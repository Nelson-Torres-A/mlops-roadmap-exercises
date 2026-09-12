#!/bin/bash
error_500=$(grep -wc "500" "$1")
error_200=$(grep -wc "200" "$1")
error_404=$(grep -wc "404" "$1")
if [ "$error_500" -gt 2 ]; then
	echo "ALERTA: posible caída del servicio" >> alertas.txt
else
	echo "Todo en orden: $error_500 errores 500 detectados" >> alertas.txt
fi
resumen=$(cat alertas.txt)
cat <<< "$resumen"


