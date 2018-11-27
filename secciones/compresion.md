# Empaquetado y Compresión

## tar

tar [OPTION...] [FILE]...

Comando utilizado para empaquetar archivos
(`tar` alias para `tape archive`)

- `c` opción para crear el archivo tar.
- `v` activa el modo verbose, documenta el empaquetado
- `f` [nombreArchivo] le otorga un nombre al archivo empaquetado
- `z` realiza el comando tar y el comando gzip a la vez
- `x` extrae los archivos.
- `t` lista el contenido de un archivo tar.
- `r` Agrega contenido al archivo.

Ejemplo:

comprimir el directorio dir

```s
tar -czvf respaldo_dir.tar dir
Compresion

```

descomprimir

```s
tar -xzvf respaldo_dir.tar dir
```

## gzip

Es un herramienta de compresión de Linux, comprime paquetes, archivos a .tar, es utilizado de la siguiente forma:

```s
gzip ruta/archivo/a/comprimir
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
