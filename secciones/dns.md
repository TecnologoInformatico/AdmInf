# DNS

*Domain Name System* Se encarga de traducir nombres de host a direcciones IP.

Establecer un servidor DNS en una red permite remplazar las IPs de las máquinas por nombres. De tal modo es posible asociar múltiples nombres a un mismo equipo para asociar diferentes servicios disponibles.

Por ejemplo, www.example.com y pop.example.com, ambos pueden apuntar a un mismo servidor que funcionará como servidor de correo y servidor de la lógica de la intranet. Estos servicios corriendo en la misma dirección IP.

A modo de ejemplo, en caso de que el administrador de la red deba por algún motivo mover el servidor de correo a otra máquina, bastará con modificar el archivo de configuración DNS.

## bind9

### Instalación

El paquete bind9 puede ser instalado mediante:

```s
apt-get install bind9
```

También es muy útil la instalación de la documentación:

```s
apt-get install bind9-doc
```

### Configuración

Los archivos de configuración se encuentran en el directorio */etc/bind/*.

- **named.conf** Archivo principal de configuración
- **named.conf.options** Opciones genéricas
- **named.conf.local** Especificación particular de este servidor DNS
- **db.127** Especificación dirección de retorno
- **db.root** DNSs de nivel superior
- Otros archivos: db.0, db.255, db.empty, db.local, rndc.conf, rndc.key, zones.rfc1918

### Caché DNS

bind9 por defecto se encuentra configurado como servidor caché. Para que sea útil basta con agregar en la sección forwarders del archivo */etc/bind/named.conf.options* las IPs de los servidores DNS donde redirigir las peticiones.

```cs
options {
    forwarders {
        8.8.8.8; 8.8.4.4;
    };
};
```

### Servidor DNS maestro

Un servidor DNS maestro permite resolver peticiones dentro de la red a nombres de los dominios sobre los cuales tiene potestad.

Para resolver las peticiones de nombres del dominio interno *"tecnologo.com"* se debe añadir en el archivo */etc/bind/named.conf.local* la especificación de maestro para el dominio y la resolución inversa.

```cs
// /etc/bind/named.conf.local
// Archivo para búsquedas directas
zone "tecnologo.com" IN {
    type master;
    file "/etc/bind/db.tecnologo";
};

// Archivo para búsquedas inversas
zone "0.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/192.rev";
};
```

#### Archivo para búsquedas directas

Suponiendo que en la red local se cuenta con 12 máquinas con 
IPs que van de 192.168.0.101 hasta .112 y las cuales tienen como nombres tisj01 y tisj12.

El archivo de configuración se podría ver de el siguiente modo.

```cs
    // Archivo /etc/bind/tecnologo.db
    ;
    ; BIND data file for tecnologo.com
    ;
    @ IN SOA tecnologo.com. root.tecnologo.com. (
    1 ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ) ; Default TTL

    IN NS dns.tecnologo.com.
    IN MX 10 mail.tecnologo.com.

    tisj01 IN A 192.168.0.101
    tisj02 IN A 192.168.0.102
    tisj03 IN A 192.168.0.103
```

Y en caso de existir servidores web, de correo y DNS en la red se pueden agregar del siguiente modo.

```cs
    www IN A 192.168.0.111
    dns IN A 192.168.0.112
    mail IN A 192.168.0.112
```

#### Archivo de zona de búsqueda inversa

Para poder realizar consultas inversas (de IP a nombre) será necesario crear el siguiente archivo:

```cs
    // Archivo /etc/bind/192.rev
    ;
    ; BIND reverse data file for 192.168.0.0
    ;
    @ IN SOA tecnologo.com. root.tecnologo.com. (
    1 ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ) ; Default TTL

    IN NS dns.tecnologo.com.

    101 IN PTR tisj01.tecnologo.com.
    102 IN PTR tisj02.tecnologo.com.
    103 IN PTR tisj03.tecnologo.com.
    104 IN PTR tisj04.tecnologo.com.
    105 IN PTR tisj05.tecnologo.com.
    106 IN PTR tisj06.tecnologo.com.
    107 IN PTR tisj07.tecnologo.com.
    108 IN PTR tisj08.tecnologo.com.
    109 IN PTR tisj09.tecnologo.com.
    110 IN PTR tisj10.tecnologo.com.
    111 IN PTR www.tecnologo.com.
    112 IN PTR dns.tecnologo.com.
    112 IN PTR mail.tecnologo.com.
```

### Iniciar y parar el servidor DNS

El servidor DNS, dispone de un script de arranque y parada en la carpeta /etc/init.d.

```cs
    // Arranque del servidor DNS
    sudo /etc/init.d/bind9 start  
    // Parada del servidor DNS
    sudo /etc/init.d/bind9 stop
    // Reinicio del servidor DNS
    sudo /etc/init.d/bind9 restart
```

### TSIG (Transaction SIGnature)

Protocolo definido en el [RFC 2845](https://tools.ietf.org/html/rfc2845) cuya principal utilidad es el de habilitar a un servidor DNS autenticarse para actualizar una base de datos DNS.

```s
rndc.key # Remote Name Daemon Control
```

## Otros archivos importantes

- `/etc/resolv.conf`
- `/etc/dhcp/dhclient.conf`
- `/var/log/syslog`

## Bibliografía

[wiki.debian](https://wiki.debian.org/Bind9)
[intef](http://www.ite.educacion.es/formacion/materiales/85/cd/linux/m2/servidor_dns_bind9.html)