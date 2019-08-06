# Usuarios y Grupos

## useradd

    useradd [opciones] usuario

Agrega un nuevo usuario al sistema

opciones:

- -d directorio home
- -m crear directorio home si no existe
- -p setear el password, no recomendado

Ej:

    useradd -d homeDir -m -p miPass peteco

## adduser

Agrega un usuario al sistema.

## userdel

    userdel [opciones] usuario

Elimina el usuario indicado.

Opciones:

- -r remueve los archivos del usuario así como el directorio home.

Ejemplo:

    userdel -r peteco

## usermod

    usermod [opciones] usuario

Modifica los datos de un usuario (la información que se guarda en el archivo /etc/passwd)

opciones:

- -d Directorio home
- -G Asigna grupos suplementarios. 
- -a Se utiliza para agregar los grupos suplementarios sin eliminar los que tiene.

Ejemplo:

    usermod -d petecoHome -G miGrupo,admin,grupoX -a peteco

## groupadd

    groupadd [opciones] grupo

Agrega un nuevo grupo al sistema

Ejemplo:

    groupadd grupoX

## groupdel

    groupdel grupo

Elimina el grupo indicado.

Ejemplo:

    groupdel grupoX

## groupmod

Modifica la definición de un grupo en el sistema.

## id

Despliega información del usuario.

## passwd

Modifica la contraseña de un usuario.

## users

Lista los usuarios actualmente logueados en el sistema.