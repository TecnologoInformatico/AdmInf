# bash scripting

Realizar un script que agregue un nuevo virtualhost en apache.

El script deberá por lo menos recibir un parametro que será el nombre del archivo de configuración, así como el `ServerName`.

Debe cumplir los siguientes requisitos:

1. Crear el archivo de configuración en el directorio que corresponda.
2. Crear el directorio `RootDocument` en caso de no existir.
3. Agregar una entrada en el archivo `hosts`.
4. Activar el virtualhost.
5. Reiniciar el servidor apache.

## Validaciones

- [ ] No debe existir otro archivo de configuración con el mismo nombre.
- [ ] Se debe pasar un nombre válido para el sitio.

Se debe retornar un código de salida adecuado en caso de error o éxito.

## Extra

Para confirmar que el script fue exitoso, se debe crear un archivo de test en el virtualhost antes creado y mediante curl solicitarlo para poder validar la instalación. posteriormente eliminar el archivo.

Se desea contar con una opción de ayuda `--help` o `-h`, que explique el uso del script.
