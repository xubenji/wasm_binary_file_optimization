'''
Author: Yanjie Xu 459547070@qq.com
Date: 2023-02-16 16:13:44
LastEditors: Yanjie Xu 459547070@qq.com
LastEditTime: 2023-02-17 15:10:21
FilePath: /binary_compare/photo3d.py
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
'''
import os
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def plot_data(file_path, z):
    # 从文件路径中提取文件名
    filename = file_path.split("/")[-1].split(".")[0]

    # 读取文件中的数据
    with open(file_path, "r") as f:
        lines = f.readlines()
        x_values = []
        y_values = []
        for line in lines:
            parts = line.split()
            x_values.append(parts[0])
            y_values.append(float(parts[1]))

    # 绘制图表
    ax.bar(x_values, y_values, zs=z, zdir='y', alpha=0.8)


if __name__ == "__main__":
    # 文件夹列表
    folders = ["x86", "arm", "wasm"]
    # 文件名列表
    filenames = []
    for folder in folders:
        filenames.append(os.path.join(
            folder, "gnuchess-Os.bin.dump.filter.decimal.total.intangSize.info"))

    # 创建3D图表
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')

    # 对每个文件进行处理
    for i, filename in enumerate(filenames):
        # 读取当前文件的数据
        with open(filename, "r") as f:
            lines = f.readlines()
            x_values = []
            y_values = []
            for line in lines:
                parts = line.split()
                x_values.append(parts[0])
                y_values.append(float(parts[1]))
        # 绘制图表
        z = [i] * len(x_values)
        plot_data(filename, z)

    # 设置坐标轴标签
    ax.set_xlabel('X Label')
    ax.set_ylabel('Z Label')
    ax.set_zlabel('Y Label')
    ax.set_zticks([])
    ax.tick_params(axis='x', labelsize=6, pad=10)
    

    # 显示图表
    plt.show()
