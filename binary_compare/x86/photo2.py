import matplotlib.pyplot as plt

filename = input("请输入文件名：")

# 读取文件内容，获取名称和高度信息
names = []
heights = []
with open(f"{filename}-O0.bin.dump.filter.decimal.total.intangSize.info", "r") as f:
    for line in f:
        fields = line.strip().split()
        names.append(fields[0])
        heights.append(int(fields[1]))

# 按高度从高到低排序
sorted_indices = sorted(range(len(heights)), key=lambda i: heights[i], reverse=True)
names_sorted = [names[i] for i in sorted_indices]
heights_sorted = [heights[i] for i in sorted_indices]

# 绘制柱状图
plt.bar(range(len(heights_sorted)), heights_sorted)
plt.xlabel("数据点")
plt.ylabel("高度")
plt.title(filename)

# 标记柱子的名称
for i, height in enumerate(heights_sorted):
    plt.text(i, height, names_sorted[i], ha='center', va='bottom')

plt.show()
