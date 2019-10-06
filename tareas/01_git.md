# Tarea git

1. Inicializar un repositorio en el directorio ~/repo/tarea02
2. Cree un archivo README.md y otro test.txt
3. En el readme ingrese un titulo y una lista con los miembros del equipo,
en el archivo `test.txt` ingrese un texto de prueba.
4. Agregue ambos archivos y realice un commit.
5. Cree una nueva rama `test` y muevase a ella.
6. Realice cambios al archivo test y agregue un subtitulo al readme
con el nombre del equipo.
7. Agregue todos los cambios realizados y realice un commit.
8. Verifique y estudie en que estado se encuentra el repositorio.
9. Muevase a la rama `master` y realice un merge con la rama `test`.
10. Cree un repositorio en un servidor remoto y establezcalo como `remote`.
11. *PC B* Clone el repositorio desde otro equipo o de no ser posible en otra carpeta.
12. *PC B* Cree una nueva rama `test2` y realice cambios en los archivos y luego actualice
la rama master con esos cambios.
13. *PC B* Agregue los cambios, realice un `commit` y un `push` al repositorio remoto.
14. Realice cambios en la rama `test` y luego actualice la rama master con esos cambios.
15. Intente hacer un `push`, baje los cambios y solucione los conflictos.
16. Realice un `fetch` y de ser necesario un `pull`.

## Procedimiento

a. Realice los pasos indicados y comente los comandos utilizados.
b. ¿en que estado se encuentra el repositorio en el paso 8?
c. ¿que sucedió en el paso 15 al intentar hacer el `push`?

1 git init

2 touch readme.md test.txt

3 nano readme.md
 (NOMBRES)

4 git add -A

5 git commit -m "primer commit"

6 git checkout -b (name branch)

7 git add -A

8 git status 

9 git chechkout master
 git merge Alex

10 git add remote remoto https://github.com/AlexZimmerBonjourAdrian/RepoClase.git
11 git clone https://github.com/AlexZimmerBonjourAdrian/RepoClase.git

12git checkout test 2
  no permite desplazarse si no se guardan los cambios
 
13 git commit 
