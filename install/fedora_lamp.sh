#!/bin/bash


#This installs a LAMP server for Fedora 17+


# First we setup MySQL


yum install mysql mysql-server -y

systemctl enable mysqld.service
systemctl start mysqld.service

mysql_secure_installation


# Next we instsall Apache 

yum install httpd -y

systemctl enable httpd.service 

systemctl start httpd.service



# Install php and phpmyadmin

yum install php -y

yum install php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-magickwand php-mbstring php-mcrypt php-mssql php-shout php-snmp php-soap php-tidy -y

yum install php-pecl-apc -y


yum install phpmyadmin -y


systemctl restart httpd.service



