#!/bin/bash

# tome como referencia el siguiente codigo:
# https://www.valuebound.com/resources/blog/create-apache2-virtual-host-using-shell-script
# $1 -> nombre de servidor (server name)

# Guardo los parametros en variables
nombre=$1
nombreArchivoConfiguracion=$1.local.conf

echo "Definiendo rutas..."
# Creo variables con las rutas de las carpetas a utilizar
sitesEnable="/etc/apache2/sites-enabled/"
sitesAvailable="/etc/apache2/sites-available/"
defaultConfigFile="${sitesAvailable}000-default.conf"
rutaArchivoConfiguracion="${sitesAvailable}${nombreArchivoConfiguracion}"
rutaArchivoTemporal="${HOME}/${nombreArchivoConfiguracion}.tmp"
rutaArchivoTest="${HOME}/${nombre}.test"

echo "Definiendo configuracion de virtual host..."
# Creo variables que voy a usar en el archivo de configuracion
emailAdministrador="webmaster@localhost"
rutaRaizDelSitio="/var/www/${nombre}/"
urlDelSitio="www.${nombre}.local"
aliasServidor="${nombre}.local"

echo "Realizando validaciones..."
# Verifico que se haya especificado el parametro con el nombre del virtual host
# el -z devuelve true si el string es vacio
if [ -z $1 ]; then
	echo "ERROR: No se especifico el nombre del virtual host"
	exit 1
fi

# Verifica que no exista un archivo de configuracion con el nombre del que se debe crear
echo $rutaArchivoConfiguracion
if [ -e $rutaArchivoConfiguracion ]; then
	echo "ERROR: Ya existe el archivo de configuracion $rutaArchivoConfiguracion"
	exit 1
fi

# Verifica que no exista una carpeta RootDocument con el mismo nombre que la que se debe crear
if [ -e $rutaRaizDelSitio ]; then
	echo "ERROR: Ya existe la carpeta del sitio $rutaRaizDelSitio"
	exit 1
fi

echo "Creando directorio del sitio y asignando permisos"
# Creo el directorio raiz del sitio, cambio propietario y copio el archivo de configuracion
sudo mkdir -p ${rutaRaizDelSitio}
sudo chown ${USER} ${rutaRaizDelSitio}

echo "Creando la configuracion del virtual host"
# Vuelco el contenido del archivo de configuracion en un archivo temporal
echo "<VirtualHost *:80>" >> $rutaArchivoTemporal
echo "    ServerAdmin ${emailAdministrador}" >> $rutaArchivoTemporal
echo "    DocumentRoot ${rutaRaizDelSitio}" >> $rutaArchivoTemporal
echo "    ServerName ${urlDelSitio}" >> $rutaArchivoTemporal
echo "    ServerAlias ${aliasServidor}" >> $rutaArchivoTemporal
echo "</VirtualHost>" >> $rutaArchivoTemporal
# muevo el archivo temporal a su ubicacion real y le cambio el nombre
sudo mv $rutaArchivoTemporal $rutaArchivoConfiguracion

echo "Agregando el sitio a /etc/hosts"
# Agrego el sitio al archivo '/etc/hosts' (con este comando queda al principio del archivo)
sudo sed -i "1s/^/127.0.1.1	$urlDelSitio\n/" /etc/hosts

echo "Habilitando el sitio y reiniciando apache"
# Habilito el sitio y reinicio apache
sudo a2ensite ${nombreArchivoConfiguracion}
sudo /etc/init.d/apache2 restart 

echo "Creando archivo index para el sitio"
# Creo un archivo index.html y le imprimo contenido HTML
rutaArchivoIndex="${rutaRaizDelSitio}index.html"
echo "<h1>${urlDelSitio}</h1>" >> $rutaArchivoIndex
echo "<p>Sitio creado por el usuario '${USER}' utilizando el script $0 </p>" >> $rutaArchivoIndex

# Verificacion de que el sitio fue creado correctamente
echo "Verificando el nuevo virtual host..."
curl $urlDelSitio
if [ $(echo $?) -eq 0 ]; then
	echo "OK: El sitio $urlDelSitio fue creado exitosamente"
	exit 0
else
	echo "ERROR: El sitio parece no haberse creado correctamente"
	exit 1
fi

