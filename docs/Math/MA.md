数学分析

# 极限

## 半连续

[check](https://en.wikipedia.org/wiki/Semi-continuity)

**半连续性**（semi-continuity）：针对实值函数而言，考虑 $f:X\rightarrow \bar{\mathbb{R}}=\{-\infty,\infty\}\cup \mathbb{R}$ ，对 $x_0\in X$ ，如果 $\forall \epsilon>0$ ，存在开集 $U\ni x$ ， $\forall x\in U$ ， $f(x)< f(x_0)+\epsilon$ ，即 $\varlimsup_{x\rightarrow x_0}f(x)\leq f(x_0)$ ，则称 $f$ 在 $x_0$ 处**上半连续**；若 $\forall \epsilon>0$ ，存在开集 $U\ni x$ ， $\forall x\in U$ ， $f(x)>f(x_0)-\epsilon$ ，即 $\varliminf_{x\rightarrow x_0}f(x)\geq f(x_0)$  ，则称 $f$ 在 $x_0$ 处**下半连续**. 类似可以定义函数在定义域上半连续或者下半连续. 

直观上理解，半连续性即为 $f(x_0)$ 在经过恒正或者恒负的扰动之后，将大于（小于） $x_0$ 某一邻域内的所有 $f(x)$ . 或者，半连续性只需简单地理解为只满足极限定义的一半.

半连续性有如下等价条件：

>[!note]- 下列命题等价： 1) $f$ 下半连续； 2) 任给 $\{x_n\}\rightarrow x:f(x)\leq\liminf_{n\rightarrow \infty}f(x_n)$ ； 3) $f$ 的**上镜图**（epgraph） $\{(x,y):y\geq f(x)\}$ 是闭集.
>证明：
> $1)\Rightarrow 2):$ $$\liminf_{n\rightarrow \infty}f(x_n)=\lim_{n\rightarrow \infty}\inf\{f(x_k):k\geq n\}$$ 又因为 $f$ 下半连续并且 $\{x_n\}$ 终在 $x$ 的任一邻域中，所以 $\forall \epsilon>0$ ，存在 $n_\epsilon\in \mathbb{N}$ ，当 $n>n_\epsilon$ 时，有 $f(x_n)>f(x)-\epsilon$ ，因此 $\inf\{f(x_k):k\geq n\}>f(x)-\epsilon$ ，又由 $\epsilon$ 的任意性可以得到 $\inf\{f(x_k):k\geq n\}\geq f(x)$ ，从而可以得到结论.
>
> $2)\Rightarrow 3):$ 考虑该集合中任一收敛序列 $(x_n,y_n):y_n\geq f(x_n)$ ，收敛到 $(x,y)$ ，由 2) 可知 $f(x)\leq \liminf_{n\rightarrow \infty}f(x_n)\leq y$ ，从而 $(x,y)\in \{(x,y):y\geq f(x)\}$ 为闭集.
>
> $3)\Rightarrow 1):$ 因为 $\{(x,y):y\geq f(x)\}$ 是闭集，假设存在 $x_0\in \text{dom}(f)$ ，存在 $\epsilon>0$ ，对于任意包含 $x_0$ 的开集 $U$ ：存在 $x\in U$ 使得 $f(x)\leq f(x_0)-\epsilon$ ，则取开集 $B(x_0,\frac{1}{n})$ 可以得到一个收敛于 $x_0$ 的序列， $(x_n,f(x_0)-\epsilon)$ 为闭集，并且收敛于 $(x_0,f(x_0)-\epsilon)$ ，所以 $f(x_0)-\epsilon>f(x_0)$ 显然矛盾.
>
>综上三者等价.

注意到下半连续的定义也可以写为 $\forall c<f(x_0),\exists$ 开集 $U\ni x$ 满足 $\forall x\in U,f(x)>c$ . 因此下半连续还有等价条件：

>[!note]- $f$ 在 $x_0$ 下半连续的充分必要条件为 $\forall c<f(x_0)$ ，集合 $f^{-1}[(c,+\infty)]=\{x:f(x)>c\}$ 为开集. 进而： $f$ 在 $X$ 下半连续的充分必要条件为 $\forall c\in \mathbb{R}$ ，集合 $f^{-1}[(c,+\infty)]=\{x:f(x)>c\}$ 为开集.

同理有：

>[!note]- 下列命题等价： 1) $f$ 上半连续； 2) 任给 $\{x_n\}\rightarrow x:f(x)\geq\limsup_{n\rightarrow \infty}f(x_n)$ ； 3) $f$ 的**下镜图**（hypograph） $\{(x,y):y\leq f(x)\}$ 是闭集. #imcomplete-whatever 4) $\forall c\in \mathbb{R}$ ，集合 $f^{-1}[(-\infty,c)]=\{x:f(x)<c\}$ 为开集.

借助以上等价条件：可以证明半连续性的函数具有如下的运算性质：

