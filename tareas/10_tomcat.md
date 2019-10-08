# Tomcat

1. Instalar Java
  `sudo apt-get install default-jdk`
2. Crear el grupo `tomcat`.
3. Crear el usuario tomcat, de tal modo que el directorio home sea `/opt/tomcat` y el grupo principal sea el anteriormente creado.
  `sudo useradd -g tomcat -d /opt/tomcat tomcat`
4. Descargar el server tomcat en /tmp.
  `curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar.gz`
5. Cree el directorio /opt/tomcat.
6. Descromprima el tar en el directorio antes creado.
  `sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1`
7. Actualizar los permisos de modo que todo en el directorio le pertenezca al grupo tomcat.
  `sudo chgrp -R tomcat /opt/tomcat`
8. Brindele lectura a todo dentro de el directorio `conf`.
9. Ejecución al directorio `conf`.
10. Setee el usuario `tomcat` como propietario de los directorios, `webapps`, `work`, `temp`, y `logs`, y todo su contenido.
  `sudo chown -R tomcat webapps/ work/ temp/ logs/`
11. Investigue como setear el usuario y contraseña de un usuario administrador.
12. Agregue un archivo war al servidor.
