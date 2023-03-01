#!/bin/bash

# 遍历所有的.opcode文件
for opcode_file in *.opcode
do
    # 构造对应的.ins文件名
    ins_file=${opcode_file%.opcode}.ins
    
    # 执行opcode_to_ins.sh脚本，将结果输出到ins文件中
    bash opcode_to_ins.sh "$opcode_file" > "$ins_file"
done
