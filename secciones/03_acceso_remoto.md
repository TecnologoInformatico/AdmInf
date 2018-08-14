# Acceso Remoto

## SSH

Secure Shell ssh, al igual que telnet se utiliza para gestionar el login de acceso a un sistema remoto. Pero a diferencia de telnet, ssh establece una conexión cifrada con el sistema remoto, además de proporcionar otras posibilidades.

La primera vez que realizas la conexión debes aceptar la firma del otro host. De esta manera se establece una relación de confianza.

sintaxis:

    ssh user@hostname [command]

### Como instalar un servidor SSH en linux

comando para instalar los paquetes del servicio SSH.

    sudo apt-get install openssh-server

Para arrancar el servidor:

    sudo /etc/init.d/ssh start

Para parar el servidor:

    sudo /etc/init.d/ssh stop

## SFTP

    sftp username@remote_hostname_or_IP:

Establece una conexión sftp con un sistema remoto.

sftp username@remote_hostname_or_IP:file :    Copia el archivo designado (file) desde el sistema remoto (remote-system).

- bye:       Sale de la sesión sftp.
- help:      Muestra todos los comandos sftp.
- ls:        Muestra los contenidos del directorio de trabajo remoto.
- get:      Copia un archivo del directorio de trabajo remoto al directorio de trabajo local.
- put:     Copia un archivo del directorio de trabajo local al directorio de trabajo remoto.
- delete:     Suprime un archivo del directorio de trabajo remoto.

## Clientes con interfaz Grafica de los servicios SSH , SCP , SFTP

En windows se puede utilizar puTTY tanto  para  utilizar cliente SSH como para SCP y SFTP
Tambien podemos encontrar WinSCP como cliente SCP, FreeSSHD como Cliente SSH y SFTP.
