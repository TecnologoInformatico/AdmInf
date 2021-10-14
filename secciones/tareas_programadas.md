# Tareas programadas

En el mundo UNIX las tareas programadas tienen en un lugar destacado a las tareas cron, para entenderlas hay que tener en cuenta tres elementos:

- `crond`, demonio `daemond`, proceso persistente en segundo plano.
- `crontab`, tabla que contiene las tareas a ejecutar y en que momento.
- `cron job`, tarea específica, línea dentro del `crontab`.

## crond

Cron es una utilidad que permite a los usuarios programar comandos para que sean ejecutadas como tareas repetitibas en determinados intervalos de tiempo. Las tareas programadas en cron son denominadas `cron jobs`. Los usuarios pueden determinar que tipo de tareas desean automatizar y en que momento debe ser ejecutadas.

Es un "demonio", un proceso que se ejecuta en segundo plano, de forma no iterativa. El mismo busca tareas a realizar cada minuto en el archivo crontab.

### crontab

`crontab [-u user] archivo`

`crontab [ -u user ] { -l | -r [ -i ] | -e }`

El comando crontab es el encargado de manipular la tabla de tareas `cron`, listado de tareas agendadas para ser ejecutadas en un intervalo regular de tiempo.

El comando crontab es utilizado para ver o editar la tabla de comandos que correrá el demonio `cron`. Cada usuario puede tener su propio crontab.
Los archivos crontab se encuentran en el directorio `/var/spool` o en un subdirectorio tal como `/var/spool/cron/crontabs`, pero no es la idea editar estos archivos de forma manual, sino a travez del comando `crontab`.

Se utiliza con las siguientes opciones:

| Opción  | Descripción                                                                                                               |
|---------|---------------------------------------------------------------------------------------------------------------------------|
| archivo | Carga los datos para el crontab desde el archivo especificado, en caso de ser un guión lo hará desde la entrada estandar. |
| -u      | Usuario del cual se manipulará el archivo cron.                                                                           |
| -l      | Muestra el archivo crontab.                                                                                               |
| -e      | Edita el archivo crontab utilizando el editor especificado en el ambiente.                                                |
| -r      | Elimina el archivo crontab actual.                                                                                        |
| -i      | Lo mismo que -r pero con confirmación                                                                                     |

### cron job

Cada entrada del `crontab` contiene cinco marcas de tiempo y fecha, seguidos por un comando. Esto define el `cron job`.

```pre
*    *    *    *    *    *    Comando
-    -    -    -    -    -
|    |    |    |    |    |
|    |    |    |    |    + año [opcional]
|    |    |    |    +----- día de la semana (0 - 7) (domingo=0 o 7)
|    |    |    +---------- mes (1 - 12)
|    |    +--------------- día del mes (1 - 31)
|    +-------------------- hora (0 - 23)
+------------------------- minuto (0 - 59)
```

Dejando el "*" equivale a todos los valores de ese lugar (ejemplo * en hs equivale a todas las horas)

Es posible ingresar rangos o una lista de números separados por comas, por ejemplo 8-11, para las horas 8, 9, 10 y 11, lo que también puede ser establecido separando con comas. También se pueden establecer "pasos", donde se indica cada determinado tiempo, por ejemplo cada dos horas, puede ser así `*/2`

### Ejemplos

```sh
0 5 * * 0 rsync -zvr /home/tecnologo/Desktop/carpeta /home/tecnologo/Desktop/respaldo
```

A las 5 a.m. todos los domingos sincroniza los elementos en carpeta en el destino respaldo. Esto en windows se puede encontrar como el administrador de tareas.

```sh
30 08 * * 5,6,7             [comando a ejecutar]
30 08 * * 5-7               [comando a ejecutar]
```

Tareas que se ejecutan todos los días a las 08:30 de viernes a sábados.

## Variables de entorno

Es posible establecer variables de entorno para cuando se ejecute las tareas del crontab. En distribuciones deribadas de Debian, tal como Ubuntu y las cuales utilizan el mcron de GNU, es posible agregar una linea de configuración para las variables de entorno, no así es el caso de otros sistemas como Arch Linux y Fedora.

Esta linea tiene el formato `nombre = valor`, siendo el espacio al rededor del signo de igual opcional.

Algunas variables de entorno se establecen automaticamente por `cron`:

- `SHELL` se establece como `/bin/sh`
- `LOGNAME` y `HOME` se obtienene del archivo `/etc/passwd` de acuerdo al propietario del crontab.

Puede ser útil a modo de debug imprimir las variables de entorno en una tarea "dummy".

`* * * * * env > /tmp/env.output`

En caso de que no sea posible establecer las variables de entorno en el archivo `crontab`, o en caso de que alguna tarea pueda requerir variables de entorno especificas, estas pueden ser establecidas dentro del script.

```sh
#!/bin/bash
PATH=/opt/someApp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# El resto del script...
```

## Configuración

### Habilitar o restringir su uso

Es posible habilitar o deshabilitar su uso a usuarios de forma individual, definiendolo en los archivos `/etc/cron.allow` y `/etc/cron.deny`.

## template

```sh
#+--------------------------- Minutos (0-59)
#|    +---------------------- Horas   (0-23)
#|    |     +---------------- Día    (1-31)
#|    |     |   +------------ Mes  (1-12)
#|    |     |   |   +-------- Día de la semana (0-6, 0=Domingo)
#|    |     |   |   |    +--- Comando a ejecutar
#|    |     |   |   |    |
#v    v     v   v   v    v
#====================================================================
# descomentar para testear
#*     *     *   *   *    $HOME/cron/showcron
```

## anacron

Al igual que la herramienta cron, anacron es útil para ejecutar tareas de forma periodica, pero de un modo más apropiado para equipos que no se encuentran en ejecución las 24 horas del día.

## Enlaces

[crontab.guru](https://crontab.guru/)
[crontab editor](https://corntab.com/)
[Computer hope](https://www.computerhope.com/unix/ucrontab.htm)
