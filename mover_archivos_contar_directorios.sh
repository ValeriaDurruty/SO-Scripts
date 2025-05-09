#!/bin/bash

#Hacer un script que recorra solo el primer nivel del directorio 
#repositorio, el cual debe ser pasado por parametro, y haga 
#lo siguiente:
#
#1) Mueva todos los archivos .doc al directorio doc (previo crearlo)
#2) Mueva todos los archivos .xls al directorio excel (previo crearlo)
#3) Contabilizar los .doc movidos
#4) Contabilizar los .xls movidos
#5) Contabilizar los directorios encontrados
#6) Dejar todos los contadores en el archivo resultado

if [[ $# -ne 1 ]]; then
    echo "Debe pasar un parametro."
    exit
fi

if [[ ! -d $1 ]]; then
    echo "El parametro debe ser un directorio."
    exit
fi

mkdir doc
find $1 -type f -name "*.doc" -exec mv {} doc \;
mkdir excel
find $1 -type f -name "*.xls" -exec mv {} excel \;

cant_doc=$(ls -a doc | wc -l)
cant_xls=$(ls -a xls | wc -l)

cant_dir=0
for i in $1/*; do
    if [[ -d $i ]]; then
        let cant_dir=cant_dir+1
    fi
done

echo "Cant. archivos .doc movidos = $cant_doc" > resultado
echo "Cant. archivos .xls movidos = $cant_xls" >> resultado
echo "Cant. directorios encontrados = $cant_dir" >> resultado