# Empaquetado y Compresión

Una de las tareas más importantes de un administrador de sistemas es mantener los datos seguros. Una forma de lograr esto es realizando regularmente un respaldo (backup) de los archivos del sistema. Incluso sin ser el administrador es deseable mantener copias seguras de algunos archivos importantes replicadas en otro dispositivo.

Algunas herramientas útiles para llevar a cabo esta tarea son:

- [gzip](#gzip)
- [bzip2](#bzip2)
- [zip](#zip)
- [tar](#tar)
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

### gzip

```s
gzip ruta/archivo/a/comprimir
```

El programa gzip es utilizado para comprimir uno o más archivos. Cuando es ejecutado reemplaza el original con una versión comprimida. Se cuenta a su vez con la contraparte `gunzip`, el cual puede ser utilizado para volver a los archivos a su estado original.

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

#### Opciones de gzip

| opción | opción larga         | descripción |
| ------ | -------------------- | ----------- |
| -c     | --stdout --to-stdout | ----------- |
| -d     | --decompress         | ----------- |
| -f     | --force              | ----------- |
| -h     | --help               | ----------- |
| -l     | --list               | ----------- |
| -r     | --recursive          | ----------- |
| -t     | --test               | Testea la integridad de un archivo comprimido. |
| -v     | --verbose            | ----------- |
| -1     | --fast               | ----------- |
| -6     | de 1 a 9, 6 default  | ----------- |
| -9     | --best               | ----------- |

Este comando suele ser utilizado junto con el comando tar.

### bzip2

Programa similar a gzip pero que utiliza un algoritmo diferente de compresión, el cual brinda mejores niveles de compresión, pero con el costo de mayor tiempo de procesamiento.

Su funcionamiento es similar a gzip, al comprimir un archivo a este se le asigna la extensión bzip2. Las opciones que incluye son las mismas que gzip a excepción de `-r`.

Programas que incluye:

- bunzip2 (descomprime `bzip2 -d`)
- bzcat (descomprime hacia stdout, la salida estandar `bzip2 -c`)
- bzip2recover (Extrae bloques de archivos bz2 dañados)

## Archivado

Una tarea frecuente al administrar datos en conjunto con la compresión es la de archivar, proceso por el cual se almacenan varios archivos como uno único. Esto se realiza por lo general como parte de un sistema de backup o para mover información desde un sistema activo hacia algún almacenamiento de largo plazo.

### tar

En el mundo de los sistemas tipo UNIX el programa tar es la clásica herramienta con esta finalidad.

La extensión que suele utilizar este tipo de archivos es `.tar` cuando se almacena la información sin procesar, o `.tgz` cuando se utilizó un proceso de compresión mediante gzip.

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

El programa zip es tanto una herramienta de compresión como un archivador, y el formato generado es común en el entorno Windows. En el mundo UNIX el programa de compresión predominante es gzip, seguido por bzip2, de todos modos en casos donde se deba interactuar con un sistema Windows este programa puede ser de ayuda.

La sintaxis básica es:

`zip opciones zipFile file...`

Comprimir todo el contenido de la carpeta myFolder.

```s
zip -r zipFile.zip myFolder
```

En caso de omitir la opción -r estaríamos incluyendo el directorio, pero nada de su contenido.

La extensión .zip es agregada de forma automática, pero se puede incluír para mejorar la claridad de la ejecución.

En zip si un archivo especificado existe, este es actualizado en lugar de ser reemplazado, pero los nuevos archivos son agregados, mientras que los existentes son reemplazados.

Listar archivos:

`unzip -l archivo.zip directorio/a/extraer/txt`

Extraer archivo en particular:

`unzip -l archivo.zip directorio/a/extraer/txt`

```s
unzip zipFile.zip -d myNewFolder
```

## Fuentes y enlaces

- [TLCL | The linux Command Line book]()
