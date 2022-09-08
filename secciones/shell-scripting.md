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

### Valor por defecto

Es posible asignarle un valor por defecto a las variables.

: ${mi_variable:='valor por defecto'}
: ${$1:='primer-parametro'}

mi_variable=${mi_variable:-'por defecto'}

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

## loops

### for

```sh
for i in "${arrayName[@]}"; do
  echo $i
done
```

### while

```sh
count=1
while [[ "$count" -le 5 ]]; do
    echo "$count"
    count=$((count + 1))
done
```

## Parametros posicionales

```sh
usage () {
    echo "$PROGNAME: usage: $PROGNAME [-f file | -i]"
    return
}

# process command line options
interactive=
filename=
while [[ -n "$1" ]]; do
    case "$1" in
        -f | --file)
            shift
            filename="$1"
    ;;
        -i | --interactive)
            interactive=1
    ;;
    -h | --help)
        usage
        exit
    ;;
    *)
        usage >&2
        exit 1
    ;;
    esac
    shift
done
```

## Buenas ubicaciones para los Scripts

El directorio `~/bin` es un buen lugar para colocar scripts de uso personal.
En caso de que se genere un script para ser utilizado por todos los usuarios del sistema, el lugar tradicional es `/usr/local/bin`. Para los scripts que son utilizados únicamente por el administrador, se suele utilizar el directorio `/usr/local/sbin`.

## Notas

