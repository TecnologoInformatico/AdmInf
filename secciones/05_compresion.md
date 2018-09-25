# Compresión y respaldo de archivos

## gzip

Es un herramienta de compresión de Linux, comprime paquetes, archivos a .tar, es utilizado de la siguiente forma:

```sh
$ gzip ruta/archivo/a/comprimir
```

Si se esta situado en el directorio del archivo solo se da el nombre del archivo

Este comando suele ser utilizado junto con el comando tar.

## tar

Comando utilizado para empaquetar archivos

- c opción para crear el archivo
- v activa el modo verbose, documenta el empaquetado
- z realiza el comando tar y el comando gzip a la vez
- f [nombreArchivo] le otorga un nombre al archivo empaquetado

Ejemplo:

```sh
tar -cvf respaldo.tar *
```

## rsync

Este comando sincroniza tanto directorios como archivos de un lugar a otro, el mismo tiene 2 parametros obligatorios para su utilización.

```sh
$ rsync ruta/directorio/a/respaldar ruta/respaldo
```

- z activa la compresión del archivo respaldado.
- v activa el modo verbose, esto significa que el comando documentara el respaldo.
- r activa la recursividad que sera usada para que el comando entre dentro de los directorios y respalde, de no ser asi solo respaldara el primer directorio.