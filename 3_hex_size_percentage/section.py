import matplotlib.pyplot as plt

# 假设这是你的数据，可以按照你的实际情况进行修改
data = [
    (1, 100, 200),
    (2, 150, 250),
    (3, 80, 300),
    # ...
]

# 每一列的标签
labels = ['Section ID', 'Section Size', 'Function Type*', 'Function Size']

# 创建一个子图
fig, ax = plt.subplots()

# 遍历每一个数据项，绘制柱状图
for i, (sec_id, sec_size, *func_sizes) in enumerate(data):
    ax.bar(labels, [sec_id, sec_size, 0, 0], bottom=[0, 0, sum(data[j][1] for j in range(i)), 0], label=f'Section {sec_id}')
    for j, func_size in enumerate(func_sizes):
        ax.bar(labels, [0, 0, 0, func_size], bottom=[0, 0, sum(data[k][1] for k in range(i+1)), sum(func_sizes[:j])], label=f'Function {j}')

# 添加图例
ax.legend()

# 添加标题和坐标轴标签
ax.set_title('Section Information')
ax.set_xlabel('Field')
ax.set_ylabel('Size')

# 显示图形
plt.show()
