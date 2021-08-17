# find

Para realizar algunas pruebas con el comando find realizaremos una zona de pruebas:

`mkdir -p playground/dir-{001..100}`
`touch playground/dir-{001..100}/file-{A..Z}`

Realice los siguientes puntos documentando al final los comandos utilizados:

1. Ejecute una busqueda de los archivos `file-A`.
2. Verifique si la salida del comando es de forma ordenada o no.
3. cuente la cantidad de resultados.
4. cree el archivo `playground/timestamp` y vea sus atributos mediante el comando `stat`, (stat archivo).
5. Ejecute el comando touch sobre el archivo timestamp y vuelva a ver sus atributos con el comando `stat`, repita lo mismo pero esta vez utilizando el comando less (accediento a leer el archivo).
6. Utilice find para ejecutar sobre los archivos `file-B` el comando touch.
7. Utilice el comando find para obtener los archivos más nuevos  que el archivo `timestamp`.
8. Imprima los archivos y directorios tal que no contengan permisos seguros, siendo estos permisos `0600` para archivos y `0700` para directorios.
9. Modifique la ejecución del punto anterior para que a esos archivos se les modifique los permisos a seguros.

## Ejecución

1. `find playground -type f -name 'file-A'`
