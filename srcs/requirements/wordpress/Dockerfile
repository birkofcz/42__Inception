FROM debian:buster

RUN apt update

RUN apt -y install php7.3 wget php-mysqli php-fpm

COPY ./config/wp_start.sh /var/www/
COPY ./config/wp-config.php /var/www/
COPY ./config/www.conf /etc/php/7.3/fpm/pool.d

EXPOSE 9000

RUN chmod +x /var/www/wp_start.sh

ENTRYPOINT [ "/var/www/wp_start.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "--nodaemonize"]

# FROM debian:buster

# # Update and install dependencies
# RUN apt update && apt -y install php7.3 wget php-mysqli php-fpm curl

# # Install WP-CLI
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp

# # Copy the configuration files
# COPY ./config/wp-config.php /var/www/
# COPY ./config/www.conf /etc/php/7.3/fpm/pool.d/

# # Expose the port PHP-FPM is reachable on
# EXPOSE 9000

# # Copy your start script
# COPY ./config/wp_start.sh /var/www/

# # Make sure the script is executable
# RUN chmod +x /var/www/wp_start.sh

# # Set the entrypoint to your custom start script
# ENTRYPOINT [ "/var/www/wp_start.sh" ]

# # Start PHP-FPM
# CMD [ "/usr/sbin/php-fpm7.3", "--nodaemonize"]
