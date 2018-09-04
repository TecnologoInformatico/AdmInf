# git

## init

Crear un nuevo repositorio

Ejemplo:

    $ git init

## clone

Crea una copia local del repositorio

Ejemplo:

    $ git clone username@host:/path/proyecto

## remote add origin

Agrega un servidor remoto

Ejemplo:

    $ git remote add origin

## branch

Crea una nueva rama.

Ejemplo: 

$ git branch mejora_486

## checkout

Mueve el espacio de trabajo a una rama especificada.

Ejemplo:

    $ git checkout mejora_486
    $ git -b checkout rama_nueva (la opción -b crea la rama y nos mueve)

## add

Prepara el archivo indicado.

Ejemplo:

    $ git add README.md
    $ git add -A (agrega todos los archivos pendientes)

## push

Actualiza el repositorio remoto con los datos locales.

Ejemplo: 

$ git push <repositorioRemoto> <rama>

## Configuración de usuario

    git config --global user.name "nombre"

    git config --global user.email x@mail.com

## Diferencias

    git diff <commitX> <commitY>