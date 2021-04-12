FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add nginx openssl
RUN apk add php7-fpm  php7-json wget
RUN apk add php7-common php7-fpm && \
apk add php7-session php7-iconv php7-json php7-gd php7-curl php7-xml && \
apk add php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql && \
apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext && \
apk add php7-ldap php7-ctype php7-dom


# nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=RU/ST=Kazan/L=Tatarstan/O=21School/CN=localhost"
RUN mkdir -p /run/nginx

#phpmyadmin
WORKDIR ./usr/share/webapps
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz 
RUN tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm -rf *.tar.gz && mv phpMyAdmin-5.0.4-all-languages phpmyadmin
RUN chmod -R 777 /usr/share/webapps/phpmyadmin
COPY ./config.inc.php /usr/share/webapps/phpmyadmin
RUN chmod 755 /usr/share/webapps/phpmyadmin/config.inc.php
# RUN chmod 644 /home/www/phpMyAdmin

WORKDIR /
COPY ./*.sh .
RUN chmod +x php_main.sh

EXPOSE 5000
CMD sh php_main.sh
# ENTRYPOINT [ "sh" , "nginx" , "&&" , "php-fpm7"]