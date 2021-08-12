# Shell

## ¿Qué es la shell?

Para interactuar con una computadora existen intefaces gráficas `GUI` e interfaces de linea de comandos, lo que se denomina `shell`. La shell es un interpete de comandos intermediaria entre el Sistema Operativo y el usuario.

Básicamente, una shell es un **macro procesador** que ejecuta comandos, en donde el termino macro procesador refiere a la funcionalidad en la que determinados textos y símbolos son expandidos para crear complejas expresiones.

Así mismo una shell de Unix es tanto un **interprete de comandos** como un **lenguaje de programación**. Como interprete de comandos la shell provee al usuario una rica interfaz a la que acceder a las utilidades del sistema. Por su parte la funcionalidad de lenguaje de programación permite que esas utilidades sean combinadas. Es posible crear un archivo conteniendo comandos, y ĺuego convertir ese mismo archivo en un nuevo comando. Esos nuevos comandos, si son alojados en directorios como el  `/bin`, están a la par de los comandos del sistema, permitiendo así que usuarios o grupos establescan entornos personalizados, o automatizar sus propias tareas de forma personalizada.

La shell puede ser utilizada de forma **interactiva** o **no interactiva**. En modo interactivo, sólo aceptaran entradas desde el teclado. En modo no interactivo, la shell ejecuta comandos leyendo desde un archivo.

Las shell proveen un pequeño conjunto de **comandos integrados** (builtins), los cuales implementan funcionalidades básicas e indispensables. Entre estas funciones se encuentran; `cd`, `break`, `continue` y `exec`, las cuales no podrían ser implementadas de forma independiente. Por otro lado comandos como `history`, `getopts`, `kill` o `pwd`, si bien podrían implementarse de forma externa, resultan más convenientes tenerlos integrados.

Existen varias shell, (`sh`, `zsh`, `fish`), de las cuales la más popular es `bash` (Bourne Again SHell).

## Prompt

Al iniciar el emulador de terminal se despliega el prompt.

```sh
[dmascheroni@admin-server ~]$
```

Este conjunto de caracteres se despliega cada vez que la línea de comandos está lista para recibir órdenes. Su apariencia puede variar dependiendo de la distribución, la shell o simplemente la configuración del usuario, de todos modos en general tienen algunas características comunes:

El `$` indica que se encuentra logueado un usuario común, mientras que en caso de sustituírse por un `#` se estará indicando que se trata de un usuario root.

Al comienzo del prompt señalado anteriormente se muestra entre parentesis rectos el nombre del usuario logueado `dmascheroni` y el host en el cual se encuentra `admin-server`. El nombre del host en el prompt es de gran utilidad ya al acceder por acceso remoto es posible saber exactamente en que equipo estamos trabajando.

El símbolo `~` indica que el usuario está en su directorio home, por lo general en el prompt se indica el directorio de trabajo actual.

## Ejecutando comandos

Para ejecutar un comando basta con escribirlo y presionar `Enter`. En caso de que el comando exista se nos desplegará la salida del mismo, de lo contrario se nos indicará que el comando ingresado no existe.

```sh
[dmascheroni@admin-server ~]$ asdasfasfasf
bash: asdasfasfasf: command not found
[dmascheroni@admin-server ~]$
```

Es posible volver a utilizar un comando previamente utilizado presionando la flecha hacia arriba `🠕`. La mayoría de las distribuciones de Linux recuerdan los últimos 1000 comandos por defecto, este comando es denominado `history`.

## Navegacion y exploracion del sistema

- `pwd` Imprime el directorio de trabajo actual.
- `cd` Cambia de directorio.
- `ls` Lista el contenido del directorio.
- `file` Determina el tipo de archivo
- `less` Muestra el contenido de un archivo de forma paginada.
- `cp` copia archivos y directorios.
- `mv` Mueve o renombra archivos y directorios
- `mkdir` Crea directorios.
- `rm` Elimina archivos y directorios.
- `ln` Crea enlaces.

### ls

Uso: `ls [OPTION]... [FILE]...`

Lista información de los archivos en el directorio especificado, por defecto en el directorio actual.

Opciones destacadas:

