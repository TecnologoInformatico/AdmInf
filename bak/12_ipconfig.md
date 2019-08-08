# ipconfig

Muestra los valores actuales de la configuración de la red TCP/IP y actualiza la configuración de DHCP (Protocolo de configuración dinámica de host) y DNS (Sistema de nombres de dominio).
Si se utiliza sin parámetros, ipconfig muestra la dirección IP, la máscara de subred y la puerta de enlace predeterminada de todos los adaptadores de red.

## Sintaxis

    ipconfig [/all] [/renew [adaptador]] [/release [adaptador]] [/flushdns] [/displaydns] [/registerdns] [/showclassid adaptador] [/setclassid adaptador [IdDeClase]]

## Parámetros

    /all: muestra la configuración de TCP/IP completa de todos los adaptadores. Sin este parámetro, ipconfig sólo mostrará los valores de dirección IP, la máscara de subred y la puerta de enlace predeterminada para cada adaptador. Los adaptadores pueden representar a interfaces físicas, como los adaptadores de red instalados, o interfaces lógicas, como las conexiones de acceso telefónico a redes.

    /renew [adaptador]: renueva la configuración de DHCP de todos los adaptadores (si no se especificó un adaptador) o de un adaptador específico, si se incluyó el parámetro adaptador. Este parámetro sólo está disponible en equipos que disponen de adaptadores configurados para obtener una dirección IP automáticamente (DHCP). Para especificar un nombre de adaptador, escriba el nombre de adaptador que aparece cuando se utiliza ipconfig sin parámetros.

    /release [adaptador]: envía el mensaje DHCPRELEASE al servidor DHCP para liberar la configuración actual de DHCP y descartar la configuración de dirección IP para todos los adaptadores (si no se especificó un adaptador) o para un adaptador específico si se incluyó el parámetro adaptador. Este parámetro deshabilita TCP/IP para los adaptadores configurados para obtener una dirección IP automáticamente. Para especificar un nombre de adaptador, escriba el nombre de adaptador que aparece cuando se utiliza ipconfig sin parámetros.

    /flushdns: vacía y restablece el contenido del servicio de resolución de la caché de clientes DNS. Durante la solución de problemas de DNS, puede utilizar este procedimiento para descartar entradas de resultados negativos en la caché y otras entradas agregadas dinámicamente.

    /displaydns: muestra el contenido del servicio de resolución de la caché del cliente DNS, que incluye las entradas cargadas previamente desde el archivo Hosts local y los registros de recursos que se hayan obtenido recientemente para consultas de nombre resueltas por el equipo. El servicio Cliente DNS utiliza esta información para resolver rápidamente los nombres consultados frecuentemente, antes de consultar a sus servidores DNS configurados.

    /registerdns: inicia el registro dinámico manual de los nombres DNS y direcciones IP configurados en un equipo. Puede usar este parámetro para solucionar problemas en el registro de nombres DNS o para resolver un problema de actualización dinámica entre un cliente y un servidor DNS sin tener que reiniciar el cliente. La configuración de DNS de las propiedades avanzadas del protocolo TCP/IP determina qué nombres se registran en DNS.

    /showclassid adaptador: muestra el Id. de clase de DHCP del adaptador especificado. Para ver el Id. de clase de DHCP de todos los adaptadores, use el carácter comodín asterisco (*) en lugar de adaptador. Este parámetro sólo está disponible en equipos que disponen de adaptadores configurados para obtener una dirección IP automáticamente.

    /setclassid adaptador [idDeClase]: configura el Id. de clase de DHCP del adaptador especificado. Para establecer el Id. de clase de DHCP de todos los adaptadores, use el carácter comodín asterisco (*) en lugar de adaptador. Este parámetro sólo está disponible en equipos que disponen de adaptadores configurados para obtener una dirección IP automáticamente. Si no se especifica un Id. de clase de DHCP, se quita el Id. de clase actual.

    /?: muestra Ayuda en el símbolo del sistema.

## ifconfig

       ifconfig - configura un interfaz de red

## SINOPSIS

       ifconfig [interfaz]
       ifconfig interfaz [aftype] opciones | dirección ...

## DESCRIPCIÓN

       Ifconfig  se usa para configurar los interfaces de red residentes en el
       núcleo.	Se  utiliza  durante  el  arranque  para  configurar  aquellos
       interfaces  que	se  necesiten. Tras esto, normalmente sólo se necesita
       para la depuración de errores o para la puesta a punto del sistema.

       Si no se pasan argumentos, ifconfig muestra el estado de los interfaces
       activos. Si se pasa un sólo argumento de interfaz, muestra sólamente el
       estado de ese interfaz; si se da  un  solo  argumento  -a,  muestra  el
       estado  de  todos  los  interfaces,  incluso  de  aquellos que no están
       activos. De otro modo, configura un interfaz.

