#!/bin/bash
contadorERROR=0
contadorINFO=0
contadorWARNING=0
mapfile -t lineas < $1
for elementos in "${lineas[@]}"
do
	if echo $elementos | grep -qw "ERROR"; then
		(( contadorERROR++ ))
	elif grep -qw "INFO" <<< "$elementos"; then
		(( contadorINFO++ ))
	elif grep -qw "WARNING" <<< "$elementos"; then
		(( contadorWARNING++ ))
	fi
done
if [[ contadorERROR -gt $2 ]]; then
                echo "ALERTA: se detectaron $contadorERROR errores en el log"
fi
echo "hay $contadorINFO info"
echo "hay $contadorWARNING warnings"
