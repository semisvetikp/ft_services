FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add supervisor

RUN apk add libc6-compat
WORKDIR /etc/grafana
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.2.linux-amd64.tar.gz --strip-components 1 && rm -rf *.tar.gz
COPY ./grafana.db /etc/grafana/data/grafana.db

WORKDIR /etc/grafana/bin

EXPOSE 3000
ENTRYPOINT [ "./grafana-server" ]