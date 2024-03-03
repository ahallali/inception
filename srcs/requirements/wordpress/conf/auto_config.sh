#!/bin/bash
sleep 10 
# service start php-fpm7.4
sed -i 's/^listen =.*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# php wp-cli.phar --info
chmod +x wp-cli.phar
# mkdir -p /usr/local/bin/wp
# mv wp-cli.phar /usr/local/bin/wp
./wp-cli.phar core download --allow-root --path=/var/www/wordpress
./wp-cli.phar config create	--allow-root --path=/var/www/wordpress \
											--dbname=$SQL_DATABASE \
											--dbuser=$SQL_USER \
											--dbpass=$SQL_PASSWORD \
											--dbhost=mariadb:3306 --path='/var/www/wordpress'

./wp-cli.phar core install --path=/var/www/wordpress --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root
# ./wp-cli.phar user create  $USER_NAME $USER_EMAIL --user_pass=$USER_PASS --allow-root
service php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F	