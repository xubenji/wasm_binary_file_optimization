#!/bin/bash
###
 # @Author: Yanjie Xu 459547070@qq.com
 # @Date: 2023-02-18 19:15:17
 # @LastEditors: Yanjie Xu 459547070@qq.com
 # @LastEditTime: 2023-02-18 19:15:23
 # @FilePath: /binary_compare/get_binSize.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

if [ $# -eq 0 ]; then
    echo "Usage: $0 folder_name"
    exit 1
fi

# 获取命令行参数作为文件夹名
folder_name=$1

# 寻找以.intangSize结尾的文件
for file in "$folder_name"/*.intangSize; do
    # 从第二行的第二列中读取数字
    size=$(awk 'FNR == 2 {print $2}' "$file")
    # 构造输出文件名
    output_file="${file%.intangSize}.binsize"
    # 将数字保存到输出文件中
    echo "$size" > "$output_file"
done
