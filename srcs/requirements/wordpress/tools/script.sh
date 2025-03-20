#!/bin/bash

mkdir -p /run/php
chown www-data:www-data /run/php
chmod 755 /run/php

mkdir /var/www/
mkdir /var/www/html

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

cp /wp-config.php /var/www/html/wp-config.php

/usr/sbin/php-fpm7.3 -F