# Redirección

## stdout hacia archivo

La redirección de entrada y salida permite redefinir hacia donde irá a parar la salida de un programa o comando. Para redirigir la salida hacia un archivo en lugar de a la pantalla es posible utilizar el operador de redirección `>` seguido del nombre del archivo.

Esto puede ser útil cuando se quiere dejar registro de la salida de una ejecución para su posterior análisis.

EJ:

`ls -l /usr/bin > ls-output.txt`

En caso de producirse un error en este caso la salida sería a la pantalla ya que la redirección anterior es a la salida estándar y en ese caso se estaría recibiendo el mensaje hacia a la salida de error estándar.

EJ con directorio que no existe:

`ls -l /bin/usr > ls-output.txt`

¿y que sucede con nuestro archivo?, originalmente se había completado con el contenido del directorio `/usr/bin`. Al fallar la ejecución la salida estándar del comando fue vacia y eso truncó nuestro archivo.

Para evitar esto deberíamos utilizar el operador `>>`, el cual realiza un append en lugar de sustitución.

## stderr hacia archivo

En algunos casos en conveniente también capturar la salida en caso de error.

Una forma es redirigir la salida de error a la salida estándar:

`ls -l /bin/usr > ls-output.txt 2>&1`

Se redirige `stdout` al archivo y luego el archivo descriptor 2 `stderr` al archivo descriptor 1 `stdout`.

`>ls-output.txt 2>&1`

El orden de redirección importa, ya que si se invierte, los errores se desplegarán en pantalla.

`2>&1 >ls-output.txt`

En versiones más recientes la notación utilizada es más sencilla:

`ls -l /bin/usr &> ls-output.txt`

## Silencio

En algunas ocaciones se requiere no obtener ningún tipo de salida, para este propósito existe un archivo especial `/dev/null` también conocido como `bit bucket`, el cual acepta entrada y no hace nada con ella.

`ls -l /bin/usr 2> /dev/null`

## Redirigír Standar input

El comando `cat` es utilizado para leer uno o más archivos y copiarlos hacia la entrada estándar.

`cat [file...]

Suele ser utilizado para desplegar un archivo de forma rápida y sin paginado, pero su función más interesante es al momento de unir archivos.

En algunos casos archivos extensos son descargados en partes, mediante el comando cat estos pueden ser reensamblados:

EJ: movie.mpeg.001, movie.mpeg.002, movie.mpeg.003...

`cat movie.mpeg.0* > movie.mpeg`

La expansión de las wildcards siempre es ordenada, por lo que los archivos se unirán en el orden correcto.

Algo similar a lo que hicimos con las tareas:

`cat tareas/*.md > tareas.md`

cat puede ser utilizado como un sencillo bloc de notas si no se le pasan argumentos, quedará recibiendo desde la entrada estandar (el teclado), hasta que reciba el valor `EOF` osea `Ctrl-d`.

EJ:

`cat`

`cat > mi-simple-notepad.txt`

Así mismo es posible utilizar un archivo como standar input:

`cat < mi-simple-notepad.txt`

## Enlaces

[wikipedia | /dev/null](https://es.wikipedia.org/wiki//dev/null)
