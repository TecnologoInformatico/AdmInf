# Servicios

## Para Linux

La manera de administrar servicios en distribuciones Linux es utilizar el comando systmctl.
El principal cometido de los servicios es iniciar los componentes que deben ser inicializados después de que se bootea el sistema operativo.

Nota: Esta solución no está implementadas para todas las distribuciones de Linux

### Systemctl

Se utiliza para realizar una introspección y controlar el estado del sistema "systemd" y gerente de servicios.

#### Sinopsis

    systemctl [Opciones ...] Comando [Nombre ...]

#### Opciones

    -t, --type : lista separada por comas de tipos de unidades
    -p, --property : muestra todas las propiedades con los nombres identificados

#### Comenzar y detener servicios

##### Iniciar Servicio

sudo systemctl start application.service

Administracion General
sudo systemctl start application 

##### Parar Servicio

sudo systemctl stop application.service

##### Reinicio y recarga

sudo systemctl restart application.service

##### Indeciso

Si no estas seguro de cual usar, se puede utilizar el siguiente comando:

$ sudo systemctl reload-or-restart aplicacion.service

#### Habilitar y deshabilitar servicios

##### Habilitar

$ sudo systemctl enable aplicacion.service

##### Deshabilitar

$ sudo systemctl disable aplicacion.service

#### Ver el estado de un servicio

$ sudo systemctl status aplicacion.service

Esto te va a proveer del estado actual del servicio.

También hay comandos para chequar por estados específicos

### Si está activo

$ systemctl is-active aplicacion.service

### Si está habilitado

$ systemctl is-enabled aplicacion.service

### Si hubo algún fallo

$ systemctl is-failed aplicacion.service

## Servicios en Windows

Una de las maneras de administrar los servicios en sistemas operativos Windows es utilizando Windows PowerShell.

Se pueden utilizar los siguientes comandos:

### Obtener servicio

Get-Service

### Nuevo servicio

New-Service

### Reiniciar servicio

Restart-Service

### Reanudar servicio

Resume-Service

### Asignar servicio

Set-Service

### Iniciar servicio

Start-Service

### Detener servicio

Stop-Service

### Suspender servicio

Suspend-Service

### Enlaces

- [uso de systemctl digitalocean](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)