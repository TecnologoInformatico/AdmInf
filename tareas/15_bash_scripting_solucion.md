# bash scripting

Realizar un script que agregue un nuevo virtualhost en apache.

El script deberá por lo menos recibir un parametro que será el nombre del archivo de configuración, así como el `ServerName`.

Debe cumplir los siguientes requisitos:

1. Crear el archivo de configuración en el directorio que corresponda.
2. Crear el directorio `RootDocument` en caso de no existir.
3. Agregar una entrada en el archivo `hosts`.
4. Activar el virtualhost.
5. Reiniciar el servidor apache.

## Validaciones

- [ ] No debe existir otro archivo de configuración con el mismo nombre.
- [ ] Se debe pasar un nombre válido para el sitio.

Se debe retornar un código de salida adecuado en caso de error o éxito.

## Extra

Para confirmar que el script fue exitoso, se debe crear un archivo de test en el virtualhost antes creado y mediante curl solicitarlo para poder validar la instalación. posteriormente eliminar el archivo.

Se desea contar con una opción de ayuda `--help` o `-h`, que explique el uso del script.

-------------------------------------------------------------
-------------------------------------------------------------

# Solución

Creo un archivo `mkvhost.sh` con el siguiente código del script

**Nota:** Recordar darle al usuario permiso de ejecucion sobre el archivo con `chmod u+x mkvhost.sh`

**Uso:** Por ejemplo, para crear el sitio **adminf** hay que ejecutar `./mkvhost adminf` (parados en donde se encuentra el script)

```sh
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

```

