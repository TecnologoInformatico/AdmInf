# Shell

La shell es la intermediaria entre el Sistema Operativo y el usuario.

Existen varias shell, la más usada es la bash. Los comandos los interpreta la Shell.

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

    $(comando)
    `comando`

Ejemplos:

    touch archivo_$(date +%y-%M-%d)
    echo “Mi actual ubicación es `pwd`”

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

    - $ ls /home/tecnologo >> test

Redireccionar el error:

    - $ ls /home/tecno 2> test.errorCombinación de comandos |

### Pipes y pipeline

Las tuberías (en inglés “pipes”) son mecanismos de comunicación específicos para todos los sistemas tipo UNIX. Una tubería, simbolizada por una barra vertical | permite asignar la salida estándar (stdout) de un comando a la entrada estándar (stdin) de otro.
Un pipeline es la ejecución simultánea de 2 o más comandos simples comunicados por un pipe.

### Comando tee

Lee de la entrada estándar y escribe en la salida estándar o un archivo.

Ejemplo: `cat /etc/passwd | tee -a testVariables del entorno del sistema`

## bashrc

`~/.bashrc`
