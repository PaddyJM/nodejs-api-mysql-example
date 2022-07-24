FROM mysql
MAINTAINER patrickjamesmorton@gmail.com

ENV MYSQL_ROOT_PASSWORD password
ADD dump.sql /docker-entrypoint-initdb.d

EXPOSE 3306