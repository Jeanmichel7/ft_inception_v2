#!/bin/sh

#Check if the database exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else
	mysql_install_db
	/etc/init.d/mysql start

#Add a root user on 127.0.0.1 to allow remote connexion
	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user for wordpress
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
        GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;\
        " | mysql -uroot

#Import database
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wp_save.sql
	mysqladmin -u root password $MYSQL_ROOT_PASSWORD
	/etc/init.d/mysql stop
fi

exec "$@"
