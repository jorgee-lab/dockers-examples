# # Servidor mysql

cd .\mysql\

# construir

docker build -t mysql_image:1.0 .

# Listar imagenes

docker images

# Ejecutar

docker run --name mysql -d mysql_image:1.0

#Referencias