# Shell scripting

## Practica

1. Crear un script que imprima `hola mundo`.
2. Modifique el script para que imprima `hola usuario`, siendo usuario un argumento y en caso de no pasarle argumentos usuario sea el usuario actual.
3. Imprimir la ubicación del script y el nombre del script.
4. Imprimir los argumentos que se le pasan al script en orden inverso.

## 🥾 Bootstrap

Se requiere un script que realice la creación de un ambiente Wordpress o Joomla.
Para ello es necesario:

1. [ ] Poder seleccionar la aplicación a instalar.
2. [ ] La versión del software debe ser la última estable disponible.
3. [ ] Se debe crear el virtualhost a utilizar, ServerName y DocumentRoot, activandolo.
4. [ ] De no cumplirse los requerimientos en el ambiente para la aplicación se debe abortar la operación con mensaje y código de error apropiado.
5. [ ] En caso de requerir autenticación no se debería ingresar la password/passphrase más de una vez.

La instalación la completa el usuario de forma manual desde el navegador.

## 🚀 Despliegue

Cree un script con el cual sea posible desplegar una aplicación a un servidor local o remoto. Los requerimientos son:

1. [ ] Mostrar los archivos que difieren del ambiente local del remoto.
2. [ ] Mover los archivos al directorio final o cancelar el procedimiento.
3. [ ] Ejecutar un postscript tras la transferencia de los archivos.
4. [ ] En caso de requerir autenticación no se debería ingresar la password/passphrase más de una vez.

## 🗃️ Backup

1. [ ] Comprimir el directorio especificado como `tar.gz` en un directorio de respaldo.
2. [ ] Guardar no más de x cantidad de archivos en el directorio de respaldo.
3. [ ] El directorio de respaldo y la cantidad pueden ser provistas y en caso de no ser así utilizar un valor por defecto.
4. [ ] Se debe borrar el archivo más viejo una vez que se alcance el limite.
5. [ ] Mantener un archivo de log.

## Enlaces

- [comparar contenido de directorios](https://www.techrepublic.com/blog/linux-and-open-source/how-to-compare-the-content-of-two-or-more-directories-automatically/)
- [notas de referencia](https://devhints.io/bash)
