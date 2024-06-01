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

```shell title="sage" linenums="1"
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

一年多前我还在用 Mathematica 时，一个最大的感觉就是想做一些常规编程，在写语句时非常别扭，但是又需要依赖 Mathematica 提供的接口. SageMath 与 Python 的结合则比较密切.

# SageMath 基本逻辑

表达式相比于映射更加重要，从表达式出发可以构造符号矩阵、方程，从而进行一系列的运算. API 的调用需要注意是对表达式还是对于函数进行计算.

```python title="符号运算" linenums="1"
# 定义自变量
_ = var('x, y') 
# 表达式
expression = x^2 + y^2
# 映射
f(x, y) = expression
# 返回的仍然是一个映射
f_nabla = f.diff()
# 映射不是简单的函数：不需要全部赋值；映射的返回值不是常规 Python 数值类型，而是 SageMath 中的对象
f_nabla(1)
# SageMath 中的许多运算都需要借助表达式进行，例如 solve 求解方程，只能够使用表达式
# ERROR: solve(f_nabla == 0, x, y)
solve([expression.gradient()[i] == 0 for i in range(2)], x, y)

```

# 拓扑

## 度量

[linalg.norm](https://numpy.org/doc/stable/reference/generated/numpy.linalg.norm.html)

```python linenums="1"
from numpy import linalg as LA
LA.norm(x)
```

# 数学分析

## 极限

## 微分

### 偏导

对于表达式求偏导：

$\frac{\partial{f}}{\partial{x_1}}$ ： `f_expr.diff(x_1)` ；

$\frac{\partial^2{f}}{x_1,x_2}$ ： `f_expr.diff(x_1, x_2)` ；

```python linenums="1"
_ = var("x_1, x_2")
f_expr = 10 * (x_1 - x_2^2)^2 + (1 - x_1)^2
```

### 多元函数微分

对于表达式求梯度：

计算梯度： $\nabla f$ ：`f.expr.gradient()` ；

计算 Hessian 阵： $\nabla^2f$ ： `f_expr.hessian()` ；

# 高等代数

## 矩阵运算

创建矩阵与 Numpy 基本相同 

```python
f_expr = x_1 + x_2^2
matrix(f_expr.gradient())
```

$I_2$ ： `matrix.indentity(2)`

对于高维的

矩阵转置： $A^T$ `A.transpose()` ；

矩阵求逆： $A^{-1}$ `A^-1` ；

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

## 等高线图 / 轮廓图

[check-sage](https://doc.sagemath.org/html/en/reference/plotting/sage/plot/contour_plot.html#sage.plot.contour_plot.contour_plot)

输入函数或者表达式

```sage
x1, x2 = var('x1, x2')
f(x1, x2) = 8 * x1 + 12 * x2 + x1^2 - 2 * x2^2
contour_plot(f, (-10, 10), (-10, 10), fill=False, contours=100)
```

