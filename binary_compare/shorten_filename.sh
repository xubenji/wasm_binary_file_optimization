#!/bin/bash
###
 # @Author: Yanjie Xu 459547070@qq.com
 # @Date: 2023-02-18 19:28:01
 # @LastEditors: Yanjie Xu 459547070@qq.com
 # @LastEditTime: 2023-02-18 19:28:09
 # @FilePath: /binary_compare/shorten_filename.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

if [ $# -ne 1 ]; then
  echo "Usage: $0 directory_name"
  exit 1
fi

directory_name="$1"

if [ ! -d "$directory_name" ]; then
  echo "Error: $directory_name is not a directory"
  exit 1
fi

# 遍历所有以.binsize结尾的文件
for file in "$directory_name"/*.binsize; do
  # 提取文件名（不包括路径）
  filename=$(basename "$file")
  # 将文件名中O1后的字符串到.binsize之前的字符串全部删除
  new_filename="${filename/O1*\.binsize/.binsize}"
  # 重命名文件
  mv "$file" "$directory_name/$new_filename"
done
