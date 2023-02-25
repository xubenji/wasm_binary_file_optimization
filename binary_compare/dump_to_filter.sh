#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-02-20 13:45:41
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-02-20 15:07:15
 # @FilePath: /wasm-binary-size-study/binary_compare/dump_to_filter.sh
 # @Description: 此脚本接收一个参数作为文件名，然后去文件夹中遍历.dump文件
 # 将.dump结尾的文件信息过滤，生成.filter文件
 # 使用方法：
 # bash dump_to_filter.sh arm
### 

for file in $(find "$1" -name "*.dump")
do
    bash get_col1and4.sh "$file" > "${file%.dump}.dump.filter"
done

