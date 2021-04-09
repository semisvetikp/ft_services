FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add vsftpd openssl
RUN apk add vsftpd-doc
# RUN apk add openrc --no-cache
# RUN apk add php7-fpm  php7-json wget
# RUN apk add php7-common php7-fpm && \
# apk add php7-session php7-iconv php7-json php7-gd php7-curl php7-xml && \
# apk add php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql && \
# apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext && \
# apk add php7-ldap php7-ctype php7-dom

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=RU/ST=Kazan/L=Tatarstan/O=21School/CN=localhost"

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf	
COPY *.sh .
RUN chmod +x main.sh


EXPOSE 21
CMD sh main.sh
# ENTRYPOINT [ "sh" , "main.sh"]