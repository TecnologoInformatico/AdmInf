# Empaquetado y Compresión

1. Clone el repositorio `XXX` en `~/repo/compresion`
2. realice un tar sin compresión del repositorio: `~/bak/repo_bak_01.tar`.
3. realice un tar con compresión del repositorio: `~/bak/repo_bak_02.tgz`.
4. Utilice el comando sftp para trasladar el repositorio en su estado original al host.
5. Realice el traslado por sftp, esta vez para los archivos dentro de bak.
6. Extraiga los archivos de ambos archivos.
7. Investigue la herramienta `rsync`
8. Utilice `rsync` para crear un espejo de la carpeta `~/repo/compresion`
  en `~/bak/compresion`
9. Realice una modificación al archivo `~/repo/compresion/README.md` y vuelva realizar el paso 7.
10. Investigue como evitar que se sincronicen los archivos correspondientes a git.


1. mkdir -p ~/repo/compresion
2. git clone https://github.com/AlexZimmerBojourAdrian/LosDelFondo.git
3.tar -cf ~/bak/repo_bak_01.tar LosDelFondo
 tar -czf ~/bak/repo_bak_02.gzip LosDelFondo
4.shh alex@192.168.56.101
5. get repo_bak_01.tar
get repo_bak_02.gzip
get repo_back_02.gzip
6. tar -xf repo_bak_01.tar
tar -xf repo_bak_02.gzip
7 rsync es un protocolo que se usa para tranferencia de datos tanto locales o remotos mediante un tunel seguro
aclarando las direciones a la cual sincronizar
www.computerhope.com/unix/rsync.htm
www.vocente-navarro.com/blog/2008/01/13/backups-con-rsync
8 crear los directorios
rsync -av dirA dirB

9 modificar los archivos 

rsync -av ~/bak/compresion /home/tecnologo/repo/compresion/




