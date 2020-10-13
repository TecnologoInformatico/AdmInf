# apache

1. Cree el directorio ~/repositorios y dentro clone el
repositorio: `https://github.com/TecnologoInformatico/AdmInf-web.git`
2. Actualice el repositorio de la lista de paquetes.
    `apt update`
3. Instalar el servidor Apache mediante apt.
4. Cree el directorio /var/www/adminf
5. Asigne como propietario del directorio su usuario.
6. Configure un nuevo Virtual host. (copiando el archivo de configuración por defecto)
  6.1. ServerName (/www.adminf.local) y Alias (adminf.local)
  6.2. Correo de contacto con el administrador.
  6.3. El root de la aplicación. (/var/www/adminf)
7. Modifique el archivo /etc/hosts de modo que el ServerName coincida con este equipo `127.0.1.1`.
8. Reinicie el servidor apache para que los cambios tengan efecto.
9. Utilice el comando rsync para sincronizar los directorios ~/repositorios/AdmInf-web con /var/www/adminf, de tal modo que el contenido del repositorio antes clonado se encuentre en el root de la aplicación.
10. Verifique que el servidor funcione correctamente.
