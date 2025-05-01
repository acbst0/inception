FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php \
    php-fpm \
    curl \
    php-mysqli \
    dos2unix \
    default-mysql-client

COPY ./tools/script.sh /script.sh
COPY ./tools/wp-config.php /wp-config.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /script.sh && dos2unix /script.sh

ENTRYPOINT ["/script.sh"]
