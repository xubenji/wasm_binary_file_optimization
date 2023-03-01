#!/bin/bash
###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-02-27 12:25:15
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-02-27 14:12:47
 # @FilePath: /wasm-binary-size-study/hex_size_percentage/repeat_ins.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
#shell脚本检查文件中是否包含字符串local.get, 如何包含就检查下一行，如果下一行也有local.get则将计数器加一，最后打印计数器数值
# 设置文件名和计数器
file_name=$1
count=0
times=10
outputfile="$1.txt"

# 逐行读取文件内容
check_next_line=false
line_num=0
repeat_str=""


#while read repeat_str; do

    while IFS= read -r line; do
    line_num=$((line_num+1))
    if [ "$check_next_line" = true ]; then
        check_next_line=false
        
        continue
    fi
        
    # 判断当前行是否包含指定字符串
    if [[ $line == *"$repeat_str"* ]]; then
        # 如果当前行包含指定字符串，就读取下一行
        read -r next_line
        # 判断下一行是否也包含指定字符串
        if [[ $next_line == *"$repeat_str"* ]]; then
            #echo $line $next_line
        # 如果下一行也包含指定字符串，就将计数器加一，并设置check_next_line为true
        ((count++))
                # if [ $count -eq $times ]
                # then
                #     break
                # fi
        #echo $line_num >> lines.txt
        check_next_line=true
        fi
    fi
    done < "$file_name"
    echo $repeat_str ":" $count
    echo $repeat_str ":" $count >> $outputfile
    count=0
     if [ $count -eq $times ]
    then
        break
    fi

# done < "$2"
# echo 


# 打印计数器数值
echo "Count: $count"
