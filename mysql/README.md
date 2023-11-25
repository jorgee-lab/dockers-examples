#  Servidor mysql

cd .\mysql\

# construir

docker build -t mysql_image:1.0 .

# Listar imagenes

docker images

# Ejecutar

docker run --name mysql-docker -d mysql_image:1.0


# Referencias
https://www.returngis.net/2019/03/comunicar-contenedores-de-docker-entre-si/