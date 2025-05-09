#!/bin/bash

cp /etc/passwd .
cp /etc/group .
cp /etc/shadow .

if [[ ! $# -eq 1 ]]; then
    echo "no se establecio nombre de usuario"
    exit
fi

if [[ $(grep "$1" passwd | cut -d: -f1) == $1 ]]; then
    echo "useradd: El usuario '$1' ya existe."
    exit
fi

uid=$(tail -1 passwd | cut -d: -f3)
gid=$(tail -1 passwd | cut -d: -f4)

let uid+=1
let gid+=1

echo "A�adiendo el usuario '$1'..."
echo "A�adiendo el nuevo grupo '$1' ($gid) ..."
echo "A�adiendo el nuevo usuario '$1' ($uid) con grupo '$1' ..."
mkdir home
mkdir home/$1
echo "Creando el directorio personal '/home/$1' ..."
cp -r /etc/skel* /home/$1
echo "Copiando los ficheros desde '/etc/skel' ..."
echo "Nueva contrase�a: "
read cont
echo "Vuelva a escribir la nueva contrase�a: "
read contra
#chequeo que la contrase�a coincida
while [[ $cont != $contra ]]; do
    echo "las contrase�as deben coincidir "
    echo "Nueva contrase�a: "
    read cont
    echo "Vuelva a escribir la nueva contrase�a: "
    read contra
done
echo "passwd: contrase�a actualizada correctamente "
echo "Cambiando la informaci�n de usuario para $1 "
echo "Introduzca el nuevo valor, o presione INTRO para el predeterminado "
echo "<><------> Nombre completo []: "
read nomcom
echo "<><------>N�mero de habitaci�n []: "
read nrohab
echo "<><------>Tel�fono del trabajo []: "
read teltr
echo "<><------>Tel�fono de casa []: "
read telca
echo "<><------>Otro []: "
read ot
echo "¿Es correcta la informaci�n [S/n]"
read resp
while [[ $resp != "s" ]]; do
    echo "<---->Nombre completo []: "
    read nomcom
    echo "<---->N�mero de habitaci�n []: "
    read nrohab
    echo "<---->Tel�fono de trabajo []: "
    read teltr
    echo "<---->Tel�fono de casa []: "
    read telca
    echo "<---->Otro []: "
    read ot
    echo "<---->¿Es correcta la informaci�n?[S/n] "
    read resp
done

#guardo en el archivo passwd los datos del nuevo usuario creado
echo "$1:x:$uid:$gid:$nomcom:$nrohab:$teltr:$telca:$ot:/home/$1:/bin/bash" >> /documentos/practicas/tp2/passwd
#guardo el nuevo usuario y el grupo en el archivo grupo
echo "$1:x:$gid:" >> /documentos/practicas/tp2/group
#guardo la contrase�a en el archivo shadow  aunque no se como encriptarla
echo "$1:x:$cont::" >> /documentos/practicas/tp2/shadow



