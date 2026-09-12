#!/bin/bash
a=1
b=1
if [[ $a -ne 1 && $b -eq 0 ]]; then
	echo "cumple con los requisitos"
fi
read -p "elige una opción (1/2/3): " option
case $option in
	1) echo "Elegiste 1";;
	2) echo "Elegiste 2";;
	3) echo "Elegiste 3";;
	*) echo "Opción no válida";;
esac
