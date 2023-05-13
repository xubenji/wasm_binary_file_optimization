#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-16 19:53:24
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 01:22:54
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/1_repeats.sh
 # @Description: shell脚本接收两个个参数，第一个参数作为文件名，然后读取这个文件，第二个参数是一个字符串，然后脚本的功能是在这个文件中查找字符串重复出现的次数
### 

# 检查参数的数量
if [ $# -ne 2 ]; then
  echo "Usage: $0 <filename> <search_string>"
  exit 1
fi

filename=$1
search_string=$2

# 检查文件是否存在
if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' not found."
  exit 1
fi

# 查找字符串重复出现的次数
count=$(grep -o -e "$search_string" "$filename" | wc -l)

# 输出结果
# echo "The string '$search_string' appears $count times in the file '$filename'"
echo $count

