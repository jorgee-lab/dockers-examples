# Servidor apache

cd .\apache-web\

# construir

docker build -t apache_image:1.0 .

# Listar imagenes

docker images

# Ejecutar

docker run --name myapache -d -p 80:80 apache_image:Referencias

https://www.crashell.com/estudio/ejecutar_aplicaciones_python_en_apache

# Listar los docker en funcionamiento

docker ps

# Ingresar a la terminal del contenedor

docker exec -it myapache bash

# M

