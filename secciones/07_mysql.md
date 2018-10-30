# mySQL

##Instalar
sudo apt-get update
sudo apt-get install mysql-server mysql-client

## Iniciar

Para iniciar en el usuario root sin contraseña:

```sh
sudo mysql
```

##Crear una base de datos
mysql -h servidor -u usuario -p
Enter password;
mysql> CREATE DATABASE nombre_BD;


##Eliminar una base de datos
$ mysql -h servidor -u usuario -p
Enter password
mysql> DROP DATABASE nombre_de_la_BD;
quit

##Desconectar
mySQL> QUIT

## Instalar phpMyAdmin
sudo apt-get install phpmyadmin

## Utilizar una base de datos
use mysql;

##Crear Usuario
CREATE USER usuario IDENTIFIED BY password;

##Eliminar Usuario
DROP USER usuario;

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
