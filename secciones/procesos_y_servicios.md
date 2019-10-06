# Procesos y servicios

Los sistemas operativos modernos son "multitarea", cambiando de proceso en ejecución rápidamente,
creando la ilusión de que realiza más de una tarea a la vez.

Es útil tener un control sobre los prpocesos en ejecución para poder saber los recursos en uso
por cada uno de ellos, así como para poder identificar y tomar medidas con procesos problemáticos.

- ps – Imprime una captura del estado de los procesos
- top – Muestra las tareas en tiempo real.
- jobs – Lista los trabajos activos.
- bg – Mueve un trabajo a segundo plano.
- fg – Trae un trabajo al frente.
- kill – Envía una señal a un proceso.
- killall – Envía una señal por nombre.
- shutdown – Apaga o reinicia el equipo.

## init

Cuando el sistema arranca, el kernel inicia algunas actividades y procesos propios, y lanza un programa llamado `init`.
init corre una serie de shell scripts, ubicados en `/etc`, llamados init scripts, los cuales inician todos los servicios del sistema.

Al hecho de que un programa ejecute otros programas lo convierte en el proceso padre, el proceso inicializador es el padre de todos los demás procesos
del sistema, y tiene el `ID=1`.

### systemd

Es un demonio que funciona como un manejador del sistema, que en muchos sistemas ha reemplazado al tradicional `init` (`sysvinit`).

Algunas de las mejoras que se plantea que tiene este sistema son:

- Proceso de boot más simple.
- Inicia procesos en paralelo.
- Mejor API.
- Sintáxis de manejo simple.
- Permite remover complementos.
- Bajo uso de memoria.
- Mejor manejo de dependencias.

### Determinar el proceso init

Por lo general se puede determinar el sistema init instalado verificando si el archivo `/sbin/ini` es un archivo o un link simbólico.
Si es un archivo corriente seguramente se utilice `sysvinit`. En caso de ser un enlace simbólico se debe ver a donde apunta.

- /lib/systemd/systemd (systemd)
- /lib/sysvinit/init (sysvinit)

## Ver procesos

### ps

El comando `ps` en su forma más simple muestra los procesos asociados a la sesión de la terminal actual.

- **TTY** es un diminutivo de “Teletype” la cual refiere a la terminal que controla el proceso.
- **TIME** fes la cantidad de tiempo consumido por el proceso en el CPU.
- **STAT** indica el estado actual del proceso, el cual puede ser:
  - `R` Running. Corriendo o listo para correr.
  - `S` Sleeping. Esperando por un evento, teclado o paquete de red.
  - `D` Uninterruptible Sleep. Esperando por un evento de I/O.
  - `T` Stopped. Proceso parado.
  - `Z` Zombie. Proceso hijo finalizado pero que no ha sido limpiado por su padre.
  - `<` Un proceso de alta prioridad.
  - `N` Nice. Un proceso de baja prioridad.

Con la opción `x` (sin -) se pueden ver todos los procesos sin importar la terminal que los controla.
En caso de no tener una terminal asociada se muestra un `?`.

#### ps aux

- **USER** ID del usuario propietario del proceso.
- **%CPU** Uso de CPU en porcentaje.
- **%MEM** Uso de memoria en porcentaje.
- **VSZ** Tamaño de memoria virtual.
- **RSS** Uso de memoria RAM en kilobytes.
- **START** Tiempo desde que el proceso comenzó, para valores mayores a un día se utilza la fecha.

### top

Vista dinámica de procesos.

El programa top se actualiza constantemente, por defecto cada 3 segundos, mostrando los procesos en orden de actividad.

### pstree

Muestra los procesos en forma de árbol, permitiendo visualizar las relaciones y dependencias.

### jobs

Permite ver los procesos que hay corriendo en segundo plano en la terminal actual.
Es posible interactuar con los procesos mediante el número de trabajo.
Por ejemplo, para traer al frente a un proceso es posible mediante `fg %2` tal que el 2 es el número de trabajo.

## Controlando los procesos

Interrumpir un proceso Ctrl+C
Poner en pausa un proceso Ctrl+Z
Correr en segundo plano `programa &` correr un con `&` al final del comando.

### señales

#### 1 HUP

Señal legada del tiempo de las terminales para recargar la configuración.
Algunos demonios aún la utilizan actualmente.

#### 2 INT

Interrumpir, misma señal que la enviada mediante Ctrl+C.
El programa puede realizar alguna acción antes de finalizar.

#### 3 QUIT

Salir.

#### 9 KILL

Un programa puede decidir ignorar la mayoría de las señales que se le envían.
Esta funciona de un modo diferente, ya que en lugar de enviarle la señal al proceso
se le envía al kernel, haciendo imposible que se ignore. No deja opción al proceso, para
que limpie-guarde su trabajo actual, por lo que debe ser utilizada como último recurso.

#### 11 SEGV

Violación del segmento de memoria.
Se envía la señal en caso de que el proceso realice un acceso a memoria no permitido.

#### 15 TERM

Es la señal enviada por defecto y si un proceso es capáz de reaccionar mediante esta señal finalizará.

#### 18 CONT

Continuar. Restablece un proceso pausado.

#### 19 STOP

Pausa el proceso sin terminarlo.
Al igual que la señal KILL es enviada al kernel y no al proceso, por lo que el proceso
no puede ignorarla.

#### 20 TSTP

Terminal Stop, Se envia al precionar Ctrl+Z.
La señal es recibida por el proceso y puede ser ignorada.

### killall

Envía señales a multiples procesos, mediante un nombre.

## Carga del sistema

### vmstat

Muestra una captura de la carga del sistema, memoria, swap y lectura de disco.
Para hacerlo de un modo dinámico es posible pasarle un tiempo de actualización como argumento.

### tload y xload

Programas de consola y de interfáz gráfica respectivamente, para visualizar la carga del sistema en forma de gráfica.

## Enlaces

- [Debian, system initialization](https://www.debian.org/doc/manuals/debian-reference/ch03.en.html)
