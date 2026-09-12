#!/bin/bash
until systemctl is-active docker &> /dev/null;do
	echo "docker no listo"
	sleep 5
done
echo "docker listo"

