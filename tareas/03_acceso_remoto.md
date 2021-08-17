# Acceso Remoto

La mayoría de los ambientes computacionales que requieren administración se encuentran físicamente distribuidos.
Para estos casos es práctico el acceso remoto.

Además, en muchos casos se dispone de máquinas sin dispositivos de E/S más que acceso a la red, las cuales pueden ser utilizadas únicamente en forma remota.

## Transferencia de archivos

### FTP

Una de las herramientas clásicas para la transferencia de archivos es ftp, el cual toma su nombre del protocolo FTP (FIle Transfer Protocol).

Investigue el programa `FTP` y realice las siguientes operaciones:

1. Conectese al equipo remoto.
2. liste el contenido del directorio actual, ¿cual es el directorio actual?
3. Muevase a la carpeta `sandbox` creada en la tarea anterior.
4. descargue una carpeta al equipo local, junto a todo su contenido.
5. ¿donde se ha descargado la carpeta?
6. Investigue como definir la carpeta donde se descargará.
7. desconectese del equipo remoto.

### scp

Repita la descarga de la carpeta remota al equipo local esta vez mediante la herramienta `scp` (secure copy).

## Acceso remoto seguro

Desde hace muchos años los equipos con sistemas operativos tipo UNIX han tenido la capacidad de ser administrados remotamente mediante la red.
Con la adopción de Internet, programas como rlogin y telnet mostraban el mismo problema que FTP, toda comunicación, incluído el nombre y contraseña del usuario viajaban en texto plano.

### ssh

Para resolver este problema un nuevo protocolo fue desarrollado `SSH` (Secure SHell).
Para resolver dos problemas básicos en la comunicación segura, SSH primero autentica que el servidor sea quién dice ser, para así evitar el llamado ataque "Man in the middle", y por otro lado encripta todas las comunicaciones entre el host local y el remoto.

1. Genere un par de claves RSA en su máquina local (ssh-keygen).
2. Agregue la nueva clave al agente ssh.
3. Copie la clave pública al servidor remoto.
4. Asegurese de que puede loguearse al servidor utilizando la clave generada.
5. Investigue el archivo `~/.ssh/config` para facilitar el inicio de sesión.

6. Agregue la clave a github, de modo que no sea necesario ingresar usuario y contraseña. [utilizar ssh con github](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
