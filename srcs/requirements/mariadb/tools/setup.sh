#!/bin/bash

service mysql start

until mysqladmin ping --silent; do
    echo "MariaDB başlatılıyor..."
    sleep 2
done

sleep 5

cat << EOF > init.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '${mysql_root_password}';
CREATE DATABASE IF NOT EXISTS ${database_name};
CREATE USER IF NOT EXISTS '${mysql_user}'@'%' IDENTIFIED BY '${mysql_password}';
GRANT ALL PRIVILEGES ON ${database_name}.* TO '${mysql_user}'@'%';
FLUSH PRIVILEGES;
EOF

mysql -u root < init.sql || mysql --protocol=TCP -u root < init.sql

mysqladmin -u root -p${mysql_root_password} shutdown || mysqladmin --protocol=TCP -u root -p${mysql_root_password} shutdown

exec mysqld_safe