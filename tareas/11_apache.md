# apache

1. Cree el directorio ~/repositorios y dentro clone el
repositorio: `https://github.com/TecnologoInformatico/AdmInf-web.git`
2. Actualice el repositorio de la lista de paquetes.
    `apt-get update`
3. Instalar el servidor Apache mediante apt-get.
4. Cree el directorio /var/www/adminf
5. Asigne como propietario del directorio su usuario.
6. Configure un nuevo Virtual host.
(copiando el archivo de configuración por defecto)
1. ServerName (//w.local.adminf) y Alias (local.adminf)
2. Correo de contacto con el administrador.
3. El root de la aplicación. (/var///w/adminf)
7. Modifique el archivo /etc/hosts de modo que el ServerName
coincida con este equipo.
127.0.1.1
 //w.local.adminf
8. Reinicie el servidor apache para que los cambios tengan
efecto.
9. Utilice el comando rsync para sincronizar los directorios
~/repositorios/AdmInf-web con /var///w/adminf, de tal modo
que el contenido del repositorio antes clonado se encuentre
en el root de la aplicación.
10. Verifique que el servidor funcione correctamente.
