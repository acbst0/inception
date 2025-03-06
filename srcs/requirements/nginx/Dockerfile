FROM debian:latest

RUN apt-get update && apt-get upgrade && apt-get install -y \
	nginx \
	openssl \
	certbot

COPY /tools/script.sh /tools/script.sh

RUN chmod +x /tools/script.sh

CMD [ "nginx", "-g", "daemon off;" ]
