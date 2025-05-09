!/bin/bash
if [ $# -ne 1 ]; then
    echo "debe ingresar un parametro"
    exit
fi
if  [ ! -d $1 ]; then
    echo "el parametro debe ser un directorio"
    exit
fi
    find $1 -maxdepth 1 -executable -type f | cut -d "/" -f5 >> exec
    find $1 -maxdepth 1 ! -executable -type f | cut -d "/" -f5 >> noexec
    find $1 -maxdepth 1 -name "*.doc" -type f | cut -d "/" -f5 >> doc

totalexec=$(cat exec | wc -l)
totalnoexec=$(cat noexec | wc -l)
totaldoc=$(cat doc | wc -l)
let total=($totalexec + $totalnoexec + $totaldoc)
echo "Total de scripts ejecutables: $totalexec" >> totales
echo "Total de scripts no ejecutables: $totalnoexec" >> totales
echo "Total de archivos de documentos: $totaldoc" >> totales
echo "Total general de archivos procesados: $total" >> totales
cat totales