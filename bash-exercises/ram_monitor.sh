#!/bin/bash
while true;
do
	ram=$(free -m | awk 'NR==2{print $3}')
	div=$(free -m | awk 'NR==2{print $2}')
	usada=$(($ram*100/$div))
		if [ $usada -ge 80 ]; then
			echo "cuidado"
		fi
	sleep 5
done
