#!/bin/bash



R=""

while read line; do

  # 提取第一列和第四列的字符串
  column1=$(echo $line | awk '{print $1}')
  column4=$(echo $line | awk '{print $4}')

  # 保存到变量R中
  R="$column1 $column4"

  # 打印变量R
  echo $R

done < $1

echo $R
# printf "%-10s %-20s %-10s\n" "Idx" "Name" "Size"
# while read -r line; do
#     size=$(echo "$line" | awk '{print $4}')
    
#     name=$(echo "$line" | awk '{print $1}')
#     printf "%-10s %-20s \n" "$name" "$size" 
# done <<< "$R"





