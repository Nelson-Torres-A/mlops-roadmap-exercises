#!/bin/bash
carpetas=("/home/javi3/scripts/3")
for carpetas in "${carpetas[@]}"
do
	tar -czf "backup_${carpetas##*/}_$(date +%Y-%m-%d).tar.gz" $carpetas
	echo "backup de $carpetas creado"
done
