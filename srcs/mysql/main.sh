#!/bin/sh
rc default
mysql_install_db
rc-service mariadb setup
rc-service mariadb start


# Переменная каталога в котором находятся базы данных - НЕ ИЗМЕНЯТЬ!!!
DBDIR=/var/lib/mysql/

mysqld -u root & sleep 10

mysql -u root -e "CREATE DATABASE wp;"
mysql -u root wp < wp.sql
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY '123';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES"

rc-service mariadb stop
supervisord -c /etc/supervisor.conf