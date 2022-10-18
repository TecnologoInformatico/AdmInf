# Tarea

[🔗 Tarea 06 | apache](https://classroom.github.com/a/oimIn52G)

## Permisos, usuarios y grupos

El mantenimiento de usuarios y grupos es fundamental en la administración de infraestructuras
informáticas en casi cualquier ámbito, para mantener controles de seguridad.

Dentro de su instancia:

1. ¿Qué realliza el comando `sudo`? Investigue al respecto (man sudo) para saber qué
comandos pueden ser invocados mediante esta escalada de privilegios.
2. Investigar el comando `useradd` (man useradd) y dar de alta un usuario.
3. Investigar el comando `usermod` (man usermod) y utilizarlo para asignarle un directorio
home al usuario creado en la *parte 2*.
4. Invoque el comando su e ingrese como el usuario de la *parte 2*.
5. Investigar el comando `groupadd` (man groupadd) y dé de alta un grupo nuevo.
6. Agregue el usuario creado en la *parte 2* al grupo creado en la *parte 7* (comando
`adduser`)
7. Cree un usuario tal que el nombre sea la primer letra del nombre y el apellido.
  Ej: `dmascheroni`
8. Asignele una contraseña que recuerde
9. Documente como se le podría modificar la contraseña en un futuro de ser necesario.
10. Agregue el usuario la habilidad de utilizar el comando `sudo`, de modo de que no tenga que utilizar el usuario `root`.
11. Cree los grupos `tisj` y `musica` asigneselo como grupo secundario.
12. Cree el directorio `/usr/local/share/Music`.
13. Cambie el grupo del directorio a `musica`.
14. Cambie los permisos del directorio de modo que los miembros del grupo puedan leer, escribir e **ingresar**.
15. Cambie el `umask` de los usuarios de modo que los archivos creados por ellos tengan permisos para los grupos `0002`.
16. Agregue el `setgid` bit al directorio de modo que todo lo que se cree en el se asigne a el grupo `musica`.
17. Investigue como hacer el cambio de `umask` permanente.
