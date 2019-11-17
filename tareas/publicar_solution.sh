#!/bin/bash

# Parametros esperados:
# $1 -> nombre de la carpeta dentro de '/var/www/'

# Verifico que se haya especificado el parametro con el nombre de la carpeta
# el -z devuelve true si el string es vacio
if [ -z $1 ]; then
	echo "ERROR: No se especifico el nombre del virtual host"
	exit 1
fi

# Guardo el parametro en la variable
nombreCarpeta=$1
carpetaDestino="/var/www/${nombreCarpeta}/"


# Verifico si existe el directorio, si no existe lo creo
if [ ! -e $carpetaDestino ]; 
then
	echo "Se creara la carpeta $carpetaDestino ya que no existe"
	sudo mkdir $carpetaDestino
fi

# Copio el directorio actual al de destino
sudo cp -r ./ $carpetaDestino

# Si el comando anterior (cp) fue exitoso, devolvio 0 y entra al if, sino al else
if [ $(echo $?) -eq 0 ]; 
then
	echo "OK: El directorio actual se copio a $carpetaDestino exitosamente"
	exit 0
else
	echo "ERROR: No se pudo copiar el directorio actual a $carpetaDestino"
	exit 1
fi
