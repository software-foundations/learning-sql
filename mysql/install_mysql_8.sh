###
# MySql 8
# https://hcode.com.br/blog/como-instalar-o-mysql-8-no-ubuntu-2004
# https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04-pt
###

# instalation
sudo apt update
sudo apt install mysql-server

# check if it is installed
service mysql status
mysql --version

# start
sudo su -
service mysql start

###
# configuration: way 01
###

# configuration
mysql_secure_installation

# connecting
sudo su -
mysql -u root -p

# verify authentication methods
SELECT user,authentication_string,plugin,host FROM mysql.user;

# update localhost password by caching_sha2_password plugin (recommended)
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';

# update localhost password by mysql_native_password plugin (to PHP Admin works properly and correctly)
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

# reload permisson tables on server
FLUSH PRIVILEGES;

# verify authentication methods again
SELECT user,authentication_string,plugin,host FROM mysql.user;

# creating a dedicated user
CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';

# grant permissons to user
GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;

# obs: FLUSH PRIVILEGES is only necessary when updating an user premisson
# or when update the update the conssession tables

# testing mysql
systemctl status mysql.service

# Output
# mysql.service - MySQL Community Server
#      Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
#      Active: active (running) since Tue 2020-04-21 12:56:48 UTC; 6min ago
#    Main PID: 10382 (mysqld)
#      Status: "Server is operational"
#       Tasks: 39 (limit: 1137)
#      Memory: 370.0M
#      CGroup: /system.slice/mysql.service
#              └─10382 /usr/sbin/mysqld

# if the message is not like that, start mysql
sudo systemctl start mysql

###
# mysqladmin (client)
# allow execute administrative commands
###

# connect as root, enter a password and returns the mysqladmin version
sudo mysqladmin -p -u root version

###
# configuration: way 02
###
secure
# configuration
mysql_secure_installation

###
# using
###

# connecting
mysql -u root -p

# creating database
CREATE DATABASE hcode;

# show data base
SHOW DATABASES

# exit mysql
exit