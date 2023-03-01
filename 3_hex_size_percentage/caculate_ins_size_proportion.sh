#!/bin/bash
# bash caculate_ins_size_proportion.sh gnuchess-Os.dump gnuchess-Os.ins
# 执行前请修改code_size
code_size=64122
output_file="whitedb-Oz.size"

if [ $# -eq 0 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename=$1
lines=0
excluded_lines_count=0
excluded_lines=""
localget_lines_count=0
i32add_lines=""

#你需要执行的行数
times=10
i=0
echo -e "code size:" $code_size  > $output_file
freq_ins_size=0
while read line_out; do
    sum=0
    
    while read line; do
        
        if [[ $line == *"$line_out"* ]]; then
            content=$(echo "$line" | awk -F ':' '{print $2}' | awk -F '|' '{print $1}')
            content=$(echo "$content" | sed 's/ //g')
            len=${#content}
            sum=$((len+sum))
            #i32add_lines+="$line\n"
            #echo $sum
        fi
       # ((lines++))
    
    done < "$filename"
    clear
    echo -e $line_out ":\c"
    sum=$((sum/2))
    echo $line_out : $sum  >> $output_file
    echo $sum 
    freq_ins_size=$((sum+freq_ins_size))
    echo $freq_ins_size
    echo "i:" $i
    i=$((i+1))

    if [ $i -eq $times ]
    then
        break
    fi
done < "$2"
proportion=$((freq_ins_size*100))
proportion=$((proportion/code_size))
echo $proportion "%"
echo $proportion "%" >> $output_file

#echo -e "The following lines contain 'i32.add':\n$sum"
