FROM debian:buster

# Sistem güncelle ve gerekli paketleri yükle
RUN apt-get update && apt-get install -y \
    mariadb-server \
    dos2unix

# Config dosyasını kopyala (opsiyonel)
COPY ./conf/my.cnf /etc/mysql/my.cnf

# Başlangıç scriptini kopyala
COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN chmod +x /setup.sh && dos2unix /setup.sh

# Port açıyoruz (MariaDB default portu)
EXPOSE 3306

# Entrypoint: setup.sh çalışacak
ENTRYPOINT ["/setup.sh"]
