'''
Author: Yanjie Xu 459547070@qq.com
Date: 2023-02-18 11:55:21
LastEditors: benjixu 459547070@qq.com
LastEditTime: 2023-02-20 14:09:29
FilePath: /binary_compare/compare_section_size_in_wasm.py
Description: 这个python文件接收一个参数作为文件夹名称，然后遍历这个文件夹中所有以.decimal结尾的文件，读取第三列和第二列数据，画一个柱状图
比较每一个section在wasm二进制文件中的大小，这个python文件会生成许多柱状图，每一个柱状图代表一个wasm二进制文件。
其中展示出DATA段和CODE段的大小。
使用方法：
python3 compare_section_size_in_wasm.py wasmo1
'''
import os
import sys
import matplotlib.pyplot as plt


def draw_bar_chart(filename, index):
    total = 0
    # 用列表推导式从文件中读取第二列数据
    labels = [line.split()[1] for line in open(filename)]

    # 用列表推导式从文件中读取第三列数据
    data = [float(line.split()[2]) for line in open(filename)]

    # 计算数据总和
    total = sum(data)

    # 计算每一份的大小
    part_sizes = [(part/total) for part in data]

    # 计算每一份的起始值和终止值
    part_values = []
    start = 0
    for part in part_sizes:
        end = start + part
        part_values.append((start, end))
        start = end

    # 绘制柱状图
    xname = filename
    xname = xname.replace("wasmo1", "")
    xname = xname.replace("-O1.bin.dump.filter.decimal", "")
    bar = plt.bar(xname, total)

    # 获取柱子的宽度
    bar_width = bar.patches[0].get_width()

    # 在柱子上画线和标注
    for i, part in enumerate(part_values):
        plt.hlines(total*part[1], index - 1 - bar_width / 2, index - 1 +
                   bar_width / 2, color='gray', linestyle='-')
        if labels[i] == "CODE" or labels[i] == "DATA":
            plt.text(index - 1, total*(part[0] + part[1])/2,
                 labels[i], ha='center', va='center')
        else:
            plt.text(index - 1, total*(part[0] + part[1])/2,
                 "", ha='center', va='center')



if __name__ == '__main__':
    # 接收文件夹名作为参数
    foldername = sys.argv[1]
    # 遍历文件夹中以.decimal结尾的文件，并依次传给draw_bar_chart()函数
    i = 0
    for filename in [f for f in os.listdir(foldername) if f.endswith('.decimal')]:
        i = i + 1
        draw_bar_chart(os.path.join(foldername, filename), i)
    plt.show()
