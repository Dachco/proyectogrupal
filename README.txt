Primero el git clone no les va a traer la carpeta clase, que es donde se encuentra el entorno venv porque 
no la necesitamos.

cuando elijan su carpeta, la que quieran hagan el siguiente git clone

git clone https://github.com/Dachco/proyectogrupal.git

luego desde la carpeta raiz verifican que tienen python --version

si si proceden a crear el entorno virtual desde powershell en la carpeta raiz

python -m venv clase

luego procedemos a instalar todo lo que necesitamos 
con un comando super genial que instala todo lo que hay en el archivo requerimientos tambien en powershell

pip install -r requerimientos.txt

asi instalamos todo de una

luego ejecutamos main.py desde visual con la flechita