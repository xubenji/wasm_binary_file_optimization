#!/bin/bash
# 遍历文件夹下所有 .dump 文件，并对每个文件执行 bash repeat_ins.sh xxx.dump xxx.ins 命令

# 设置变量，指定要遍历的文件夹路径和要执行的脚本路径
folder_path="./wasm_data"
script_path="./repeat_ins.sh"
ins_path=".ins"
log_path=".log"

# 遍历文件夹
for file in "$folder_path"/*.dump; do
    # 检查当前文件是否是 .dump 文件
    if [ -f "$file" ] && [[ $file == *.dump ]]; then
        # 提取文件名
        file_name=$(basename "$file" .dump)

        # 拼接 .ins 文件路径
        ins_file="$folder_path/$file_name$ins_path"

        # 检查 .ins 文件是否存在，如果不存在则创建一个空的 .ins 文件
        if [ ! -f "$ins_file" ]; then
            touch "$ins_file"
        fi

        log_file="./$file_name$log_path"

        # 执行 repeat_ins.sh 命令，并将输出信息重定向到日志文件
        bash "$script_path" "$file" "$ins_file" > "$log_file"
    fi
done
