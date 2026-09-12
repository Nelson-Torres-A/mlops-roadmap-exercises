#!/bin/bash
info=$(grep -w "INFO" $1)
count_info=$(wc -l <<< "$info")
error=$(grep -w "ERROR" $1)
count_error=$(wc -l <<< "$error")
warning=$(grep -w "WARNING" $1)
count_warning=$(wc -l <<< "$warning")
echo "$count_info"
echo "INFO: $info"
echo "$count_error"
echo "ERROR: $error"
echo "$count_warning"
echo "WARNINGS: $warning"

