# PHP & MySQL

Se busca completar el stack LAMP con la instalación de MySQL y PHP en nuestro servidor, además se requiere crear un sitio, manteniendo el código fuente con GIT y se seguiran directivas de diseño HTML.

1. Instalar MySQL mediante el comando:
  `sudo apt-get install mysql-server mysql-client` Para la contraseña del usuario root utilice “T15J-sanjose”

		sudo apt-get install mysql-server mysql-client
	
	(le puse **root** a la contraseña...)

2. Instale PHP 7 y el módulo para utilizar con apache. (en la versión 14.0 de ubuntu será necesario agregar el repositorio  ppa:ondrej/php)

		sudo add-apt-repository ppa:ondrej/php
		sudo apt-get install php7.0 libapache2-mod-php7.0
		sudo apt-get install php7.0-mysql
		(reinicie apache luego de realizado este paso.)

	(El tercer comando no me dejó instalarlo, dice que no encuentra ese paquete, asi que instale lo mas parecido: `sudo apt-get install php5-mysql`  )

3. Cree un sitio en el servidor apache y dentro de dicho directorio agregue un archivo info.php conteniendo el código:
  `<?php phpinfo(); ?>`

	(Creo otro sitio como con la tarea anterior)

		sudo mkdir /var/www/tarea-php-mysql
		cd /var/www/
		sudo chown tecnologo tarea-php-mysql
		cd /etc/apache2/sites-available
		sudo cp  000-default.conf  tarea-php-mysql.local.conf
		sudo gedit tarea-php-mysql.local.conf
		
			ServerAdmin ejemplo@email.com
			DocumentRoot /var/www/tarea-php-mysql
			ServerName www.tarea-php-mysql.local
			ServerAlias tarea-php-mysql.local
		
		sudo a2ensite tarea-php-mysql.local.conf
		
		sudo gedit /etc/hosts
		
			127.0.1.1	www.tarea-php-mysql.local
		
		sudo /etc/init.d/apache2 restart 
	
	(creo el archivo que dice la letra)
	
		gedit /var/www/tarea-php-mysql/info.php
	
	(agrego el contenido `<?php phpinfo(); ?>`  , guardo y cerro)

4. Acceda al sitio e investigue el resultado obtenido.

	La página brinda informacion sobre los archivos del sitio: Nombre, fecha de modificacion, tamaño y descripción

5. Instale phpMyAdmin
  `sudo apt-get install phpmyadmin`

	- Selecciono que quiero usar Apache
	- Selecciono que quiero configurar la conexción con la base de datos
	- Contraseña del usuario administrador de la base de datos: **root**
	- Contraseña de aplicacion MySql para phpmyadmin: **root**
	
	(Se supone que entrando a **localhost/phpmyadmin** se accede, pero no funciona por diferencia de versiones de PHP)

