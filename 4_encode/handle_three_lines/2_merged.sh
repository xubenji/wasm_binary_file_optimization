#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-01 15:24:37
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-02 15:23:31
 # @FilePath: /wasm-binary-size-study/4_encode/2_merged.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检查输入参数是否正确
# shell脚本接收一个参数作为文件名，读取这个文件名，逐行扫描这个文件，
# 将本行第一列字符串和紧接着的下一行第一列字符串读取出来并合并到一行，逐行写入一个新的文件。
#!/bin/bash
#!/bin/bash
set +x

# 检查输入参数是否正确
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

rm -rf 2_merged_output*

# 将文件名存储在变量中
filename=$1

# 检查文件是否存在
if [ ! -f $filename ]; then
    echo "File not found: $filename"
    exit 1
fi

times=2000
i=0

# 3 lines
# 从文件中逐行读取
while read line; do
        # 获取前两行和当前行的第一列字符串
    col1=$(echo $prev_prev_line | cut -d ' ' -f 1)
    next_col1=$(echo $prev_line | cut -d ' ' -f 1)
    next_next_col1=$(echo $line | cut -d ' ' -f 1)

    # 将三个单词合并到一行，并用破折号分隔它们
    merged_line="$col1-$next_col1-$next_next_col1"

    # 写入输出文件
    echo $merged_line >> 2_merged_output.txt

    # 更新辅助变量
    prev_prev_line="$prev_line"
    prev_line="$line"

    # i=$((i+1))
    # if [ $i -eq $times ]
    # then
    #     break
    # fi
done < $filename


# 2 lines
# # 读取文件并逐行处理
# while read line; do
#     # 获取本行和先前行的第一列字符串
#     col1=$(echo $prev_line | cut -d ' ' -f 1)
#     next_col1=$(echo $line | cut -d ' ' -f 1)

#     # 将第一列字符串合并到一行，并将空格替换为其他字符
#     merged_line="$col1-$next_col1"

#     # 写入新文件
#     echo $merged_line >> 2_merged_output.txt

#     # 更新辅助变量
#     prev_line="$line"

#     i=$((i+1))
#     if [ $i -eq $times ]
#     then
#         break
#     fi
# done < $filename

# lines 2
# 读取文件并逐行处理
i=0
while read line; do
     # 获取本行、下一行和下下一行的第一个单词
    col1=$(echo $line | cut -d ' ' -f 1)
    next_line=$(read; echo $REPLY)
    next_col1=$(echo $next_line | cut -d ' ' -f 1)
    next_next_line=$(read; echo $REPLY)
    next_next_col1=$(echo $next_next_line | cut -d ' ' -f 1)

    # 将三个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line="$col1-$next_col1-$next_next_col1 $line $next_line $next_next_line"

    # 写入新文件
    echo $merged_line >> 2_merged_output2.txt
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
done < $filename

echo "Done."
