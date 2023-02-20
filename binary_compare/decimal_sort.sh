#!/bin/bash

# 找到所有.decimal后缀结尾的文件，并且将这些文件名放入一个数组中
files=( $(find ./$1 -name '*.decimal') )

# 循环遍历每个文件，并对每个文件的第三列数字进行排序，然后将排序后的结果输出到对应的文件
for file in "${files[@]}"; do
    # 使用awk命令提取第三列数字，并排序
    sorted_data=$(awk '{print $3}' "$file" | sort -n)
    
    # 将排序后的所有信息都以格式化形式保存在文件中
    printf "=== Sorted data for file %s ===\n" "$file" > "$file.sort"
    printf "%-10s %-20s %-10s\n" "Idx" "Name" "Value" >> "$file.sort"
    printf "%-10s %-20s %-10s\n" "===" "====" "=====" >> "$file.sort"
    awk -v OFS='\t' '{print $1, $2, $3}' "$file" | sort -nk3 | awk -v OFS='\t' '{print $1, $2, $3}' | sed '1d' | while read -r line; do
        printf "%-10s %-20s %-10s\n" $line >> "$file.sort"
    done
done

