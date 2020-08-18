# Primer Parcial 2019

El parcial consiste en realizar una serie de instrucciones en la máquina virtual.
Una vez culminadas las mismas se deberá dejar la máquina virtual abierta poder verificar lo realizado.
Nota: Se pueden realizar otras modificaciones además de las solicitadas, si son necesarias para realizar alguna tarea en particular.

1. Ingresar a la máquina virtual con el usuario `tecnologo` y contraseña `TISJ2019`.
2. Dar de alta un usuario con nombre de usuario formado por la primera letra de su nombre concatenado con su apellido. Ej: dmascheroni
3. Cree el directorio /var/tisj
4. Cree un grupo tisj y asigneselo tanto al usuario tecnologo como al antes creado.
5. Modifique el directorio tisj para que pertenezca a el grupo tisj y que todo lo que se cree en el en el futuro le corresponda a ese grupo, asegurese de que cualquier miembro de dicho grupo pueda escribir en el directorio.
6. Instale un servidor ssh.
7. Desde Windows utilizando git bash genere un archivo, cuyo contenido sea el listado de elementos que contiene el directorio `/c/windows`.
8. Mediante sftp y el usuario con su nombre traslade este archivo a la carpeta tisj.
9. Configure el nombre de usuario y correo del usuario git de forma global.
10. En su directorio home (el del usuario con su nombre) clone el repositorio
  `“github.com/TecnologoInformatico/AdmInf.git”`
11. Cree una nueva rama denominada parcial y en ella agregue diez archivos de nombre “archivo_XX” donde XX es el número de archivo, una vez hecho esto realice un commit.
12. Cree una tarea CRON que cada 5 minutos, los martes y jueves cree un archivo tar en el su directorio home de nombre tisj_bak_d, tal que d es el día, que contenga la carpeta tisj.
13. En el directorio tisj cree un archivo de nombre history, el cual contenga el historial de los usuarios que utilizó, cada historial precedido por el nombre de usuario a que corresponde.
