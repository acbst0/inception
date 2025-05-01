# *Inception 42*
## What is inception?
Inception is a project of Ecole 42
In this project we have been learning
Docker and Docker-Compose. We can't 
use official images for MariaDB, Nginx
or WordPress.

## Requirements
If you want to use this project, you need
4 file. In /secrets/*;
- credentials.txt
- db_password.txt
- db_root_password.txt
Also an .env file in /srcs/

### Example Usage of Requirements
Example .env file :

DOMAIN=xxx.42.fr
NGINX_PORT=443
SSL_CERT_PATH=/etc/ssl/certs/xxxx.crt
SSL_KEY_PATH=/etc/ssl/certs/xxxx.key

database_name=xxxx
mysql_user=xxxx
mysql_host=xxxx

brand="Your Brand"

login=xxxx
wp_user_email=xxxx@xxxx.com
wp_user_pwd=xxxx

You can get your keys from https://api.wordpress.org/secret-key/1.1/salt/
AUTH_KEY=
SECURE_AUTH_KEY=
LOGGED_IN_KEY=
NONCE_KEY=
AUTH_SALT=
SECURE_AUTH_SALT=
LOGGED_IN_SALT=
NONCE_SALT=


Example credentials.txt file :

wp_admin_name
wp_admin_pass
wp_admin_mail

Example db_password.txt file :

your_db_pass

Example db_root_password.txt file :

your_db_root_pass