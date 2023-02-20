#!/bin/bash

for file in $(find "$1" -name "*.dump")
do
    bash check.sh "$file" > "${file%.dump}.dump.filter"
done

