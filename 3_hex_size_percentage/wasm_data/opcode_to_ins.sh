#!/bin/bash
#bash opcode_to_ins.sh *.opcode

# 定义标志变量，用于标记是否已经找到"Opcode counts with immediates:"行
found_opcodes=0

filename=$1

# 循环读取文件中的每一行
while read line; do


  # 如果已经找到了"Opcode counts with immediates:"行，则打印当前行
  if [[ $found_opcodes -eq 1 ]]; then
    # 使用冒号分隔符来获取分号之前的内容
    content=${line%:*}

    # 打印结果
    # 检查变量中是否包含括号
        if [[ $content == *"("*")"* ]]; then
        # 如果有括号，使用sed命令去除括号及其内容
        output=$(echo $content | sed 's/(.*)//')
        else
        # 如果没有括号，直接输出原始内容
        output=$content
        fi
    echo $output
  fi

    # 如果找到了"Opcode counts with immediates:"行，则将标志变量设置为1，表示已经找到
  if [[ "$line" == "Opcode counts:" ]]; then
    found_opcodes=1
  fi
done < "$filename"