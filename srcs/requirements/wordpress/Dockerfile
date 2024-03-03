FROM debian:bullseye

RUN     apt-get update\
        && apt-get upgrade -y \
        && apt-get -y install curl\
        && apt-get install -y php-fpm=2:7.4+76\
        && apt-get install -y php-mysql\
        && apt-get install -y wordpress

RUN     mkdir -p /var/www/wordpress
RUN     mkdir -p /run/php/
COPY    ./conf/auto_config.sh /auto_config.sh
RUN     chmod +x /auto_config.sh
# RUN     sed -i 's/^listen =.*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE  9000
CMD     ["bash", "/auto_config.sh" ]