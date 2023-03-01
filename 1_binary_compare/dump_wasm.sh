#!/bin/bash
#使用此脚本将所有.wasm二进制文件dump到以dump后缀结尾的文件中
if [ -d "$1" ]; then
    find "$1" -type f -name "*.bin" | while read file; do
        /mnt/bake_webassembly/wabt/bin/wasm-objdump -h "$file" > "$file.dump"
    done
else
    echo "Usage: $0 directory"
fi

