#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-17 12:37:31
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 12:49:39
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/size.sh
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

# 逐行读取文件
while read -r line; do
    # 提取第一列字符串和第二列数字
    col1=$(echo "$line" | awk '{print $1}')
    col2=$(echo "$line" | awk '{print $2}')

    # 计算字符串长度，减去2，然后乘以第二列数字得到变量size
    length=$(echo -n "$col1" | wc -c)
    length=$((length - 2))
    size=$((length * col2))
    
    # 输出第一列字符串和变量size
    echo "$col1 $size"
done < "$1"
