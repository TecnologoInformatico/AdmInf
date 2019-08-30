# Acceso Remoto

La mayoría de los ambientes computacionales que requieren administración se encuentran físicamente distribuidos.
Para estos casos es práctico el acceso remoto.

Además, en muchos casos se dispone de máquinas sin dispositivos de E/S más que acceso a la red, las cuales pueden ser utilizadas únicamente en forma remota.

1. Instalar el servidor `ssh` utilizando `apt-get`
2. Levantar el servicio `ssh`
3. Levantar una segunda máquina virtual y conectarse a la primera utilizando `ssh`
  (o realizarlo desde el host via git bash).
4. Dentro de la sesión `ssh`, cree el archivo `~/test_ssh`.
5. Complete el archivo con la salida del comando `ls /bin`.
6. De no contar con el programa `vim` instálelo.
7. Abra el archivo con el editor de texto `vim`, busque la palabra `less`.
8. Mueva el cursor una linea abajo y borre de ahí hasta el final del archivo.
9. Vaya a la linea 15 y copiela.
10. Muevase hasta la última linea y pege lo copiado en la linea anterior.
11. Salga de la sesión remota y mediante sftp baje el archivo `test_ssh` al equipo local como `test_sftp`.
