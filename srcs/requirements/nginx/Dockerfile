FROM debian:latest

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean

# Copy the Nginx configuration file for the site
COPY ./conf/default.conf /etc/nginx/sites-available/abostano.42.fr.conf

# Create a symlink to enable the site in Nginx
RUN ln -s /etc/nginx/sites-available/abostano.42.fr.conf /etc/nginx/sites-enabled/abostano.42.fr.conf

# Expose the HTTPS port
EXPOSE 443

# Stop signal
STOPSIGNAL SIGQUIT

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]