Material basado en el curso de [Ryan Chadwick](https://ryanstutorials.net/linuxtutorial/scripting.php) y del libro [The Linux Command Line](https://tlcl.net).

## Playground Shell scripting

```bash
#!/bin/bash

# La primera línea del script es el [shebang](http://en.wikipedia.org/wiki/Shebang_(Unix)) que le indica al sistema 
# cómo ejecutar el script.
# Como te habrás dado cuenta, los comentarios en shell empiezan con #.
# El shebang también es un comentario.

# Ejemplo sencillo de hola mundo:
echo ¡Hola mundo!

# Cada comando empieza con una nueva línea, o después de un punto y coma:
echo 'Esta es la primera línea'; echo 'Esta es la segunda línea'

# Para declarar una variable se hace lo siguiente:
VARIABLE="Mi string"

# Pero no así:
VARIABLE = "Mi string"

# Bash decidirá que VARIABLE es un comando a ejecutar, dando un error.

# Usando la variable:
echo $VARIABLE
echo "$VARIABLE"
echo '$VARIABLE'

# Cuando la variable es usada - o asignada, exportada, etcétera - se
# escribe su nombre sin $. Si se quiere saber el valor de la variables,
# entonces sí se usa $. Note que ' (comilla simple) no expandirá las 
# variables.

# Sustitución de strings en variables.
echo ${VARIABLE/Mi/Una}
# Esto sustituirá la primera cadena "Mi" con "Una".

# Substring de una variable.
echo ${VARIABLE:0:7}
# Esto va a regresar sólo los primeros 7 caracteres del valor.

# Valor por defecto de una variable
echo ${FOO:-"DefaultValueIfFOOIsMissingOrEmpty"}
# Esto trabaja para null (VARIABLE=), string vacío (VARIABLE=""), }
# cero (VARIABLE=0) regresa 0

# Variables del sistema:
# Aquí hay algunas variables incluídas en el sistema:
echo "El valor de regreso del último programa: $?"
echo "PID del sistema: $$"
echo "Número de argumentos: $#"
echo "Argumentos del script: $@"
echo "Argumentos del script separados en variables: $1 $2..."

# Para leer un valor del input:
echo "¿Cuál es tu nombre?"
read NOMBRE # Note que no necesitamos declarar una variable
echo ¡Hola, $NOMBRE!

# Tenemos la estructura 'if' usual:
# use 'man test' para más información sobre condicionales
if [ $NOMBRE -ne $USER ]
then
    echo "Tu nombre es tu usuario."
else
    echo "Tu nombre no es tu usuario."
fi

# También hay ejecuciones condicionadas.
echo "Siempre ejecutado" || echo "Sólo ejecutado si el primer comando falla"
echo "Siempre ejecutado" && echo "Sólo ejecutado si el primer comando NO falla"

# Para usar && y || con condicionales, se necesitan 
# múltiples pares de corchetes:
if [ $NOMBRE == "Steve" ] && [ $EDAD -eq 15 ]
then
    echo "Esto correrá si $NOMBRE es Steve Y $EDAD es 15."
fi

if [ $NOMBRE == "Daniya" ] || [ $NOMBRE == "Zach" ]
then
    echo "Esto correrá si $NOMBRE es Daniya O Zach."
fi

# Las expresiones se denotan con el siguiente formato:
echo $(( 10 + 5 ))

# A diferencia de otros lenguajes de programación, bash es shell , así que
# funciona en un contexto de directorio actual. Puedes listar archivos y
# directorios en un directorio actual con el comando 'ls':
ls

# Estos comandos tienen opciones que controlan su ejecución:
ls -l # Lista todos los archivos y directorios en líneas distintas.

# Los resultados del comando anterior pueden ser pasados al siguiente 
# como input. El comando 'grep' filtra el input con los comandos provistos.
# Así es como podemos listar archivos .txt en el directorio actual:
ls -l | grep "\.txt"

# Puedes también redireccionar el input y el error lanzado de algún comando.
python2 hello.py < "input.in"
python2 hello.py > "output.out"
python2 hello.py 2> "error.err"

# El error lanzado eliminará el contenido del archivo si es que existe,
# para después escribir el error. Para que se concatene (en lugar de eliminar)
# use el comando ">>".

# Los comandos pueden ser sustituidos dentro de otros comandos usando $():
# El siguiente ejemplo despliega el número de archivos y directorios en el
# directorio actual.
echo "Hay $(ls | wc -l) elementos aquí."

# Lo mismo puede ser hecho usando comillas invertidas `` pero no pueden ser
# anidadas. El método preferido es $().
echo "Hay `ls | wc -l` elementos aquí."

# Bash usa una estructura de casos similar al switch de Java o C++:
case "$VARIABLE" in 
    # Lista de patrones que las condiciones deben cumplir: 
    0) echo "Hay un cero.";;
    1) echo "Hay un uno.";;
    *) echo "No es null.";;
esac

# Para los ciclos, se usa la estructura 'for'. Cicla para cada argumento dado:
# El contenido de $VARIABLE se imprime tres veces.
for VARIABLE in {1..3}
do
    echo "$VARIABLE"
done

# ciclos while:
while [true]
do
    echo "cuerpo del ciclo..."
    break
done

# También se pueden definir sub-rutinas (funciones)
# Definición:
function miFuncion ()
{
    echo "Los argumentos trabajan igual que argumentos de script: $@"
    echo "Y: $1 $2..."
    echo "Esto es una función"
    return 0
}

# O simplemente:
miOtraFuncion ()
{
    echo "¡Otra forma de declarar funciones!"
    return 0
}

# Para llamar a tu función
foo "Mi nombre es:" $NOMBRE

# Hay muchos comandos útiles que puedes aprender:
# imprime las últimas 10 líneas del archivo file.txt
tail -n 10 file.txt
# imprime las primeras 10 líneas del archivo file.txt
head -n 10 file.txt
# ordena las líneas del archivo file.txt
sort file.txt
# identifica u omite las líneas repetidas, con -d las reporta
uniq -d file.txt
# imprime sólo la primera columna antes de cada ',' en el archivo|
cut -d ',' -f 1 file.txt
```

## Enlaces

- [The Linux Command Line](http://linuxcommand.org/tlcl.php)
- [ryanstutorials](https://ryanstutorials.net/bash-scripting-tutorial/)
- [bash academy](https://www.bash.academy/)
- [cyberciti](https://bash.cyberciti.biz/guide/Main_Page)
