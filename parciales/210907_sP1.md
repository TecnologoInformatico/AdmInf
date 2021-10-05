# 210907_sP1

## mkgit

Realice un script con las siguientes funciones:

- `mkgit -d directorio [-t titulo]`
- `mkgit --help`

Se le pasará como argumento un directorio, en caso de no existir debe crearlo. En dicho directorio iniciará un nuevo repositorio git, creará un archivo README.md donde el título será el pasado en los argumentos o en caso de no haber sido pasado como un argumento el nombre del directorio.

- En caso de que el directorio exista y no esté vacío devolverá un código de error.
- En caso de que el directorio no exista y no se pueda crear deberá retornar otro código de error.
- En caso de no poder inicializar el repositorio o fallar el intento de commit también debe retornar un código de error correspondiente.
- Se debe proveer una ayuda la cual indique el modo de uso y los posibles códigos de error a ser retornados, está ayuda será accedida mediante la opción `--help` o al utilizar el comando de forma incorrecta.

El script debe poder ser ejecutado desde cualquier directorio del sistema de este modo.

## find .jpg

Renombrar dentro del directorio `~/wiki` todos los archivos regulares con extensión `.JPG` y `.jpeg` a `.jpg`.
Una vez renombrado los archivos listar los que superen los 3MB y realice una copia de estos al directorio `~/img`.

## Backup

Describa con argumentos como sería la implementación de un buen método para realizar un "backup" de:

1. Código fuente de una aplicación en desarrollo.
2. Una aplicación en producción.
3. El directorio home del usuario.
