#!/bin/bash

for file in $(find "$1" -name "*.dump")
do
    bash check_wasm.sh "$file" > "${file%.dump}.dump.filter"
done


