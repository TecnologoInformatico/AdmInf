# Tarea 06 / backups & rsync

1. Cree un set de preubas mediante los siguientes comandos:
  `mkdir -p ~/sandbox/dir-{00{1..9},0{10..99},100}`
  `touch ~/sandbox/dir-{00{1..9},0{10..99},100}/archivo-{A..Z}`
2. Archive (empaquete) el directorio sandbox mediante el comando tar, sin compresión.
  `time tar cf sandbox.tar sandbox`
3. Archive el directorio sandbox mediante el comando tar, con compresión.
  `time tar czf sandbox.tgz sandbox`
4. Cree un archivo nuevo y agregelo a ambos paquetes.
  `ll /bin > sandbox/heavyDoc.txt`
  `tar ???` YO: tar cfz heavyDoc.tgz sandbox/heavyDoC.txt
5. Investigue como actualizar el archivo `.tgz`.  YO: tar tf nombre archivo,

6. Cree el directorio `~/foo` y muevase a el.
7. Archive el directorio sandbox desde ahí mediante rutas absolutas.
  Descombrima y vea el resultado, ¿sucedió algo inesperado?

## rsync

Una estrategia comun de backap consiste en mantener uno o más directorios sincronizados con otro directorio en el mismo sistema o en un equipo remoto.

En los sistemas tipo Unix la herramienta por excelencia para esto es `rsync`.
Este programa permite sincronizar directorios locales así como remotos, utilizando un protocolo `rsync remote-update protocol` el cual detecta las diferencias requiriendo un minimo esfuerzo para syncronizar directorios.

1. Utilice rsync para sincronizar el directorio `~/sandbox` con `~/bar`.
2. Ejecute el paso 1 nuevamente, ¿que sucedió?.
3. Busque el modo de ignorar en la transferencia los archivos `archivo-X`.
4. Investigue el modo de sincronizar este directorio de o a un equipo remoto.
5. Compare el tiempo de ejecución de sftp con rsync.

## crontab

Investigue el modo de generar un backup programado de un directorio y documentelo.
Por ejemplo `~/sandbox`.
