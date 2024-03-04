#!/bin/bash

service mariadb start

sleep 5 

mysql_secure_installation << EOF
n
${MYSQL_ROOT_PASSWORD}
${MYSQL_ROOT_PASSWORD}
y
n
n
n
n
EOF

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER2}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD2}';"
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
exec mariadbd
