# Certificados SSL

En las distribuciones de GNU/Linux `openssl` es la herramienta más utilizada para gestionar certificados, entre las cuales también podemos encontrar `gnutls`.

## Estructura PKI

Al momento de utilizar un sistema con certificados se puede optar por utilizar certificados de una entidad externa, comodo, Verisign, El Correo Uruguayo, Abitab, o es posible utilizar certificados generados por una CA propia.

Formatos disponibles para almacenar certificados:

### CER,DER,CRT

Se utilizan normalmente para el almacenamiento del certificado en formato binario (DER, Distinguish Encoding Rules).

### PEM

Certificado codificado en Base64, encerrado entre `-----BEGIN CERTIFICATE-----` y `-----END CERTIFICATE-----`. (PEM, Privacy-enhanced Electronic Mail)

### P7B, P7C

El formato PCKS#7 permite almacenar el certificado junto con los certificados de la ruta de certificación. La ruta de certificación es el conjunto de certificados que jerárquicamente firman un certificado.

### PFX, P12

Este formato permite la transferencia de los certificados junto con sus claves privadas correspondientes. PCKS#12 permite incluir todos los certificados de la ruta de certificación.

## Infraestructura PKI

### Clave privada

Contiene la clave privada y suele tener contraseña.

### Solicitud de certificado

Se envía la clave pública y la información de identidad en este archivo a la CA para que ésta la firme.

### Certificado

Contiene la clave pública firmada por la CA.

### Lista de revocaciones

Este archivo contiene una lista de certificados revocados por la CA.

### Certificado CA

Contiene el certificado auto firmado de la CA.

### Certificados externos

En este caso basta con importar los certificados y claves en las carpetas correspondientes.

## Enlaces

- [PKI - wikipedia](http://es.wikipedia.org/wiki/PKI#Componentes)
