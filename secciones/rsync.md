# rsync

Este comando sincroniza tanto directorios como archivos de un lugar a otro, el mismo tiene 2 parametros obligatorios para su utilización. [documentación](https://rsync.samba.org/)

```s
rsync ruta/directorio/a/respaldar usuario@host:ruta/respaldo
```

- `-z` Activa la compresión del archivo respaldado.
- `-v` Activa el modo verbose, esto significa que el comando documentara el respaldo.
- `-r` Activa la recursividad que sera usada para que el comando entre dentro de los directorios y respalde, de no ser asi solo respaldara el primer directorio.
- `-a` La opción -a es una combinación de banderas. Significa "archive" y sincroniza de forma recursiva preservando links simbólicos, archivos especiales, modificaciones de tiempo, grupo, propietario y permisos.
- `-n` Corre una simulación `--dry-run` que se puede utilizar para conocer sin riesgos el resultado de utilizar el comando.
- `--exclude-from=archivo` Excluye los archivos o directorios que se establezcan en el archivo pasado.
