#!/bin/bash

if [ ! -f ${SSL_CERT_PATH} ]; then
    echo "Self-signed sertifikalar oluşturuluyor..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${SSL_KEY_PATH} \
    -out ${SSL_CERT_PATH} \
    -subj "/C=TR/ST=Istanbul/L=Istanbul/O=Example/OU=IT/CN=${DOMAIN}"
fi

/conf.sh

ln -sf /etc/nginx/sites-available/${DOMAIN}.conf /etc/nginx/sites-enabled/

exec nginx -g "daemon off;"