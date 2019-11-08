# DNS

## Servidor Caché

1. Instalar bind9.

		sudo apt-get install bind9

2. Investigue los archivos de configuración por defecto y defina brevemente el propósito de cada uno de los archivos.

	Los archivos de configuración se encuentran en el directorio */etc/bind/*.

	- **named.conf** Archivo principal de configuración
	- **named.conf.options** Opciones genéricas
	- **named.conf.local** Especificación particular de este servidor DNS
	- **db.127** Especificación dirección de retorno
	- **db.root** DNSs de nivel superior
	- Otros archivos: db.0, db.255, db.empty, db.local, rndc.conf, rndc.key, zones.rfc1918

3. Establezca un servidor sólo de caché, omita el utilizar un `forwarder` y pruebe su funcionamiento, analice el trafico mediante `wireshark` o `tcpdump` (`tcpdump udp port 53`).

	(Copio el archivo para tener un respaldo...)
	
		sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.back
	
	(bind9 ya viene configurado por defecto como servidor DNS Caché)
	
	(Intenté probar el DNS usando `tcpdump` pero no lo entendi, asi que usé este comando que vi en internet)
	
		dig @localhost www.google.com
	
	(Si la peticion pudo ser resuelta devuelve los detalles, de lo contrario un aviso de "connection timed out; no servers could be reached")

4. ¿que sucede al omitir un forwarder, funciona?, ¿cómo?

	Al consultar por un dominio no cacheado, resuelve la peticion recurriendo a los DNS raíz y almacena el resultado en el cache

5. Agregue el DNS público de Google (`8.8.8.8`), o el de su preferencia como forwarder, y reinicie el servicio bind9.

	(Abro el archivo de configuracion y agreguo las siguientes lineas)
	
		sudo gedit /etc/bind/named.conf.options

			forwarders {
				8.8.8.8;
			};
		
		sudo /etc/init.d/bind9 restart

6. Explique el propósito de agregar un `forwarder`, ¿que es lo que realiza el servidor DNS cuando recibe una consulta?

	Cuando se tiene configurado un forwarder, al consultar por un dominio no cacheado NO recurre a los DNS raíz, sino que le pasa la peticion a otro DNS (definido en la configuracion de foward) para que este la resuelva.
	El resultado obtenido es cacheado

--------------------------------------------------------------
--------------------------------------------------------------

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
