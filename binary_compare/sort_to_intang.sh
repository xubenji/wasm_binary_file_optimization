###
 # @Author: benjixu 459547070@qq.com
 # @Date: 2023-02-20 13:45:41
 # @LastEditors: benjixu 459547070@qq.com
 # @LastEditTime: 2023-02-20 15:36:46
 # @FilePath: /wasm-binary-size-study/binary_compare/sort_to_intang.sh
 # @Description: 脚本接收一个参数作为文件夹，然后进入文件夹，遍历所有以sort结尾的文件计算binary size - all section size的大小
 # 其中all section size的大小是使用objdump得出的信息，将所有的section size相加得出的大小
 # 使用方法：
 # bash sort_to_intang.sh arm
### 
#!/bin/bash
cd $1
for file in *.bin; do
    binSize=`find . -type f -name "$file" -exec ls -l --block-size=1 {} \; | awk '{print $5}'`
    filetotalName=`find . -type f -name "$file" -exec ls -l --block-size=1 {} \; | awk '{print $9}'`
    num2=$(expr "`cat $filetotalName.dump.filter.decimal.total`" + 0)
    num1=$(expr "$binSize" + 0)

    IntangibleSize=$((num1-num2))
    echo "$filetotalName: $num1 - $num2" > $filetotalName.dump.filter.decimal.total.intangSize
    echo "BinarySize"  $num1 >> $filetotalName.dump.filter.decimal.total.intangSize
    echo "SectionSize"  $num2 >> $filetotalName.dump.filter.decimal.total.intangSize
    echo "Bin-Section"  $IntangibleSize >> $filetotalName.dump.filter.decimal.total.intangSize
done