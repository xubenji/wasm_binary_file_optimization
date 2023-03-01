#!/bin/bash

# 检查参数是否存在
if [ -z "$1" ]; then
  echo "请提供要处理的文件夹名"
  exit 1
fi

# 切换到指定文件夹
cd "$1" || exit

# 遍历当前文件夹中的所有.info文件，将其中的DATA和CODE字符串替换为.data和.text
for file in *.info; do
  sed -i 's/DATA/\.data/g; s/CODE/\.text/g' "$file"
done

