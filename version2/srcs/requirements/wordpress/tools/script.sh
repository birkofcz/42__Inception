#!/bin/bash

# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
# chown -R www-data:www-data /var/www/*;
# chown -R 755 /var/www/*;
# mkdir -p /run/php/;
# touch /run/php/php7.3-fpm.pid;

# if [ ! -f /var/www/html/wp-config.php ];
# then
# 	echo "Initializing wordpress"
# 	mkdir -p /var/www/html
# 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# 	chmod +x wp-cli.phar;
# 	mv wp-cli.phar /usr/local/bin/wp;
# 	cd /var/www/html;
# 	wp core download --allow-root;
# 	mv /var/www/wp-config.php /var/www/html/
# 	echo "Creating users"
# 	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_MAIL};
# 	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_MAIL} --user_pass=${WP_USER_PASSWORD};
# 	echo "Wordpress initialization done"
# fi

# exec "$@"


# set -e

# # ... (other setup steps here if necessary) ...

# # Wait for the database to be ready
# until mysqladmin ping -h"$DB_HOST" --silent; do
#     echo 'Waiting for database to be ready...'
#     sleep 2
# done

# # Install WordPress if not already installed
# if ! wp core is-installed --path=/var/www/html --allow-root; then
#     wp core download --path=/var/www/html --allow-root
#     wp config create \
#         --dbname="${DB_NAME}" \
#         --dbuser="${DB_USER}" \
#         --dbpass="${DB_PASSWORD}" \
#         --dbhost="${DB_HOST}" \
#         --path=/var/www/html \
#         --allow-root
#     wp core install \
#         --url="${WP_URL}" \
#         --title="${WP_TITLE}" \
#         --admin_user="${WP_ADMIN_LOGIN}" \
#         --admin_password="${WP_ADMIN_PASSWORD}" \
#         --admin_email="${WP_ADMIN_MAIL}" \
#         --path=/var/www/html \
#         --allow-root
#     wp user create "${WP_USER_LOGIN}" "${WP_USER_EMAIL}" \
#         --user_pass="${WP_USER_PASSWORD}" \
#         --role=author \
#         --path=/var/www/html \
#         --allow-root
# fi

# # Run PHP-FPM
# exec "$@"


# create directory to use in nginx container later and also to setup the wordpress conf
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html


rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php


sed -i -r "s/db1/$db_name/1"   wp-config.php
sed -i -r "s/user/$db_user/1"  wp-config.php
sed -i -r "s/pwd/$db_pwd/1"    wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root




wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root


# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


 
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php



# wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F