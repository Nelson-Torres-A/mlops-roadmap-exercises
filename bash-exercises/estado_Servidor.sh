#!/bin/bash
usuario=$(whoami)
fecha=$(date "+%d/%m/%Y %H:%M:%S")
espacio_disponible=$(df -h | awk '$1=="C:\\" {print $4}')
ram=$(free -h | awk 'NR==2 {print $4}')
echo "Usuario: "$usuario", Fecha: "$fecha", Espacio disponible:"$espacio_disponible" , ram: "$ram""
