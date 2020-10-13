# mySQL

## Instalación

Para instalar mysql se pueden utilizar los paquetes `mysql-server` y `mysql-client` para instalar servidor y cliente respectivamente.

`sudo apt install mysql-server`

Una vez esto realizado es recomendable correr un script que agrega cierto nivel de seguridad a la instalación.

`sudo mysql_secure_installation`

## Iniciar

Para iniciar en el usuario root sin contraseña:

```s
sudo mysql
```

En caso de haberle dado una contraseña, -u para ingresar el usuario y el -p para la contraseña. `mysql -u root -p`

```s
mysql -h servidor -u usuario -p
Enter password: ...
```

## Mostrar las bases de datos

show databases;

## Utilizar una base de datos

use nombre-base-de-datos;

## Mostrar las tablas

show tables;

## Crear una base de datos

`mysql> CREATE DATABASE nombre_BD;`

## Eliminar una base de datos

`mysql> DROP DATABASE nombre_de_la_BD;`

## Desconectar

`mySQL> QUIT`

## Crear usuarios

`CREATE USER usuario;`

create user nuevo_usuario@'localhost';

## Eliminar Usuario

DROP USER usuario;

## Listar usuarios

```SQL
select User from mysql.user;
```

Ver detalles de la tabla:

desc mysql.user;

## Modificar usuario

### Asignar contraseña

Para versiones 5.7.5 o anteriores:

```SQL
SET PASSWORD FOR 'nombreDeUsuario'@'hostname' = PASSWORD('nuevaContraseña');
```

Para versiones más nuevas:

```SQL
ALTER USER 'user'@'hostname' IDENTIFIED BY 'newPass';
```

otras forma:

```SQL
UPDATE mysql.user SET Password=PASSWORD('nuevaContraseña') WHERE USER='nombreDeUsuario' AND Host='hostname';
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';
```

En lugar de `caching_sha2_password` es posible utilizar la anterior versión `mysql_native_password`, en caso de que se presenten problemas de compatibilidad.

## Otorgar privilegios

```sql
GRANT 'privilegios' ON basededatos.tabla TO 'nombre_usuario'@'localhost';
```

```sql
GRANT ALL PRIVILEGES ON `usuario\_%` . * TO 'usuario'@'localhost';
```

El primer comando le otorga los privilegios al usuario `nombre_usuario` en la tabla `tabla` de la base de datos `basededatos`, el segundo comando le otorga todos los privilegios a todas las tablas de todas las bases de datos que comiencen con su nombre. Este ultimo es útil para permitir que un usuario pueda administrar las bases de datos restringido por su nombre, o algun prefijo.

privilegios:

- ALL PRIVILEGES
- CREATE
- DROP
- DELETE
- INSERT
- SELECT
- UPDATE
- GRANT OPTION : permite remover privilegios de usuarios.

Ejemplo:

## Privilegios

`grant all on nombre_de_base_de_datos.* to 'nuevo_usuario'@'localhost';`
