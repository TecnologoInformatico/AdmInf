# shell-scripting

## Shebang

La primer linea del script indica que interprete debe utilizar el sistema.

`#!` El numeral por lo general se utiliza para los comentarios y no es interpretado por el sistema, pero en el caso de la primer línea y seguido por el signo de exclamación indica que a continuación se establece la ruta al interprete que se debe utilizar, ej: `/bin/bash`.

En caso de no saber donde se ubica el interprete, se puede utilizar el comando `which`, `which bash`.

`#!/bin/bash`

## Variables

Para asignar una variable se debe especificar su nombre siguiendo por un signo de igual y el valor a asignar, esto sin espacios en ninguno de los lados del signo de igualdad.

`peteco="test"`

Para acceder al valor de las variables se utiliza el símbolo de pesos `echo $peteco`.

En caso de necesitar almacenar en una variable la salida de un comando es posible mediante el tilde invertido peteco=`ls /var`, peteco=$(ls /var).

Para declarar constantes es posible utilizar la siguiente notación.
`declare -r MICONSTANTE="Valor de mi constante"`

## Ejecución ./script.sh

Para ejecutar el script, este debe tener permisos de ejecución, lo más común es asignarle los permisos 755, mientras que si corresponde que sólo el propietario tenga permiso de ejecución será 700.

`chmod 755 script.sh`

La extensión del script no es necesaria, pero suele ser utilizada la extensión `.sh`.

Una vez con los permisos adecuados es posible correrlo haciendo referencia a su nombre con la ruta absoluta o relativa.

Ej: `./script.sh` o `/home/tecnologo/script.sh`.

Para ejecutarlo con tan solo el nombre, y desde cualquier lado, sería necesario moverlo a algún path dentro de la variable de entorno `PATH`.

Ej: `mv script.sh bin/myscript`

## Argumentos

- `$0` - El nombre del script.
- `$1` - `$9` - Cualquier argumento pasado al programa, donde `$1` es el primer argumento, `$2` el segundo, y así...
- `$#` - Cuantos argumentos se le han pasado al programa.
- `$*` - Todos los argumentos pasados.
- `$@` - Todos los argumentos pasados.

## if

```sh
if [<condicion>];
then
    <comandos>
elif [<cond>];
then
   <comandos>
fi
```

## test

Los parentesis rectos `[]` en el if son una referencia al comando `test`, por lo que todos los operadores que el comando test acepta también pueden ser utilizados en un if.

| Operador              | Descripción                                  |
|-----------------------|----------------------------------------------|
| ! Expresión           | La expresión es falsa.                       |
| -n STRING             | El tamaño del string es mayor a cero.        |
| -z STRING             | El string es vacío.                          |
| STRING1 = STRING2     | STRING1 es igual a STRING2                   |
| STRING1 != STRING2    | STRING1 no es igual a STRING2                |
| INTEGER1 -eq INTEGER2 | INTEGER1 es numericamente igual a INTEGER2   |
| INTEGER1 -gt INTEGER2 | INTEGER1 es numericamente mayor que INTEGER2 |
| INTEGER1 -lt INTEGER2 | INTEGER1 es numericamente menor que INTEGER2 |
| -d FILE               | FILE existe y es un directorio.              |
| -e FILE               | FILE existe.                                 |
| -r FILE               | FILE existe y tiene permisos de lectura.     |
| -s FILE               | FILE existe y su tamaño es mayor a cero.     |
| -w FILE               | FILE existe y tiene permisos de escritura.   |
| -x FILE               | FILE existe y tiene permisos de ejecución.   |

Hay una versión más moderna de test `[[]]` y otra para el manejo de enteros `(())`

El test `[[]]` admite el manejo de expreciones regulares del modo `string1 =~ regex` tal que es verdadero si el string1 se encuentra la expreción regular.

### Operadores lógicos

| Operación | test | [[ ]] y (( )) |
|-----------|------|---------------|
| `AND`     | `-a` | `&&`          |
| `OR`      | `-o` | `||`          |
| `NOT`     | `!`  | `!`           |

## Exit status

Los comandos, incluyendo los scripts, retornan un valor al sistema cuando finalizan, llamado estado de salida o código de retorno, `exit status`. Este valor es un entero en el rango del 0 al 255, indicando éxito o fallo en la ejecución.

`exit 0` o `exit 1`

Por convención, cero indica una ejecución exitosa, mientras que cualquier otro valor fallo.

Es posible determinar en un script el valor retornado por un comando mediante `$?`.

```cs
[tecnologo@tisj ~]$ ls -d /usr/bin
/usr/bin
[tecnologo@tisj ~]$ echo $?
0
[tecnologo@tisj ~]$ ls -d /bin/usr
ls: cannot access /bin/usr: No such file or directory
[tecnologo@tisj ~]$ echo $?
2
```

## Funciones

Las funciones tienen 2 posibles sintaxis:

```cs
function nombre {
    comandos
    return
}
```

```cs
nombre () {
    comandos
    return
}
```

Para luego ejecutar las funciones basta con utilizar su nombre.

## case

En bash al igual que en otros lenguajes de programación existe el componente multiopción llamado `case`, el cual puede ser utilizado por ejemplo para un menú, sirviendo de buena alternativa a sucesivos if anidados.

```cs
case texto in
[patron [| patron]...) comandos ;;]...
esac
```

## for

```sh
for i in "${arrayName[@]}"; do
  echo $i
done
```


## Buenas ubicaciones para los Scripts

El directorio `~/bin` es un buen lugar para colocar scripts de uso personal.
En caso de que se genere un script para ser utilizado por todos los usuarios del sistema, el lugar tradicional es `/usr/local/bin`. Para los scripts que son utilizados únicamente por el administrador, se suele utilizar el directorio `/usr/local/sbin`.

## Notas

Material basado en el curso de [Ryan Chadwick](https://ryanstutorials.net/linuxtutorial/scripting.php) y del libro [The Linux Command Line](https://tlcl.net).

## Enlaces

- [The Linux Command Line](http://linuxcommand.org/tlcl.php)
- [ryanstutorials](https://ryanstutorials.net/bash-scripting-tutorial/)
- [bash academy](https://www.bash.academy/)
- [cyberciti](https://bash.cyberciti.biz/guide/Main_Page)
