1)  A_ Con respecto al tiempo de ejecucion se nota una variacion de 1 segundo aproximadamente entre el archivo conhilos.py (Tiempo transcurrido: 4.01558 segundos) y sinhilos.py (Tiempo transcurrido: 5.16804 segundos); 
es predecible luego de varias ejecucciones determinando un promedio.

B_ No, iguales no son, varian en milesimas de segundo(ms).

C_ No paso nada, intuyo que porque eran unicamente comentarios para ayuda de la persona que vaya a interpretar el codigo.

2) A_
```
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *comer_hamburguesa(void *tid)
{
	while (1 == 1)
	{ 
		pthread_mutex_lock(&mutex);

		if (cantidad_restante_hamburguesas > 0)
		{
			printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
			cantidad_restante_hamburguesas--;
		}
		else
		{
			printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
			pthread_mutex_unlock(&mutex);
			pthread_exit(NULL);
		}

		pthread_mutex_unlock(&mutex);
	}
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i, ret;
	for (int i = 0; i < NUMBER_OF_THREADS; i++)
	{
		printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
		status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
		if (status != 0)
		{
			printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
			exit(-1);
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++)
	{
		void *retval;
		ret = pthread_join(threads[i], &retval);
	}
	pthread_exit(NULL);
}
```
B_ 
