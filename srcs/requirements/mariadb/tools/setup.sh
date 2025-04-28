#!/bin/bash

# Veritabanı dizinlerini başlat
service mysql start

# Root password'u ayarla
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${mysql_root_password}'; FLUSH PRIVILEGES;"

# Yeni veritabanı oluştur
mysql -u root -p${mysql_root_password} -e "CREATE DATABASE IF NOT EXISTS ${database_name};"

# Yeni kullanıcı oluştur ve ona yetki ver
mysql -u root -p${mysql_root_password} -e "CREATE USER IF NOT EXISTS '${mysql_user}'@'%' IDENTIFIED BY '${mysql_password}';"
mysql -u root -p${mysql_root_password} -e "GRANT ALL PRIVILEGES ON ${database_name}.* TO '${mysql_user}'@'%';"
mysql -u root -p${mysql_root_password} -e "FLUSH PRIVILEGES;"

# Servisi düzgün şekilde kapat
mysqladmin -u root -p${mysql_root_password} shutdown

# Sonra mariadb'yi foreground olarak başlat
exec mysqld_safe
