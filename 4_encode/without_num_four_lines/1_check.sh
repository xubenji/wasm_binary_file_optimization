#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-03 13:46:09
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-03 14:20:59
 # @FilePath: /wasm-binary-size-study/4_encode/1_check.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

#shell脚本接收一个参数作为文件名，读取这个文件，将 | 后的一列内容读取出来保存在新文件中

if [ $# -ne 1 ]; then
  echo "Usage: $0 filename"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "File not found: $1"
  exit 1
fi

output_file="t1_${1%.*}_column2.txt"

while IFS='|' read -r col1 col2 col3; do
  echo "$col2" >> "$output_file"
done < "$1"
