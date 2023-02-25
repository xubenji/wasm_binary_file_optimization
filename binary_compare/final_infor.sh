#!/bin/bash

# 检查参数数量是否正确
if [ $# -ne 1 ]; then
  echo "Usage: $0 directory"
  exit 1
fi

# 获取文件夹名称
dir=$1

# 循环处理所有的.bin文件
for filename in "$dir"/*.bin; do
 # 读取最后3行的信息
  size=$(tail -n 3 "${filename}.dump.filter.decimal.total.intangSize")

  # 读取最后五行的第二列和第三列信息
  #data=$(tail -n 2 "${filename}.dump.filter.decimal.sort" | awk '{print $2, $3}')
   data=$(awk '/(\.text|\.data)/{++count; if(count<=2) print $2, $3}' "${filename}.dump.filter.decimal.sort")
 
  # 将信息保存到文件
  
  echo "$size" > "${filename}.dump.filter.decimal.total.intangSize.info"
  echo "$data" >> "${filename}.dump.filter.decimal.total.intangSize.info"
done