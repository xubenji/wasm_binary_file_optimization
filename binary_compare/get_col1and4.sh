###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-02-20 13:45:41
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-02-20 14:56:48
 # @FilePath: /wasm-binary-size-study/binary_compare/get_col1and4.sh
 # @Description: 从文件中读取第一二三列信息，并写入对应文件，这个脚本只接收一个文件作为参数。
 # 使用方法
 # bash get_col1and4.sh filename 
### 
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

