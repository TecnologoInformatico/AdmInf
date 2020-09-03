# Entorno

- [¿Qué es el entorno?](#El-entorno)
- [Comandos](#comandos)
  - [env y printenv](#env-y-printenv)
  - [set]
  - [export]
  - [alias]
- [Variables del entorno](#Variables-del-entorno)
  - [PATH](#PATH)
  - [PS1](#PS1)

## El entorno

Cuando ingresamos en el sistema se leen una serie de scripts de configuración, denominados startup files, los cuales establecen el entorno compartido por los usuarios.
Esto es seguido por otros scripts ubicados en el directorio home del usuario, los cuales personalizarán el ambiente.

- /etc/profile
- ~/.bash_profile
- ~/.bash_login
- ~/.profile

Los datos/variables establecidos en el entorno servirán al sistema tanto como a algunos programas que utilizan las variables de entorno para conocer el sistema en el que se encuentran y definir algunos comportamientos propios de la aplicación.

En el entorno se guardan dos tipos básicos de datos; Las variables de entorno y las variables de la shell. Dentro de los datos almacenados por la shell además de variables se cuenta con `aliases` (alias) y `shell functions` funciones.

## Scripts para sesiones sin login

- /etc/bash.bashrc
- ~/.bashrc

## Comandos

### env y printenv

El comando env lista todas las variables del ambiente.
Para ver una variable en particular se utiliza el comando echo y el nombre de la variable con un simbolo de pesos adelante. printenv funciona de un modo similar, y permite imprimir el valor de una determinada variable.

Ejemplo: `echo $PATH` o `printenv PATH`

### set

El comando `set` es un buuiltin de shell y tiene una función similar a printenv, permitiendonos ver las variables almacenadas en el entorno, pero además mostrará los datos almacenados en la shell.

EJ: `set | less`

Redirigimos la salida de set mediante el uso de `pipes` al comando `less` para poder ver de forma más práctica la salida del comando. A diferencia de `printenv`, aquí se nos desplegará el contenido ordenado de forma alfabética.

### export

Al ejecutar el comando export se les habilita el valor de la variable a los procesos hijo.

`export PATH`

### alias

Los `alias` son útiles para modificar el comportamiento por defecto de un comando o programa, o para crear nuestros propios comandos combinando otros o escribiendo pequeños scripts. Estos `alias` no son mostrados ni por `printenv` ni por `set`, pero fácilmente pueden ser desplegados mediante el comando `alias` sin argumentos.

## Variables del entorno

| Variable | Contenido |
|----------|-----------|
| SHELL    | El nombre del programa shell por defecto para el usuario |
| HOME     | El pathname del directorio home del usuario |
| PWD | El directorio de trabajo actual |
| OLDPWD | El directorio de trabajo anterior |
| PAGER | El nombre del programa utilizado para paginar, por lo general /usr/bin/less |
| TERM | El nombre del tipo de terminal utilizado |
| TZ | Time zone, en la mayoria de los sistemas tipo UNIX el reloj interno se maneja mediante UTC, y el tiempo es desplegado al usuario dependiendo de su TZ |
| USER | nombre del usuario actual |
| PATH | Listado de directorios separados por dos puntos, donde la shell buscará un programa al intentar ser ejecutado por su nombre |
| PS1 | Define el contenido del shell prompt |

### PATH

Al ingresar un comando el shell busca el programa a ejecutar en la lista de caminos que contiene la variable PATH.

Ejemplo de PATH en el ~/.bashrc
`PATH=$PATH:$HOME/bin`

### PS1

