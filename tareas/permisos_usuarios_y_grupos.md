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
9. Agregue el usuario creado en lla parte b al grupo creado en la parte g (comando
adduser)
10. Cree un grupo y dos usuarios adicionales (con sus respectivos directorios home) que
pertenezcan a dicho grupo.

### Seguridad de usuarios y grupos

1. Ingrese con el usuario de la parte 1.1 e intente ingresar a los directorios de los usuarios
creados en la parte 1.10. ¿Se logró el acceso? ¿Por qué?
2. Ingrese con el usuario user y cambie los permisos de cada uno de los directorios home
de los usuarios dados de alta en la parte 1 para que puedan ser ingresados únicamente
por el usuario correspondiente (comando chmod)
3. Vuelva a ingresar con el usuario 1.2 e intente ingresar a los directorios de los usuarios
creados en la parte 1.10. ¿Se logró el acceso? ¿Por qué?
4. Ingrese con el usuariro user y cree un directorio compartido con todos los permisos
5. Ingrese con algún usuario del grupo de la parte 1.10 y cree un archivo en el directorio
compartido. Ingrese con otro usuario del mismo grupo e intente modificarlo. ¿Puede?
¿Por qué? Investigue y modifique lo que sea necesario para que ambos usuarios puedan modificar el archivo.
6. Cambie los permisos del archivo para que el usuario creado en la parte 1.2 también
pueda modificar el archivo y verifique los cambios realizados.


====Permisios usuarios y grupos
1 sudo adduser EdWardRodriguez
sudo passwd OctavioSepergo
sudo add user OctavioSepergo

2 sudo Groupadd Musica
sudo chgrp Musica EdwardRodriguez
sudo chgrp Musica OctavioSepergo
sudo usermod OctavioSepergo -G Musica

3 sudo mkdir /usr/local/share/Music

4- sudo groupmod Musica -n musica

5 sudo chmod g-rwx /usr/local/share/Music

6 umask -S 0002

7 sudo chmod g+s /usr/local/share/Music

8

=============================================================================

El comando sudo puede realizar las siguientes operaciones 

sudo -A	--askpass
Normalmente si sudoRequiere una contraseá, la leera desde el terminal del usuario. Si se 
especificar la opcion- A(askpass), se ejecutar un programa auxiliar (Posible grafico)
para leer la contraseña del usuario y enviar la contraseña a la salida estandar.Si se establece 
la SUDO_ASKPASS variable de rentorno, especifica la ruta al prograna auxiliar. De lo contrario, 
si sudo.conf (5) contiene una linea de especifica el programa askpass, se usara ese valor: por 
ejemplo:

#Ruta al programa de ayuda askpass
Ruta askpass / usr/ x11r6/BIN /ssh-askpass

si no hay un programa asjpass disponible, sudosaldra con un error 

sudo -a tipo, --auth-type = tipo
utilice el tipo de autenticacion BSD espesificado al validar al usuario. si lo permite 
/etc/login.conf. El administrador del sistema puede especificar una lista de metodos de 
autenticacion especificoos de sudo agregando una entrada "auth-sudo" en /etc/login.comf. Esta 
opcion solo esta disponible en sistemas que admiten la autnticacion BSD

sudo -b, --Background 
Ejecute el comando dado en segundo plano. Tenga en cuenta que no es posible utuluzar el control 
de trabajo de shell para manipular procesos en segundo plano iniciados para sudo. La mayoria de 
los comandos interactivos no funcionaran corrctamente en modo de fondo.

sudo -C num, --close-from=num
cierre todos los descriptores de archivo mayores o iguales que num antes de ejecutar un 
comando. No se permiten valores inferiores a tres. Por defecto sudo cerrara todos los 
descriptores de archivos abiertos que no sean estrada estandar, salida estandar y error 
estandar al ejecutar un comando. L politica de seguridad puede restringir la capacidad de 
usuario para usar esta opcion. La politica de sudoers solo permte el uso de la -C opcion cuando 
el administrador ha habilitado la opcion closeform_override.

-c clase, --login-class= clase
Ejecute el comando con limites de recirsos y prioridad de programacion de la clase de inicio de 
secion especificada. El argumento de clase puede ser un nombre. El argumento de clase puede ser 
un nombre de clase como se define en /etc/login.conf, o un solo caracter '-' Si las clase es -, 
se usara la clase de inicio de sesion predeterminada del usuario objetivo.De lo contrario, el 
comando debe ejecutarse como superusuario.Si el comando se ejecuta como un shell de inicio de 
secion predeterminada del usuario objetivo De lo contrario, el comando debe ejecutarse como 
superusuario(ID de usuario 0), i sudo debe ejecutarse desde un shell que ya se esta ehecutando 
coo superusuario. Si el comando se ejecuta como un chell de inicio de sesion, adicional 
/etc/login.confse apicaran configuracuibes, como las cariables umask y de entorno si estan 
presentes.Esta opcion solo esta disponible en sistemas con clases de inicio de secion BSP.

-E, --preserve-env
indica a la politica de seguridad que el usuario desdea preservar sus variables de entorno 
existentes.La politica de seguridad puede devolver un error si el usuario no tiene permiso para 
preservar el entorno.

-e, --edit
Edite uno o mas archivos en lugar de ejecutar un comando. en lugar de un nombre de ruta, la 
cadena "sudoedit" se usa cuando se consulta la politica de seguridad. Si el usuario esta 
utilizado por la politica, se toma los siguintes pasos:

1. Se hacen copas temporales de los archivos que se editaran con el propietario configurado 
para el usuario que invoca.

2.El editor especificado por la politica se ejecuta para editar los archivos temporales. el 
Sudoers politica utiliza los SUDO_Editor, VISUAL Y Editor las variables de entoro (en ese 
orden). Si ninguno de SUDO_EDITOR, VISUAL o EDITOR estan configurados, se utiliza el promer 
programa listado en la opcion sudoers del editor (5).

3. Si se las modificado, los archivos tmporales se vuelven a copiar en su ubicacion origial y 
se eliminan las versiones temporales.

Si el archivo especificado no existe, se creara. Tenga en cuenta que , a diferencia de la 
mayoria de los comandos ejecutados por sudo, el editor se ejecuta sin modificar eel entorno 
del usuario que invoca. Si por alguna razon sudo no puede actualizar un archivo con su versin 
editada, el usuario recivira una advertencia y la copia editada permanecera en un archivo 
temporal.

-g group, --group=gropo

Ejcute el comando con el grupo primario estableciden grupo en lugar del grupo prmario 
especifcado por laentrada de la bas de datos e contraseña del usuario objetivo. El grupo puede 
ser un nombre de grupo o un ID de grupo numerico(GID) prefijado con el caracter '#'(por 
ejemplo, #0 para GID 0)
