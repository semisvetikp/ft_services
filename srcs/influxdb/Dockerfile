FROM alpine:3.12
RUN apk update && apk upgrade

RUN apk add influxdb
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN apk add supervisor
RUN apk add php7-fpm  php7-json wget

RUN apk add openrc 
RUN mkdir -p /run/openrc
RUN rc-update && touch /run/openrc/softlevel 


COPY *.sh .
RUN chmod +x influxdb_main.sh
COPY supervisor.conf /etc/

COPY influxdb.conf /etc/influxdb.conf
COPY telegraf.conf /etc/telegraf.conf

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086
ENTRYPOINT [ "sh" ]
# , "influxdb_main.sh" ]
# CMD sh main.sh