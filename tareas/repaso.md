# Tarea de repaso primer parte

## Usuarios

1. Cree un usuario conformado por la primer letra de su nombre y su apellido para cada miembro del equipo.
2. Asegúrese de que cuenta con un directorio home.
3. Agregue un grupo nuevo que se llame "repositorio" y agréguelo a los usuarios creados en el punto 1.
4. Cree la carpeta /var/repo/ de tal modo que pertenezca a uno de los usuarios del grupo y que el grupo de la carpeta sea "repositorio".

## Repositorio

1. Verifique que cuenta con git en el sistema y en caso de no ser así instalarlo.
2. Clone el [repositorio](https://github.com/TecnologoInformatico/AdmInf.git) en el directorio /var/repo de modo que quede en la carpeta /var/repo/adminf/.
3. Cree la rama "repaso" y cambie a ella.
4. En dicho repositorio cree un archivo en la carpeta tareas de nombre "01_resolucion_nombreEquipo.md". Donde nombreEquipo es el nombre de los usuarios del equipo en camel case. En el, con formato markdown, documente los pasos realizados para resolver el taller hasta el momento.
5. Realice un commit.

## Acceso remoto

1. De ser necesario instale el servicio ssh en el equipo linux.
2. acceda de forma remota desde windows.
3. En windows cree un archivo que todo lo que crea necesario para instalar e ingresar via ssh y páselo vía sftp al directorio home de su usuario en linux.

## Tareas programadas

1. Cree un archivo crontab que escriba en un archivo el dia y la hora, todos los martes cada 15 minutos agregándolo al final del archivo.
2. Cree un archivo crontab que realice un backup del repositorio a la carpeta ~/respaldos de lunes a viernes
3. Agregue a la tarea realizada en el punto 2 una compresión de los archivos.

## Compartir

Complete la información que le resulte útil para completar la tarea y haga otro commit en la rama repaso.
Investigue como realizar un push request para enviar los cambios realizados al repositorio de origen.