## OPTIONS

interfaz
	El  nombre  de  un  interfaz.  Suele  ser el nombre de un driver
	seguido por el número de una unidad, por ejemplo: eth0  para  el
	primer interfaz Ethernet.

up     Esta  opción  hace  que  el  interfaz  se  active. Se especifica
	implícitamente si se asigna una dirección al interfaz.

down   Esta opción hace que el interfaz se cierre.

[-]arp Activa o desactiva el uso del protocolo ARP para este interfaz.

[-]promisc
	Activa o	desactiva  el  modo  promiscuo	del  interfaz.	Si  se
	selecciona, el interfaz recibirá todos los paquetes de la red.

[-]allmulti
	Activa  o desactiva el modo all-multicast.  Si se selecciona, el
	interfaz recibirá todos los paquetes multicast de la red.

metric N
	Esta opción establece la métrica de la interfaz.

mtu N  Este parámetro establece la Unidad de Transferencia Máxima (MTU)
	de un interfaz.

dstaddr addr
	Establece la dirección IP remota de una unión punto-a-punto (tal
	como PPP).  Hoy en día esta  opción  resulta  obsoleta;  use  la
	opción pointopoint en su lugar.

netmask addr
	Establece  la  máscara  de red IP para un iterfaz. Este valor es
	por defecto el de la máscara de red normal de clase  A,  B  o  C
	(tal  y  como  se  deriva  de la dirección IP del iterfaz), pero
	puede configurarse para cualquier valor.

add addr/prefixlen
	Añade una dirección Ipv6 a un interfaz.

del addr/prefixlen
	Elimina una dirección Ipv6 de un interfaz.

tunnel aa.bb.cc.dd
	Crea  un	nuevo	dispositivo   SIT   (Ipv6-en-Ipv4),   mediante
	encapsulamiento al destino especificado.

irq addr
	Establece  la línea de interrupción usada por el dispositivo. No
	todos los dispositivos pueden cambiar su	configuración  de  IRQ
	dinámicamente.

io_addr addr
	Establece  la  dirección	inicial en el espacio de E/S para este
	dispositivo.

mem_start addr
	Establece la dirección inicial para la memoria compartida  usada
	por  el  dispositivo.  Muy  pocos  dispositivos  necesitan  esta
	opción.

media type
	Establece el puerto físico o el tipo de medio que ha de usar  el
	dispositivo.   No  todos	los dispositivos pueden modificar esta
	configuración, y aquellos que pueden  varian  en	cuanto	a  los
	valores  que  pueden  admitir.  Los  valores típicos de type son
	10base2  (thin  Ethernet),  10baseT  (10Mbps  Ethernet  de   par
	trenzado),  AUI  (transceptor  externo),	etc.  El tipo de medio
	especial	auto  se  puede  usar  para  decirle  al  driver   que
	autodetecte  el  medio.  Una  vez más, no todos los dispositivos
	pueden hacer esto.

[-]broadcast [addr]
	Si se da un argumento de dirección, establece  la  dirección  de
	emisión  del  protocolo del interfaz. De otro modo, establece (o
	elimina) la opción IFF_BROADCAST del interfaz.

[-]pointopoint [addr]
	Esta opción activa el modo point-to-point (punto	a  punto)  del
	interfaz,  lo  cual  significa que se trata de una unión directa
	entre dos máquinas, sin nadie más a la escucha.
	Si se  da  también  un  argumento  de  dirección,  establece  la
	dirección  de  protocolo	del otro lado de la unión, exactamente
	igual que hace la opción obsoleta dstaddr.  Si no,  establece  o
	elimina la opción IFF_POINTOPOINT del interfaz.

hw class address
	Establece  la dirección de hardware del interfaz, siempre que el
	driver del dispositivo lo permita. Esta opción debe  ir  seguida
	del  nombre de la clase de hardware y el código ASCII imprimible
	equivalente de la dirección del hardware. Las clases de hardware
	soportadas  actualmente  incluyen:  ether (Ethernet), ax25 (AMPR
	AX.25), ARCnet y netrom (AMPR NET/ROM).

multicast
	Establece la opción multicast del interfaz. Normalmente esto  no
	debería  ser  necesario  dado  que  los  drivers establecen esta
	opción correctamente.

address
	La dirección IP que se va a asignar al interfaz.

txqueuelen length
	Establece la longitud de la cola de transmisión del dispositivo.
	Resulta útil configurar este parámetro con valores pequeños para
	dispositivos más lentos con latencias altas (uniones de  modems,
	ISDN)  para evitar que las transferencias masivas de información
	interfieran demasiado el tráfico interactivo del tipo telnet.
