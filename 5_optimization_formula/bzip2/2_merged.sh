#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-03-01 15:24:37
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-03-09 16:33:05
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
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> "
    exit 1
fi



# 将文件名存储在变量中
filename=$1

# 检查文件是否存在
if [ ! -f $filename ]; then
    echo "File not found: $filename"
    exit 1
fi

times=200000
i=0


if [ $2 -eq 1 ]
then
    echo "输入变量值为 1"
elif [ $2 -eq 2 ]
then
    echo "输入变量值为 2"
    while read line; do
    # 获取前两行的第一个单词
    col1=$(echo $prev_line | cut -d ' ' -f 1)
    next_col1=$(echo $line | cut -d ' ' -f 1)

    # 将两个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line="$col1-$next_col1"
    # 将两个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line2="$col1-$next_col1 $prev_line $line"

    # 写入输出文件
    echo $merged_line >> 2_merged_output_2lines.txt
    # 写入新文件
    echo $merged_line2 >> 2_merged_output_2lines2.txt

    # 更新辅助变量
    prev_line="$line"
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
    done < $filename
elif [ $2 -eq 3 ]
then
    echo "输入变量值为 3"
    while read line; do
    # 获取前三行的第一个单词
    col1=$(echo $prev_prev_line | cut -d ' ' -f 1)
    next_col1=$(echo $prev_line | cut -d ' ' -f 1)
    next_next_col1=$(echo $line | cut -d ' ' -f 1)

    # 将三个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line="$col1-$next_col1-$next_next_col1"
    # 将三个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line2="$col1-$next_col1-$next_next_col1 $prev_prev_line $prev_line $line"

    # 写入输出文件
    echo $merged_line >> 2_merged_output_3lines.txt
    # 写入新文件
    echo $merged_line2 >> 2_merged_output_3lines2.txt

    # 更新辅助变量
    prev_prev_line="$prev_line"
    prev_line="$line"
    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
    done < $filename
elif [ $2 -eq 4 ]
then
    echo "输入变量值为 4"

    # 从文件中逐行读取
    while read line; do
        # 获取前四行的第一个单词
        col1=$(echo $prev_prev_prev_line | cut -d ' ' -f 1)
        next_col1=$(echo $prev_prev_line | cut -d ' ' -f 1)
        next_next_col1=$(echo $prev_line | cut -d ' ' -f 1)
        next_next_next_col1=$(echo $line | cut -d ' ' -f 1)

        # 将四个单词和所有内容合并到一行，并用破折号分隔它们
        merged_line="$col1-$next_col1-$next_next_col1-$next_next_next_col1"
        # 将四个单词和所有内容合并到一行，并用破折号分隔它们
        merged_line2="$col1-$next_col1-$next_next_col1-$next_next_next_col1 $prev_prev_prev_line $prev_prev_line $prev_line $line"

        # 写入输出文件
        echo $merged_line >> 2_merged_output_4lines.txt
        # 写入新文件
        echo $merged_line2 >> 2_merged_output_4lines2.txt

        # 更新辅助变量
        prev_prev_prev_line="$prev_prev_line"
        prev_prev_line="$prev_line"
        prev_line="$line"

        i=$((i+1))
        if [ $i -eq $times ]
        then
            break
        fi
    done < $filename

elif [ $2 -eq 5 ]
then
    echo "输入变量值为 5"

    while read line; do
    # 获取前五行的第一个单词
    col1=$(echo $prev_prev_prev_prev_line | cut -d ' ' -f 1)
    next_col1=$(echo $prev_prev_prev_line | cut -d ' ' -f 1)
    next_next_col1=$(echo $prev_prev_line | cut -d ' ' -f 1)
    next_next_next_col1=$(echo $prev_line | cut -d ' ' -f 1)
    next_next_next_next_col1=$(echo $line | cut -d ' ' -f 1)

    # 将五个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line="$col1-$next_col1-$next_next_col1-$next_next_next_col1-$next_next_next_next_col1"
    # 将五个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line2="$col1-$next_col1-$next_next_col1-$next_next_next_col1-$next_next_next_next_col1 $prev_prev_prev_prev_line $prev_prev_prev_line $prev_prev_line $prev_line $line"

    # 写入输出文件
    echo $merged_line >> 2_merged_output_5lines.txt
    # 写入新文件
    echo $merged_line2 >> 2_merged_output_5lines2.txt

    # 更新辅助变量
    prev_prev_prev_prev_line="$prev_prev_prev_line"
    prev_prev_prev_line="$prev_prev_line"
    prev_prev_line="$prev_line"
    prev_line="$line"

    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
    done < $filename
elif [ $2 -eq 6 ]
then
    echo "输入变量值为 6"

    while read line; do
    # 获取前六行的第一个单词
    col1=$(echo $prev_prev_prev_prev_prev_line | cut -d ' ' -f 1)
    next_col1=$(echo $prev_prev_prev_prev_line | cut -d ' ' -f 1)
    next_next_col1=$(echo $prev_prev_prev_line | cut -d ' ' -f 1)
    next_next_next_col1=$(echo $prev_prev_line | cut -d ' ' -f 1)
    next_next_next_next_col1=$(echo $prev_line | cut -d ' ' -f 1)
    next_next_next_next_next_col1=$(echo $line | cut -d ' ' -f 1)

    # 将六个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line="$col1-$next_col1-$next_next_col1-$next_next_next_col1-$next_next_next_next_col1-$next_next_next_next_next_col1"
    # 将六个单词和所有内容合并到一行，并用破折号分隔它们
    merged_line2="$col1-$next_col1-$next_next_col1-$next_next_next_col1-$next_next_next_next_col1-$next_next_next_next_next_col1 $prev_prev_prev_prev_prev_line $prev_prev_prev_prev_line $prev_prev_prev_line $prev_prev_line $prev_line $line"

    # 写入输出文件
    echo $merged_line >> 2_merged_output_6lines.txt
    # 写入新文件
    echo $merged_line2 >> 2_merged_output_6lines2.txt

    # 更新辅助变量
    prev_prev_prev_prev_prev_line="$prev_prev_prev_prev_line"
    prev_prev_prev_prev_line="$prev_prev_prev_line"
    prev_prev_prev_line="$prev_prev_line"
    prev_prev_line="$prev_line"
    prev_line="$line"

    i=$((i+1))
    if [ $i -eq $times ]
    then
        break
    fi
    done < $filename
else
    echo "输入变量值无效"
fi



echo "Done."
