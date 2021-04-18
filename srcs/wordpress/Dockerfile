FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add nginx openssl
RUN apk add supervisor
RUN apk add php7-fpm 
RUN apk add php7-json
RUN apk add php7-phar 
RUN apk add php7-common php7-fpm && \
apk add php7-session php7-iconv php7-json php7-gd php7-curl php7-xml && \
apk add php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql && \
apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext && \
apk add php7-ldap php7-ctype php7-dom
RUN apk add curl

COPY ./supervisor.conf /etc/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar /
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /home/public_html
COPY ./wp-config.php /home/public_html/
WORKDIR /home/public_html
RUN wp core download --allow-root
RUN chown -R 775 /home/public_html/

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=RU/ST=Kazan/L=Tatarstan/O=21School/CN=localhost"
RUN mkdir -p /run/nginx

WORKDIR /

EXPOSE 5050
ENTRYPOINT  [ "supervisord", "-c", "/etc/supervisor.conf" ]
