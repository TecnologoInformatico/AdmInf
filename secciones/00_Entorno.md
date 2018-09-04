# Entorno

## Shell

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

Ejemplo:

    $ touch /home/tecnologo/archivo{01,02,03,04,05,06}.txt

creará 6 archivos con sufijo archivo y extensión .txt
Lo mismo se podría hacer: 

    $ touch /home/tecnologo/archivo{01..06}.txt

## Sustitución de comando

Esta expansión sustituye el comando ejecutado (incluyendo sus parametros) por su salida normal. La secuencia $(comando) ejecuta el comando y permite tomar el valor devuelto por otro comando. La salida se puede almacenar en una variable.

Formatos:

    $(comando)
    `comando`

Ejemplos:

    $ touch archivo_$(date +%y-%M-%d)
    $ echo “Mi actual ubicación es `pwd`”

## Entrada Salida

Toda operación dentro de un proceso tiene una entrada y una salida (I/O) y en algunas ocaciones una salida de error.

- Si no hay redireccionamiento la entrada y la salida son la entrada estándar y salida estándar
respectivamente.
- La entrada estándar usualmente es el teclado, y la salida usualmente la ventana actual o terminal.

El símbolo > permite redireccionar la salida a un archivo.
El símbolo < permite redireccionar la entrada, de modo que el comando tome datos de un archivo.
Si el nombre del archivo existe, > sobrescribe.
Si se desea agregar al final de un archivo (append) se utiliza >> (si no existe el archivo, se crea).

jemplo:

    $ ls /home/tecnologo >> test

Redireccionar el error:

    $ ls /home/tecno 2> test.errorCombinación de comandos | 
    
## Pipes y pipeline

Las tuberías (en inglés “pipes”) son mecanismos de comunicación específicos para todos los sistemas tipo UNIX. Una tubería, simbolizada por una barra vertical | permite asignar la salida estándar (stdout) de un comando a la entrada estándar (stdin) de otro.
Un pipeline es la ejecución simultánea de 2 o más comandos simples comunicados por un pipe.

## Comando tee

Lee de la entrada estándar y escribe en la salida estándar o un archivo.

Ejemplo:

    $ cat /etc/passwd | tee -a testVariables del entorno del sistema

## Comando env

El comando env lista todas las variables del ambiente.
Para ver una variable en particular se utiliza el comando echo y el nombre de la variable con un simbolo de pesos adelante.

Ejemplo:

$ echo $PATH

Variable PATH

Al ingresar un comando el shell busca el programa a ejecutar en la lista de caminos que contiene la

variable PATH.

Variable PS1
Define el prompt del usuario.

Variable TERM
Contiene el tipo de terminal

Variable HOME

Variable HOSTNAME