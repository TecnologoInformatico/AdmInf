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
11. Agregue las variables de entorno: `JAVA_HOME`, `CATALINA_HOME`
12. Cree un soft link de `$CATALINA_HOME/bin/catalina.sh` en `/etc/init.d/`.
13. Investigue como setear el usuario y contraseña de un usuario administrador.
14. Agregue un archivo war al servidor y desplieguelo.
15. Acceda al sitio desde el navegador del anfitrion.

- [war](https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war)

## systemd

 Crear el archivo tomcat.service en /etc/systemd/system:

  `sudo nano /etc/systemd/system/tomcat.service`

```cs
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
```

Recargar el servicio:

  `sudo systemctl daemon-reload`

Iniciar tomcat:

  `sudo systemctl start tomcat`

Chequear el estado:

  `sudo systemctl status tomcat`
