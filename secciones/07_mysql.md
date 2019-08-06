# mySQL

## Instalar

Para instalarlo se deberá poner:

 $ apt-get install mysql-server mysql-client

create database 'nombreBaseDeDatos'

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

mysql -h servidor -u usuario -p
Enter password;
mysql> CREATE DATABASE nombre_BD;

## Eliminar una base de datos

$ mysql -h servidor -u usuario -p
Enter password
mysql> DROP DATABASE nombre_de_la_BD;
quit

## Desconectar

mySQL> QUIT

## Instalar phpMyAdmin

sudo apt-get install phpmyadmin

## Utilizar una base de datos

use mysql;

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

otra forma:

```SQL
UPDATE mysql.user SET Password=PASSWORD('nuevaContraseña') WHERE USER='nombreDeUsuario' AND Host='hostname';
```

set password for 'nuevo_usuario'@'localhost' = PASSWORD('UnAcl4v3muyDiFiCiL');

## Otorgar privilegios

`GRANT 'privilegios' ON basededatos.tabla TO 'nombre_usuario'@'localhost';`

GRANT ALL PRIVILEGES ON `usuario\_%` . * TO 'usuario'@'localhost';

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
