FROM debian:bullseye

RUN             apt-get update\
                && apt-get upgrade -y \
                && apt-get -y install curl\
                && apt-get install -y php-fpm=2:7.4+76\
                && apt-get install -y php-mysql\
                && apt-get install -y wordpress

RUN             mkdir -p /var/www/wordpress
COPY            ./tools/auto_config.sh /auto_config.sh
RUN             chmod +x /auto_config.sh
EXPOSE          9000
ENTRYPOINT      ["bash", "/auto_config.sh" ]