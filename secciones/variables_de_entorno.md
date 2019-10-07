# Entorno

Cuando ingresamos en el sistema se leen una serie de scripts de configuración, denominados startup files, los cuales establecen el entorno compartido por los usuarios.
Esto es seguido por otros scripts ubicados en el directorio home del usuario, los cuales personalizarán el ambiente.

- /etc/profile
- ~/.bash_profile
- ~/.bash_login
- ~/.profile

## Scripts para sesiones sin login

- /etc/bash.bashrc
- ~/.bashrc

## Comando env y printenv

El comando env lista todas las variables del ambiente.
Para ver una variable en particular se utiliza el comando echo y el nombre de la variable con un simbolo de pesos adelante. printenv funciona de un modo similar, y permite imprimir el valor de una determinada variable.

Ejemplo: `echo $PATH` o `printenv PATH`

## PATH

Al ingresar un comando el shell busca el programa a ejecutar en la lista de caminos que contiene la variable PATH.

Ejemplo de PATH en el ~/.bashrc
`PATH=$PATH:$HOME/bin`

## PS1

Define el prompt del usuario.

## TERM

Contiene el tipo de terminal

## export

Al ejecutar el comando export se les habilita el valor de la variable a los procesos hijo.

`export PATH`
