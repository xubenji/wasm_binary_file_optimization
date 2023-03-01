#!/bin/bash

# 检查参数数量是否正确
if [ $# -ne 1 ]; then
  echo "Usage: $0 directory"
  exit 1
fi

# 获取文件夹名称
dir=$1

# 循环处理所有的.wasm文件
for wasm_file in "$dir"/*.wasm; do
  # 生成对应的.bin文件名
  bin_file="${wasm_file%.wasm}.bin"
  # 复制文件并重命名为.bin
  cp "$wasm_file" "$bin_file"
done

