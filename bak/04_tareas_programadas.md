# Tareas programadas

## Cron

Es un "demonio", este programa esta siempre ejecutándose, el mismo busca tareas a realizar cada minuto en el archivo crontab.

### crontab

`crontab [ -u user ] { -l | -r [ -i ] | -e }`

Pertenece al nombre del archivo donde se guardan las tareas programadas, se utiliza con las siguientes opciones:

- -l muestra el archivo
- -r elimina el archivo
- -e permite al usuario editar el archivo crontab

```sh
* * * * * [comando a ejecutar]
```

Dejando el "*" equivale a todos los valores de ese lugar (ejemplo * en hs equivale a todas las horas)

- Min
- Hs
- DiaDelMes  
- Mes  
- DiaDeLaSemana

### Ejemplos

```sh
0 5 * * 0 rsync -zvr /home/tecnologo/Desktop/carpeta /home/tecnologo/Desktop/respaldo
```

A las 5 a.m. todos los domingos sincroniza los elementos en carpeta en el destino respaldo. Esto en windows se puede encontrar como el administrador de tareas.

```sh
30 08 * * 5,6,7             [comando a ejecutar]
30 08 * * 5-7               [comando a ejecutar]
```

Tareas que se ejecutan todos los días a las 08:30 de viernes a sábados.

## Enlaces

[crontab.guru](https://crontab.guru/)