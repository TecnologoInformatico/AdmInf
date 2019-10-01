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

## Enlaces

- [Debian, system initialization](https://www.debian.org/doc/manuals/debian-reference/ch03.en.html)
