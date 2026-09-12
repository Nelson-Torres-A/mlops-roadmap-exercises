#!/bin/bash
uso=$( df / | awk 'NR==2{print $2}')
disponible=$( df / | awk 'NR==2{print $3}')
if [[ $((uso*100/disponible)) -ge 80 ]];then
	echo "ALERTA"
	rm -rf /tmp/*
fi
