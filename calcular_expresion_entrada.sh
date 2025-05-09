#!/bin/bash

while read linea 
do
x=$(echo $linea | cut -d "," -f 1)
y=$(echo $linea | cut -d "," -f 2)
z=$(echo $linea | cut -d "," -f 3)
if [ "$linea" == "" ]; then
	echo "saliendo"
	exit	
else
	let a=$((3*$y-2))
	let b=$((2*$x+$z))
	let c=$(($a+$b))
	let d=$(($x+1))
	let f=$(($c/$d))
	echo $a $b $c $d
	echo "las variables son: x="$x" y= "$y" z= "$z""
	echo "y el resultado es F= "$f""
fi
done < entrada.txt