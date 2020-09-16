# rsync

Este comando sincroniza tanto directorios como archivos de un lugar a otro, el mismo tiene 2 parametros obligatorios para su utilización. [documentación](https://rsync.samba.org/)

```s
rsync ruta/directorio/a/respaldar usuario@host:ruta/respaldo
```

Una estrategia frecuentemente utilizada al momento de mantener un backup es mantener uno o más directorios en sincronización. En los sistemas tipo UNIX la herramienta de preferencia para esta tarea es `rsync`.

- `-z` Activa la compresión del archivo respaldado.
- `-v` Activa el modo verbose, esto significa que el comando documentara el respaldo.
- `-r` Activa la recursividad que sera usada para que el comando entre dentro de los directorios y respalde, de no ser asi solo respaldara el primer directorio.
- `-a` La opción -a es una combinación de banderas. Significa "archive" y sincroniza de forma recursiva preservando links simbólicos, archivos especiales, modificaciones de tiempo, grupo, propietario y permisos.
- `-n` Corre una simulación `--dry-run` que se puede utilizar para conocer sin riesgos el resultado de utilizar el comando.
- `--exclude-from=archivo` Excluye los archivos o directorios que se establezcan en el archivo pasado.

## --itemize-changes

Entendiendo la salida de `rsync --itemize-changes`

Como es imaginable, la opción `--delete` puede ser muy destructiva si no se es cuidadoso. Para prevenir borrar archivos por equivocación es útil la opción `--itemize-change` junto con `--dry-run`, la primer opción nos detallará los cambios a incluír, mientras que la segunda no realizará ningún cambio, sino que servirá como un simulacro.

La salida se verá como algo así:

```pre
.d..t..g... ./
.f...p.g... teorico.pdf
.f.....g... md5sum-2020-09-15.txt
.f...p.g... 07_compresion.md
.d.....g... .metadata/
.f...p.g... .metadata/.lock
.f...p.g... .metadata/.log
.f...p.g... .metadata/version.ini
>f+++++++++ Parameter_Usage.txt
```

Donde el primer campo de cada linea indica lo que rsync haría con cada archivo.

[Andrea Francia](http://andreafrancia.it) escribió este pequeño esquema el cual sirve de ayuda para entender el formato de la salida de `--itemize-change`.

```pre
YXcstpoguax  path/to/file
|||||||||||
`----------- the type of update being done::
 ||||||||||   <: file is being transferred to the remote host (sent).
 ||||||||||   >: file is being transferred to the local host (received).
 ||||||||||   c: local change/creation for the item, such as:
 ||||||||||      - the creation of a directory
 ||||||||||      - the changing of a symlink,
 ||||||||||      - etc.
 ||||||||||   h: the item is a hard link to another item (requires --hard-links).
 ||||||||||   .: the item is not being updated (though it might have attributes that are being modified).
 ||||||||||   *: means that the rest of the itemized-output area contains a message (e.g. "deleting").
 ||||||||||
 `---------- the file type:
  |||||||||   f for a file,
  |||||||||   d for a directory,
  |||||||||   L for a symlink,
  |||||||||   D for a device,
  |||||||||   S for a special file (e.g. named sockets and fifos).
  |||||||||
  `--------- c: different checksum (for regular files)
   ||||||||     changed value (for symlink, device, and special file)
   `-------- s: Size is different
    `------- t: Modification time is different
     `------ p: Permission are different
      `----- o: Owner is different
       `---- g: Group is different
        `--- u: The u slot is reserved for future use.
         `-- a: The ACL information changed
```

Este esquema esta basado en el [manual de rsync](https://www.samba.org/ftp/rsync/rsync.html).

## Enlaces

- [www.computerhope.com | rsync](https://www.computerhope.com/unix/rsync.htm)
- [understanding --itemize-changes](https://web.archive.org/web/20160904174444/http://andreafrancia.it/2010/03/understanding-the-output-of-rsync-itemize-changes.html)
