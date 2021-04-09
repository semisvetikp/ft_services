FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add nginx openssl


COPY ./nginx.conf etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=RU/ST=Kazan/L=Tatarstan/O=21School/CN=localhost"
# COPY ./*.sh /tmp/
# RUN chmod +x /tmp/*
RUN mkdir -p /run/nginx

# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 80 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]