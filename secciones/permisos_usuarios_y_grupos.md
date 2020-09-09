# Permisos, usuarios y grupos

- Permisos
  - [chmod](#chmod) cambia el modo de un archivo (permisos)
  - [umask](#umask) Setea los permisos por defecto de los archivos
  - `chown` Cambia el propietario (y/o grupo) de un archivo
  - `chgrp` Cambia el grupo de un archivo

- Usuarios y grupos
  - [id](#id) Muestra la identidad del usuario
  - [users](#users) Muestra los usuarios logueados en el sistema
  - [su](#su) Inicia un shell como otro usuario
  - [sudo](#sudo) Ejecuta un comando como otro usuario
  - [passwd](#passwd) Cambia la contraseña de un usuario
  - [useradd](#useradd) Crea un usuario (bajo nivel)
  - [adduser](#adduser) Crea un usuario (de forma iterativa)
  - [usermod](#usermod) Modifica un usuario
  - [userdel](#userdel) Elimina un usuario
  - [groupadd](#groupadd) Crea un grupo
  - [groupmod](#groupmod) Modifica un grupo
  - [groupdel](#groupdel) Elimina un grupo
  - [users](#users) Muestra los usuarios actualmente logueados.

## Permisos

Los permisos disponibles para manejar los archivos y directorios
en linux son `read` (lectura), `write` (escritura) y `execution` (ejecución).

Mediante el comando `ls -l` se puede visualizar una representación de dichos permisos.
En la primer parte veremos el tipo de archivo:

| Atributo | tipo de archivo                    |
|----------|------------------------------------|
| -        | Archivo regular                    |
| d        | Directorio                         |
| l        | Link simbólico                     |
| c        | Archivo de caracteres ej: terminal |
| b        | Archivo de bloques ej: HD/CD-ROM   |

Los restantes 9 atributos son los permisos llamados `file mode`, representando
la lectura `r`, escritura `w` y ejecución `x`, para el propietario del archivo `u`,
el grupo del archivo `g` y para todos los demás `o`.

### chmod

Para cambiar el modo (los permisos), de un archivo o directorio, es utilizado el comando `chmod`.
Sólo el propietario del archivo, o el superusuario son capaces de cambiar estos permisos.

`chmod` soporta dos formas de especificar el cambio de modo:

- Representación octal
- Representación simbólica

#### Representación octal

| Octal | Binario | Modo |
|-------|---------|------|
| 0     | 000     | ---  |
| 1     | 001     | --x  |
| 2     | 010     | -w-  |
| 3     | 011     | -wx  |
| 4     | 100     | r--  |
| 5     | 101     | r-x  |
| 6     | 110     | rw-  |
| 7     | 111     | rwx  |

#### Representación simbólica

Ej: `chmod u+x file.sh`

### umask

El comando umaske controla los permisos por defectos que se le dan a un archivo cuando es creado. Utiliza notación octal para expresar una máscara de bits para ser removidos del modo asignado al archivo.

`umask [modo]`

Ej: `umask 0002`

### Permisos especiales

Además de los permisos de escritura lectura y ejecución existen otros tipos de permisos.

#### setuid (octal 4000)

El setuid, cuando es aplicado a un ejecutable setea el ID efectivo al del propietario del archivo. Frecuentemente es aplicado a algunos programas pertenecientes al usuario root.

Ej: `chmod u+s programa.sh`

#### setgid (octal 2000)

Similar al anterior, sólo que setea el grupo real al perteneciente al archivo, en caso de ser asignado a un directorio, los archivos creados dentro de este directorio pertenecerán al propietario del directorio, en lugar del usuario creador. Esto puede ser muy útil en un directorio compartido.

Ej: `chmod g+s dir`

#### sticky bit (octal 1000)

Este bit tiene su razón de ser en un comportamiento antiguo, en lo que respecta a archivos, de todos modos, aplicado a directorios previene que un usuario pueda borrar o renombrar archivos, salvo que sea el propietario del archivo o del directorio.

Ej: `chmod +t dir`

## Usuarios y grupos

### id

Muestra la identidad del usuario.
idu del usuario, id y grupo principal, y grupos secundarios.

### users

Lista los usuarios actualmente logueados en el sistema.

### su

El comando `su` es utilizado para iniciar una shell como otro usuario.

`su [-[l]] [user]`

Si la opción -l es utilizada el comando resulta en un login shell para determinado usuario, esto quiere decir que el entorno del usuario es cargado, y se cambia el `working directory` (área de trabajo) al directorio home del usuario. La opción puede ser abreviada como `-` y es del modo en que se utiliza más frecuentemente.

En caso de no especificar un usuario se asume el superusuario.

Luego de ingresar el comando se nos solicita ingresar la contraseña del usuario destino. Para volver al usuario original se puede ejecutar el comando `exit`.

Así mismo es posible ejecutar un único comando mediante la opción `-c`.

`su -c 'comando'`

Tener en cuenta el utilizar comillas simples para evitar la expansión del comando en nuestra propia sesión.

### sudo

En la mayoría de los sistemas actuales se evita utilizar el superusuario `root` para las tareas cotidianas. Por el contrario se utiliza el comando `sudo` que puede ser asignado a usuarios particulares sin tener que brindar el acceso al usuario `root`.

![sudo en la vida real (xkcd)](https://imgs.xkcd.com/comics/sandwich.png)

En muchos casos es posible recibir un mensaje en el que se nos indica que no tenemos permiso para realizar determinada tarea `Permission denied`. En esos casos se puede utilizar el comando `sudo` para realizar la operación.

Así mismo también es posible utilizar dicho comando para ejecutar una acción como otro usuario utilizando la opción `-u`.

Para poder utilizar sudo el usuario debe encontrarse de algún modo en el archivo `/etc/sudoers`. En este archivo se especifica a su vez que comandos pueden requerir contraseña o que comandos puede ejecutar un usuario o grupo en particular.

La modificación del archivo `/etc/sudoers` se recomienda realizar mediante el programa visudo, el cual evita que se modifique por dos personas al mismo tiempo y realiza algunas validaciones para minimizar el margen de error.

La opción `-l` nos muestra los comandos que nos es posible ejecutar utilizando `sudo`.

### passwd

Modifica la contraseña de un usuario.

### useradd

    useradd [opciones] usuario

Agrega un nuevo usuario al sistema

opciones:

- -d directorio home
- -m crear directorio home si no existe
- -p setear el password, no recomendado

Ej:

    useradd -d homeDir -m -p miPass peteco

### adduser

Agrega un usuario al sistema.

Se carga template, ver directorio:

`/etc/skel`

### usermod

    usermod [opciones] usuario

Modifica los datos de un usuario (la información que se guarda en el archivo /etc/passwd)

opciones:

- -d Directorio home
- -G Asigna grupos suplementarios. 
- -a Se utiliza para agregar los grupos suplementarios sin eliminar los que tiene.

Ejemplo:

    usermod -d petecoHome -G miGrupo,admin,grupoX -a peteco

### userdel

    userdel [opciones] usuario

Elimina el usuario indicado.

Opciones:

- -r remueve los archivos del usuario así como el directorio home.

Ejemplo:

    userdel -r peteco

## groupadd

    groupadd [opciones] grupo

Agrega un nuevo grupo al sistema

Ejemplo:

    groupadd grupoX

## groupmod

Modifica la definición de un grupo en el sistema.

## groupdel

    groupdel grupo

Elimina el grupo indicado.

Ejemplo:

    groupdel grupoX
