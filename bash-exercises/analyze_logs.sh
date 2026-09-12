#!/bin/bash
texto=$(<"$1")
echo "$texto"
lineas=$(wc -l < "$1")
contador=1
info=0
error=0
warning=0

while [ "$contador" != "$((lineas + 1))" ]; do
        linea=$(awk -v contador="$contador" 'NR==contador {print $0}' "$1")
        if grep -qw "INFO" <<< "$linea"; then
                ((info++))
        elif grep -qw "WARNING" <<< "$linea"; then
                ((warning++))
        elif grep -qw "ERROR" <<< "$linea"; then
                ((error++))
        fi
        ((contador++))
done

echo "$contador"
echo "INFO: $info"
echo "WARNING: $warning"
echo "ERROR: $error"
