# Php

## Instalar Php
  $ apt-get install php7.0 libapache2-mod-php7.0

Luego será necesario reiniciar el servidor apache

  $ Systemctl restart apache2

#### Para tener soporte de MySQL en PHP deberemos
instalar el paquete php7.0-mysql
– $ apt-cache search php7.0
(es necesario reiniciar Apache)

### Ver información de instalación PHP
php -r "phpinfo();" > nombreArchivo
Lo vuelca en un archivo



















