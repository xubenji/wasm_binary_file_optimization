###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-09 16:51:26
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-10 13:03:05
 # @FilePath: /wasm-binary-size-study/5_optimization_formula/5_filter_opcode.sh
 # @Description: 提取冒号和管道符号之间的内容
### 
#!/bin/bash

if [ $# -eq 0 ]; then
  echo "请提供文件名作为参数"
  exit 1
fi

filename="$1"
output=""

times=200000
i=0
while read -r line; do
  # 检查行中是否包含 'func' 字符串
  if echo "$line" | grep -q 'func'; then
    continue
  fi
  # 使用sed命令提取冒号和管道符号之间的内容并删除其中的空格
  content=$(echo "$line" | sed -n 's/.*:\s*\(.*\)|.*/\1/p' | tr -d ' ')
  # 如果有内容，将其添加到输出中
  if [ -n "$content" ]; then
    output="$output$content"
  fi
  
    i=$((i+1))
    if [ $i -eq $times ]
    then
    break
    fi
    
done < "$filename"

# 输出提取出来的内容
echo "$output"
