# Shell



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

- [ea](##_Navegacion_y_exploracion_del_sistema)
