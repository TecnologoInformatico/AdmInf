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

<<<<<<< HEAD
1 sudo apt-get install ssh

2 sudo /etc/init.d/ssh start -> iniciar el servidor shh

  sudo /etc/init.d/ssh stop -> detiene el servidor ssh 

  ssh-keygen 

4 touch test_ssh
 put test_ssh

5 ls /bin >> test_ssh

6 sudo apt-get install vim

7 vim test_shh 

 /less para buscar el arhivo particular

8 dG borra del cuersor al final de la linea

9 15G and yy

10 G and p 

11 get test_sftp
=======
sudo apt-get install ssh

sudo apt-get install openshh-server

ssh-keygen

2. sudo /etc/init.d/ssh start

3. ssh Alex@ipadress 

4. touch ~/test_ssh

5. ls >> /bin/tes_ssh

6. sudo apt-get install vim

7. vim test_ssh

8. /less

9. :15 or G15 and yy

10.G and p

11 control + D Desconnectar ssh

12 stfp usuario@ipadress

13. get test_ssh test_sftp


<<<<<<< HEAD
1
=======
>>>>>>> 66253603cf0e8c4ce967bd890b8921dd88de6b5c
>>>>>>> bb5587ad1ec54dcc4b6f84eef9eb7155722cf5d4
