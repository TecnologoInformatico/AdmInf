# Busqueda de archivos

La busqueda de archivos es una tarea frecuente en un sistema, veamos un par de herramientas para llevar a cabo esta tarea.

- locate
- find

## locate

[locate en ubuntu?](https://askubuntu.com/questions/1183750/ubuntu-19-10-why-is-the-locate-command-missing)

Una forma sencilla de encontrar archivos es mediante el programa `locate`, el cual realiza una búsqueda rápida en una base de datos de directorios, y finalmente retorna cada nombre que coincida con el criterio.

Por ejemplo si se quiere encontrar todos los programas con el texto `zip` en el nombre:

`locate zip`

Y en caso de que se requiera alguna búsqueda más avanzada, se puede combinar con otras herramientas, como grep.

`locate zip | grep bin`

La base de datos de locate es creada por otro programa llamado `updatedb`, usualmente corre de forma periodica como un `cron job`, de todos modos la mayoría de los sistemas con locate lo ejecutan una vez al día. Ya que esta base de datos no es actualizada continuamente, cambios recientes no serán reflejados al momento de buscar con esta herramienta. En caso de ser necesario se puede ejecutar con el usuario root `updatedb` de forma manual.

## find

Mientras que el programa locate utiliza únicamente el nombre del archivo, find puede encontrar archivos dentro de un directorio dado (y sub directorios), utilizando varios atributos.

En su modo más simple, pasando uno o más directorios para buscar retornará su contenido.

`find ~`

lo que podríamos combinar con `wc` mediante una `pipe` para obtener el número de archivos:

`find ~ | wc -l`

### Test

Para que find sea realmente útil es posible utilizar tests, los que realizarán un filtrado de los archivos que retornará, por ejemplo si quisieramos obtener sólo los directorios:

`find ~ -type d | wc -l`

| tipo | Descripción                      |
|------|----------------------------------|
| b    | Archivo de dispositivo de bloque |
| c    | Archivo especial de caracteres   |
| d    | Directorio                       |
| f    | Archivo regular                  |
| l    | Link simbólico                   |

Y así podemos agregar más tests, por ejemplo, especificar el nombre del archivo, o un patron, en este caso los archivos con extensión `.jpg` que son más grandes que 1MB.

`find ~ -type f -name "*.jpg" -size +1M | wc -l`

Tabla de unidades de medida:

| Caracter | Descripción                  |
|----------|------------------------------|
| b        | bloque de 512-byte (default) |
| c        | Bytes                        |
| w        | palabras de 2-byte           |
| k        | Kilobytes                    |
| M        | Megabytes                    |
| G        | Gigabytes                    |

Tabla de tests:

| Test              | Descripción                                         |
|-------------------|-----------------------------------------------------|
| -cmin n           | modificado hace n minutos.                          |
| -cnewer archivo   | Modificado más recientemente que el archivo         |
| -ctime n          | modificado hace n*24 horas                          |
| -empty            | Archivos y directorios vacíos                       |
| -group name       | Perteneciente al grupo                              |
| -iname patron     | Tal que el nombre pero insencible a mayúsc. y mins. |
| -inum n           | Numero de inodo                                     |
| -mmin n           | Modificado por lo menos hace n minutos              |
| -mtime n          | Modificado por lo menos hace n*24 horas             |
| -name patron      | Por nombre                                          |
| -newer archivo    | Más reciente que el archivo                         |
| -nouser           | Sin usuario válido                                  |
| -nogroup          | Sin grupo válido                                    |
| -perm mode        | Con determinados permisos                           |
| -samefile archivo | Similar a -inum pero haciendo referencia al archivo |
| -size n           | Por tamaño                                          |
| -type c           | Por tipo                                            |
| -user usuario     | Perteneciente al usuario                            |

#### Operadores

Además de los test en algunos casos es necesario realizar operaciones lógicas para lograr el resultado deseado, por ejemplo si necesitamos saber los archivos y directorios con permisos seguros deberíamos hacer una distinción entre directorios con permisos `0700` y archivos con permisos `0600`.

`find ~ \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)`

- `-and`, `-a`
- `-or`, `-o`
- `-not`, `!`
- `()`

### Acciones

Obtener la lista de archivos con un filtro específico puede ser muy útil, podemos realizar un pipeline tal como lo hicimos con `wc`. De todos modos find incluye un mecanismo para realizar acciones.

Algunas acciones predefinidas:

| Acción  | Descripción                                    |
|---------|------------------------------------------------|
| -delete | Elimina el archivo encontrado.                 |
| -ls     | Ejecuta el comando equivalente a `ls -dils`    |
| -print  | Imprime el pathname completo. (default)        |
| -quit   | Finaliza una vez que se encuentra un resultado |

Ejemplos:

- `find ~ -type f -name '*.bak' -delete`
- `find ~ -type f -name '*.bak' -print`
- `find ~ -type f -name '*.bak' -ls`

A su vez nos permite ejecutar acciones definidas por el usuario:

Por ejemplo, `-delete` se podría definir de este modo:

`find -type f -name 'foo*' -exec rm '{}' ';'`

o mediante una confirmación:

`find -type f -name 'foo*' -ok rm '{}' ';'`

#### Eficiencia

El comando anterior se ejecuta por cada resultado, en muchos casos va a ser más útil y eficiente ejecutar la acción una única vez para el total de resultados:

```sh
ls -l archivo_01
ls -l archivo_02
ls -l archivo_03
```

Por otro lado sería más efectivo: `ls -l archivo_01 archivo_02 archivo_03`

Esto es posible sustituyendo el caracter `;` por el signo `+`.

`find -type f -name 'foo*' -ok ls '{}' +`