| opcion | largo            | descripcion |
---------|------------------|-------------|
| -a     | --all            | lista todos los archivos, incl. los ocultos  |
| -d     | --directory      | muestra información del directorio, no de su contenido |
| -F     | --classify       | muestra un indicador al final del archivo. ej: `/` |
| -h     | --human-readable | con -l tamaños para humanos en lugar de bytes |
| -l     |                  | formato largo      |
| -r     | --reverse        | orden reverso (por defecto ascendente) |
| -S     |                  | ordena por tamaño |
| -t     |                  | ordena por fecha de modificacion |

Documentación completa: <http://www.gnu.org/software/coreutils/ls>.

### less

Uso: `less [FILE]`

less es un programa del tipo paginador, lo cual permite ver fácilmente largos documentos de textos, manejandolo de forma de páginas.

En lugar de un archivo también admite la entrada estándar, por lo que es posible redirigir la salida de otro comando.

| comando               | accion                      |
|-----------------------|-----------------------------|
| `Page Up` o `b`       | Una página atrás            |
| `Page Down` o `space` | Una página atrás            |
| `Flecha arriba`       | Scroll una linea arriba     |
| `Flecha abajo`        | Scroll una linea abajo      |
| `G`                   | Mueve al final del texto    |
| `1G` o `g`            | Mueve al comienzo del texto |
| `/texto`              | Busca el texto `texto`      |
| `n`                   | Busca la próxima ocurrencia del texto anterior |
| `h`                   | Muestra ayuda               |
| `q`                   | (quit) salir de less        |

## Comandos

- `type`
- `which`
- `man`
- `apropos`
- `info`
- `whatis`
- `alias`

Entradas de teclado para el uso de la línea de comandos

- *Ctrl + c* finaliza la tarea.
- *Ctrl + l* limpia la pantalla
- *Ctrl + a* Al inicio de la línea (tecla home)
- *Ctrl + e* Al fin de la línea (tecla end)
- *del* Elimina a la derecha del cursor
- *Ctrl + k* Elimina desde el cursor al final de la línea
- *Tabulador* Autocompletar

## Expansión de llaves { }

Mediante la expansión de llaves se pueden generar la repetición de una tarea en un sólo comando.

Ejemplo: `touch /home/tecnologo/archivo{01,02,03,04,05,06}.txt`

creará 6 archivos con sufijo archivo y extensión .txt
Lo mismo se podría hacer: `touch /home/tecnologo/archivo{01..06}.txt`

## Sustitución de comando

Esta expansión sustituye el comando ejecutado (incluyendo sus parametros) por su salida normal. La secuencia $(comando) ejecuta el comando y permite tomar el valor devuelto por otro comando. La salida se puede almacenar en una variable.

Formatos:

```sh
$(comando)
`comando`
```

Ejemplos:

```sh
touch archivo_$(date +%y-%m-%d)
echo “Mi actual ubicación es `pwd`”
```

## Redirección

- `cat`
- `sort`
- `uniq`
- `grep`
- `wc`
- `head`
- `tail`
- `tee`

### Entrada Salida

Toda operación dentro de un proceso tiene una entrada y una salida (I/O) y en algunas ocaciones una salida de error.

- Si no hay redireccionamiento la entrada y la salida son la entrada estándar y salida estándar respectivamente.
- La entrada estándar usualmente es el teclado, y la salida usualmente la ventana actual o terminal.

El símbolo > permite redireccionar la salida a un archivo.
El símbolo < permite redireccionar la entrada, de modo que el comando tome datos de un archivo.
Si el nombre del archivo existe, > sobrescribe.
Si se desea agregar al final de un archivo (append) se utiliza >> (si no existe el archivo, se crea).

Ejemplo:

```sh
ls /home/tecnologo >> test
```

Redireccionar el error:

```sh
ls /home/tecno 2> test.error
```

### Pipes y pipeline

Las tuberías (en inglés “pipes”) son mecanismos de comunicación específicos para todos los sistemas tipo UNIX. Una tubería, simbolizada por una barra vertical `|` permite asignar la salida estándar (stdout) de un comando a la entrada estándar (stdin) de otro.
Un pipeline es la ejecución simultánea de 2 o más comandos simples comunicados por un pipe.

### Comando tee

Lee de la entrada estándar y escribe en la salida estándar o un archivo.

Ejemplo: `cat /etc/passwd | tee -a test`

## Variables del entorno del sistema

### bashrc

`~/.bashrc`

## Bibliografía / Link's

- [GNU / Manual bash](https://www.gnu.org/software/bash/manual/bash.html#What-is-Bash_003f)
