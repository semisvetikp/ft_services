FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add supervisor
RUN apk add php7-fpm  php7-json wget
RUN apk add openrc 
RUN mkdir -p /run/openrc
RUN rc-update && touch /run/openrc/softlevel 


RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.3.linux-amd64.tar.gz && rm -rf *.tar.gz
RUN apk add libc6-compat

COPY *.sh .
RUN chmod +x grafana_main.sh
# COPY supervisor.conf /etc/

# VOLUME ["/var/lib/mysql"]

WORKDIR /grafana-7.5.3/bin

EXPOSE 3000
# ENTRYPOINT [ "sh", "./grafana-server" ]
# # , "main.sh" ]
CMD sh grafana_main.sh