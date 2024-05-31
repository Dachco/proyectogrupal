from flask import Flask, render_template, request, redirect, url_for, session
import conectar as db

app = Flask(__name__)

app.config.from_mapping(
    SECRET_KEY='dev'
)

@app.route("/inicio")
def inicio():
    return render_template('inicio.html')


@app.route("/softw")
def softw():
    return render_template('softw.html')

@app.route("/registro")
def registro():
    return render_template('login.html')

@app.route('/productos')
def productos():
    cursor = db.sql_server_connection.cursor()
    cursor.execute("""
        SELECT p.Id, p.Nombre, p.Detalle, p.Precio, i.ImagenUrl 
        FROM Productos p
        LEFT JOIN ImagenesProductos i ON p.Id = i.IdProducto
    """)
    productos = cursor.fetchall()

    productos_dict = {}
    for producto in productos:
        id_producto = producto[0]
        if id_producto not in productos_dict:
            productos_dict[id_producto] = {
                'Id': producto[0],
                'Nombre': producto[1],
                'Detalle': producto[2],
                'Precio': producto[3],
                'Imagenes': []
            }
        productos_dict[id_producto]['Imagenes'].append(producto[4])

    return render_template('productos.html', productos=productos_dict.values())

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        nombre_usuario = request.form['nombre_usuario']
        contrasena = request.form['contrasena']
        
        cursor = db.sql_server_connection.cursor()
        query = "SELECT Nombre FROM Usuarios WHERE Nombre = ? AND Contrasena = ?"
        cursor.execute(query, (nombre_usuario, contrasena))
        usuario = cursor.fetchone()

        if usuario:
            session['nombre_usuario'] = nombre_usuario
            return redirect(url_for('perfil'))
        else:
            error = 'Usuario o contraseña incorrectos. Por favor, inténtalo de nuevo.'
            return render_template('login.html', error=error)

    return render_template('login.html')

@app.route('/perfil')
def perfil():
    if 'nombre_usuario' in session:
        nombre_usuario = session['nombre_usuario']
        return render_template('perfil.html', nombre_usuario=nombre_usuario)
    else:
        return redirect(url_for('login'))

@app.route('/logout')
def logout():
    session.pop('nombre_usuario', None)
    return redirect(url_for('inicio'))

def pagina_no_encontrada(error):
    return redirect(url_for('inicio'))

if __name__ == '__main__':
    app.register_error_handler(404, pagina_no_encontrada)
    app.run(debug=True, port=80, host='0.0.0.0')
