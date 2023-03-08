#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-01 23:25:01
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-01 23:25:06
 # @FilePath: /wasm-binary-size-study/4_encode/8_final.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查参数数量是否正确
if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# 检查文件是否存在
if [ ! -f $1 ]; then
  echo "Error: File $1 does not exist"
  exit 1
fi

# 使用awk删除第三列并在其位置插入冒号
awk '{ $3=":"; print }' $1 > tmpfile && mv tmpfile $1

echo "Done."
