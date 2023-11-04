# # FROM debian:buster

# # RUN apt update
# # RUN apt -y install nginx openssl

# # EXPOSE 443

# # COPY ./config/ng.conf /etc/nginx/sites-enabled/default

# # RUN openssl req -x509 -nodes -newkey rsa:4096 \
# #     -keyout /etc/ssl/private/nginx.key \
# #     -out /etc/ssl/certs/nginx.crt \
# #     -subj "/C=CZ/ST=Prague/L=Prague/O=42Prague/CN=sbenes"

# # CMD [ "nginx", "-g", "daemon off;" ]

# FROM debian:buster


# RUN apt -y update && apt install -y nginx && apt install openssl -y


# # COPY ./conf/default /etc/nginx/sites-available/

# COPY ./tools/script.sh /

# RUN chmod +x /script.sh

# CMD [ "/script.sh" ]

FROM debian:buster

RUN apt update
RUN apt -y install nginx openssl

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

RUN openssl req -x509 -nodes -newkey rsa:4096 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=CZ/ST=Prague/L=Prague/O=42Prague/CN=sbenes"

CMD [ "nginx", "-g", "daemon off;" ]