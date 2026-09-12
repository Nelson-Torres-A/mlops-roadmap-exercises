#!/bin/bash
if [ -z $1 ]; then
	echo "Uso: ./check_args.sh archivo"
elif [[ "$1" != *.txt ]]; then 
	echo "Error: "$1" no es un archivo"
elif [ ! -e "$1" ]; then 
	echo "Error: "$1" no existe"
else
	ls -lh . | awk -v nombre="$1" '$9 == nombre {print "tamano: "  $5}'
	lineas=$(wc -l "$1" | awk '{print $1}')
	echo "nombre: "$1""
	echo "lineas: "$lineas""
fi
