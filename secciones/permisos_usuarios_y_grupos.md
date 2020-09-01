# Permisos, usuarios y grupos

- Permisos
  - [chmod](#chmod) cambia el modo de un archivo (permisos)
  - `umask` Setea los permisos por defecto de los archivos
  - `chown` Cambia el propietario (y/o grupo) de un archivo
  - `chgrp` Cambia el grupo de un archivo

- Usuarios y grupos
  - [id](#id) Muestra la identidad del usuario
  - [users](#users) Muestra los usuarios logueados en el sistema
  - `su` Inicia un shell como otro usuario
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

## Usuarios y grupos

### id

Muestra la identidad del usuario.
idu del usuario, id y grupo principal, y grupos secundarios.

### users

Lista los usuarios actualmente logueados en el sistema.

### sudo

En la mayoría de los sistemas actuales se evita utilizar el superusuario `root` para las tareas cotidianas. Por el contrario se utiliza el comando `sudo` que puede ser asignado a usuarios particulares sin tener que brindar el acceso al usuario `root`.

![sudo en la vida real (xkcd)](https://imgs.xkcd.com/comics/sandwich.png)

En muchos casos es posible recibir un mensaje en el que se nos indica que no tenemos permiso para realizar determinada tarea `Permission denied`. En esos casos se puede utilizar el comando `sudo` para realizar la operación.

Así mismo también es posible utilizar dicho comando para ejecutar una acción como otro usuario utilizando la opción `-u`.

Para poder utilizar sudo el usuario debe encontrarse de algún modo en el archivo `/etc/sudoers`. En este archivo se especifica a su vez que comandos pueden requerir contraseña o que comandos puede ejecutar un usuario o grupo en particular.

La modificación del archivo `/etc/sudoers` se recomienda realizar mediante el programa visudo, el cual evita que se modifique por dos personas al mismo tiempo y realiza algunas validaciones para minimizar el margen de error.

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
