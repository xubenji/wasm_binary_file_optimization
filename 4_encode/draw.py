'''
Author: benjixu 459547070@qq.com
Date: 2023-03-02 18:08:36
LastEditors: benjixu 459547070@qq.com
LastEditTime: 2023-03-03 15:04:51
FilePath: /wasm-binary-size-study/4_encode/draw.py
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
'''
import matplotlib.pyplot as plt

# 读取2lines.txt的前十行
with open('2lines.txt', 'r') as f:
    lines = [next(f) for x in range(10)]
y_values = [float(line.split()[1]) for line in lines]
plt.plot(y_values)

# 读取3lines.txt的前十行
with open('3lines.txt', 'r') as f:
    lines = [next(f) for x in range(10)]
y_values = [float(line.split()[1]) for line in lines]
plt.plot(y_values)

# 读取4lines.txt的前十行
# with open('4lines.txt', 'r') as f:
#     lines = [next(f) for x in range(10)]
# y_values = [float(line.split()[1]) for line in lines]
# plt.plot(y_values)

# 添加标题
plt.title('bzip-Oz')

# 显示图形
plt.show()
