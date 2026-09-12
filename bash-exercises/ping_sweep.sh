#!/bin/bash
ips=("8.8.8.8" "8.8.4.4" "1.1.1.1" "127.0.0.1" "192.145.1.1")
for i in "${ips[@]}"
do
	if ping -c 1 $i &> /dev/null ;then
		echo " $i activa"
	else
		echo " $i no activa"
	fi

done
