# mySQL
## Instalar

Para instalarlo se debera poner:
 $ apt-get install mysql-server mysql-client

## Iniciar

Para iniciar en el usuario root sin contraseña:

```sh
sudo mysql
```
## Mostrar las bases de datos
show databases;

## Utilizar una base de datos

use mysql;

## Crear una base de datos

create database nombre_de_base_de_datos character set utf8;
## Crear usuarios

create user nuevo_usuario@'localhost';
para su contraseña: 
set password for 'nuevo_usuario'@'localhost' = PASSWORD('UnAcl4v3muyDiFiCiL');
Privilegios:
grant all on nombre_de_base_de_datos.* to 'nuevo_usuario'@'localhost' ;

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
