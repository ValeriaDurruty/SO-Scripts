#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Debe pasar un parametro."
    exit
fi

if [[ ! $1 -ef /etc/passwd ]]; then
    echo "El parametro no es correcto, debe pasar el archivo passwd."
    exit
fi

#generar un archivo "usu1" con los usuarios que comiencen con 
#"so1", guardar nombre de usuario y shell. En la última línea 
#guardar el total de usuarios.
grep ˆso1 $1 -exec cut -d ":" -f1 {} -exec cut -d ":" -f7 {} \; > usu1
total1=$(wc -l usu1)
echo "Total de usuarios: $total1" >> usu1

#generar un archivo "usu2" con los usuarios que comiencen con 
#so2 y guardar nombre de usuarios y UID correspondiente. En la última 
#línea guardar el total de usuarios.
grep ˆso2 $1 -exec cut -d ":" -f1 {} -exec cut -d ":" -f3 {} \; > usu2
total2=$(wc -l usu2)
echo "Total de usuarios: $total2" >> usu2

#generar un archivo "usu3" con los usuarios que comiencen con 
#so3 y guardar nombre de usuario y el GiD. En la última línea 
#guardar el total de usuarios.
grep ˆso3 $1 -exec cut -d ":" -f1 {} -exec cut -d ":" -f4 {} \; > usu3
total3=$(wc -l usu3)
echo "Total de usuarios: $total3" >> usu3

#generar un archivo "usu4" con los usuarios que comiencen con 
#so4 y guardar el nombre de usuarios y el home. En la última 
#guardar el total de usuarios.
grep ˆso4 $1 -exec cut -d ":" -f1 {} -exec cut -d ":" -f6 {} \; > usu4
total4=$(wc -l usu4)
echo "Total de usuarios: $totala" >> usu4

#contar el total general de usuarios y guardarlo en el archivo 
#"total general"
let total=total1+total2+total3+total4
echo "Total general de usuarios leídos = $total" > total_general