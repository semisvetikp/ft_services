FROM alpine:3.12
RUN apk update && apk upgrade

RUN apk add mysql mysql-client
RUN apk add supervisor
RUN apk add php7-fpm  php7-json wget

RUN apk add openrc 
RUN mkdir -p /run/openrc
RUN rc-update && touch /run/openrc/softlevel 

RUN chown mysql:mysql /var/lib/mysql 

COPY *.sh .
RUN chmod +x main.sh
COPY my.cnf /etc/my.cnf
COPY supervisor.conf /etc/
COPY ./wp.sql .
RUN chmod +x wp.sql


VOLUME ["/var/lib/mysql"]

EXPOSE 3306
CMD sh main.sh