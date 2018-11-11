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

## Mostrar las bases de datos

show databases;

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

Primero ingresar a la consola de Linux, -u toma el usuario y el -p toma la contraseña. `mysql -u root -p`

`CREATE USER usuario IDENTIFIED BY password;`

create user nuevo_usuario@'localhost';
para su contraseña:
set password for 'nuevo_usuario'@'localhost' = PASSWORD('UnAcl4v3muyDiFiCiL');
Privilegios:
grant all on nombre_de_base_de_datos.* to 'nuevo_usuario'@'localhost' ;

## Eliminar Usuario

DROP USER usuario;

## Listar usuarios

select *.from mysql.user;

mysql> select user from mysql.user;

Ver detalles de la tabla:

desc mysql.user;

## Modificar usuario

modificar contraseña:

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

## Otorgar privilegios

GRANT 'privilegios' ON *base de datos* TO 'nombre_usuario'@'localhost';

privilegios:

- ALL PRIVILEGES
- CREATE
- DROP
- DELETE
- INSERT
- SELECT
- UPDATE
- GRANT OPTION : permite remover privilegios de usuarios.
