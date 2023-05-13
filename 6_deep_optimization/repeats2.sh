#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-17 12:56:29
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 12:56:36
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/repeats2.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查参数个数是否为1
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# 检查文件是否存在
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# 逐行读取文件并打印
while read -r line; do
    echo "$line"
done < "$1"
