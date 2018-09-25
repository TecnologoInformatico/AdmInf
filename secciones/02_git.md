# git

## init

Crear un nuevo repositorio

Ejemplo:

```sh
git init
```

## clone

Crea una copia local del repositorio

Ejemplo:

utilizando ssh:

```sh
git clone username@host:/path/proyecto
```

utilizando http:

```sh
git clone https://github.com/TecnologoInformatico/AdmInf.git
```

## remote add origin

Agrega un servidor remoto

Ejemplo:

```sh
git remote add origin
```

## branch

Crea una nueva rama.

Ejemplo:

```sh
git branch mejora_486
```

## checkout

Mueve el espacio de trabajo a una rama especificada.

Ejemplo:

```sh
git checkout mejora_486
```

Otra forma de hacerlo todo de una vez:

```sh
git -b checkout rama_nueva
```

La opción -b crea la rama y nos mueve.

## add

Prepara el archivo indicado.

Ejemplo:

    $ git add README.md
    $ git add -A (agrega todos los archivos pendientes)

## push

Actualiza el repositorio remoto con los datos locales.

Ejemplo:

```sh
git push <repositorioRemoto> <rama>
```

## Configuración de usuario

```sh
git config --global user.name "nombre"
git config --global user.email x@mail.com
```

## Diferencias

```sh
git diff <commitX> <commitY>
```