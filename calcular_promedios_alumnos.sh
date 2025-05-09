#!/bin/bash

#Dado el archivo alumnos donde en cada linea tiene nombre,  
#y notas de parciales separados por coma "," sin espacios.
#Hacer un script que me calcule el promedio de los 3 parciales, dejar lo 
#calculado en el archivo Promedios, con este formato.
#
#Promedio de Juan = 5
#Promedio de Luis = 6
#
#En el archivo "prom-mas-alto" dejar el alumno con promedio más alto.
#En el arcihvo "prom-mas-bajo" dejar el alumno con promedio más bajo.

#nombre,X,X,X

mayor_prom=0
menor_prom=0

cat alumnos | while read line; do
    #nota1=$(cut -d "," -f2 $line)
    #nota2=$(cut -d "," -f3 $line)
    #nota3=$(cut -d "," -f4 $line)
    let promedio=($(cut -d "," -f2 $line)+$(cut -d "," -f3 $line)+(cut -d "," -f4 $line))/3
    if [[$promedio -lt $menor_prom]]; then
        menor_prom=$promedio
        nombremenor=$(cut -d "," -f1 $line)
    fi
    if [[$promedio -gt $mayor_prom]]; then
        mayor_prom=$promedio
        nombremayor=$(cut -d "," -f1 $line)
    fi
    echo "Promedio de $(cut -d "," -f1 $line) = $promedio" >> Promedios
done

echo "Promedio de $nombremenor = $menor_prom" > prom-mas-bajo
echo "Promedio de $nombremayor = $mayor_prom" > prom-mas-alto