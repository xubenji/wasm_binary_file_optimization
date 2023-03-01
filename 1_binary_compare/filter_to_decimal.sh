#!/bin/bash

for file in $(find "$1" -name "*.filter")
do
	size_in_decimal=`awk '{print $1, $2, strtonum("0x" $3)}' "$file"`
        awk '{print $1, $2, strtonum("0x" $3)}' "$file" > "${file%.filter}.filter.decimal"	
done
