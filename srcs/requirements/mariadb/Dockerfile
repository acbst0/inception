FROM debian:buster

RUN apt-get update && apt-get install -y \
    mariadb-server \
    dos2unix

COPY ./conf/my.cnf /etc/my.cnf
COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN chmod +x /setup.sh && dos2unix /setup.sh

EXPOSE 3306

ENTRYPOINT ["/setup.sh"]
