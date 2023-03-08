#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-01 22:25:13
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-01 23:20:34
 # @FilePath: /wasm-binary-size-study/4_encode/6_delete_even.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

if [ $# -ne 1 ]; then
  echo "请提供文件名作为参数"
  exit 1
fi

file=$1
if [ ! -f "$file" ]; then
  echo "$file 不是一个有效的文件"
  exit 1
fi

# 使用awk读取文件并删除偶数行
awk 'NR%2==0' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"

echo "已删除 $file 的奇数行"
