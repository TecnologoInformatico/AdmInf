# Git

Git es un sistema de control de versiones distribuido libre, para manejar proyectos de cualquier magnitud.

## Estados y áreas

Git tiene tres principales estados:

- `modified`, hay cambios pero aún no están commiteados a la base de datos.
- `staged`, archivos modificados marcados para ser incluidos en el próximo commit.
- `commited`, datos guardados de forma segura en la base de datos local.

El flujo de trabajo básico en git es algo así:

1. Se modifican archivos en el área de trabajo (`working tree`).
2. Se seleccionan los cambios que van a ser parte del próximo commit, agregando esos cambios al área de preparación (`staging area`).
3. Se realiza un commit, lo cual toma los archivos en el área de preparación y los guarda como una "instantanea", de fomra permanente en el directorio git (`git directory`).

![Estados y áreas](./img/git_areas.png)

## Comandos

### Iniciación

- `init` Inicializa un repositorio en el directorio actual.
- `clone` Clona un repositorio a un directorio local.

### Flujo de trabajo

- `status` Muestra el estado del repositorio.
- `add` Agrega cambios al área de staging.
- `stash` Guarda cambios de forma provicional.
- `commit` Realiza un commit a la base de datos local.
- `clean` Remueve archivos no traqueados del directorio de trabajo.

### Ramas

- `branch` Lista, crea o elimina ramas.
- `checkout` Cambia de rama o vuelve a un estado anterior.
- `merge` Une dos o más historias en una.
- `rebase` Reaplica commits a la cabeza de otra rama.

### Remoto

- `remote`
- `fetch`
- `push`
- `pull`

## Configuración de usuario

`git config --global user.name "nombre usuario"`
`git config --global user.email "usuario@mail.com"`

## Enlaces

- [documentación oficial](https://git-scm.com/doc)
- [libro](https://git-scm.com/book/en/v2)
- [guía simple](http://rogerdudler.github.io/git-guide/)
