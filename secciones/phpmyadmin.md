# phpMyAdmin

## Instalación

Para el correcto funcionamiento de phpmyadmin es conveniente contar con algunas extensiones de PHP:

- php-mbstring: Permite manejar strings en diferentes formatos de codificación.
- php-zip: Extensión que permite publicar archivos .zip a phpMyAdmin.
- php-gd: Habilita soporte para la librería de gráficos GD.
- php-json: Le brinda a PHP soporte para la serialización JSON.
- php-curl: Permite a PHP interactuar con otros servidores utilizando variados protocolos.

`sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl`

Durante el proceso de instalación de phpmyadmin se solicitarán algunas configuraciones:

Tipo de servidor, debe elegirse `apache2`, esta opción se presenta resaltada pero no seleccionada, presionar espacio para seleccionarla.

Seleccionar `Yes` cuando se ofrezca utilizar `dbconfig-common` para configurar la base de datos, entonces se nos consultará el usuario y contraseña MySQL para la aplicación phpMyAdmin.

Finalmente habilitar el módulo mbstring de PHP.

`sudo phpenmod mbstring`

Y reiniciar el servidor apache.

`sudo systemctl restart apache2`

## seguridad

Es buena idea brindar una capara de seguridad a la aplicación phpmyadmin, ya que cumple una función un tanto delicada.

Para esto es posible crear una puerta de enlace `gateway` desde el mismo servidor.

Agregaremos la directiva `AllowOverride` en la configuración del sitio phpmyadmin de apache, dentro de la directiva `<Directory /usr/share/phpmyadmin>` y luego eso nos permitirá utilizar un archivo .htaccess para la aplicación.

/etc/apache2/conf-available/phpmyadmin.conf

```xml
<Directory /usr/share/phpmyadmin>
    Options FollowSymLinks
    DirectoryIndex index.php
    AllowOverride All
    . . .
```
