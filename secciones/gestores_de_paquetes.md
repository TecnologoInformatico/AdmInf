# Gestores de paquetes

Uno de los puntos más determinantes sobre la calidad de una distribución de Linux se encuentra en su sistema de empaquetado y distribución de software, a la vez que su soporte por parte de la comunidad.

Un gestor de paquetes `Package management` es un método para instalar y mantener el software del sistema.

Nos centraremos en el estilo Debian, `.deb`. Un paquete es una colección de archivos comprimidos que componen un programa, archivos para completar la instalació y metadata.

Entre esos archivos muchas veces se encuentran scripts pre y post instalación.

Los paquetes son creados por una persona conocida como `package maintainer`, quién no necesariamente es un empleado de la distribución. Esta persona obtiene el código del autor del software y crea la metadata y los scripts necesarios para la instalación.

## dpkg

Herramienta de bajo nivel para la instalación y mantenimiento de paquetes .deb.

`dpkg --install package_file.deb`

Listar paquetes instalados:

`dpkg --list`

Verificar si un paquete esta instalado

`dpkg --status package_name`



## apt-get

Mantenimiento de paquetes mediante repositorios.

Actualización del repositorio

`apt-get update`

Busqueda de un paquete

`apt-cache search texto_a_buscar`

Instalación de un paquete

`apt-get install package_name`

Remover un paquete

`apt-get remove package_name`

Actualizar paquetes

`apt-get update; apt-get upgrade`

Conociendo el nombre de un paquete instalado es posible obtener información de el.

`apt-cache show package_name`

## aptitude

## apt

## Enlaces

- [The Debian GNU/Linux FAQ package management](http://www.debian.org/doc/FAQ/ch-pkgtools.en.html)