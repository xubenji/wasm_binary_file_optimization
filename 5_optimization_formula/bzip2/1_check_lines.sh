#!/bin/bash
#脚本接收一个参数作为文件名，逐行读取文件内容，将本行的 :  和 | 之间的内容提取出来，去掉空格以后合并逐行写入新文件

if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

input_file="$1"
output_file="1_check_lines_output.txt"
times=1000
i=0
line_number=0

while read line; do
  ((line_number++))
  if [ "$line_number" -lt 6 ]; then
    continue
  fi
  if [[ "$line" == *"func["* ]]; then
    continue
  fi
  text=$(echo "$line" | awk -F ':|\\|' '{print $2}' | tr -d '[:space:]')
  suffix=$(echo "$line" | awk -F '|' '{print $2}' | tr -d '[:space:]')
  echo "$text $suffix" >> "$output_file"
#   i=$((i+1))
#     if [ $i -eq $times ]
#     then
#         break
#     fi
done < "$input_file"

