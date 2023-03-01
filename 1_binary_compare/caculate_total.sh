#!/bin/bash
cd $1
for file in *.decimal; do
    total=0
    while read line; do
        col3=$(echo "$line" | awk '{print $3}')
        if [[ "$col3" =~ ^[0-9]+$ ]]; then
            total=$((total + col3))
        fi
    done < "$file"
    echo "$total" >> "${file%.decimal}.decimal.total"
done

