#!/bin/bash
if [ $# -eq 2]; then
	echo "ip local: $(hostname -I | awk '{print $1}')"
	if ping -c 4 -q "$1"; then
		echo "Gateway: $1"
		echo "Gateway status: OK"
	else
		echo "Gateway: $1"
		echo "Gateway status: FAILED"
	fi
	if ping -c 4 -q 8.8.8.8; then
		echo "Internet: OK "
	else
		echo "Internet: FAILED"
	fi
	if nc -vz "$1" "$2"; then
		echo "Port "$2": OPEN "
	else
		echo "Port "$2": CLOSE "
	fi
else
	echo "no ingresaste los dos argumentos, ip y puerto"

