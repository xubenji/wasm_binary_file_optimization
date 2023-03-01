
#!/bin/bash
#shell脚本接收三个参数。第一个参数是文件名，第二个参数和第三个参数分别是十进制数字作为行号A和B。读取从行A到行B所有行的最后结尾的数字，再把这些数字相加。
#然后再读取第一行的第三列数字，将之前相加的数字除以第一行第二列数字，然后乘以100%
#这个脚本计算的是最经常使用的指令占总指令的比重
# 获取输入参数

file_name=$1

#start_line=$2
# 找到包含指定字符串的行，保存行号到变量line_number中
start_line=$(grep -n "Opcode counts with immediates:" "$file_name" | cut -d: -f1)
start_line=$((start_line + 1))


end_line=$((start_line+255))
total_sum=0
# 读取第一行的第二列数字
first_line_num=$(awk 'NR==1{print $3}' $file_name)


# 读取文件中从行start_line到行end_line的所有行，提取第二列数字并相加
# total_sum=$(awk -v start=$start_line -v end=$end_line '{if(NR>=start && NR<=end) total_sum+=$2} END {print total_sum}' $file_name)

# 逐行读取并累加
current_line=1
while read line; do
    if [ $current_line -ge $start_line ] && [ $current_line -le $end_line ]; then
        # 只处理指定行范围内的行
        content=$(echo "$line" | cut -d: -f2)
        content=$(echo "$content" | tr -d ' ')
        if [[ "$content" =~ ^[0-9]+$ ]]; then
            total_sum=$((total_sum + content))
        else
            echo "error"
        fi
    fi
    current_line=$((current_line + 1))
done < "$file_name"

#total_sum=$((total_sum - 3279 - 5950))
# echo "从第 $start_line 行到第 $end_line 行，所有最后一列的数字之和为：$total_sum"
# 计算平均值
if [ $total_sum -ne 0 ]; then
    average=$(echo "scale=2; $total_sum/$first_line_num*100" | bc)
    echo "从第 $start_line 行到第 $end_line 行，第二列数字相加的总和为：$total_sum"
    echo "占比为：$average%"
else
    echo "总和为0，无法计算占比"
fi

