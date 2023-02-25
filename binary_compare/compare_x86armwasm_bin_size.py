'''
Author: benjixu 459547070@qq.com
Date: 2023-02-20 13:45:41
LastEditors: benjixu 459547070@qq.com
LastEditTime: 2023-02-20 14:17:10
FilePath: /wasm-binary-size-study/binary_compare/compare_x86armwasm_bin_size.py
Description: 在x86，arm，wasm中分别找到以.binsize后缀结尾的文件，读取其中的数字，画一个柱状图比较x86，arm，wasm的二进制文件的大小。
以.binsize结尾的文件包含了对应二进制文件的大小，这些数据由ls命令获得。
使用方法：
python3 compare_x86armwasm_bin_size.py
'''

import os
import re
import matplotlib.pyplot as plt
import numpy as np

# 定义要查找的文件后缀
file_extension = ".binsize"

# 定义文件夹名称和对应的颜色
directories = {"x86o1": "r", "armo1": "g", "wasmo1": "b"}

# 定义用于存储数据的字典
data = {}

# 遍历所有文件夹和文件，按照顺序读取相同文件名的文件，并读取其中的数字
for filename in os.listdir("x86o1"):
    if filename.endswith(file_extension):
        # 遍历所有文件夹
        for directory in directories:
            # 构建文件的完整路径
            filepath = os.path.join(directory, filename)
            # 读取文件中的数字
            with open(filepath, "r") as f:
                contents = f.read()
                # 使用正则表达式匹配数字
                match = re.search(r"\d+", contents)
                if match:
                    number = int(match.group())
                    name_without_extension = os.path.splitext(filename)[0]
                    # 将数字存储到字典中
                    key = name_without_extension
                    if directory not in data:
                        data[directory] = {}
                    data[directory][key] = number

# 将字典中的数据转换为列表，以便绘制柱状图
x_labels = list(data["x86o1"].keys())
bar_width = 0.25
offsets = np.arange(len(x_labels))
colors = [directories[directory] for directory in directories]

# 创建一个新的图形
fig, ax = plt.subplots()

# 绘制柱状图
for i, directory in enumerate(directories):
    y_values = [data[directory][key] for key in x_labels]
    ax.bar(offsets + i * bar_width, y_values, bar_width, label=directory, color=colors[i])

# 添加图例
ax.legend()

# 设置横轴标签的角度
plt.xticks(offsets + bar_width, x_labels, rotation=90)

# 显示图形
plt.show()

