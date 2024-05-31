import pyodbc

# Detalles de la conexión
server = 'LAPTOP-UE98O5QF'
database = 'ProyectoTienda'  # Nombre de la base de datos

# Configura la cadena de conexión para autenticación de Windows y deshabilitar la verificación del certificado SSL
connection_string = f'DRIVER={{ODBC Driver 18 for SQL Server}};SERVER={server};DATABASE={database};Trusted_Connection=yes;TrustServerCertificate=yes;'

try:
    # Establece la conexión
    sql_server_connection = pyodbc.connect(connection_string)
    print("Conexión exitosa")

except pyodbc.Error as ex:
    print(f"Error al conectar a SQL Server: {ex}")


