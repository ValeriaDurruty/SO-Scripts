#!/bin/bash

#dado el directorio directorio1 que debe ser pasado por parametro, calcular la cantidad de lineas que tiene cada uno de los archivos ubicados en 
#el primer directorio.
#Dejar en el archivo de nombre informe el nombre del mismo con su correspondiente cantidad de lineas, y al final del mismo dejar la cantidad
#de archivos procesados.
#Chequear que se pase el parametro y que el mismo sea un directorio.

if [ ! $# == 1 ]; then 
	echo "Ingrese un parámetro por favor."
	exit
fi 

if ! test -d $1; then
	echo "Ingrese un directorio por favor."
	exit
fi
cont=0
for i in $1/*; do
	if test -f $i; then
		guarda=$(cat $i | wc -l)
        
		echo "El directorio de nombre $i, posee la siguiente cantidad de lines : $guarda" >> informe.txt 
		((cont++))
 	fi
done

echo "Fueron procesados $cont archivos" >> informe.txt