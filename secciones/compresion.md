# Empaquetado y Compresión

Una de las tareas más importantes de un administrador de sistemas es mantener los datos seguros. Una forma de lograr esto es realizando regularmente un respaldo (backup) de los archivos del sistema. Incluso sin ser el administrador es deseable mantener copias seguras de algunos archivos importantes replicadas en otro dispositivo.

Algunas herramientas útiles para llevar a cabo esta tarea son:

- [gzip](#gzip)
- [bzip2](#bzip2)
- [tar](#tar)
- [zip](#zip)
- [rsync](#rsync)

Además de las ya antes mencionadas sftp, scp.

## Comprpesión de archivos

Desde los inicios de la computación se ha mantenido el desafío de almacenar información en la menor cantidad de espacio posible, más allá de que se trate de especio en memoria, espacio en almacenamiento masivo o ancho de banda, eso dió inicio a las técnicas de compresión de datos.

La compresión de datos es el proceso de remover redundancia de los datos.

### Ejemplo

Considerando como ejemplo una imagen completamente negra, con las dimenciones de 100px x 100px, en terminos de almacenamiento ,(asumiendo 24bits por pixel ~ 3 bytes), estariamos hablando de 30.000  bytes de almacenamiento.

Al ser toda la imagen de un único color se trata de un archivo completo de información redundante, por decirlo de algún modo tenemos un bloque de 10.000 pixeles negros. En lugar de almacenar los datos de ese modo podemos comprimirlos indicando con el número 10.000 que a continuación el valor del color (0 en este caso). Esa técnica es denominada `run-length encoding`, una de las más rudimentarias formas de encriptación, hoy en día existen mucho más avanzados mecanismos, pero la idea es la misma, minimizar lo máximo posible la redundancia de datos.

### Categorías

#### Sin pérdida | Lossless

Este tipo de compresión preserva toda la información contenida en el archivo original, esto quiere decir que cuando un archivo es restablecido a su estado original, el archivo es exactamente igual al original.

#### Con pérdida | Lossy

Por otro lado existen técnicas donde se remueven datos al momento de la compresión para lograr una mayor reducción del tamaño final, al ser restablecido el archivo no es exactamente igual al original, sino que bastante similar. Ejemplos de este tipo de compresión son JPEG y MP3.

## gzip

```s
gzip ruta/archivo/a/comprimir
```

El programa gzip es utilizado para comprimir uno o más archivos. CUando es ejecutado reemplaza el original con una versión comprimida. Se cuenta a su vez con la contraparte `gunzip`, el cual puede ser utilizado para volver a los archivos a su estado original.

```sh
ls -l /etc > foo.txt
ls -l foo.*
gzip foo.txt
ls -l foo.*
gunzip foo.txt
ls -l foo.*
```

En el ejemplo anterior se crea un archivo foo.txt a partir del listado del directorio /etc, luego se reemplaza mediante gzip por una versión comprimida, para finalmente volver a ser restablecido.

Cabe destacar que tanto el archivo original como su versión comprimida mantienen los mismos permisos y timestamp.

| opción | opción larga | descripción |
| ------ | ------------ | ----------- |
| -c     | ------------ | ----------- |
| -d     | ------------ | ----------- |
| -f     | ------------ | ----------- |
| -h     | ------------ | ----------- |
| -l     | ------------ | ----------- |
| -r     | ------------ | ----------- |
| -t     | ------------ | ----------- |
| -v     | ------------ | ----------- |
| -6     | ------------ | ----------- |

Este comando suele ser utilizado junto con el comando tar.

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

## zip

Comprimir todo el contenido de la carpeta myFolder.

```s
zip -r zipFile.zip myFolder
```

```s
unzip zipFile.zip -d myNewFolder
```
