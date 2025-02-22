FROM debian:latest

RUN apt-get clean && apt-get autoremove -y && apt update && DEBIAN_FRONTEND=noninteractive apt upgrade -y && apt install nginx -y

COPY conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]