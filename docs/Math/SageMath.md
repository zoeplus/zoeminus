官方的文档非常不友好，遂萌生按照现有教材学习 SageMath 的使用.

教材选择如下：

分析：

- 《数学分析》徐森林；

代数：

- 《高等代数》丘维声
- 《抽象代数》朱富海

离散：

- 无教材

几何与拓扑：

- 《一般拓扑学》

[Debian](https://packages.debian.org/search?keywords=sagemath)

[GitHub](https://github.com/sagemath/sage)

- [Sage Tutorial](https://doc.sagemath.org/html/en/tutorial/index.html)
- [Sage-quick-ref](https://wiki.sagemath.org/quickref)

```sage title="sage" linenums="1"
$ sage
# 用 jupyter notebook 打开
$ sage -n jupyter

# sage 一般存储在 ~/.sage 下
$ cd ~/.sage
# 一般存储绘制的图片等，退出 sage shell 之后就会完全清除
$ cd temp
```

Jupyter Notebook 快捷键：

块外： `L` 显示当前块的行号

[云计算平台](https://cocalc.com/)

[check-sage-tutorial](https://doc.sagemath.org/html/en/tutorial/tour_algebra.html#basic-algebra-and-calculus)

# 写在前面

SageMath 作为依赖 Python 的语言，在常规运算（e.g. 最优化算法实现）中其实可以轻易被 Python 中的 Numpy 取代. 其提供的 `matrix` ， `vector` 等，如果用于计算而不是符号运算，则兼容性（e.g. 广播、微分）差劲并且反直觉.

但 Numpy 也<u>非常窒息</u>，例如计算 $x^TAx$ ，在 Numpy 中的实现是：

```python linenums="1"
np.dot(x, np.matmul(A, x))
```

而在 SageMath 中（似乎）可以简单易读一些：

```sage linenums="1"
f(x_1, x_2) = x.transpose() * A * x
```

不过，仅限于 $x$ 中包含的变量数少.

# SageMath 基本逻辑

```sage title="符号运算" linenums="1"
# 定义自变量
_ = var('x, y') 
# 表达式
expression = x^2 + y^2
x = 1; y = 1; print(expression)
```

# 数学分析

## 极限

## 微分

```
```

# 高等代数

# 最优化

## Newton Method

[check-sagemath](https://www.sfu.ca/~jtmulhol/calculus-applets/html/sagemath-cell-newtonsmethod.html)

# 绘图

[check-sage-tutorial](https://doc.sagemath.org/html/en/tutorial/tour_plotting.html)

## 二维图

```sage title="绘制一元函数图像" linenums="1"
f(x) = 0.5 * ((x + 1)^3 + x^2)^2 - 3
plot_range = (-10, 10)
plot(f, plot_range)
```

## 等高线图

[check-sage](https://doc.sagemath.org/html/en/reference/plotting/sage/plot/contour_plot.html#sage.plot.contour_plot.contour_plot)

```sage
x1, x2 = var('x1, x2')
f(x1, x2) = 8 * x1 + 12 * x2 + x1^2 - 2 * x2^2
contour_plot(f, (-10, 10), (-10, 10), fill=False, contours=100)
```