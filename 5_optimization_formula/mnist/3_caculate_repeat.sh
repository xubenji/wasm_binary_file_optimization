#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-08 17:16:23
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-09 16:13:53
 # @FilePath: /wasm-binary-size-study/5_optimization_formula/3_caculate_repeat.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 


# 检查是否提供了正确数量的参数
if [ $# -ne 1 ]
then
  echo "Usage: $0 filename"
  exit 1
fi

# 检查文件是否存在并可读
if [ ! -r $1 ]
then
  echo "Error: $1 is not a readable file"
  exit 2
fi

# 创建一个临时文件来存储结果
tempfile=$(mktemp)
touch $tempfile

# 定义一个关联数组，用于记录每一行出现的次数
declare -A counts

# 逐行读取文件
while read line
do
  # 如果该行还没有出现过，记录下来
  if [ -z "${counts[$line]}" ]
  then
    counts[$line]=0
  fi

  # 记录该行出现次数
  counts[$line]=$((${counts[$line]}+1))

  # 如果该行是第一次出现，则输出到临时文件中
  if [ ${counts[$line]} -eq 1 ]
  then
    echo $line >> $tempfile
  fi
done < $1

# 重新打开临时文件，并逐行输出，输出该行的删除次数
exec 3<$tempfile
while read line <&3
do
  echo "$line $(( ${counts[$line]} - 1 ))" 
done

# 关闭文件描述符和删除临时文件
exec 3<&-
rm $tempfile
