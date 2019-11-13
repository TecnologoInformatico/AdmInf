# Tareas programadas

## Tareas programadas (Windows)

1. Investigue la aplicación Tareas Programadas.
2. Cree una tarea que respalde el contenido de una carpeta
mediante el programa robocopy

## crontab (Linux)

1. Investigue el demonio cron.
2. Cree una tarea que agregue al archivo `~/notas`
    "faltan 15 minutos para el final de la clase" (cuando eso sea cierto...)
3. Cree una rutina de respaldo para los martes y jueves a la hora actual del directorio `~/repo`. Considere utilizar los programas tar, gzip y/o rsync.

## Documentación

Documente los comandos utilizados y las opciones que le hayan resultado útiles.
1.
45 21 * * * echo "Faltan 15 minutos" >> /home/tecnologo/notas.txt

2.
00 22 * * * tar -zcf /home/tecnolgo/respaldo/resp.tgz /home/tecnolgo/notas.txt

