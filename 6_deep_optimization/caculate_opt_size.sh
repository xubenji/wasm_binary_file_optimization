#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-17 01:06:37
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 01:55:27
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/1_caculate_optimizate_size.sh
 # @Description: 
### 

# 检查参数是否存在
if [ $# -ne 1 ]; then
    echo "使用方法: $0 <文件名>"
    exit 1
fi

# 检查文件是否存在
if [ ! -f "$1" ]; then
    echo "错误: 文件 $1 不存在"
    exit 2
fi

i=0
times=60
# 读取文件第一列并移除其中的"-"字符
while read -r line; do
    col1=$(echo "$line" | awk '{print $1}')
    col1_no_dash=$(echo "$col1" | tr -d '-')
    input_string="$col1_no_dash"
    length=${#input_string}
    opt_size=$((length-2))
    #echo $opt_size
    repeats=`bash repeats.sh bzip2.opcode $col1_no_dash`
    #echo $repeats
    all_opt_size=$((opt_size*repeats))
    echo "$col1_no_dash $all_opt_size" 
    
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
done < "$1"
