# PHP

## instalar PHP

sudo apt install php libapache2-mod-php php-mysql

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

## Establecer server name para suprimir los errores de sintaxis

$ sudo apache2ctl configtest
$ sudo gedit /etc/apache2/apache2.conf

## phpMyAdmin

```s
sudo apt update
sudo apt install phpmyadmin php-mbstring php-gettext
```

Ejemplo de archivo de configuración `phpmyadmin.conf` para apache.

```xml
Alias /phpmyadmin /usr/share/phpmyadmin

<Directory /usr/share/phpmyadmin>
    Options Indexes FollowSymLinks
    DirectoryIndex index.php

    <IfModule mod_php5.c>
        AddType application/x-httpd-php .php

        php_flag magic_quotes_gpc Off
        php_flag track_vars On
        php_flag register_globals Off
        php_value include_path .
    </IfModule>

</Directory>

# Authorize for setup
<Directory /usr/share/phpmyadmin/setup>
    <IfModule mod_authn_file.c>
    AuthType Basic
    AuthName "phpMyAdmin Setup"
    AuthUserFile /etc/phpmyadmin/htpasswd.setup
    </IfModule>
    Require valid-user
</Directory>

# Disallow web access to directories that don't need it
<Directory /usr/share/phpmyadmin/libraries>
    Order Deny,Allow
    Deny from All
</Directory>
<Directory /usr/share/phpmyadmin/setup/lib>
    Order Deny,Allow
    Deny from All
</Directory>
```
