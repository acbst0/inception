FROM debian:buster

# Gerekli paketleri kur
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php \
    php-fpm \
    curl \
    php-mysqli \
    dos2unix \
    default-mysql-client

# Script ve wp-config'i kopyala
COPY ./tools/script.sh /script.sh
COPY ./tools/wp-config.php /wp-config.php

# PHP-FPM ayar dosyasını kopyala
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Scripti çalıştırılabilir yap
RUN chmod +x /script.sh && dos2unix /script.sh

# Başlangıçta script çalışsın
ENTRYPOINT ["/script.sh"]
