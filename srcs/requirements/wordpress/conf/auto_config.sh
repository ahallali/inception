#!/bin/bash
sleep 10 
# service start php-fpm7.4
sed -i 's/^listen =.*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
# php wp-cli.phar --info
# mkdir -p /usr/local/bin/wp
# mv wp-cli.phar /usr/local/bin/wp

folder_path=/var/www/wordpress
if [ ! -d $folder_path ];
then 
./wp-cli.phar core download --allow-root --path=/var/www/wordpress
./wp-cli.phar config create	--allow-root --path=/var/www/wordpress \
											--dbname=$SQL_DATABASE \
											--dbuser=$DB_USER \
											--dbpass=$SQL_PASSWORD \
											--dbhost=mariadb:3306 --path='/var/www/wordpress'

./wp-cli.phar core install --path=/var/www/wordpress --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root
./wp-cli.phar user create --path=/var/www/wordpress $USER_NAME $USER_EMAIL --user_pass=$USER_PASS --allow-root
fi
service php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F	