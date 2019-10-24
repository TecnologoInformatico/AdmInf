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

## OpenSSL

Openssl es un conjunto de herramientas que permiten una completa gestión de certificados. Para manipular certificados tenemos el comando openssl , que admite una gran variedad de modalidades distintas, entre ellas:

- `ca`: Gestión de una autoridad certificadora (CA).
- `crl`: Gestión de revocación de certificados CLR (Certificate Revocation List).
- `crl2pkcs7`: Conversiones de CRL a PKCS#7.
- `passwd`: Generación de contraseñas.
- `pkcs12`: Gestión de certificados PKCS#12.
- `pkcs7`: Gestión de certificados PKCS#7.
- `req`: Gestión de solicitudes de certificados X.509 (Certificate Signing Request, CSR).
- `rsa`: Gestión de llaves RSA.
- `x509`: Gestión de certifcados de tipo X.509.

El archivo de configuración suele encontrarse en el directorio `/etc/ssl/` con el nombre `openssl.cnf`, y en el se especifica donde se almacenan las claves y los certificados, además de otra configuración de la herramienta.

En la misma ubicación se suele encontrar una carpeta `private` la cual contiene la clave del servidor, otra `certs` que contiene certificados conocidos y de confianza y otra `newcerts` que contiene una copia de cada certificado que firma la CA.

## Enlaces

- [PKI - wikipedia](http://es.wikipedia.org/wiki/PKI#Componentes)
