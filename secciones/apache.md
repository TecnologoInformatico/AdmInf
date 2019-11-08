# Servidores web

## Servidor Apache

El servidor web Apache es el más utilizado, es poderoso, flexible y bien documentado.
Cada sitio o dominio se denomina virtual host, de forma tal que podremos disponer de varios sitios en una misma IP. Cada dominio configurado enviará al visitante a un directorio específico.

### Instalación

```cs
sudo apt-get update
sudo apt-get install apache2
```

Luego de instalar es posible comprobar el [estado del servidor](#Comprobar-estado) mediante la herramienta systemctl, service o ingresando desde el navegador a [localhost](http://localhost).

### Directorios y archivos

Luego de la instalación en las distribuciones procedentes de debian la estructura creada es la siguiente:

```s
ServerRoot              ::      /etc/apache2
DocumentRoot            ::      /var/www
Apache Config Files     ::      /etc/apache2/apache2.conf
                        ::      /etc/apache2/ports.conf
Default VHost Config    ::      /etc/apache2/sites-available/default, /etc/apache2/sites-enabled/000-default
Module Locations        ::      /etc/apache2/mods-available, /etc/apache2/mods-enabled
ErrorLog                ::      /var/log/apache2/error.log
AccessLog               ::      /var/log/apache2/access.log
cgi-bin                 ::      /usr/lib/cgi-bin
binaries (apachectl)    ::      /usr/sbin
start/stop              ::      /etc/init.d/apache2 (start|stop|restart|reload|force-reload|start-htcacheclean|stop-htcacheclean)
```

En estas distribuciones la configuración de apache se divide en varios archivos ordenados de forma jerárquica dentro del directorio /etc/apache2.

       /etc/apache2/
       |-- apache2.conf
       |       `--  ports.conf
       |-- mods-enabled
       |       |-- *.load
       |       `-- *.conf
       |-- conf-enabled
       |       `-- *.conf
       `-- sites-enabled
               `-- *.conf

La estructura para otras distribuciones puede ser vista en la documentación oficial, [Httpd Wiki](https://wiki.apache.org/httpd/DistrosDefaultLayout).

#### apache2.conf

El principal archivo de configuración. Incluye todas las demás piezas de configuración juntas al iniciar el servidor.

#### ports.conf

Contiene las directivas que determinan que puertos TCP Apache2 escuchará.

#### *-available

Los directorios *mods-available/*, *conf-available/* y *sites-available/* contienen los archivos de configuración para el manejo de módulos,
fragmentos de configuración global y configuraciones de los virtual hosts respectivamente.
Al activarse se generan enlaces simbólicos dentro de los directorios *enabled*.

Para su manejo existen en debian los helpers a2enmod/a2dismod, a2enconf/a2disconf y a2ensite/a2dissite.

### Comprobar estado

Para comprobar el estado del servidor podemos utilizar **systemctl**

`systemctl status apache2`

En caso de no tener systemctl instalado se puede utilizar `/etc/init.d/apache2 status` o `service apache2 status`

## Errores de sintaxis

`sudo apache2ctl configtest`

## Virtual Host

Parametros del archivo del virtual host

### ServerAdmin

Indica el correo del administrador, en caso de producirse un error se mostrará para que se le pueda contactar.

### Listen

Puerto y opcionalmente IP en que escuchará Apache.

### ServerName

Nombre del dominio del sitio, se puede combinar conServerAlias para agregar direcciones adicionales.

### DocumentRoot

Directorio raíz del sitio, por defecto: /var/www/html

### Habilitar sitio

```cs
sudo a2ensite sitiotecnologo
```

### Deshabilitar sitio

```cs
sudo a2dissite sitiotecnologo
```

### Reiniciar Servidor

```cs
service apache2 restart
```

```cs
systemctl restart apache2.service
```

```s
/etc/init.d/apache2 restart
```

## HostNames y DNS

Para conectarse a un server es necesario resolver un ServerName a dirección IP.

Para hacer pruebas locales con virtual host sin necesidad de configurar un servidor DNS es posible editar el archivo */etc/hosts*.

`127.0.0.1   www.mivirtualhost.com`
