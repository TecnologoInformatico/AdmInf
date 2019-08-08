# Compresión y respaldo de archivos

## tar

tar [OPTION...] [FILE]...

Comando utilizado para empaquetar archivos

- c opción para crear el archivo tar.
- v activa el modo verbose, documenta el empaquetado
- f [nombreArchivo] le otorga un nombre al archivo empaquetado
- z realiza el comando tar y el comando gzip a la vez
- x extrae los archivos.

Ejemplo:

comprimir el directorio dir

```sh
tar -czvf respaldo_dir.tar dir
```

descomprimir

```sh
tar -xzvf respaldo_dir.tar dir
```

## gzip

Es un herramienta de compresión de Linux, comprime paquetes, archivos a .tar, es utilizado de la siguiente forma:

```sh
$ gzip ruta/archivo/a/comprimir
```

Si se esta situado en el directorio del archivo solo se da el nombre del archivo

Este comando suele ser utilizado junto con el comando tar.

## zip

Comprimir todo el contenido de la carpeta myFolder.

```s
zip -r zipFile.zip myFolder
```

```s
unzip zipFile.zip -d myNewFolder
```

## rsync

Este comando sincroniza tanto directorios como archivos de un lugar a otro, el mismo tiene 2 parametros obligatorios para su utilización. [documentación](https://rsync.samba.org/)

```sh
$ rsync ruta/directorio/a/respaldar ruta/respaldo
```

- `-z` Activa la compresión del archivo respaldado.
- `-v` Activa el modo verbose, esto significa que el comando documentara el respaldo.
- `-r` Activa la recursividad que sera usada para que el comando entre dentro de los directorios y respalde, de no ser asi solo respaldara el primer directorio.
- `-a` La opción -a es una combinación de banderas. Significa "archive" y sincroniza de forma recursiva preservando links simbólicos, archivos especiales, modificaciones de tiempo, grupo, propietario y permisos.
- `-n` Corre una simulación `--dry-run` que se puede utilizar para conocer sin riesgos el resultado de utilizar el comando.
- `--exclude-from=archivo` Excluye los archivos o directorios que se establezcan en el archivo pasado.
