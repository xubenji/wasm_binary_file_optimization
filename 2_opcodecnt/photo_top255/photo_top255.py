'''
Author: benjixu 459547070@qq.com
Date: 2023-02-24 14:44:15
LastEditors: benjixu 459547070@qq.com
LastEditTime: 2023-02-24 14:46:00
FilePath: /wasm-binary-size-study/opcodecnt/photo_top255/photo_top255.py
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AEend
'''
import matplotlib.pyplot as plt
import numpy as np

with open('filename.txt', 'r') as f:
    lines = f.readlines()

labels = []
values1 = []
values2 = []

for line in lines:
    parts = line.split(':')
    label = parts[0].strip()
    value1, value2 = [float(x.strip('%')) for x in parts[1].split()]
    labels.append(label)
    values1.append(value1)
    values2.append(value2)

fig, ax = plt.subplots()

x = np.arange(len(labels))

width = 0.35
ax.bar(x - width/2, values1, width, label='with add and end 1')
ax.bar(x + width/2, values2, width, label='without 2')

ax.set_title('proportion of frequently instruction Comparison')
ax.set_xlabel('Program')
ax.set_ylabel('Percentage')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()

plt.show()
