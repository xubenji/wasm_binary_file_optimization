#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-01 16:40:15
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-01 23:22:22
 # @FilePath: /wasm-binary-size-study/4_encode/4_sort.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
#shell脚本接收一个参数作为文件名，读取这个文件，根据这个文件的第二列数字进行从到小的行排序

# 确保脚本输入参数正确
if [ $# -ne 1 ]
then
  echo "Usage: $0 filename"
  exit 1
fi

# 读取输入文件并按照第二列数字进行排序
sort -n -r -k2 $1 > 7_second_sort_output.txt