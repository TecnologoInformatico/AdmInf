# DNS

## Servidor Caché

1. Instalar bind9.
2. Investigue los archivos de configuración por defecto y defina brevemente el propósito de cada uno de los archivos.
3. Establezca un servidor sólo de caché, omita el utilizar un `forwarder` y pruebe su funcionamiento, analice el trafico mediante `wireshark` o `tcpdump` (`tcpdump udp port 53`).
4. ¿que sucede al omitir un forwarder, funciona?, ¿cómo?
5. Agregue el DNS público de Google (`8.8.8.8`), o el de su preferencia como forwarder, y reinicie el servicio bind9.
6. Explique el propósito de agregar un `forwarder`, ¿que es lo que realiza el servidor DNS cuando recibe una consulta?

## Servidor Autoritativo

Para utilizar el servidor DNS por defecto en nuestro host, editar el archivo `/etc/resolv.conf`.

- Ingrese en la configuración para un top level domain `.local` y el dominio `adminf` en el archivo `/etc/bind/named.conf.local`.

  ```cs
  zone "adminf.local" IN {
    type master;
    file "/etc/bind/db.adminf.local";
    allow-update { none; };
  };
  ```

- Agregue el archivo de base de datos para la zona. `db.adminf.local`

<<<<<<< HEAD
- Reinicie el servicio del servidor e investigue mediante los comandos `nslookup` y `tcpdump` el funcionamiento.


1 - sudo apt-get install bind9

sudo apt-get install wireshark

2 - named.conf es el archivo de configuracion pricipal del dns esto indica los archvios que se elecuten
named.conf.default-zones es una archivo que controla las zonas predeterminadas de avance, proceso y difusion
named.conf.local este archivo contiene la configuracion del servidor DNS local, y aqui es donde declara la zona asociadas con los dominios de este servidor
named.conf.options este archivo contiene las opcione de configuracion para el servidor DNS
named.named.conf.log con debian jessie debe crear este archivo en /etc/bind
 hay que meterse en el archivo de configuracion named.conf.options
3- id.addr == 192.168.56.101 and udp.port in {56} 

sudo tcpdump udp 53 -w prueba
sudo tcpdump -r prueba | less
curl www.adminf.local
#adicional sudo nano /etc/resolv.conf ->configurar esto 

colocando la ip de la maquina
y el search nuestro dominio
=======
`$cat db.adminf.local`

```cs
; BIND archivo para el dominio adminf.local
;
$TTL    86400
@       IN      SOA     adminf.local. root.adminf.local. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL
;
@       IN      NS      ns.adminf.local.
ns      IN      A       172.28.128.4
www     IN      A       172.28.128.4
```

- Reinicie el servicio del servidor e investigue mediante los comandos `nslookup` y `tcpdump` el funcionamiento.

`sudo service bind9 restart`
>>>>>>> dc410439ffff990737ad3c3e64eb22758e51e06b
