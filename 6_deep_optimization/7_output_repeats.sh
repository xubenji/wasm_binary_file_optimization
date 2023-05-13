#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-17 02:14:16
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 13:07:58
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/all.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查文件是否存在
if [ ! -f "$1" ]; then
  echo "文件 $1 不存在"
  exit 1
fi
rm -rf bzip2.size.output

i=0
times=20

# 读取文件的第一行第一列
while read -r line; do
    echo "$col1"
    repeats=`bash repeats.sh bzip2.opcode $col1`
    echo "$col1 $repeats" >> bzip2.size.repeats
    bash size.sh bzip2.size.repeats
    
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi

done < "$1"
