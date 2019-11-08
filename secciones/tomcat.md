# tomcat

Tomcat es un servidor web con sopoerte de servlets y JSPs. Incluye el compilador Jasper, que compila JSPs convirtiéndolas en servlets. El motor de servlets de Tomcat a menudo se presenta en combinación con el servidor web Apache.

Esta escrito en Java, y puede funcionar en cualquier sistema operativo que disponga de la máquina virtual Java.

## Arministración de aplicaciones

El servidor Tomcat cuenta con un panel web donde se pueden cargar archivos .war, agregandolos al servidor.
Desde la misma interfáz permite detener, replegar o recargar aplicaciones ya cargadas.

## Variables de entorno

### $CATALINA_HOME

Dentro de el directorio $CATALINA_HOME se encuentran los directorios:

- bin
  Contiene los scripts de inicio y parada.
- lib
  Librerias externas.
- conf
  Archivos de configuración. El principal `server.xml`
- logs
  Ficheros de trazas y depuración.
- server
  Clases y paquetes de Tomcat
- shared
  Similar a common.
- temp
  Ficheros temporales
- webapps
  Directorios y paquetes de aplicaciones.
- work
  Directorios de trabajo en tiempo de ejecución.

## Logs

El archivo por defecto para registrar la salida standar `stdout` y los errores `stderr` es `$JAVA_HOME/catalina.out`.

## Enlaces

- [tomcat docs](https://tomcat.apache.org/tomcat-9.0-doc/index.html)
- [descarga](https://tomcat.apache.org/download-80.cgi)
- [tomcat digitalocean](https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-ubuntu-16-04)
