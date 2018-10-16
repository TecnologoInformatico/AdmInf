#Como instalar PHP en ubuntu

#Requisitos previos

#instalar apache y permitir fairwall
$ sudo apt-get update
$ sudo apt-get install apache2

#Establecer server name para suprimir los errores de sintaxis
$ sudo apache2ctl configtest
$ sudo gedit /etc/apache2/apache2.conf

#guarde y cierre los cambios
#revise errores de sintaxis:
$ sudo apache2ctl configtest

#instalar PHP
$ sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql

