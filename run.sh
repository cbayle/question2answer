#! /bin/sh

/etc/init.d/mysql start
	
mysql -uroot -e "create database q2a;"
mysql -uroot -e "GRANT ALL PRIVILEGES on *.* TO 'q2a'@'localhost' IDENTIFIED BY 'q2apass' WITH GRANT OPTION;"

/etc/init.d/apache2 start
