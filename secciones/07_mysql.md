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
