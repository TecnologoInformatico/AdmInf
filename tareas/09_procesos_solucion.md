# Procesos

1. Ejecutar el programa `xlogo`.

		xlogo

2. Interrumpir el programa.

		Ctrl + C

3. Volver a ejecutar el programa pero en segundo plano (background).

		xlogo&

4. Obtenga el `PID` del programa que acaba de ejecutar.

		ps | grep xlogo	
	
	(ps lista los procesos, con '|' redirigo al comando 'grep' y este busca la palabra xlogo devolviendo la linea donde aparezca)

5. Traiga al frente el programa.

		fg %1
	
	(el 1 es porque es el numero de trabajo, esto se sabe ejecutando el comando `jobs`)

6. Pause el proceso y retornelo a a segundo plano.

		Ctrl + Z
		bg %1
