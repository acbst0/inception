FROM debian:latest

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean \
    && apt-get install -y dos2unix


RUN mkdir -p /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=TR/ST=Istanbul/L=Istanbul/O=Example/OU=IT/CN=abostano.42.fr"

# Copy the Nginx configuration file for the site
COPY ./conf/default.conf /etc/nginx/sites-available/abostano.42.fr.conf

# Create a symlink to enable the site in Nginx
RUN rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/abostano.42.fr.conf /etc/nginx/sites-enabled/

# Expose the HTTPS port
EXPOSE 443

# Stop signal
STOPSIGNAL SIGQUIT

# Entrypoint betiğini kopyala ve çalıştırılabilir yap
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

RUN dos2unix script.sh

# Default komut olarak entrypoint'i çalıştır
CMD ["/bin/bash", "/script.sh"]