FROM debian:buster

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean \
    && apt-get install -y dos2unix

COPY ./conf/default.conf /etc/nginx/sites-available/abostano.42.fr.conf

# Create a symlink to enable the site in Nginx
RUN rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/abostano.42.fr.conf /etc/nginx/sites-enabled/

# Expose the HTTPS port
EXPOSE 443

# Stop signal
STOPSIGNAL SIGTERM

# Entrypoint betiğini kopyala ve çalıştırılabilir yap
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

RUN dos2unix script.sh

# Default komut olarak entrypoint'i çalıştır
ENTRYPOINT ["/script.sh"]