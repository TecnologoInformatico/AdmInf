# Markdown

## Encabezados

Para crear un encabezado, agrega uno a seis símbolos `#` antes del encabezado del texto. La cantidad de `#` que utilices determinará el tamaño del encabezado.

```md
# El encabezado más largo (h1)
## El segundo encabezado más largo (h2)
###### El encabezado más pequeño (h6)
```

## Estilo de texto

Puedes indicar un énfasis con texto en negritas, itálicas, tachado, subíndice o superíndice en los campos de comentario y archivos .md.

| Estilo            | Sintaxis          | Ejemplo                | Resultado            |
|-------------------|-------------------|------------------------|----------------------|
| Negrita           | `** **` o `__ __` | `**Texto en negrita**` | **Texto en negrita** |
| Cursiva           | `* *` o `_ _`     | `*Texto en cursiva*`   | *Texto en cursiva*   |
| Tachado           | `~~ ~~`           | `~~Texto tachado~~`    | ~~Texto tachado~~    |
| Negrita y cursiva | `*** ***`         | `***Texto NyC***`      | ***Texto NyC***      |
| Subíndice         | `<sub> </sub>`    | `E<sub>x</sub>`        | E<sub>x</sub>        |
| Superíndice       | `<sup> </sup>`    | `E<sup>2</sup>`        | E<sup>2</sup>        |

## Cita de texto

Se puede citar texto con `>`

> Cita de texto

## Cita de código

Para hacer referencia a un bloque de código es posible mediante 3 comillas simples `:

\`\`\`
Bloque de código
\`\`\`

```md
Bloque de código
```

Para realizar referencia a una palabra clave o a un código de linea con una comilla que envuelva la o las  palabras basta: \`palabra clave\` `palabra clave`.

## Enlaces

Puedes crear un enlace en línea al encerrar el texto del enlace entre corchetes `[ ]`, y luego encerrar la URL entre paréntesis `( )`.

```md
Esta documentación se aloja en el sitio [Tecnologo Informático](https://tecnologoinformatico.com/secciones/markdown.html)
```

Esta documentación se aloja en el sitio [Tecnologo Informático](https://tecnologoinformatico.com/secciones/markdown.html)

## Imágenes

Puedes mostrar una imagen si agregas ! y pones el texto alternativo entre [ ]. Entonces encierra el enlace de la imagen entre paréntesis ().

![Esta es una imagen](https://myoctocat.com/assets/images/base-octocat.svg)

## Tablas

Las tablas no son parte del core de markdown, pero la mayoría de los interpretes de md las soportan.

```md
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
```

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

## Listas

Puedes crear una lista con viñetas si precedes una o más líneas de texto con - o *.

```md
- Baltasar Brum
- José Serrato
- Juan Campisteguy
```

Lista desordenada representada

- Baltasar Brum
- José Serrato
- Juan Campisteguy

Para ordenar tu lista, antecede cada línea con un número.

```md
1. Shell
2. Git
3. Docker
```

1. Shell
2. Git
3. Docker

## Listas de tareas

Para crear una lista de tareas, lista los elementos por prefacio con un guion y espacio, seguido de `[ ]`. Para marcar una tarea como completada, utiliza `[x]`.

```md
- [X] Entregar tarea de Adminf
- [ ] Instalar base de datos
- [ ] Compilar programa EDA
```

- [X] Entregar tarea de Adminf
- [ ] Instalar base de datos
- [ ] Compilar programa EDA

## Enlaces

- [markdown github docs](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
- [markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)