#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-03 14:02:06
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-03 14:22:18
 # @FilePath: /wasm-binary-size-study/4_encode/3_delete_space.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查输入参数
if [ $# -ne 1 ]; then
  echo "请输入一个文件名作为参数"
  exit 1
fi

# 检查文件是否存在
if [ ! -f "$1" ]; then
  echo "文件 $1 不存在"
  exit 1
fi

# 去除文件中所有的空行
sed '/^$/d' "$1" > "$1.tmp"
mv "$1.tmp" "$1"



echo "空行已经被成功删除"
