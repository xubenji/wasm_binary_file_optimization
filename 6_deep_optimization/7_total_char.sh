#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-09 21:51:55
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-09 21:54:58
 # @FilePath: /wasm-binary-size-study/5_optimization_formula/7_total_char.sh
 # @Description: 脚本接收一个参数作为文件名，读取这个文件，计算这个文件有多少个字符
### 

# 判断输入参数是否为空
if [ -z "$1" ]
then
  echo "请提供文件名作为参数"
  exit 1
fi

# 判断文件是否存在
if [ ! -f "$1" ]
then
  echo "文件不存在"
  exit 1
fi

# 使用wc命令统计文件字符数
char_count=$(wc -c < "$1")

# 输出结果
echo "$char_count"
