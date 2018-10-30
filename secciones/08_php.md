# PHP

## instalar PHP

$ sudo add-apt-repository ppa:ondrej/php
$ sudo apt-get install php7.0 libapache2-mod-php7.0
$ sudo apt-get install php7.0-mysql

## Iniciar Servidor
php -S localhost:4000
Inicia un servidor nuevo en localhost y escucha en el puerto 4000

### Soporte de MySQL

Para tener soporte de MySQL en PHP deberemos

instalar el paquete php7.0-mysql
– $ apt-cache search php7.0
(es necesario reiniciar Apache)

### Ver información de instalación PHP
php -r "phpinfo();" > nombreArchivo
Lo vuelca en un archivo
