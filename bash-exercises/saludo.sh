#!/bin/bash
read -p "¿Como te llamas?" nombre
if [ -z "$nombre" ]; then
	echo "no escribiste nada"
else 
	echo "hola, $nombre"
fi

for i in 1 2 3; do
	echo "Repeticion número $i"
done

