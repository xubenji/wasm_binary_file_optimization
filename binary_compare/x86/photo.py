import sys
import matplotlib.pyplot as plt

def plot_data(filename):
    # 读取文件中的数据
    with open(f"{filename}-O0.bin.dump.filter.decimal.total.intangSize.info", "r") as f:
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
    plt.show()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 photo.py <filename>")
        sys.exit(1)
    filename = sys.argv[1]
    plot_data(filename)
