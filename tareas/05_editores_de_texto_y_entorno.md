# Editores de texto y entorno

## vim

1. Verifique la versión que tiene instalada de `vi`.
2. Compruebe si tiene instalado `vim`, de lo contrario instalelo y cree un alias tal que al ejecutar `vi`, en realidad se ejecute `vim`.
3. Escriba un script simple

```sh
#!/bin/bash

echo 'HELLO WORLD!'
```

## Variables de entorno

Establesca el directorio `~/customPath/mi/super/secret/pathFolder` de tal modo que lo ingresado allí quede dentro del listado del `PATH`. Se puede establecer sólo para la sesión actual o dejar fijo, en este caso probar ambas formas, primero en la sesión y luego de manera fija.

1. Crear el directorio super secreto.
2. Agregar una entrada al PATH.
3. Probar que funcione, cree un link simbólico del script antes creado en el directorio super secreto con el nombre `path-test`, luego intente ejecutarlo desde un directorio cualquiera.
