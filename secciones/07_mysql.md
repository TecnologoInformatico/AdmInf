# mySQL

## Iniciar

Para iniciar en el usuario root sin contraseña:

```sh
sudo mysql
```

## Utilizar una base de datos

use mysql;

## Listar usuarios

select *.from mysql.user;

mysql> select user from mysql.user;

Ver detalles de la tabla:

desc mysql.user;

## Modificar usuario

modificar contraseña:

Para versiones 5.7.5 o anteriores:

SET PASSWORD FOR 'nombreDeUsuario'@'hostname' = PASSWORD('nuevaContraseña');

Para versiones más nuevas:

ALTER USER 'user'@'hostname' IDENTIFIED BY 'newPass';

Hotra forma:

UPDATE mysql.user SET Password=PASSWORD('nuevaContraseña') WHERE USER='nombreDeUsuario' AND Host='hostname';

## Instalacion de mySQL

1. Actualizar paquetes de Linux
 sudo apt-get update
2.Instalar el servidor y cliente de MySQL
 sudo apt-get install mysql-server mysql-client

## Crear un usuario
Primero ingresar a la consola de Linux, -u toma el usuario y el -p toma la contraseña 
mysql -u root -p
CREATE USER 'nombre_de_usuario@'localhost' IDENTIFIED BY 'password';

## Otorgar privilegios
GRANT 'privilegios' ON *base de datos* TO 'nombre_usuario'@'localhost';
privilegios:
-ALL PRIVILEGES
-CREATE
-DROP
-DELETE
-INSERT
-SELECT
-UPDATE
-GRANT OPTION : permite remover privilegios de usuarios.

## CREAR BASE DE DATOS
create database 'nombreBaseDeDatos'
