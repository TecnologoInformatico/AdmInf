# tomcat

Tomcat es un servidor web con sopoerte de servlets y JSPs. Incluye el compilador Jasper, que compila JSPs convirtiéndolas en servlets. El motor de servlets de Tomcat a menudo se presenta en combinación con el servidor web Apache.

Esta escrito en Java, y puede funcionar en cualquier sistema operativo que disponga de la máquina virtual Java.

## Tarea

### 1 — Instalar Java

Tomcat requiere que Java se encuentre instalado en el servidor, para que así el código Java pueda ser interpretado en el servidor, para esto instalaremos OpenJDK mediante apt.

Actualizar el indice del repositorio:

`sudo apt update`

Instalar el paquete JDK (Java Development Kit):

`sudo apt install default-jdk`

### 2 — Usuario tomcat

Una vez Java instalado crearemos el usuario `tomcat`, el cual será el utilizado para correr el servicio del servidor.

Por motivos de seguridad, Tomcat debe correr como un usuario sin privilegios, no root.

Creamos el grupo tomcat:

`sudo groupadd tomcat`

Y luego creamos el nuevo usuario `tomcat`, el cual será miembro del grupo creado anteriormente y tendrá como directorio home `/opt/tomcat` (donde se instalará el servidor), además le asignaremos la shell `/bin/false`, de modo que nadie pueda iniciar sesión con este usuario:

`sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat`

Ya que contamos con el usuario tomcat, descargaremos e instalaremos el servidor.

### 3 — Instalación del servidor Tomcat

Una forma de instalar Tomcat es descargando la última distribución binaria y configurarla manualmente.

Ingrese al sitio de Tomcat y desde la sección de descargas busque la última versión de Tomcat 9. Copie el enlace del archivo “tar.gz”.

En su servidor muevase al directorio `/tmp`. Este es un buen directorio para descargar elementos efimeros, en este caso no volveremos a necesitar el tar luego de descomprimirlo:

    cd /tmp

Utilizaremos curl para descargar el archivo del cual copiamos el enlace:

    curl -O link_al_archivo_tar

Instalaremos Tommcat en el directorio `/opt/tomcat`. Por lo que debemos crear el directorio y extraer el archivo en esa ubicación:

    sudo mkdir /opt/tomcat
    sudo tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1

### 4 — Configurar permisos

El usuario tomcat necesita tener acceso a la instalación.

Nos moveremos al directorio de la instalación:

    cd /opt/tomcat

Y le otorgaremos el grupo tomcat al directorio completo:

    sudo chgrp -R tomcat /opt/tomcat

A continuación le daremos al grupo acceso de lectura al directorio de configuración y a su contenido, y de ejecución al directorio para que se pueda navegar:

    sudo chmod -R g+r conf
    sudo chmod g+x conf

Establecemos como propietario a tomcat de los directorios webapps, work, temp, y logs:

`sudo chown -R tomcat webapps/ work/ temp/ logs/`

### 5 — Archivo de servicio systemd

Una vez los permisos se han asignado, es momento de crear un archivo para el servicio systemd, el cual manejar'a el proceso Tomcat.

Tomcat necesita saber donde se encuentra instalado Java. Este directorio es referido comunmente como “JAVA_HOME”. La forma más fácil de ver la ubicación es mediante el comando:

    sudo update-java-alternatives -l

Salida:
`java-1.11.0-openjdk-amd64       1081       /usr/lib/jvm/java-1.11.0-openjdk-amd64`

El JAVA_HOME en la salida es la última columna. Dado el ejemplo anterior, en este caso el valor de JAVA_HOME será:

JAVA_HOME
`/usr/lib/jvm/java-1.11.0-openjdk-amd64`

Tu JAVA_HOME tal vez sea otro.

Con esta información podemos crear el archivo para el servicio tomcat de systemd, abriremos el archivo tomcat.service en el directorio /etc/systemd/system:

    sudo vim /etc/systemd/system/tomcat.service

Pegue el siguiente contenido en el archivo modificando el valor de JAVA_HOME de ser necesario y demás campos que crea convenientes, como por ejemplo el manejo de memoria en el campo CATALINA_OPTS:
/etc/systemd/system/tomcat.service

```ini
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
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

Una vez finalizado guarde y cierre el archivo, y reinicie el demonio systemd para que sepa del nuevo archivo:

    sudo systemctl daemon-reload

Inicie el servicio de tomcat mediante el comando:

    sudo systemctl start tomcat

Chequee que inicie sin errores tipeando:

    sudo systemctl status tomcat

### 6 — Ajuste el Firewall y pruebe el servidor

Ahora que el servicio ha iniciado, podemos probar que la página inicial responda.

Antes de hacer esto debemos ajustar el firewall para permitir solicitudes a este servicio.

Tomcat utiliza el puerto 8080 para aceptar las solicitudes convencionales.

    sudo ufw allow 8080

De este modo, ya se debería poder acceder a la página de inicio del servidor, ingresando desde un navegador web a la IP del servidor en el puerto :8080:

http://dominio_del_servidor_o_IP:8080

Por el momento no tendremos habilitado el acceso a la sección de mantenimiento, lo cual configuraremos luego.

En caso de que se haya podido acceder al servidor con éxito, habilitar el archivo del servicio para que se ejecute al iniciar el sistema:

    sudo systemctl enable tomcat
