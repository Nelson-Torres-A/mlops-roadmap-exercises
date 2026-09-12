#!/bin/bash
servicio=$1
if systemctl is-active --quiet $servicio; then
	echo "está activo"
else
	echo "no está activo"
	systemctl start $servicio
fi
