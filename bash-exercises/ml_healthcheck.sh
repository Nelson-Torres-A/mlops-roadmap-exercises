#!/bin/bash
lineas=$(wc -l $1 | awk '{print $1}')
linea=1
inicio=$(date +%s%3N)
intentos=1
salida=0
printf "%-16s %-9s %-11s %-8s\n" "SERVICIO" "ESTADO" "LATENCIA" "INTENTOS"
until [ "$linea" -eq $((lineas + 1)) ]; do
	servicio=$(awk 	-F':' -v linea=$linea 'NR==linea {print $1}' $1)
	host=$(awk -F':' -v linea=$linea 'NR==linea {print $2}' $1)
	puerto=$(awk -F':' -v linea=$linea 'NR==linea {print $3}' $1)

	if nc -zm 2 $host $puerto > /dev/null 2>&1; then
		estado="UP"
		fin=$(date +%s%3N)
		tiempo=$((fin - inicio))
	else
		estado="DOWN"
		while [ "$intentos" -le 3 ]; do 
			if nc -zm 2 $host $puerto > /dev/null 2>&1; then
				estado="UP"
				fin=$(date +%s%3N)
				tiempo=$(fin-inicio)
				break
			else
				sleep 1
				((intentos++))
			fi
		done
		((intentos--))
		if [[ "$estado" == "DOWN" ]];then
			salida=1
		fi
	fi
	((linea++))
	printf "%-16s %-9s %-11s %-8s\n" "$servicio" "$estado" "$tiempo" "$intentos"
done
if (($salida==0));then
	exit 0
else
	exit 1
fi