>[!note]-  1) $f,g$ 下半连续，则 $f+g$ 下半连续；2) 若 $f,g$ 下半连续并且 $f,g>0,\forall x\in \text{dom }f\cap \text{dom }g$ ，则 $fg$ 下半连续；3) 若 $f$ 下半连续， $g$ 连续，则 $f\circ g$ 下半连续；4) 若 $\{f_k(x)\}_{k\geq1}$ 下半连续，则 $g=\sup_{k\geq1}f_k(x)$ 下半连续；若 $\{f_k(x)\}_{1\leq k\leq n}$ 下半连续，则 $g=\min_{1\leq k\leq n}f_k(x)$ 下半连续.
>证明多数可以借助下半连续函数 $f$ 诱导的集合 $\{x:f(x)>c\},\forall c$ 为开集，将问题转化为证明集合相等.
>1) $f,g$ 下半连续，注意到 $\forall c\in \mathbb{R}:$ $$\{x:(f+g)(x)>c\}=\cup_{d\in \mathbb{R}}\{x:(f(x)>c-d)\cap(g(x)>d)\}$$ 由开集的定义和 $f,g$ 下半连续的等价条件知 $\{x:(f(x)>c-d)\cap(g(x)>d)\}$ 为开集. 任意个开集之并仍然为开集. 从而可知 $f+g$ 下半连续；
>2) $\{x:fg>c\}=\bigcup_{d\in \mathbb{R}^+}\{x:f>d^{-1}c\cap g>d\}$ ；
>3) 对于任意的 $x\in \{f\circ g(x)>c\}$ ，因为 $f$ 为下半连续函数，所以 $\exists$ 开集 $U\ni g(x)$ ，对于任意的 $g(x')\in U:g(x')>c$ . 又因为 $g$ 是连续函数，所以存在 $U'\ni x$ ，从而 $\{x:f\circ g>c\}$ 为开集. 证毕.
>4) 证明： $\{x:g>c\}=\cup_{k\geq1}\{x:f_k(x)>c\}$ ， $\{x:g>c\}=\cap_{1\leq k\leq n}\{x:f_k(x)>c\}$ .

>[!example]- 设 $\lVert \cdot\rVert_{l_0}=\#\{i:x_i\neq0\}$ ，则 $\lVert \cdot\rVert_{l_0}:\mathbb{R}^n\rightarrow \mathbb{R}$ 是下半连续函数.

>[!example]- 矩阵的秩函数 $\text{rank}:\mathbb{R}^{m\times n}\rightarrow \mathbb{R}$ 是下半连续的.
>证明： $c\in \mathbb{R}$ ，注意到 $$\{A:\text{rank}(A)>c\}=\bigcup_{r>c,r\in \mathbb{N}}\{A:\text{rank}(A)\geq r\}$$ 
>
>下面证明 $\{A:\text{rank}(A)\geq r\}$ 为开集，取矩阵范数 $\lVert A\rVert_{\max}=\max\{\lvert a_{ij}\rvert\}$ ，证明对于任意的 $A_0\in\{A:\text{rank}(A)\geq r\}$ ，存在 $\delta>0$ ，对于任意的 $A'\in\{A:\text{rank}(A)\geq r\}:\lVert A-A'\rVert<\delta$ ，有 $\text{rank}(A')\geq r$ . 
>
>当 $\text{rank}(A_0)=0\geq r$ 时，上述条件显然成立；当 $\text{rank}(A_0)\geq r_0>0$ 时，可知存在 $A_0$ 的子矩阵，记为 $A_0^{r_0\times r_0}$ ，满足 $\det(A_0^{r_0\times r_0})$ ，因为 $\det$ 是连续函数，所以存在 $\delta>0$ ，使得 $\lVert B^{r_0\times r_0}-A^{r_0\times r_0}\rVert<\delta$ 时， $\det(B^{r_0\times r_0})\neq0$ . 因此 $\forall C\in \{A:\text{rank}(A)\geq r>0\}$ ，当 $\lVert C-A\rVert<\delta$ 时， $\lVert C^{r_0\times r_0}-A^{r_0\times r_0}\rVert<\lVert C-A\rVert<\delta$ ，因此也就可以得到 $\text{rank}(C)\geq\text{rank}(C)^{r_0\times r_0}\geq r_0$ ，从而得证.

# 连续函数

## 间断点

若函数 $f$ 在 $x_0$ 点不连续，则称 $x_0$ 为 $f$ 的**间断点**：如果 $f(x_0^-),f(x_0^+)$ 均为有限数，而 $f(x_0^{-})\neq f(x_0^+)$ 或者 $f(x_0^-)\neq f(x)_)$ 或者 $f(x_0^+)\neq f(x_0)$  ，则称 $x_0$ 为**第一类间断点**；其他间断点都称为第二类间断点.

>[!note]- 单调函数的间断点均为第一类间断点. #imcomplete 

>[!note]- 区间上单调函数的间断点至多可数.
