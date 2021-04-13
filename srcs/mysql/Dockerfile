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

VOLUME ["/var/lib/mysql"]

EXPOSE 3306
ENTRYPOINT [ "sh", "main.sh" ]
# CMD sh main.sh