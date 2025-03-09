#!/bin/bash

# Eğer sertifikalar yoksa oluştur
if [ ! -f /etc/ssl/certs/nginx-selfsigned.crt ]; then
    echo "Self-signed sertifikalar oluşturuluyor..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=TR/ST=Istanbul/L=Istanbul/O=Example/OU=IT/CN=abostano.42.fr"
fi

nginx -g "daemon off;"