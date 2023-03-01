#!/bin/bash
#此脚本将所有二进制文件(不包括wasm)dump到以.dump后缀结尾的文件中
if [ -d "$1" ]; then
    find "$1" -type f -name "*.bin" | while read file; do
        objdump -h "$file" > "$file.dump"
    done
else
    echo "Usage: $0 directory"
fi

