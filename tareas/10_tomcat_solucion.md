# Tomcat

1. Instalar Java

		sudo apt-get install default-jdk

2. Crear el grupo `tomcat`.

		sudo addgroup tomcat

3. Crear el usuario tomcat, de tal modo que el directorio home sea `/opt/tomcat` y el grupo principal sea el anteriormente creado.

		sudo useradd -g tomcat -d /opt/tomcat tomcat

4. Descargar el server tomcat en /tmp. `curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar.gz`

	(antes de ejecutar el comando moverse a /tmp/)
	(A mi no me anduvo, la version 8.5.46 no estaba, la siguente es la 8.5.47 y esa si)

		curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz

5. Cree el directorio /opt/tomcat.

		sudo mkdir /opt/tomcat

6. Descromprima el tar en el directorio antes creado. `sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1`
	
	(como descargue otro archivo ese comando tambien cambio)
	
		sudo tar -xzvf apache-tomcat-8.5.47.tar.gz -C /opt/tomcat --strip-components=1

7. Actualizar los permisos de modo que todo en el directorio le pertenezca al grupo tomcat.

		sudo chgrp -R tomcat /opt/tomcat

8. Brindele lectura a todo dentro de el directorio `conf`.

		sudo chmod ugo+r conf/

9. Ejecución al directorio `conf`.

		cd /opt/tomcat/
	
	(no me deja)
	
		sudo chmod ugo+x /opt/tomcat/conf/
		cd /opt/tomcat/
	
	(ahora si)

10. Setee el usuario `tomcat` como propietario de los directorios, `webapps`, `work`, `temp`, y `logs`, y todo su contenido.

		cd /opt/tomcat/
		sudo chown -R tomcat webapps/ work/ temp/ logs/

11. Agregue las variables de entorno: `JAVA_HOME`, `CATALINA_HOME`

		sudo gedit /etc/enviroment

	(agregar las siguientes lineas)

		JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre"
		CATALINA_HOME="/opt/tomcat"

	(cerrar sesión y volver a abrir)

12. Cree un soft link de `$CATALINA_HOME/bin/catalina.sh` en `/etc/init.d/`.

		sudo ln -s $CATALINA_HOME/bin/catalina.sh /etc/init.d/tomcat
	
13. Investigue como setear el usuario y contraseña de un usuario administrador.





	(inicia el servidor Tomcat)
		
		sudo /etc/init.d/tomcat start
	
	(abre el archivo de configuracion de usuarios. Pegar las siguientes lineas al final pero antes de `</tomcat-users>` . Esto define el usuario **tomcat** con contraseña **tomcat**)
	
		sudo gedit /opt/tomcat/conf/tomcat-users.xml
		
			<role rolename="manager-gui"/>
			<user username="tomcat" password="tomcat" roles="manager-gui"/>
		
	(guardar los cambios y cerrar)
	
	(Abrir Firefox y acceder a **localhost:8080/manager** y acceder utilizando el usuario y contraseña configurado)

14. Agregue un archivo war al servidor y desplieguelo.

	[Descargar .war]( https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war )
	
	(seleccionar el archivo en la seccion **WAR file to deploy** del manager y click en deploy)

15. Acceda al sitio desde el navegador del anfitrion.

	(entrar a **localhost:8080/sample**)

