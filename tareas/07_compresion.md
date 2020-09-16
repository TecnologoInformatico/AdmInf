# Empaquetado y Compresión

1. Clone el repositorio `https://github.com/picandocodigo/ci_js.git` en `~/repo/compresion`
2. realice un tar sin compresión del repositorio: `~/bak/repo_bak_01.tar`.
3. realice un tar con compresión del repositorio: `~/bak/repo_bak_02.tgz`.
4. Utilice el comando sftp para trasladar el repositorio en su estado original al host.
5. Realice el traslado por sftp, esta vez para los archivos dentro de bak (los archivos .tgz).
6. Extraiga el contenido de ambos archivos `tar`.
7. Investigue la herramienta `rsync`
8. Utilice `rsync` para crear un espejo de la carpeta `~/repo/compresion`
  en `~/bak/compresion`
9. Realice una modificación al archivo `~/repo/compresion/README.md` y vuelva realizar el paso 7.
10. Investigue como evitar que se sincronicen los archivos correspondientes a git.
