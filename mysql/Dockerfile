#Create MySQL Image for JSP Tutorial Application
FROM mysql
MAINTAINER j.orgee@live.com

ENV MYSQL_ROOT_PASSWORD 1234
#Creacion de restore a partir de un respaldo.

ADD ./db/backup.sql /docker-entrypoint-initdb.d

EXPOSE 3306