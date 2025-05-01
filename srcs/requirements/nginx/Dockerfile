FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean \
    && apt-get install -y dos2unix

RUN rm -f /etc/nginx/sites-enabled/default

EXPOSE 443

STOPSIGNAL SIGTERM

COPY ./conf/conf.sh /conf.sh
RUN chmod +x /conf.sh
RUN dos2unix /conf.sh

COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh
RUN dos2unix /script.sh

ENTRYPOINT ["/script.sh"]