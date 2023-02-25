import matplotlib.pyplot as plt

# 读取文件并解析数据
with open('data.txt', 'r') as f:
    lines = f.readlines()

data = {}
for line in lines:
    tokens = line.strip().split(':')
    name = tokens[0].strip()
    percentage = float(tokens[1].strip().rstrip('%'))
    data[name] = percentage

# 画图
plt.bar(range(len(data)), data.values(), align='center')
plt.xticks(range(len(data)), list(data.keys()))
plt.ylabel('Percentage')
plt.title('proportion of frequently instruction Comparison')
plt.show()
