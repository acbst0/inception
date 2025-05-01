#!/bin/bash

export mysql_password=$(cat /run/secrets/db_password)
wordpress_admin=$(head -n 1 /run/secrets/credentials | tr -d '\r\n' | xargs)
wordpress_admin_password=$(sed -n "2p" /run/secrets/credentials | tr -d '\r\n' | xargs)
wordpress_admin_email=$(sed -n "3p" /run/secrets/credentials | tr -d '\r\n' | xargs)
export wordpress_admin
export wordpress_admin_password
export wordpress_admin_email

echo "WordPress admin: ${wordpress_admin}"
echo "WordPress admin password: ${wordpress_admin_password}"
echo "WordPress admin email: ${wordpress_admin_email}"

# PHP-FPM için gerekli dizinleri hazırla
mkdir -p /run/php
chown www-data:www-data /run/php
chmod 755 /run/php

# Web dizinini oluştur
mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
cd /var/www/html

# Önceki WordPress dosyalarını temizle
rm -rf *

# wp-cli indir
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# WordPress çek
wp core download --allow-root

# Örnek wp-config değil, doğrudan bizim özel wp-config'imizi kullan
cp /wp-config.php /var/www/html/wp-config.php

# MariaDB tam başlasın diye bekle
until mysqladmin ping -h ${mysql_host} --silent; do
    echo "MariaDB başlatılıyor..."
    sleep 2
done

# WordPress kurulumu
wp core install \
  --url="https://${DOMAIN}" \
  --title="${brand}" \
  --admin_user="${wordpress_admin}" \
  --admin_password="${wordpress_admin_password}" \
  --admin_email="${wordpress_admin_email}" \
  --skip-email \
  --allow-root

# İkinci kullanıcı oluştur (isteğe bağlı)
wp user create "${login}" "${wp_user_email}" --user_pass="${wp_user_pwd}" --role=author --allow-root

# PHP-FPM başlat
/usr/sbin/php-fpm7.3 -F
