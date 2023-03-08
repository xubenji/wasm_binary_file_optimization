#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-01 22:11:10
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-02 13:45:16
 # @FilePath: /wasm-binary-size-study/4_encode/tianjia_hang.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查输入参数是否为空
if [ -z "$1" ]; then
  echo "Please provide a filename as an argument."
  exit 1
fi

# 读取传入的文件名
filename=$1

# 检查文件是否存在
if [ ! -f "$filename" ]; then
  echo "File not found."
  exit 1
fi

times=20
i=0

rm -rf  5_modified_$filename

# 逐行读取文件并处理每一行
while read line; do
  # 提取第一列
  first_col=$(echo "$line" | awk '{print $1}')

  # 在第二个文件中查找匹配的行
  # match_line=$(grep "^$first_col " 2_merged_output2.txt)
  # 逐行读取文件并匹配第一列
    while read match_line; do
    if [[ "$match_line" == "$first_col"* ]]; then
        echo "$match_line"
        echo "$line $match_line" >> 5_modified_$filename
        break
    fi
    done < "2_merged_output2.txt"

  # 如果匹配成功，则在源文件行的末尾添加匹配行的内容
    #   if [ -n "$match_line" ]; then
        
    #     echo "$line $match_line" 
    
    #  # else
    #     # 如果没有匹配，则仅将源文件的行写入修改后的文件中
    #    # echo "$line" >> 5_modified_$filename
    #   fi
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
done < "$filename"

echo "Done!"
