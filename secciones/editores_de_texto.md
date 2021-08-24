# Editores de Texto

- gedit
- kwrite

- [nano](#nano)
- emacs
- [vi/vim](#vi)

## nano

nano es un editor de texto creado como premplazo de `` un editor de correo electrónico. Si bien no contiene muchas herramientas su uso es sencillo.

Los comandos de muestran en la parte inferior del programa y se pueden accionar junto a la tecla `ctrl` representada como `^`.

Ej:

- `Ctrl-x` salir
- `Ctrl-o` guardar

## vi

¿Por que aprender vi?

- Esta ampliamente disponible, por lo que al tener que hacer algun mantenimiento en un equipo remoto o un equipo con la interfaz gráfica dañada puede ser una herramienta fundamental.
- Es ligero y rápido, un extenso archivo cargará más rápido que en un programa de interfáz gráfica, además de que está diseñado para una edición eficiente, un usuario experimentado no tiene por que quitar sus manos del teclado.
- Para poder alardear de este superpoder.

### Historia de vi

La primer versión de vi fue escrita en 1976 por Bill Joy en la universidad de California, quié más tarde se convirtió en uno de los co fundadores de `Sun Microsystems`.

Se creo para utilizar en las nuevas terminales con video, previamente la edición de texto se limitaba a una línea a la vez, en los cuales había que ir a determinada línea e indicar el cambio a realizar.

La mayoría de las distribuciones de Linux vienen con un vi "mejorado" llamado `vim` (vi improved), de todos modos por tradición se utiliza un link simbólico para accederlo mediante el nombre de `vi`.

### Iniciando y cerrando vi

Para iniciar vi basta con ingresar vi en la consola.
o de otro modo se puede iniciar con un archivo existente o no pasandole el nombre como argumento.

Para salir se utiliza el comando `:q` (los dos puntos son parte del comando). En caso de haber efectuado cambios se puede forzar la salida, descartandolos agregando un simbolo de exclamación. `:q!`.

### Modo comando y modo Insert

Para escribir es necesario cambiar del modo de comandos al modo de insertar, lo cual se hace con el comando `i`.

Una vez hecho esto se podrá escribir, y mediante la tecla `ESC` se puede retornar al modo de comandos.

### Guardar cambios

Para guardar cambios se debe ingresar un `comando ex`, desde el modo comando se presiona la tecla `:` y de ese modo se pueden ingresar los comandos ex. Para guardar basta `:w` lo que mostrará un mensaje al final de la pantalla en caso de haber sido exitoso con el número de lineas y caracteres agregados.

### Movimiento del cursor

| Tecla   | Movimiento del cursor                 |
|---------|-------------------------              |
| l       | caracter a la derecha                 |
| h       | caracter a la izquierda               |
| j       | caracter a abajo                      |
| k       | caracter a arriba                     |
| ^       | primer caracter no vacio              |
| $       | al final de la linea                  |
| w       | al principio de prox. punt. o palabra |
| W       | al principio de prox. palabra         |
| b       | al  principio de la ant. punt. o pal. |
| B       | al principio de la ant. palabra.      |
| Ctrl-f  | pagina abajo                          |
| Ctrl-b  | pagina arriba                         |
| numeroG | a la linea numero `numero` ej: 2G     |
| G       | a la última linea del archivo         |

### Agregar texto

Para agregar texto a una sentencia se puede utilizar el comando `a`. (ver diferencia con `i`)
Pero suele ser más útil el comando `A`, el cual mueve el cursor al final de la linea y queda en modo `INSERT` al final del texto.

### Agregar lineas

Para agregar lineas se puede utilizar el comando `o` u `O`, los cuales abren `open` una linea debajo y encima del cursor respectivamente.

### Borrar

Para borrar existen distintas opciones, por un lado `x` que elimina caracteres, con distintos variantes, y por el otro `d` que siempre es seguido por un comando de movimiento.

| Comando | Borra                            |
|---------|----------------------------------|
| x       | caracter                         |
| 3x      | 3 caracteres                     |
| dd      | la linea                         |
| 5dd     | 5 lineas                         |
| dW      | del cursor a prox palabra        |
| d$      | del cursor al final de la linea  |
| d0      | del cursor al inicio de la linea |
| d^      | del cursor al primer caracter    |
| dG      | de la linea al final del archivo |
| d20G    | de la linea a la linea #20       |

### Deshacer cambios

Con el comando `u` es posible revertir los cambios.
vim soporta varios niveles, por lo que podemos utilizar varias veces el comando `u` para volver varios pasos atrás. Por su parte vi sólo tiene un nivel de deshacer.

### Cortar

El comando `d`, no sólamente borra texto, sino que también lo corta, guardandolo en un buffer para ser pegado mediante el comando `p` para pegarlo después del cursor, o `P` antes del cursor.

### Copiar

El comando `y` se usa para `yunk` (copiar) texto de forma similar que el `p`.

| Comando | Copia                            |
|---------|----------------------------------|
| yy      | la linea                         |
| 5yy     | 5 lineas                         |
| yW      | del cursor a prox palabra        |
| y$      | del cursor al final de la linea  |
| y0      | del cursor al inicio de la linea |
| y^      | del cursor al primer caracter    |
| yG      | de la linea al final del archivo |
| y20G    | de la linea a la linea #20       |

### Unir (Join) lineas

vi es algo estricto en cuanto a la idea de linea, por lo general no permite eliminar el caracter de salto de linea para así unir dos lineas, por lo que provee un comando para hacer esta tarea, `J`.

### Reemplazar

Es posible mover el cursor en base a una busqueda.

Para buscar en una linea en particular esto es posible mediante el comando `f` y un caracter, ej: `fa`, este comando lleva a la primer ocurrencia de la letra a, y puede ser repetido mediante el ingreso de `;`.

Para buscar en todo el archivo esto es posible mediante el comando `/` lo cual funciona del mismo modo que en el comando `less`. Ejemplo: `/texto` y la tecla `ENTER` nos llevará a la próxima ocurrencia de la palabra texto, y podremos ir al siguiente resultado con la tecla `n`.

### Buscar y reemplazar

vi puede realizar una busqueda y reemplazo de forma global mediante un comando `ex` llamado sustitución. Para cambiar la palabra `Texto` a `texto2` se podría del siguiente modo:

`:%s/Texto/texto2/g`

Donde:

- `:` inicia el comando `ex`
- `%` especifica el rango de lineas, el simbolo de porcentaje es un atajo desde la primer linea a la última, lo que también se podría definir como `1,$`.
- `s` La operación a realizar, en este caso sustitución.
- `/Texto/texto2/` El patrón de busqueda y sustitución.
- `g` global, en el sentido de que se realizará para todas las apariciones, si se omite se realiza sólo para la primer aparición. Agregando una `c` se puede realizar una confirmación antes de cada sustitución.

## Configuración

Archivo vimr

El archivo vimrc contiene configuración que se carga al momento de iniciar vim. En sistemas tipo Unix este archivo se llama .vimrc, mientras que en Windows _vimrc.

Se puede customizar vim colocando comandos en dicho archivo.

Ejemplo: `:set number`

Las lineas que comienzan con " son un comentario y no son leidas por vim.

Se puede buscar otros ejemplos en el archivo vimrc_example.vim. 
También puede consultar el comando de ayuda `:help vimrc-intro` o  `:help vimrc_example.vim`.

## Enlaces

- [configuracion](https://vim.fandom.com/wiki/Open_vimrc_file)
- [tutorial - Vim Genius](http://vimgenius.com/)
- [tutorial - Open vim](https://www.openvim.com/)
- [juego - PacVim (GitHub Project)](https://github.com/jmoon018/PacVim)
- [juego - vim adventures](https://vim-adventures.com/)
- [esc key](https://vim.fandom.com/wiki/Avoid_the_escape_key)
