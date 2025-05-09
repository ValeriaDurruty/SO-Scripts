#!/bin/bash

esNum='^-?[0-9]?$ '

if [[ $# - ne 1 ]]; then
    echo "Debe pasar un parametro."
    exit
fi

if ! [[ $1 =~ $esNum ]]; then
    echo "El parametro debe ser un numero entero."
    exit
fi

resp=s

while [[ resp == s ]]; do
    echo "Ingrese un numero entero para generar su tabla de multiplicar."
    read nro
    while ! [[ $nro =~ $esNum ]]; do
        echo "Debe ingresar un numero entero."
        echo "Ingrese un numero entero para generar su tabla de multiplicar."
        read nro
    done

    echo "Generando tabla del $nro.."
    echo "Tabla del $nro" > tabla$nro
    echo "" >> tabla$nro
    for i in {0..$1}; do
        let resul=nro*i
        echo "$nro x $i = $resul" >> tabla$nro
    done
    echo "Tabla del $nro generada exitosamente en archivo tabla$nro."
    echo "Desea generar otra tabla? s/n"
    read resp
    clear
done