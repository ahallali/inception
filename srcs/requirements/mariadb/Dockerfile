FROM  debian:bullseye 


RUN   apt-get update && apt-get upgrade -y &&  apt-get install mariadb-server -y
COPY  conf/mariadb.conf /etc/mysql/my.cnf
COPY  tools/script.sh /etc/mariadb/conf/script.sh
RUN   chmod +x /etc/mariadb/conf/script.sh
EXPOSE 3306
ENTRYPOINT ["bash", "/etc/mariadb/conf/script.sh"]