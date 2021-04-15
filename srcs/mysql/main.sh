#!/bin/sh

# rc update
rc default
mysql_install_db
rc-service mariadb setup
rc-service mariadb start

# -------------------------------------------------------------------------
# Переменные базы данных (имя базы, имя пользователя, пароль пользователя).
# -------------------------------------------------------------------------
# basename, username, password - заменить на свои значения.
# DBNAME=wp
# DBUSER=root
# DBPASS=123

# Переменная пароля root-пользователя mysql/mariadb, для входа в консоль.
# ROOTPASS=123

# Переменная каталога в котором находятся базы данных - НЕ ИЗМЕНЯТЬ!!!
DBDIR=/var/lib/mysql/

# service mysql start

# # Создание пользователя
# mysql -u root -p"$ROOTPASS" -e "create user "$DBUSER"@'%' identified by '$DBPASS';"
# mysql -u root -p -e "create user 'root'@'%' identified by '';"

# Создание базы данных и назначение привилегий пользователя.
# mysql -u root -p -e "create database 'jradioac'; grant all on *.* to 'root'@'%'; flush privileges;"
# mysql -u root -p"$ROOTPASS" -e "create database "$DBNAME"; grant all on "$DBNAME".* to "$DBUSER"@'%'; flush privileges;"

# mysqld_safe



mysqld -u root & sleep 10
# s
mysql -u root -e "CREATE DATABASE wp;"
mysql -u root wp < wp.sql
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY '123';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES"

rc-service mariadb stop
supervisord -c /etc/supervisor.conf