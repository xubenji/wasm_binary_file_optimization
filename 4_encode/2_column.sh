#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-03 13:48:51
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-03 13:48:56
 # @FilePath: /wasm-binary-size-study/4_encode/2_column.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

if [ $# -ne 1 ]; then
  echo "Usage: $0 filename"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "File not found: $1"
  exit 1
fi

output_file="${1%.*}_column1.txt"

awk 'NR>=6 {print $1}' "$1" > "$output_file"
