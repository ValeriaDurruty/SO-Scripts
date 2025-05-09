#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Debe pasar un parametro."
    exit
fi

if [[ ! -d $1 ]]; then
    echo "El parametro debe ser un directorio."
    exit
fi

#genero un archivo de nombre "exec" solo con el nombre de los archivos
#scripts que tienen permiso de ejecución
find $1 -type f -name "*.sh" -executable -exec awk -F/ '{print $(NF)}' {} \; > exec

#genero un archivo de nombre "noexec" solo con el nombre de los archivos 
#scripts que no tienen permiso de ejecución
find $1 -type f -name "*.sh" ! -executable -exec awk -F/ '{print $(NF)}' {} \; > noexec

#genero un archivo de nombre "doc" solo con los nombres de los archivos 
#de documentos
find $1 -type f -name "*.doc" -exec awk -F/ '{print $(NF)}' {} \; > doc

#genero un archivo de reporte de nombre "Totales"
scriptsexe=$(wc -l exec)
scriptsnoexe=$(wc -l noexec)
doc=$(wc -l doc)
let total=scripsexe+scripsnoexe+doc
echo "Total de scripts ejecutables: $scriptsexe" > Totales
echo "Total de scripts no ejecutables: $scriptsnoexe" >> Totales
echo "Total de archivos de documentos: $doc" >> Totales
echo "Total general de archivos procesados: $total" >> Totales