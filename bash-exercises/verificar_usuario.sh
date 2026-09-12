#!/bin/bash
read -p "Usuario: " usuario
if [ -z "$usuario" ]; then 
	echo "no ingreso su usuario"
	exit 1
else
	echo "hola, $usuario"
fi
if grep -qw "$usuario" /etc/passwd ; then
	awk -F: -v nombre="$usuario" '$1==nombre {print $3, $7}' /etc/passwd
else
	echo "el usuario no existe"
fi
