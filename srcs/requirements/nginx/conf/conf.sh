#!/bin/bash

CONFIG_FILE="/etc/nginx/sites-available/${DOMAIN}.conf"

cat > $CONFIG_FILE << EOF
server {
    listen ${NGINX_PORT} ssl;
    listen [::]:${NGINX_PORT} ssl;

    server_name ${DOMAIN};

    root /var/www/html;

    index index.php index.html index.htm;

    ssl_certificate     ${SSL_CERT_PATH};
    ssl_certificate_key ${SSL_KEY_PATH};
    ssl_protocols       TLSv1.2 TLSv1.3;
    ssl_ciphers         'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';
    ssl_prefer_server_ciphers on;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }
    
    location ~ .php\$ {
        include fastcgi_params;
        fastcgi_pass wp-cli:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}
EOF

sed -i "s|\${NGINX_PORT}|${NGINX_PORT}|g" $CONFIG_FILE
sed -i "s|\${DOMAIN}|${DOMAIN}|g" $CONFIG_FILE
sed -i "s|\${SSL_CERT_PATH}|${SSL_CERT_PATH}|g" $CONFIG_FILE
sed -i "s|\${SSL_KEY_PATH}|${SSL_KEY_PATH}|g" $CONFIG_FILE