#!/bin/sh

rc default
mysql_install_db
rc-service mariadb setup
rc-service mariadb start

# -------------------------------------------------------------------------
# Переменные базы данных (имя базы, имя пользователя, пароль пользователя).
# -------------------------------------------------------------------------
# basename, username, password - заменить на свои значения.
DBNAME=db_jradioac
DBUSER=jradioac
DBPASS=123

# Переменная пароля root-пользователя mysql/mariadb, для входа в консоль.
ROOTPASS=123

# Переменная каталога в котором находятся базы данных - НЕ ИЗМЕНЯТЬ!!!
DBDIR=/var/lib/mysql/

# service mysql start

# Создание пользователя
mysql -u root -p"$ROOTPASS" -e "create user "$DBUSER"@'%' identified by '$DBPASS';"

# Создание базы данных и назначение привилегий пользователя.
mysql -u root -p"$ROOTPASS" -e "create database "$DBNAME"; grant all on "$DBNAME".* to "$DBUSER"@'%'; flush privileges;"

mysqld_safe