#!/bin/bash
my_function(){
	read -p "Nombre del archivo" archivo
	chmod +x $archivo
	ls -l $archivo

}
my_function
