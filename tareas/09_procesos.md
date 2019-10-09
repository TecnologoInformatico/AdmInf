# Procesos

1. Ejecutar el programa `xlogo`.
2. Interrumpir el programa.
3. Volver a ejecutar el programa pero en segundo plano (background).
4. Obtenga el `PID` del programa que acaba de ejecutar.
5. Traiga al frente el programa.
6. Pause el proceso y retornelo a a segundo plano.

1 name start proces 
xlogo
2 job "ver los procesos activos"
2.a kill -20 o -9 0 -15 %N 

-9 mata el proceso por el kernel sin guardar
-15 mata el proceso guardando los cambios
-20 no lo mata del todo y guarda los datos en buffer desde donde quedo

%N esto varia debido al numero de procesos

3. xlogo & ejecutar en segundo plano

4 ps aux | grep xlogo

5 fg %N -> trae al frente un proceso

6 bg &N -> esto permite lograr poner un proceso de fondo
