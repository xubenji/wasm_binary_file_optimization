'''
Author: Yanjie Xu 459547070@qq.com
Date: 2023-02-16 15:47:51
LastEditors: Yanjie Xu 459547070@qq.com
LastEditTime: 2023-02-17 14:08:41
FilePath: /binary_compare/x86/photo.py
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
'''
import sys
import matplotlib.pyplot as plt


def plot_data(filename):
    # 读取文件中的数据
    with open(f"{filename}.bin.dump.filter.decimal.total.intangSize.info", "r") as f:
        lines = f.readlines()
        x_values = []
        y_values = []
        for line in lines:
            parts = line.split()
            x_values.append(parts[0])
            y_values.append(float(parts[1]))

    # 绘制图表
    plt.bar(x_values, y_values)
    plt.xlabel("X Label")
    plt.ylabel("Y Label")
    plt.title(filename)
   # plt.show()
    
    plt.savefig("xxx")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 photo.py <filename>")
        sys.exit(1)
    filename = sys.argv[1]
    plot_data(filename)
