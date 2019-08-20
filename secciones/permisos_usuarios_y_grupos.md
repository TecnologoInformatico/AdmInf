# Permisos, usuarios y grupos

- Permisos
  - `id` Muestra la identidad del usuario
  - [chmod](#chmod) cambia el modo de un archivo (permisos)
  - `umask` Setea los permisos por defecto de los archivos
  - `sudo` Ejecuta un comando como otro usuario
  - `chown` Cambia el propietario (y/o grupo) de un archivo
  - `chgrp` Cambia el grupo de un archivo

- Usuarios y grupos
  - `su` Inicia un shell como otro usuario
  - `passwd` Cambia la contraseña de un usuario
  - `useradd` Crea un usuario (bajo nivel)
  - `adduser` Crea un usuario (de forma iterativa)
  - `userdel` Elimina un usuario
  - `usermod` Modifica un usuario
  - `groupadd` Crea un grupo
  - `groupdel` Elimina un grupo
  - `groupmod` Modifica un grupo
  - `users` Muestra los usuarios actualmente logueados.

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
