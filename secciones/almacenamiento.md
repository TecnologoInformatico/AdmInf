# Almacenamiento

### Listar unidades

`lsblk` lista información sobre los dispositivos de bloques.

### Montar y desmontar

Para montar una partición:

```s
sudo mount -t vfat /dev/sda6 /mnt/
```

Para desmontar una partición:

```s
sudo umount /dev/sda6
```

donde `/dev/sda6` es la partición a desmontar o también se puede utilizar el path donde está montado.

Para montar automáticamente crear un registro en `/etc/fstab`.

### Listar particiones

`sudo fdisk -l`

### Formatear Disco

```bash
sudo mkfs.ntfs -L etiqueta /dev/sda6
```

Ejemplo formato en NTFS de la partición `/dev/sda6` con la etiqueta `etiqueta`

### Administrar espacio

`df` & `du`

### dd

`lsblk` para listar los block devices.

`mkfs.vfat -I /dev/sdb # Formatear el USB`

`sudo dd if=/path/to/isofile of=/dev/sdb status=progress`

`sudo dd bs=4M if=software/neon-user-20200917-0948.iso of=/dev/sdc conv=fdatasync status=progress`

## Enlaces

- [/etc/fstab](https://www.redhat.com/sysadmin/etc-fstab)
