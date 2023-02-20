#!/bin/bash

# Read the file content
file_content=$(cat $1)

# Extract the Size, Name and Idx column
R=$(echo "$file_content" | awk '/^[ ]+[0-9]+/ {print $1,$2,$3}')

printf "%-10s %-20s %-10s\n" "Idx" "Name" "Size"
while read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    name=$(echo "$line" | awk '{print $2}')
    idx=$(echo "$line" | awk '{print $3}')
    printf "%-10s %-20s %-10s\n" "$size" "$name" "$idx"
done <<< "$R"

