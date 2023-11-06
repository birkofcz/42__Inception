FROM	debian:buster

# Install nginx
RUN	apt-get update && apt-get install -y nginx openssl

# Make a directory for the ssl certificate
RUN mkdir /etc/nginx/ssl

# Copy the ssl certificate and key to the ssl directory inside the container
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./conf/nginx_start.sh /var/www

# Make the script for runningg nginx executable
RUN chmod +x /var/www/nginx_start.sh
RUN mkdir -p /run/nginx

# Entry point for the container - here it all starts
ENTRYPOINT ["var/www/nginx_start.sh"]

# Expose ports
EXPOSE	443

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
