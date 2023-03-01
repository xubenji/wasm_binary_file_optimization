#!/bin/bash
# shell脚本遍历当前文件夹中所有的.wasm结尾的文件。使用以下命令依次执行：
# wasm-opcodecnt --output=xxx.opcode xxx.wasm


# 遍历所有的.wasm文件
for wasm_file in *.wasm
do
    # 构造对应的.opcode文件名
    opcode_file=${wasm_file%.wasm}.opcode
    
    # 执行wasm-opcodecnt命令，将结果输出到opcode文件中
    wasm-opcodecnt --output="$opcode_file" "$wasm_file"
done
