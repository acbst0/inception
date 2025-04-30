#!/bin/bash

# Eğer sertifikalar yoksa oluştur
if [ ! -f ${SSL_CERT_PATH} ]; then
    echo "Self-signed sertifikalar oluşturuluyor..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${SSL_KEY_PATH} \
    -out ${SSL_CERT_PATH} \
    -subj "/C=TR/ST=Istanbul/L=Istanbul/O=Example/OU=IT/CN=${DOMAIN}"
fi

exec nginx -g "daemon off;"