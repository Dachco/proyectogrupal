from flask import Flask, render_template, request, redirect, url_for
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, EmailField

import conectar as db

app = Flask(__name__)

app.config.from_mapping(
    SECRET_KEY = 'dev'
)

# @app.before_request
# def before_request():
#    print("Antes de la petición...")
    
# @app.after_request
# def after_requests(response):
#    print("Después de la peticion")
#   return response

@app.route("/")
@app.route("/inicio")
def inicio():
    user_ip=request.remote_addr
    return render_template('inicio.html')

@app.route("/info")
def info():
    user_ip=request.remote_addr
    return f"Hola, la dirreccion IP es ={user_ip}"

@app.route('/index')
def index():
    nombre = 'william fonseca pardo'
    ausentes = ['valentina','chang','paula','natalia','helly']
    nombre = None
    
    return render_template('index.html', nombre = nombre, ausentes = ausentes)

@app.route("/softw")
def softw():
     return render_template('softw.html')
 
class RegistroForm(FlaskForm) :
    username = StringField("Nombre de Usuario : ")
    password = PasswordField("Password : ")
    submit = SubmitField("Registrar")
 
@app.route('/registro', methods=['GET', 'POST'])
def registro():
    form = RegistroForm()
    
    if request.method =='POST':
        username = request.form['username']
        password = request.form['password']
#       print(f"Nombre de Usuario : {username}, Contraseña : {password}")
  
        if  (len(username) >= 6 and  len(username) <= 20) and (len(password) >= 8 and  len(password) <= 20) :
            cursor = db.database.cursor()
            sql = "INSERT INTO usuarios(nombreusuario, nombres, apellidos, contrasena, email, celular) VALUES (%s,%s,%s,%s,%s,%s)"
            data= (username,username,username,password,username,username)
            cursor.execute(sql, data)
            db.database.commit()
            return f"""Nombre de Usuario : {username},
                       Contraseña        : {password}"""
            # print(f"Nombre de Usuario : {username}")
        else :
            error = 'Nombre de usuario no valido, debe tener entre 6 y 20 caracteres o la contraseña no valido, debe tener entre 8 y 20 caracteres'
            return render_template('registro.html',form=form, error = error)
        
        #if  len(password) >= 8 and  len(password) <= 20 :
        #    return print(f"La contraseña es : {password}")
        #else :
        #    error1 = 'Contraseña no valido, debe tener entre 8 y 20 caracteres'
        #    return render_template('registro.html',form=form , error1 = error1)
         
    return render_template('registro.html', form = form) 
    

@app.route('/menu/<nombre>/<int:semestre>', methods=['GET', 'POST'])
def menu(nombre, semestre):
    return f'<h1>Bienvenido Estudiante {nombre} y el semestre es {semestre}</h1>'
#-- def query_string():
  #--  print(request)
  #--  print(request.args)
  #-- print(request.args.get('param1'))
  #-- print(request.args.get('param2'))
  #-- return 'ok'

def pagina_no_encontrada(error):
     #return render_template('404.html'), 404
     return redirect (url_for('index'))


if __name__ == '__main__':
    #app.add_url_rule( '/query_string', view_func=query_string)
    app.register_error_handler(404, pagina_no_encontrada)
    app.run(debug=True, port=80, host='0.0.0.0')