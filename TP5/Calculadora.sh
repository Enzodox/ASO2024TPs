#!/bin/bash

echo "Bienvenido a la topo calc"

echo "Seleccione una opcion:"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. División"

read opcion

echo "Ingresa el primer número:"
read numero1
echo "Ingresa el segundo número:"
read numero2
case $opcion in
  1)
    resultado=$((numero1 + numero2))
    echo "Resultado: $resultado"
    ;;
  2)
    resultado=$((numero1 - numero2))
    echo "Resultado: $resultado"
    ;;
  3)
    resultado=$((numero1 * numero2))
    echo "Resultado: $resultado"
    ;;
  4)
    resultado=$((numero1 / numero2))
    echo "Resultado: $resultado"
    ;;
  *)
    echo "Intente de nuevo."
    ;;
esac