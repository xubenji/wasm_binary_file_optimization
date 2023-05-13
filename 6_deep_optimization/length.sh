#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-17 01:21:52
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-17 01:21:56
 # @FilePath: /wasm-binary-size-study/6_deep_optimization/length.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查参数是否存在
if [ $# -ne 1 ]; then
    echo "使用方法: $0 <字符串>"
    exit 1
fi

input_string="$1"
length=${#input_string}

echo "字符串长度: $length"
