# PHP

```php
<?php
    phpinfo();
>
```

## instalar PHP

Para instalar PHP basta con instalar el paquete php, pero para utilizarlo junto con apache y mysql además es necesario instalar los módulos para ello.

`sudo apt install php libapache2-mod-php php-mysql`

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
