# Tomcat

1. Instalar Java
  `sudo apt-get install default-jdk`
2. Crear el grupo `tomcat`.
3. Crear el usuario tomcat, de tal modo que el directorio home sea `/opt/tomcat` y el grupo principal sea el anteriormente creado.
4. Descargar el server tomcat en /tmp.
  `curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar.gz`
5. Cree el directorio /opt/tomcat.
6. Descromprima el tar en el directorio antes creado.
  `sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1`
7. Actualizar los permisos de modo que todo en el directorio le pertenezca al grupo tomcat.
8. Brindele lectura a todo dentro de el directorio `conf`.
9. Ejecución al directorio `conf`.
10. Setee el usuario `tomcat` como propietario de los directorios, `webapps`, `work`, `temp`, y `logs`, y todo su contenido.
11. Agregue las variables de entorno: `JAVA_HOME`, `CATALINA_HOME`
12. Cree un soft link de `$CATALINA_HOME/bin/catalina.sh` en `/etc/init.d/`.
13. Investigue como setear el usuario y contraseña de un usuario administrador.
14. Agregue un archivo war al servidor y desplieguelo.
15. Acceda al sitio desde el navegador del anfitrion.

<<<<nan<<< HEAD
1  `sudo apt-get install default-jdk`

mkdir -p /opt/tomcat

2 sudo addgroup tomcat

3 sudo useradd -d /opt/tomcat -g tomcat tomcat ->le asigna el directorio home de una

4. `curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar.gz` -> estando en tmp

5  usermod -d /opt/tomcat tomcat

6 tar -xf (name tar)
sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

7 sudo chown -R :tomcat /opt/tomcat

8. sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

8 y 9 sudo chmod g+xrs conf

10. sudo chown -R tomcat: webapps
 sudo chown -R tomcat: work
sudo chown -R tomcat: temp
sudo chown -R tomcat: logs

11. sudo nano/etc/environments

11 JAVA_HOME="/usr/bin/java"

11 CATALINA_HOME="/opt/tomcat"

12. sudo ln -s $CATALINA_HOME/bin/catalina.sh /etc/init.d/

sudo ln -s $CATALINA_HOME"/bin/catalina.sh" /etc/init.d/tomcat

sudo /etc/init.d/tomcat start

13.

15 http://localhost:8080 
=======

1. sudo apt-get install default-jdk
2. sudo addgroup tomcat
3. mkdir -p ./opt/tomcat 
3.sudo useradd tomcat -d /opt/tomcat -g tomcat
4.sudo curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar 
5. mkdir -p /opt/tomcat
6. sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
<<<<<<< HEAD
7.
=======
>>>>>>> 0a5c62b654fbdfe5543ad8391e11f74df52ff6a1
>>>>>>> 417ddccf1945470d9f5ef893535901f2d4b78dcb
