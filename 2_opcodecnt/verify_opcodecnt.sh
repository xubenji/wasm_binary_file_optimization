#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename=$1
lines=0
excluded_lines_count=0
excluded_lines=""
localget_lines_count=0
i32add_lines=""

while read line; do
  if [[ $line == *"func["* || $line == *"unreachable"* ]]; then
    ((excluded_lines_count++))
    excluded_lines+="$excluded_lines_count: $line\n"
  else
    if [[ $line == *"local.get"* ]]; then
      ((localget_lines_count++))
    fi
    if [[ $line == *"$2"* ]]; then
      i32add_lines+="$line\n"
    fi
    ((lines++))
  fi
done < "$filename"

echo -e "The file $filename has $lines lines (excluding lines containing 'func[' and 'unreachable'). The following $excluded_lines_count lines were excluded:\n$excluded_lines"
echo "The file $filename has $localget_lines_count lines containing 'local.get'."
echo -e "The following lines contain 'i32.add':\n$i32add_lines"
