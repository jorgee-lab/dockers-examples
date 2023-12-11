#Create MySQL Image for JSP Tutorial Application
FROM mysql
MAINTAINER j.orgee@live.com

ENV MYSQL_ROOT_PASSWORD 1234
#Creacion de restore a partir de un respaldo.

ADD ./db/backup.sql /docker-entrypoint-initdb.d
ENV TZ="America/Santiago"

RUN echo "USE mysql;" > /docker-entrypoint-initdb.d/timezones.sql &&  mysql_tzinfo_to_sql /usr/share/zoneinfo >> /docker-entrypoint-initdb.d/timezones.sql

EXPOSE 3306