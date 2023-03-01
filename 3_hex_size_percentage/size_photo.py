'''
Author: benjixu 459547070@qq.com
Date: 2023-02-27 12:43:37
LastEditors: benjixu 459547070@qq.com
LastEditTime: 2023-02-27 12:43:46
FilePath: /wasm-binary-size-study/hex_size_percentage/size_photo.py
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
'''
import matplotlib.pyplot as plt

# 定义数据
data = [
    'bzip-Oz 84%',
    'espeak-Oz 79%',
    'facedetection-Oz 80%',
    'gnuchess-Oz 76%',
    'mnist-Oz 78%',
    'snappy-Oz 81%',
    'whitedb-Oz 81%'
]

names = [s.split()[0] for s in data]
values = [float(s.split()[1][:-1]) for s in data]

# 绘制水平条形图
fig, ax = plt.subplots()
ax.barh(names, values)

# 添加标签和标题
ax.set_xlabel('Percentage')
ax.set_title('top 10 ins size proportion')

# 显示图形
plt.show()
