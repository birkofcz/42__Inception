FROM	debian:bookworm

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/sbenes.crt \
       -keyout /etc/nginx/ssl/sbenes.key \
       -subj "/C=CZ/ST=Prague/L=Prague/O=42Prague/OU=sbenes/CN=sbenes/"

COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY ./public/index.html /var/www/html/

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]