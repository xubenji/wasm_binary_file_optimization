#!/bin/bash
# 遍历文件夹下所有 .ins 文件，修改文件内容，只保留前十行

# 设置变量，指定要遍历的文件夹路径
folder_path="./"

# 遍历文件夹
for file in "$folder_path"/*.ins; do
    # 检查当前文件是否是 .ins 文件
    if [ -f "$file" ] && [[ $file == *.ins ]]; then
        # 使用 sed 命令修改文件内容，只保留前十行
        sed -i '11,$d' "$file"
    fi
done

