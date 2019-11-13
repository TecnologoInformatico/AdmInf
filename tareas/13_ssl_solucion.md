# SSL/TLS

SSL (Secure Sockets Layer) y su sucesor, TLS (Transport Layer Security), son protocolos para establecer una comunicación autenticada y encriptada entre una red de computadoras.

El protocolo SSL fue deprecated desde el lanzamiento del protocolo TLS 1.0 en 1999, de todos modos aún es comun referirse a el como `SSL` o `SSL/TLS`.

La versión al momento (10-2019) es TLS 1.3, definida en el RFC 8446.

1. Verifique que tenga instalado tanto apache2 como openssl. En caso de no contar con estas herramientas instalelas.

		which apache2
		which openssl

	(Si el paquete esta instalado, da su ruta, de lo contrario no muestra nada)

2. Cree el directorio `/etc/ssl/localcerts` en caso de que no exista.

		ls /etc/ssl/localcerts
	
	(da error, asi que no existe)
	
		sudo mkdir /etc/ssl/localcerts

3. Crear un certificado autofirmado con una validez de 30 días.
  `openssl req -new -x509 -days 30 -nodes -out /etc/ssl/localcerts/apache.pem -keyout /etc/ssl/localcerts/apache.key`

		sudo openssl req -new -x509 -days 30 -nodes -out /etc/ssl/localcerts/apache.pem -keyout /etc/ssl/localcerts/apache.key
	
	(Hay que ingresar algunos datos...)

		Country Name (2 letter code) [AU]:UY
		State or Province Name (full name) [Some-State]:San Jose
		Locality Name (eg, city) []:San Jose de Mayo
		Organization Name (eg, company) [Internet Widgits Pty Ltd]:Tecnologo Informatico
		Organizational Unit Name (eg, section) []:Administracion de infraestructura
		Common Name (e.g. server FQDN or YOUR name) []:adminf
		Email Address []:ejemplo@email.com

4. Modifique los permisos de las claves para que sólo el propio usuario root cuente con escritura y lectura.

		sudo chmod go-r /etc/ssl/localcerts/apache.key /etc/ssl/localcerts/apache.pem

5. Habilite el módulo `ssl` de apache.

		sudo a2enmod ssl
		sudo /etc/init.d/apache2 restart
	
	(En realidad dice para reiniciar con `service apache2 restart` pero no me anda)

6. Cree un nuevo virtualhost con la configuración [testssl](#Config-testssl).

	(Creo un nuevo sitio como en las tareas anteriores)

		sudo mkdir /var/www/testssl
		sudo chown tecnologo /var/www/testssl
		cd /etc/apache2/sites-available
		sudo cp 000-default.conf testssl.local.conf
		sudo gedit testssl.local.conf
	
	(agrego la configuracion especificada)

		<VirtualHost *:7000>
			ServerAdmin webmaster@localhost
			DocumentRoot /var/www/testssl
			
			SSLEngine On
			SSLCertificateFile /etc/ssl/localcerts/apache.pem
			SSLCertificateKeyFile /etc/ssl/localcerts/apache.key
		</VirtualHost>
	
	(Hago que Apache escuche el puerto **7000**)
	
		sudo gedit /etc/apache2/ports.conf
		
			Listen 7000
		
	(Habilito la configuracion y reinicio el servidor)
	
		sudo a2ensite testssl.local.conf
		sudo /etc/init.d/apache2 restart 


7. Agregue un contenido de prueba para ese sitio.

	(Creo el archivo `index.html` y le pongo contenido)
	
		sudo gedit /var/www/testssl/index.html

			<h1>Hola SSL</h1>
	
	Accedo a `https://localhost:7000` , el navegador advierte sobre la seguridad del sitio y le doy acepto para continuar

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

## Config testssl

```xml
  <VirtualHost *:7000>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/testssl

    SSLEngine On
    SSLCertificateFile /etc/ssl/localcerts/apache.pem
    SSLCertificateKeyFile /etc/ssl/localcerts/apache.key
</VirtualHost>
```
