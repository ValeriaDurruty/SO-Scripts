#!/bin/bash

#Hacer un script que arme un menu y simule una calculadora, 
#donde pueda realizar operaciones de suma y resta.
#
#1) En el caso de la suma la cantidad de cifras a sumar pueden 
#ser infinitas.
#2) En el caso de la resta solamente ingresar cifras de Minuendo 
#y Sustraendo.

resp=s
while [[ resp == s ]]; do
echo "Calculadora"
echo "==========="
echo "1 - Suma"
echo "2 - Resta"
echo "0 - Salir"
echo "Ingrese la opción deseada."
read op
clear

if [[ op -eq 1 ]]; then
    echo "Ingrese el primer número a sumar."
    read nro1
    echo "Ingrese el segundo número a sumar."
    read nro2
    let suma=nro1+nro2
    echo "$nro1 + $nro2 = $suma"

elif [[ op -eq 2 ]]; then
    echo "Ingrese el minuendo."
    read minuendo
    echo "Ingrese el sustraendo."
    read sustraendo
    let resta=minuendo-sustraendo
    echo "$minuendo - $sustraendo = $resta"

elif [[ op -eq 0]]; then
    exit

else
    echo "Opción incorrecta. Intentelo nuevamente."
fi

done