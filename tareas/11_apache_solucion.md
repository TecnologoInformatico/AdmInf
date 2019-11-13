# apache

1. Cree el directorio ~/repositorios y dentro clone el
repositorio: `https://github.com/TecnologoInformatico/AdmInf-web.git`

		mkdir ~/repositorios
		cd repositorios
		git clone https://github.com/TecnologoInformatico/AdmInf-web.git

2. Actualice el repositorio de la lista de paquetes.
    `apt-get update`

		sudo apt-get update

3. Instalar el servidor Apache mediante apt-get.

		sudo apt-get install apache2

	(Para comprobar que se instaló: `apache2 -v`)

4. Cree el directorio /var/www/adminf

		sudo mkdir /var/www/adminf

5. Asigne como propietario del directorio su usuario.

		cd /var/www/
		sudo chown tecnologo adminf/

6. Configure un nuevo Virtual host. (copiando el archivo de configuración por defecto)

	6.1. ServerName (/www.adminf.local) y Alias (adminf.local)

	6.2. Correo de contacto con el administrador.

	6.3. El root de la aplicación. (/var/www/adminf)


	(Me muevo a la carpeta de sitios de apache)
	
		cd /etc/apache2/sites-available
	
	(creo un nuevo archivo de configuracion a partir del por defecto)
	
		sudo cp  000-default.conf  adminf.local.conf
		
	(abro el nuevo archivo y modifico (o agrego si no existen) las siguientes lineas)
	
		sudo gedit adminf.local.conf
			
			ServerAdmin ejemplo@email.com
			DocumentRoot /var/www/adminf
			ServerName www.adminf.local
			ServerAlias adminf.local
	
	(Deshabilito el sitio por defecto de Apache)
	
		sudo a2dissite 000-default.conf
	
	(Habilito el sitio creado)
	
		sudo a2ensite adminf.local.conf

7. Modifique el archivo /etc/hosts de modo que el ServerName coincida con este equipo `127.0.1.1`.

		sudo gedit /etc/hosts
	
	(Agregar la linea:)
	
		127.0.1.1	www.adminf.local

8. Reinicie el servidor apache para que los cambios tengan efecto.

		sudo /etc/init.d/apache2 restart 

9. Utilice el comando rsync para sincronizar los directorios ~/repositorios/AdmInf-web con /var/www/adminf, de tal modo que el contenido del repositorio antes clonado se encuentre en el root de la aplicación.

		cd
		rsync -rv /home/tecnologo/repositorios/AdmInf-web/ /var/www/adminf/
	
	(por las dudas reinicio el servidor...)
	
		sudo /etc/init.d/apache2 stop
		sudo /etc/init.d/apache2 start
  
10. Verifique que el servidor funcione correctamente.

	(Abrir Firefox y acceder a **www.adminf.local**)


