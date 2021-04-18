FROM alpine:3.12
RUN apk update && apk upgrade

RUN apk add influxdb
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN apk add supervisor
RUN apk add php7-fpm  php7-json wget

COPY ./supervisor.conf ./etc
RUN mkdir -p ./etc/influxdb
COPY ./influxdb.conf ./etc/influxdb/influxdb.conf
RUN chown influxdb:influxdb /etc/influxdb
RUN mkdir -p /etc/telegraf
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > ./etc/telegraf/telegraf.conf

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086
ENTRYPOINT  [ "supervisord", "-c", "./etc/supervisor.conf" ]