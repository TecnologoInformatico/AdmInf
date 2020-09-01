# Tarea

## Permisos, usuarios y grupos

El mantenimiento de usuarios y grupos es fundamental en la administración de infraestructuras
informáticas en casi cualquier ámbito, para mantener controles de seguridad. En esta práctica
se realizarán configuraciones para creación y mantenimiento de los mismos, en sistemas tipo Unix.

Nota: sólo pueden utilizarse comandos bash para la resolución de los siguientes ejercicios.

Un problema frecuente es el de los directorios comopartidos, donde dos o más usuarios desean compartir,
por ejemplo, archivos de música.

1. Cree dos usuarios tales que sean la primer letra del nombre y el apellido de dos miembros del equipo.
  Ej: `dmascheroni` o `pcaradehacha`.
2. Cree un grupo `musica` y asigneselo a ambos usuarios como grupos secundarios.
3. Cree el directorio `/usr/local/share/Music`.
4. Cambie el grupo del directorio a `musica`.
5. Cambie los permisos del directorio de modo que los miembros del grupo puedan leer, escribir e **ingresar**.
6. Cambie el `umask` de los usuarios de modo que los archivos creados por ellos tengan permisos para los grupos `0002`.
7. Agregue el `setgid` bit al directorio de modo que todo lo que se cree en el se asigne a el grupo `musica`.
8. Investigue como hacer el cambio de `umask` permanente.

### Administración de usuarios y grupos

1. ¿Qué realliza el comando sudo? Investigue al respecto (man sudo) para saber qué
comandos pueden ser invocados mediante esta escalada de privilegios.
2. Investigar el comando useradd (man useradd) y dar de alta un usuario.
3. Investigar el comando passwd (man passwd) y utilizarlo para asignarle una contraseña
al usuario creado en la parte b.
4. Investigar el comando usermod (man usermod) y utilizarlo para asignarle un directorio
home al usuario creado en la parte b.
5. Invoque el comando su e ingrese como el usuario de la parte b.
6. ¿Por qué cambió el prompt? Investigue y soluciónelo con usermod.
7. Investigar el comando groupadd (man groupadd) y dé de alta un grupo nuevo.
8. Asígne un identificador de grupo apropiado (distinto del grupo 0 y del grupo actual) al
grupo creado en la parte anterior (comando groupmod)
9. Agregue el usuario creado en la parte *2* al grupo creado en la parte *7* (comando
adduser)
10. Cree un grupo y dos usuarios adicionales (con sus respectivos directorios home) que
pertenezcan a dicho grupo.

### Seguridad de usuarios y grupos

1. Ingrese con el usuario de la parte 1.1 e intente ingresar a los directorios de los usuarios
creados en la parte *1.10*. ¿Se logró el acceso? ¿Por qué?
2. Ingrese con el usuario user y cambie los permisos de cada uno de los directorios home
de los usuarios dados de alta en la parte *1* para que puedan ser ingresados únicamente
por el usuario correspondiente (comando chmod)
3. Vuelva a ingresar con el usuario *1.2* e intente ingresar a los directorios de los usuarios
creados en la parte *1.10*. ¿Se logró el acceso? ¿Por qué?
4. Ingrese con el usuario user y cree un directorio compartido con todos los permisos
5. Ingrese con algún usuario del grupo de la parte *1.10* y cree un archivo en el directorio
compartido. Ingrese con otro usuario del mismo grupo e intente modificarlo. ¿Puede?
¿Por qué? Investigue y modifique lo que sea necesario para que ambos usuarios puedan modificar el archivo.
6. Cambie los permisos del archivo para que el usuario creado en la parte *1.2* también
pueda modificar el archivo y verifique los cambios realizados.
