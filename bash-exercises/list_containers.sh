#!/bin/bash
listar_contenedores(){
contenedores=$(docker ps)
for i in "${contenedores[@]}";do
	echo "está activo $i"
done
}
listar_contenedores

