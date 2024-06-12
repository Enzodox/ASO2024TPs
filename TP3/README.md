1)  A_ Con respecto al tiempo de ejecucion se nota una variacion de 1 segundo aproximadamente entre el archivo conhilos.py (Tiempo transcurrido: 4.01558 segundos) y sinhilos.py (Tiempo transcurrido: 5.16804 segundos); 
es predecible luego de varias ejecucciones determinando un promedio.

B_ No, iguales no son, varian en milesimas de segundo(ms).

C_ Tanto el comentado como el no comentado provocan race conditions, esto es debido ambos usan una variable global llamada acumulador (Aqui, se encuentra la zona critica, ya que ambos estan compitiendo por el "acumulador") sucede al usar 2 hilos sin ningun control.

2) C) a_
```
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void comer_hamburguesa(voidtid)
{
    while (1 == 1)
    { 
        while (turno != (int) tid);
        // INICIO DE LA ZONA CRÍTICA
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--; // me como una hamburguesa
        }
        else
        {
            printf("SE TERMINARON LAS HAMBURGUESAS  \n");
        turno = (turno + 1) % NUMBER_OF_THREADS;
            pthread_exit(NULL); // forzar terminacion del hilo
        }
        // SALIDA DE LA ZONA CRÍTICA
turno = (turno + 1) % NUMBER_OF_THREADS;
    }
}

int main(int argc, char argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, i, ret;
    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void)i);
        if (status != 0)
        {
            printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
            exit(-1);
        }
    }

    for (i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
    }
    pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
```
C) b_ ![Comensal A](https://github.com/Enzodox/ASO2024TPs/assets/96905062/3aea8928-321d-444b-b93c-6f354bcf2311)


