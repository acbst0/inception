FROM debian:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/init.sql /etc/mysql/init.sql

RUN mkdir /run/mysql

CMD ["mysqld"]