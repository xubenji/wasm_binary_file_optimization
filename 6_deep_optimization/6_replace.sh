#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-09 17:05:57
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 13:59:40
 # @FilePath: /wasm-binary-size-study/5_optimization_formula/6_replace.sh
 # @Description: 脚本接收一个参数作为文件名，逐行读取这个文件的第一列数据，去掉其中所有-字符。逐行输出
### 




# 判断输入参数是否为空
if [ -z "$1" ] || [ -z "$2" ]
then
  echo "请提供两个文件名作为参数"
  exit 1
fi

# 判断文件是否存在
if [ ! -f "$1" ]
then
  echo "文件$1不存在"
  exit 1
fi

if [ ! -f "$2" ]
then
  echo "文件$2不存在"
  exit 1
fi

times=257
i=197

index=0

# 逐行读取文件的第一列数据，去掉其中所有-字符，并逐行输出
while true; do
#   # 使用cut命令提取第一列数据
#   col1=$(echo "$line" | cut -d " " -f 1)

#   # 使用tr命令去掉所有-字符
#   col1=$(echo "$col1" | tr -d '-')
# 读取文件的第一列第一行内容
    col1=$(awk 'NR==1 {print $1; exit}' "$2")

    index=$((index+1))
    echo -n "$index:    "
    hex=$(printf '%x' "$i")
    bash replace.sh $1 "$col1" "$hex"
    #echo $col1
    bash two_file_size.sh 2_sort.txt bzip2.opcode > temp
    bash 2_sort.sh temp temp1
    rm bzip2.size temp
    mv temp1 bzip2.size
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi

    


done 
