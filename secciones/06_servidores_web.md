# Servidores web

## Servidor Apache

El servidor web Apache es el más utilizado, es poderoso, flexible y bien documentado.
Cada sitio o dominio se denomina virtual host, de forma tal que podremos disponer de varios sitios en una misma IP. Cada dominio configurado enviará al visitante a un directorio específico.

### Instalación

```sh
sudo apt-get update
sudo apt-get install apache2
```

Al instalar el servidor apache se crea un sitio por defecto al que podremos acceder desde el navegador a través de localhost.

### Comprobar estado

Para comprobar el estado del servidor podemos utilizar **systemctl**

```sh
systemctl status apache2
```

En caso de no tener systemctl instalado se puede utilizar /etc/init.d/apache2 status

### Directorios y archivos

/etc/apache2

Este directorio contiene los archivos de configuración del servidor.

/etc/apache2/apache2.conf

El principal archivo de configuración. Contiene la configuración global del servidor.

/etc/apache2/ports.conf

Contiene las directivas que determinan que puertos TCP Apache2 escuchará.

/etc/apache2/sites-available

Directorio que contiene archivos para la configuración de virtualhost.

Parametros del archivo del virtual host

ServerAdmin

Indica el correo del administrador, en caso de producirse un error se mostrará para que se le pueda contactar.

Listen

Puerto y opcionalmente IP en que escuchará Apache.

ServerName

Nombre del dominio del sitio, se puede combinar conServerAlias para agregar direcciones adicionales.

DocumentRoot

Directorio raíz del sitio, por defecto: /var/www/html

### Habilitar sitio

```sh
sudo a2ensite sitiotecnologo
```

### Deshabilitar sitio

```sh
sudo a2dissite sitiotecnologo
```

### Reiniciar Servidor

```sh
service apache2 restart
```

```sh
systemctl restart apache2.service
```

Para hacer pruebas locales con virtual host editar el archivo /etc/hosts.

    127.0.0.1   www.mivirtualhost.com
