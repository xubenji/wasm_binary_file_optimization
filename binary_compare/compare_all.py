# import os
# import re
# import matplotlib.pyplot as plt
# import numpy as np

# # 定义要查找的文件后缀
# file_extension = ".binsize"

# # 定义文件夹名称
# directories = ["x86o1", "armo1", "wasmo1"]

# # 定义用于存储数据的字典
# data = {}

# # 遍历所有文件夹和文件，按照顺序读取相同文件名的文件，并读取其中的数字
# for filename in os.listdir(directories[0]):
#     if filename.endswith(file_extension):
#         # 遍历所有文件夹
#         for directory in directories:
#             # 构建文件的完整路径
#             filepath = os.path.join(directory, filename)
#             # 读取文件中的数字
#             with open(filepath, "r") as f:
#                 contents = f.read()
#                 # 使用正则表达式匹配数字
#                 match = re.search(r"\d+", contents)
#                 if match:
#                     number = int(match.group())
#                     name_without_extension = os.path.splitext(filename)[0]
#                     #print(name_without_extension)  # 输出 "example"
#                     # 将数字存储到字典中
#                     key = f"{directory}/{name_without_extension}"

#                     data[key] = number

# # 将字典中的数据转换为列表，以便绘制柱状图
# x_labels = list(data.keys())
# y_values = list(data.values())

# # 创建一个新的图形
# fig, ax = plt.subplots()

# # 绘制柱状图
# ax.bar(x_labels, y_values)

# # 设置横轴标签的角度
# plt.xticks(rotation=90)

# # 显示图形
# plt.show()

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

