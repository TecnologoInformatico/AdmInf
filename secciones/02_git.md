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

## Repositorios Remotos

Para ver los repositorios remotos

```s
git remote -v
```

Agregar un servidor remoto:

```s
git remote add origin https://github.com/user/repo.git
```

Modificar:

```s
git remote set-url origin https://github.com/TecnologoInformatico/AdmInf.git
```

## branch

Crea una nueva rama.

Ejemplo:

```sh
git branch mejora_486
```

### Archivar branch

Para archivar un branch agregarle un tag para luego poder buscarlo mediante el:

    git tag archive/<branchname> <branchname>

Luego eliminarlo.

    git branch -d <branchname>

En caso de necesitar restaurarlo:

    git checkout -b <branchname> archive/<branchname>

- [stackoverflow | how can i archive git branches](https://stackoverflow.com/questions/1307114/how-can-i-archive-git-branches)

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