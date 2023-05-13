#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-17 13:35:02
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 13:35:09
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/two_file_size.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查参数个数是否为2
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filename1> <filename2>"
    exit 1
fi

# 检查文件是否存在
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "Error: File '$2' not found."
    exit 1
fi

# 逐行读取第一个文件中的第一列字符串
while read -r line1; do
    col1=$(echo "$line1" | awk '{print $1}')

    # 计算字符串在第二个文件中出现的次数
    #count=$(grep -o -w -c "$col1" "$2")
    count=`bash repeats.sh $2 $col1`
    # 计算字符串长度，将长度减去2，再乘以出现的次数，将结果保存在变量size中
    length=$(echo -n "$col1" | wc -c)
    length=$((length - 2))
    size=$((length * count))

    # 打印字符串和变量size的值
    echo "$col1 $size"
done < "$1"
