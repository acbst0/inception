FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive && apt update && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    curl

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY /tools/script.sh .

RUN chmod 777 /tools/script.sh

CMD ["./tools/script.sh"]