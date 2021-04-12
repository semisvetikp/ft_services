FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add vsftpd openssl

RUN adduser -D jradioac
RUN echo "jradioac:123456s" | chpasswd
RUN mkdir -p /home/jradioac/userfiles
RUN chmod -R 777 /home/jradioac
RUN chown jradioac /home/jradioac

RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/private/vsftpd.key -subj "/C=RU/ST=Tatarstan/L=Kzn/O=School21/OU=Student/CN=jradioac"

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf	
RUN echo jradioac > /etc/vsftpd/vsftpd.userlist
COPY *.sh .
RUN chmod +x main.sh

EXPOSE 21 2100
ENTRYPOINT [ "sh" , "main.sh"]