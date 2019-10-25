# SSL/TLS

SSL (Secure Sockets Layer) y su sucesor, TLS (Transport Layer Security), son protocolos para establecer una comunicación autenticada y encriptada entre una red de computadoras.

El protocolo SSL fue deprecated desde el lanzamiento del protocolo TLS 1.0 en 1999, de todos modos aún es comun referirse a el como `SSL` o `SSL/TLS`.

La versión al momento (10-2019) es TLS 1.3, definida en el RFC 8446.

1. Verifique que tenga instalado tanto apache2 como openssl. En caso de no contar con estas herramientas instalelas.
2. Cree el directorio `/etc/ssl/localcerts` en caso de que no exista.
3. Crear un certificado autofirmado con una validez de 30 días.
  `openssl req -new -x509 -days 30 -nodes -out /etc/ssl/local\certs/apache.pem -keyout /etc/ssl/localcerts/apache.key`
4. Modifique los permisos de las claves para que sólo el propio usuario root cuente con escritura y lectura.
5. Habilite el módulo `ssl` de apache.
6. Cree un nuevo virtualhost con la configuración [testssl](#Config-testssl).
7. Agregue un contenido de prueba para ese sitio.

## Config testssl

```xml
  <VirtualHost *:7000>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/testssl

    SSLEngine On
    SSLCertificateFile /etc/ssl/localcerts/apache.pem
    SSLCertificateKeyFile /etc/ssl/localcerts/apache.key
</VirtualHost>
```
