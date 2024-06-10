# 极限

## 上下极限

[[2423Su181045]]

对于数列 $\{a_n\}_{n\ge1}$ ，定义其**上极限**为 $\lim_{n\rightarrow \infty}\sup_{k\ge n}a_k$ ，**下极限**为 $\lim_{n\rightarrow \infty}\inf_{k\ge n}a_k$ .

>[!note] 任意数列都存在上下极限，考虑 $\pm\infty$ .

最直观理解上下极限的方法是如下的等价定义：

称 $\{a_n\}_{n\ge1}$ 的一个子列的极限为 $\{a_n\}_{n\ge1}$ 的一个**极限点**. 并将 $\pm\infty$ 也作为极限点. 数列的上（下）极限有等价定义：最大（小）极限点.

上下极限有如下的性质：

>[!note] $\{a_n\}_{n\ge1}$ 收敛的充分必要条件为 $\varliminf_{n\rightarrow \infty}a_n=\varlimsup_{n\rightarrow \infty}a_n$ . 

>[!note] $\varliminf_{n\rightarrow \infty}-a_n=-\varlimsup_{n\rightarrow \infty}a_n,\ \varlimsup_{n\rightarrow \infty}-a_n=-\varliminf_{n\rightarrow \infty}a_n$ . 

>[!note] $C>0,\varlimsup_{n\rightarrow \infty}Ca_n=C\varlimsup_{n\rightarrow \infty}a_n$ . $C<0,\varlimsup_{n\rightarrow \infty}Ca_n=C\varliminf_{n\rightarrow \infty}a_n$ .

上下极限有如下的不等式：

>[!note] $\varliminf_{n\rightarrow \infty}a_n\leq \varlimsup_{n\rightarrow \infty}a_n$ .

>[!note]- $\varlimsup_{n\rightarrow \infty}(x_n+y_n)\leq \varlimsup_{n\rightarrow \infty}x_n+\varlimsup_{n\rightarrow \infty}y_n$ . $\varliminf_{n\rightarrow \infty}(x_n+y_n)\ge \varliminf_{n\rightarrow \infty}x_n+\varliminf_{n\rightarrow \infty}y_n$ .
>证明： $\sup_{n\ge1}(x_n+y_n)\ge \sup_{n\ge1}x_n+\sup_{n\ge1}y_n$ .

从而可得：

>[!note] $\varliminf_{n\rightarrow \infty}(x_n+y_n)\leq \varliminf_{n\rightarrow \infty}x_n+\varlimsup_{n\rightarrow \infty}y_n\leq \varlimsup_{n\rightarrow \infty}(x_n+y_n)$ .

并由上结论的证明过程可以得到：

>[!note] 对 $\{x_n\}_{n\geq1},\{y_n\}_{n\ge1}$ ，如果 $\{y_n\}_{n\ge1}$ 收敛，那么 $\varliminf_{n\rightarrow \infty}(x_n+y_n)=\varliminf_{n\rightarrow \infty}x_n+\lim_{n\rightarrow \infty}y_n$ , $\varlimsup_{n\rightarrow \infty}(x_n+y_n)=\varlimsup_{n\rightarrow \infty}x_n+\lim_{n\rightarrow \infty}y_n$ . 

# 连续


>[!note]- 柯西：若 $f$ 为连续函数或者单调函数，并且对于任意 $x,y\in \mathbb{R}$ 有 $f(x+y)=f(x)f(y)$ 则存在 $\alpha\geq0$ ， $f(x)=\alpha^x$ .
>证明：首先注意到 $f(x)=f(x/2)^2,\forall x\in \mathbb{R}$ ，所以 $f\geq0$ ， $f(1)=[f(1/n)]^n,\forall n\geq1$ ，设 $\alpha=f(1)\geq0$ ，从而 $f(1/n)=\alpha^{1/n}$ ，从而对于任意的有理数 $\frac{m}{n},m,n\in \mathbb{N}$ ， $f\left(\frac{m}{n}\right)=\alpha^{\frac{m}{n}}$ ，并且由 $f$ 的连续性 / 单调 #imcomplete %%单调怎么推出结论，上界收敛%% 可得 $f(x)=\alpha^x,\forall x\in \mathbb{R}$ .
>^CauchyExp

称 $f$ 沿着 $E$ 连续，如果对于任意的 $x\in \text{dom}(f)$ ，对任意 $\epsilon>0$ ，存在 $\delta>0$ ，对任意 $y\in E\cap B(x,\delta),\lvert f(x)-f(y)\rvert<\epsilon$ .

>[!warning]+ $f$ 分别沿着 $A,B$ 连续 $\not\Rightarrow$ $f$ 沿着 $A\cup B$ 连续.
>考虑 Dirichlet 函数 $\chi_\mathbb{Q}$ 其沿着 $\mathbb{Q},\mathbb{R}\backslash \mathbb{Q}$ 连续而在 $\mathbb{R}$ 上不连续.

>[!note]- $F$ 是紧集， $\{f_n\}_{n\geq1}$ 为沿 $F$ 连续的函数列，若 $\{f_n\}_{n\geq1}$ 沿着 $F$ 一致收敛到 $f$ ，则 $f$ 沿着 $F$ 连续.
>证明： $\forall \epsilon>0$ ，存在 $N\in \mathbb{N},\forall n\geq N(\forall x\in \text{dom}(f) ，\lvert f(x)-f_n(x)\rvert<\frac{\epsilon}{3})$  ，又 $f_n$ 沿着 $F$ 连续，所以存在 $\delta>0,\forall y\in B(x,\delta)\cap F$ ， $\lvert f_n(y)-f_n(x)\rvert<\frac{\epsilon}{3}$ ，从而 $\lvert f(x)-f(y)\rvert\leq \lvert f(x)-f_N(x)\rvert+\lvert f_N(x)-f_N(y)\rvert+\lvert f_N(y)-f(y)\rvert<\epsilon$ .

推论：闭区间上连续函数列一致收敛的极限是连续的.

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

>[!note]  | 1) $f,g$ 下半连续，则 $f+g$ 下半连续；2) 若 $f,g$ 下半连续并且 $f,g>0,\forall x\in \text{dom }f\cap \text{dom }g$ ，则 $fg$ 下半连续；3) 若 $f$ 下半连续， $g$ 连续，则 $f\circ g$ 下半连续；4) 若 $\{f_k(x)\}_{k\geq1}$ 下半连续，则 $g=\sup_{k\geq1}f_k(x)$ 下半连续；若 $\{f_k(x)\}_{1\leq k\leq n}$ 下半连续，则 $g=\min_{1\leq k\leq n}f_k(x)$ 下半连续.
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

# 数列

Stolz定理 其主要解决的是$\frac{0}{0}$型和$\frac{*}{\infty}$型的极限问题


（ $\frac{0}{0}$ ）设 $\{a_n\},\{b_n\}$ 均为无穷小量，其中 $\{a_n\}$ 是<u>严格单调减少</u>

# 微分

## 微分学基本定理

>[!note]- 中值定理
>>[!note]- Rolle定理
>
>>[!note]- Largrange中值定理 设$f\in C([a,b])$，在$(a,b)$上可微，则存在$\xi\in(a,b)$，使得：$$f'(\xi)=\frac{f(b)-f(a)}{b-a}$$

## 微分学应用

### 极值理论

定义极大值，极大值点，极小值，极小值点；

> [!note] 极值必要条件：设 $X_0$ 是 $f(X)$ 的极值点，如果 $\frac{\partial{f}}{\partial{x_i}}(X_0)$ 存在，则 $\frac{\partial{f}}{\partial{x_i}}(X_0)=0$ . 进一步，设 $f(X)$ 在 $X_0$ 的一个邻域内的所有二阶偏导数连续，记其在 $X_0$ 的Hessen 矩阵为 $H_f(X_0)$ ，则有 1) 如果 $X_0$ 是 $f(X)$ 的极小值点，那么 $H_f(X_0)\geq0$ ，即为半正定对称矩阵；2) 如果 $X_0$ 是 $f(X)$ 的极大值点，那么 $H_f(X_0)\leq 0$ ，即为半负定对称矩阵.

>[!note] 极值充分条件：设 $f(X)$ 在 $X_0$ 的一个邻域内的所有二阶偏导数都连续，并且 $X_0$ 是 $f(X)$ 的临界点，即 $\nabla f(X_0)=0$ ，记 $H_f(X_0)$ 为 $f(X)$ 在 $X_0$ 的 Hessen 矩阵，则： 1) $H_f(X_0)>0$ 即 $H_f(X_0)$ 为正定矩阵 $\Rightarrow$ $X_0$ 是 $f(X)$ 的极小值点；2) $H_f(X_0)<0$ 即 $H_f(X_0)$ 为负定矩阵 $\Rightarrow$ $X_0$ 是 $f(X)$ 的极大值点；3) $H_f(X_0)$ 为不定矩阵（特征值有正有负） $\Rightarrow$ $X_0$ 不是 $f(X)$ 的极值点；4) $H_f(X_0)\geq0$ 但 $H_f(X_0)>0$ 不成立，或者 $H_f(X_0)\leq0$ 但是 $H_f(X_0)<0$ 不成立，则需要进一步的信息才能确定 $X_0$ 是否是 $f(X)$ 的极值点.

# 积分

## Riemann积分

### 可积条件

>[!note] （可积的必要条件） $f\in R[a,b]$ ，则 $f$ 在 $[a,b]$ 上有界.

>[!note] （可积第一充分必要条件）有界函数 $f$ 在 $[a,b]$ 上可积的充分必要条件为 $\lim_{\lVert P\rVert\rightarrow 0}\sum\limits_{i=1}^{n}\omega_i\Delta x_i=0$ ，其中 $P$ 为 $[a,b]$ 上的分划.

第一充分必要条件要求对于 $\epsilon>0$ ，存在 $\delta>0$ 任意满足 $\lVert P\rVert<\delta$ 的分划 $P$ 都满足 $\sum\limits_{i=1}^{n}\omega_w\Delta x_i<\epsilon$ .

第二充分必要条件则只要求对于 $\epsilon>0$ ，存在一个满足条件的分划即可.

>[!note] （可积第二充分必要条件）有界函数 $f$ 在 $[a,b]$ 上可积的充分必要条件为 $\forall \epsilon>0$ ，存在区间 $[a,b]$ 上的一个分划 $P$ 使得 $\sum\limits_{P}^{}\omega_i\Delta x_i<\epsilon$ .

此外，可以得到如下可积的充分条件：

>[!note] $f\in C[a,b]\Rightarrow f\in R[a,b]$ .

>[!note] $f$ 在 $[a,b]$ 上有界并且只有有限个间断点，则 $f\in R[a,b]$ .

>[!note] 设 $f$ 在 $[a,b]$ 上单调，则 $f\in R[a,b]$ .

## 广义积分

### 无穷积分

>[!summary]- 无穷积分
>$f$在$[a,+\infty)$上有定义，并且在任何有限区间$[a,u]$上Riemann可积，如果极限$$\lim_{u\rightarrow +\infty}\int_a^uf(x)dx=J$$存在，则称该极限$J$为$f$在$[a,+\infty)$上的**无穷积分**，记为：$$J=\int_a^{+\infty}f(x)dx$$若$J$为实数，则称无穷积分$\int_a^{+\infty}f(x)dx$收敛，否则称为发散

>[!note]- Newton-Leibniz公式

>[!example]- 讨论无穷积分$\int_1^{+\infty}\frac{dx}{x^p}$的敛散性.
>$p>1$收敛，$p\leq 1$发散.

>[!note]- 换元公式

>[!example]- 讨论：$\int_2^{+\infty}\frac{dx}{x(\ln x)^p}$的敛散性.
>$$=\int_{\ln 2}^{+\infty}\frac{dt}{t^p}$$转换为上一个例题的问题.
>- (两者的敛散性相同，均为$p>1$收敛，$p\leq 1$发散)

>[!note]- 分部积分公式

>[!example]- 讨论：$\int_{-\infty}^{+\infty}\frac{dx}{1+x^2}$的敛散性
>**解答**：令$x=\tan t,t\in(-\frac{\pi}{2},\frac{\pi}{2})$，则有：$$\begin{aligned}
&= \int_{-\infty}^0\frac{dx}{1+x^2}+\int_0^{+\infty}\frac{dx}{1+x^2}\\
&=\lim_{v\rightarrow \infty}\int_v^0\frac{dx}{1+x^2}+\lim_{u\rightarrow\infty}\int_0^u\frac{dx}{1+x^2}\\
&=\lim_{v\rightarrow -\infty}(\arctan 0-\arctan v)+\lim_{u\rightarrow +\infty}(\arctan u-\arctan0)\\
&=-(-\frac{\pi}{2})+\frac{\pi}{2}=\pi
\end{aligned}$$
>- 注：从中也能看出来积分与断点$c$的选取无关. 另外也可以简化为：$$\arctan x\bigg |_{-\infty}^{+\infty}$$计算.

>[!example]- 求极限：$\lim_{n\rightarrow+\infty}\sin \frac{\pi}{n}\sum\limits_{k=1}^{n}\frac{1}{3+\sin \frac{k \pi}{n}}$
>（用到积分的定义，万能公式）注意到：$$\begin{aligned}
&=\lim_{n\rightarrow+\infty} \frac{\sin\frac{\pi}{n}}{\frac{\pi}{n}}\frac{\pi}{n}\sum\limits_{k=1}^{n}\frac{1}{3+\sin \frac{k \pi}{n}}\\
&=\int_0^\pi\frac{dx}{3+\sin x}\\
&=\int_0^\pi\frac{dx}{3+\frac{2\tan \frac{x}{2}}{1+\tan^2\frac{x}{2}}}\\
&=\int_0^{\pi}\frac{2d(\tan \frac{x}{2})}{3+3\tan^2\frac{x}{2}+2\tan \frac{x}{2}}\\
&\overset{u=\tan\frac{x}{2}}{=}\int_0^{+\infty}\frac{2du}{3+2u+3u^2}\\
&=\int_0^{+\infty}\frac{2d(u+\frac{1}{3})}{3(u+\frac{1}{3})^2+\frac{8}{9}}\\
&=\frac{2}{3}\int_{1/3}^{+\infty}\frac{dv}{v^2+\frac{8}{3}}\\
&=\frac{2}{3}\frac{3}{2\sqrt{2}}\arctan(\frac{v}{\frac{2\sqrt{2}}{3}})\bigg|_{1/3}^{+\infty}\\
&=\frac{1}{\sqrt{2}}(\frac{\pi}{2}-\arctan\frac{1}{2\sqrt{2}})
\end{aligned}$$

>[!example]- 计算：$\int_0^{+\infty}\frac{dx}{1+x^3}$
>由待定系数法可以得到：$$\begin{aligned}
&=\int_0^{+\infty}\left(\frac{1}{3(1+x)}+\frac{(2-x)}{3(x^2-x+1)}\right)\\
&=\int_0^{+\infty}(\frac{1}{3(1+x)}-❗\frac{1}{6}\frac{d(x^2-x+1)}{x^2-x+1}+\frac{1}{2}\frac{dx}{x^2-x+1})\\
&=\int_0^{+\infty}\left(\frac{1}{3(1+x)}-\frac{1}{6}\frac{d(x^2-x+1)}{x^2-x+1}+\frac{1}{2}\frac{d(x-\frac{1}{2})}{(x-\frac{1}{2})^2+\frac{3}{4}}\right)\\
&=0+\frac{1}{2}\frac{2}{\sqrt{3}}\arctan(\frac{2}{\sqrt{3}}(x-\frac{1}{2}))=\frac{2}{9}\sqrt{3}\pi
\end{aligned}$$

>[!example]- 证明：$\int_0^{+\infty}\frac{dx}{1+x^4}=\frac{\pi}{2\sqrt{2}}$
>对于$\int_0^{+\infty}\frac{dx}{1+x^4}$的求解见[[积分表]]. 徐森林（N P409）中给出了B函数与$\Gamma$函数的公式. [Stackexchange](https://math.stackexchange.com/questions/160157/integration-of-int-frac1x41-mathrm-dx)

>[!example]- 计算：$I=\int_0^{+\infty}\sin ax e^{-bx}dx,J=\int_0^{+\infty}\cos ax e^{-bx},a>0,b>0$
>[[3-复积分、Cauchy定理]]中给出求解方法，此外也可以直接使用分部积分法解决这一问题. 最终得到：$$I=\frac{a}{a^2+b^2},J=\frac{b}{a^2+b^2}$$注：这个积分很容易记忆，如果是$\sin(ax)$则分子为$a$，否则为$b$.

>[!example]- 计算Poisson积分$\int_{-\pi}^\pi\frac{1-r^2}{1-2r\cos x+r^2}dx,0<r<1$
>$\frac{\pi}{2}$，换元：$t=\tan\frac{x}{2}$.

>[!example]- 证明：Euler-Poisson 积分： $\int_0^{+\infty}e^{-x^2}dx=\frac{\sqrt{\pi}}{2}$
>（使用Wallis公式和夹逼定理证明）考虑到：$$\begin{aligned}
\frac{(2n)!!}{(2n+1)!!}&=\int_0^{\frac{\pi}{2}}\cos^{2n+1}tdt\\
&\overset{x=\sin t}{=}\int_0^1(1-x^2)^ndx\\
&<\int_0^1e^{-nx^2}dx<\int_0^{+\infty}e^{-nx^2}dx\\
&<\int_0^{+\infty}\frac{dx}{(1+x^2)^n}\\
&\overset{x=\tan t}{=}\int_0^{\frac{\pi}{2}}\cos^{2n-2}dt\\
&=\frac{(2n-3)
!!}{(2n-2)!!}\frac{\pi}{2}
\end{aligned}$$并且：$$\int_0^{+\infty}e^{-nx^2}dx\overset{x=\frac{t}{\sqrt{n}}}{=}\frac{1}{\sqrt{n}}\int_0^{+\infty}e^{-t^2}dt$$所以有：$$n\left(\frac{(2n)!!}{(2n+1)!!}\right)^2<\int_0^{+\infty}e^{-x^2}dx<n\left(\frac{(2n-3)!!}{(2n-2)!!}\frac{\pi}{2}\right)^2$$
由Wallis公式$$\lim_{n\rightarrow\infty}n\left(\frac{(2n)!!}{(2n+1)!!}\right)^2=\lim_{n\rightarrow \infty}\frac{[(2n)!!]^2}{(2n-1)!!(2n+1)!!}\frac{n}{2n+1}=\frac{\pi}{4}$$并且：$$\lim_{n\rightarrow \infty}n\frac{[(2n-3)!!]^2}{(2n-2)!!}\cdot\frac{\pi^2}{4}=\lim_{n\rightarrow \infty}\frac{(2n-3)!!(2n-1)!!}{(2n-2)!!}\frac{n}{2n-3}\frac{\pi^2}{4}=\frac{\pi}{4}$$最后由夹逼定理即可得到结论.

>[!example]- 计算 $\int_{-\infty}^\infty e^{-\frac{x^2}{2}}dx$ .
>解：令 $I=\int_{-\infty}^\infty e^{-\frac{x^2}{2}}dx$ 则 $I^2=\int_{-\infty}^{\infty}dx\int_{-\infty}^\infty e^{-\frac{x^2+y^2}{2}}dy$ ，令 $\left\{\begin{aligned}&x=r\cos \theta \\ &y=r\sin \theta\end{aligned}\right.$ 可得：
>
>$$I^2=\int_{0}^\infty dr\int_{-\pi}^\pi e^{-\frac{r^2}{2}}r d \theta=2\pi$$
>
>从而可得 $I=\sqrt{2\pi}$ .

>[!note]- 无穷积分收敛的Cauchy准则
>无穷积分$\int_a^{+\infty}f(x)dx$收敛$\Leftrightarrow\forall \epsilon>0,\exists \Delta>\max\{a,0\}$，当$u_1,u_2>\Delta$时有：$$\left\lvert \int_a^{u_1}f(x)dx-\int_a^{u_2}f(x)dx \right\rvert=\left\lvert \int_{u_1}^{u_2}f(x)dx\right\rvert<\epsilon$$
>由函数收敛的Cauchy准则可得，函授收敛的Cauchy准则由数列收敛的Cauchy准则得到.

>[!summary]- 绝对收敛
>设$f$在任何有限区间$[a,u]$上Riemann可积，如果$\int_a^{+\infty}\lvert f(x)\rvert dx$收敛，则称$\int_a^{\infty}$**绝对收敛**.

>[!note]- 绝对值不等式
>设$f$在任何有限区间$[a,u]$上Riemann可积，并且$\int_a^{+\infty}\lvert f(x)\rvert dx$收敛，则$\int_a^{+\infty}f(x)dx$也收敛，并且有：$$\left\lvert \int_a^{+\infty}f(x)dx\right\rvert\leq \int_a^{+\infty}\lvert f(x)\rvert dx$$
>- **注意**：前提是$\int_a^{+\infty}\lvert f(x)\rvert dx$收敛.

>[!note]- 无穷积分的比较判别法
>设定义在$[a,+\infty)$上的两个函数$f$和$g$都在任何有限区间$[a,u]$上Riemann可积，并且满足：$$\lvert f(x)\rvert\leq g(x),\quad x\in[a,+\infty)$$则有：1) $\int_a^{+\infty}g(x)dx$收敛$\rightarrow\int_a^{+\infty}\lvert f(x)\rvert dx$收敛$\rightarrow \int_a^{+\infty}f(x)dx$收敛. 2) 当$\int_a^{+\infty}\lvert f(x)\rvert dx$发散时$\rightarrow$$\int_a^{+\infty}g(x)dx$发散.
>
>>[!note]- （无穷积分的比较判别法的极限形式）设$f,g$在任何有穷区间$[a,u]$上Riemann可积，$g(x)>0$，并且有$$\lim_{x\rightarrow +\infty}\frac{\vert f(x)\vert}{g(x)}=c$$则有以下三种情况：
>>1) $0<c<+\infty$时，$\int_{a}^{+\infty}\lvert f(x)\rvert dx$与$\int_{a}^{+\infty}g(x)dx$同敛散；
>>2) $c=0$时，$\int_a^{+\infty}g(x)dx$收敛$\rightarrow\int_{a}^{+\infty}\lvert f(x)\rvert dx$收敛；
>>3) $c=+\infty$时，$\int_a^{+\infty}g(x)dx$发散$\rightarrow\int_a^{+\infty}\lvert f(x)\rvert dx$发散.

### 瑕积分

>[!summary]- 瑕积分
>设$f$在区间$(a,b]$上有定义，在$a$的任一有开邻域内无界，在任何内闭区间$[v,b]\subset(a,b]$上Riemann可积，如果存在极限：$$\lim_{v\rightarrow a^+}\int_v^bf(x)dx=J$$则称此极限$J$为无界函数$f$在$(a,b]$上的**瑕积分**，记为：$$J=\int_a^bf(x)dx$$如果$J$为实数，则称$\int_a^bf(x)$收敛，否则发散，上述点$a$称为$f$的**瑕点**。类似，可定义瑕点为$b$的瑕积分：$$\int_a^bf(x)dx=\lim_{u\rightarrow b^{-}}\int_a^bf(x)dx$$以及若瑕点为$c\in(a,b)$的瑕积分：$$\int_a^bf(x)dx=\int_a^cf(x)dx+\int_c^bf(x)dx$$以及若$a,b$为瑕点，$f$在任何内闭区间$[u,v]\subset(a,b)$上Riemann可积，定义为：$$\int_a^bf(x)dx=\int_a^cf(x)dx+\int_c^bf(x)dx$$其中$c$为$(a,b)$上任何一点👻如何证明与$c$的选取无关？|最后，如果有有限多个瑕点，可以将$(a,b)$分成有限部分，当且仅当每一部分的积分都收敛，$\int_a^bf(x)dx$才是收敛的.

>[!note]- Newton-Leibniz公式

>[!note]- 换元公式

>[!note]- 分部积分公式

## 含参变量积分

$\varphi(T)=\int_a^bf(x,T)dx$其中$T$是参变量.

类比函数项级数$\sum\limits_{n=1}^{\infty}u_n(t)\overset{t_0}{\rightarrow}\sum\limits_{n=1}^{\infty}u_n(t_0)$数项级数
对参变量$T$求极限，求导，求积分；

**一致收敛**：$f(x,T)\in[a,b]\times D$，$T_0$为聚点，$\forall \epsilon>0,\exists \delta>0$，当$0<\lvert T-T_0\rvert<\delta$时，$\forall x\in[a,b]$，有$\lvert f(x,T)-h(x)\rvert<\epsilon$，则称为当$T\rightarrow T_0$时，$f(x,T)$<u>关于</u>$x\in[a,b]$一致收敛于$h(x)$.

保证参变量，自变量构成的二元函数在指定曲序上连续，若存在边界上的瑕点，则补充定义.

含参变量广义积分

$\int_0^{+\infty}f(x,T)dx=\varphi(T),\forall T\in D$，考虑其一致收敛性.
$\forall \epsilon>0,\exists M>a$（与$T$无关）使得$A>M$时，$\forall T\in D$，$\lvert \int_{A}^{+\infty}f(x,T)dx\rvert<\epsilon$，则$\int_a^{+\infty}f(x,T)dx$关于$T\in D$一致收敛.

记$F(A,T)=\int_a^Af(x,T)dx$，则在$A|\rightarrow+\infty$时，$F(A,T)$关于$T\in D$一致收敛于$\varphi(T)$，类似可以定义内闭一致收敛.

引入一些特殊函数以表示不定积分、含参变量积分等的解.

## 含参变量积分求导

>[!note]- 考虑变积分限含参变量积分： $\varphi(t)=\int_{\alpha(t)}^{\beta(t)}f(x,t)dt$ ，其中 $\alpha,\beta$ 在 $[c,d]$ 上可导，并且 $a\leq \alpha,\beta\leq b$ ，如果 $f(x,t),f'_t(x,t)$ 在 $[a,b]\times[c,d]$ 上连续，则 $\varphi(t)$ 在 $[c,d]$ 上可导，并且 $\varphi'(t)=\int_{\alpha(t)}^{\beta(t)}f_t'(x,t)dx+f(\beta(t),t)\beta'(t)-f(\alpha(t),t)\alpha'(t)$ .

对于广义含参变量积分，上述结论是否成立？ #issue 












### Gamma 函数

| #imcomplete 

$\Gamma$ 函数： $\Gamma(s)=\int_0^{+\infty}t^{s-1}e^{-t}dt$ .

$\Gamma(1)=\int_0^{+\infty}e^{-t}dt=1$ .

注意到 $\Gamma$ 函数的递推公式： $\Gamma(s+1)=\int_0^{+\infty}t^se^{-t}dt=s \Gamma(s-1)$ ，特别地 $\Gamma(n)=(n-1)!$ .

### Beta 函数

**Beta 函数** / $B$ 函数：$B(p,q)=\int_0^1t^{p-1}(1-t)^{q-1}dt$

>[!note]- $B(p,q)=\frac{\Gamma(p)\Gamma(q)}{\Gamma(p+q)}$ .

$$B(1/2,1/2)=\int_0^1t^{-\frac{1}{2}}(1-t)^{-\frac{1}{2}} dt$$


# 级数

## 数项级数

>[!summary]- 无穷级数
>**无穷级数**，无穷级数的**通项**，**部分和**，**余项**，无穷级数**收敛**，无穷级数**发散**
>- 数列与无穷级数的关系：数列$\{a_n\}$可以得到部分和数列：$S_n=\sum\limits_{k=1}^{n}a_k$，并且对于$a_n$，有：$$a_n=(a_{n}-a_{n-1})+(a_{n-1}-a_{n-2})+\cdots+(a_2-a_1)+(a_1-a_0)$$其中$a_0=0$，也就是说数列中的每一项可以表示为部分和。从这个观点出发可以利用无穷级数的敛散性解决数列的敛散性问题：

>[!example]- $1+\frac{1}{2}+\cdots+\frac{1}{n}-\ln n$的敛散性
>令$r_n=1+\frac{1}{2}+\cdots+\frac{1}{n}-\ln n$，则$a_k=r_k-r_{k-1}=\frac{1}{k}+\ln(1-\frac{1}{k})$.并定义$r_0=0$，由泰勒公式，$a_k\sim \frac{1}{k^2}$，所以$r_n=\sum\limits_{k=1}^{n}a_k$收敛.

>[!note]- 级数收敛的简单性质
>- 收敛数列加减仍然收敛

>[!note]- 无穷级数收敛的必要条件

>[!example]- 证明$\sum\limits_{n=1}^{\infty}n\sin \frac{1}{n}$与$\sum\limits_{n=1}^{\infty}(1+\frac{1}{n})^n$均发散.
>用级数收敛的必要条件.

>[!note]- （无穷级数敛散性的判定）Cauchy定理

>[!note]- 级数加上或者去掉有限项仍然收敛

>[!note]- 收敛级数的组合级数仍然收敛，并且和相同
>>[!note]- （反之）收敛组合级数内的每一个组合都不变号，则原级数收敛，并且和相等
>>级数$$(a_1+\cdots+a_{n})+(a_{n_1+1}+\cdots+a_{n_2})+\cdots+(a_{n_{k-1}+1}+\cdots+a_{n_k})+\cdots$$在同一个括号内具有相同的符号，则$\sum\limits_{n=1}^{\infty}a_n$也收敛，并且两级数和相等.
>>**证明**：夹逼定理

>[!example]- 发散级数的组合级数不一定收敛
>- $(-1)^n$

>[!example]- （Cauchy收敛定理）设$\{a_n\}$递减并且级数$\sum\limits_{n=1}^{\infty}a_n$递减，求证$\lim_{n\rightarrow+\infty}na_n=0$ NK.14(A).1

>[!example]- 判断$\sum\limits_{n=1}^{\infty}\frac{n^{n+\frac{1}{n}}}{(n+\frac{1}{n})^n}$的收敛性 NK.14_2.2(16) 
>#issue
>

>[!example]- 设$a_n>0,\{a_n-a_{n+1}\}$为一个严格减的数列，如果$\sum\limits_{n=1}^{\infty}a_n$收敛，证明：$\lim_{n\rightarrow +\infty}\left(\frac{1}{a_{n+1}}-\frac{1}{a_n}\right)=+\infty$
>**证明**：（没有巧的方法，只能放缩，同时用到了数列数列与级数的关系）注意到：$$\lim_{n \rightarrow\infty}(a_n-a_{n+1})=0$$因为$\{a_n-a_{n+1}\}$为严格减的数列， #issue 所以 $a_n-a_{n+1}>0$$$\frac{1}{a_{n+1}}-\frac{1}{a_n}=\frac{a_n-a_{n+1}}{a_na_{n+1}}>\frac{a_n-a_{n+1}}{a_n^2}$$❗注意到：$a_n^2=\sum\limits_{k=n}^{\infty}(a_k^2-a_{k+1}^2)$，这里等式成立的原因是：$$a_n^2=\sum\limits_{k=n}^{n+p}(a_k^2-a_{k+1}^2)+a^{2}_{n+p+1}$$令$p\rightarrow\infty$就可以得到上式. 然后有：$$a_n^2=\sum\limits_{k=n}^{\infty}(a_k-a_{k+1})(a_k+a_{k+1})<(a_n-a_{n+1})\sum\limits_{k=n}^{\infty}(a_k+a_{k+1})$$于是有：$$\frac{1}{a_{n+1}}-\frac{1}{a_n}>\frac{1}{\sum\limits_{k=n}^{\infty}(a_k+a_{k+1})}$$并由$\sum\limits_{n=1}^{\infty}a_n$收敛可以得到$\sum\limits_{k=n}^{\infty}(a_k+a_{k+1})=R_n+R_{n+1}$，其中$R_n,R_{n+1}$为$\sum\limits_{n=1}^{\infty}$的余项，从而有$\sum\limits_{k=n}^{\infty}(a_k+a_{k+1})\rightarrow0(n \rightarrow\infty)$，因此可得结论.

>[!example]- 研究下面级数的收敛性：$\sum\limits_{n=1}^{\infty}(\sqrt[n]{1+\frac{1}{n}}-1),\quad \prod_{n=1}^{\infty}\sqrt[n]{1+\frac{1}{n}}$
>参考[Stackexchange](https://math.stackexchange.com/questions/314510/study-the-convergence-of-sum-n-1-infty-bigl-sqrtn1-frac1n-1-bi)上的一些解答.
>对于后一个无穷乘积注意到：$$=1+\left(\sqrt[n]{1+\frac{1}{n}}-1\right),\sqrt[n]{1+\frac{1}{n}}-1\geq 0,n=1,2,\cdots$$所以转换为前者的讨论. 有结论：$$\sqrt[n]{1+\frac{1}{n}}-1\sim \frac{1}{n^2}$$证明方法有很多，1) 如使用不等式：$$1\leq 1+\frac{1}{n}\leq (1+\frac{1}{n^2})^n \rightarrow 1\leq \sqrt[n]{1+\frac{1}{n}}\leq (1+\frac{1}{n^2})$$从而可得到结论. 2) 另一个角度（同1)）则为：$$x^n-y^n=(x-y)(x^{n-1}+x^{n-2}y+\cdots+y^{n-1})$$或者从 3) 分析的角度，利用中值定理得到不等式 $e^x-1<ex,x\in[0,1]$从而可得：$$0\leq \sqrt[n]{1+\frac{1}{n}}-1=e^{\frac{1}{n}\log(1+\frac{1}{n})}-1\leq e^{\frac{1}{n^2}}-1\leq \frac{e}{n^2}$$或者使用 4) 洛必达法则直接证明同阶$$\begin{aligned}
\lim_{n\rightarrow \infty}\frac{\left(1+\frac{1}{n}\right)^{\frac{1}{n}}-1}{\frac{1}{n^2}}&=\lim_{x \rightarrow0}\frac{(1+x)^x-1}{x^2}\\
&=\lim_{x\rightarrow0}\frac{(1+x)^x \left(\frac{x}{1+x}+\ln(1+x)\right)}{2x}\\
&=\lim_{x \rightarrow0}(1+x)^x \left(\frac{1}{2(1+x)}+\frac{\ln(1+x)}{2x}\right)=1
\end{aligned}$$

>[!example]- 求级数和：$\sum\limits_{n=1}^{\infty}\arctan\frac{1}{n^2+n+1}$
>$$\begin{aligned}
=& \sum\limits_{n=1}^{\infty}\arctan\frac{(n+1)-n}{n^2+n+1}\\
=&\sum\limits_{n=1}^{\infty}(\arctan(n+1)-\arctan n)\\
=&\lim_{n\rightarrow +\infty}(\arctan(n+1)-\arctan1)\\
=&\frac{\pi}{2}-\frac{\pi}{4}=\frac{\pi}{4}
\end{aligned}$$

>[!example]- 求解$\sum\limits_{n=1}^{\infty}nx^{n-1}$
>一种方式是裂项相消，另一种：$$\sum\limits_{k=1}^{n}kx^{k-1}=(\sum\limits_{k=1}^{n}x^{k})'=(\frac{x-x^{n+1}}{1-x})'=\frac{nx^{n+1}-(n+1)x^n+1}{(1-x^2)}$$然后代入求极限即可.

### 正项级数

>[!summary]- 正项级数

>[!note]- （正项级数收敛的充分必要条件，部分和判别法）
>正向级数的部分和为有界数列.

>[!note]- （比较判别法）设$\sum\limits_{n=1}^{\infty}u_n,\sum\limits_{n=1}^{\infty}v_n$为正项级数，并且存在正整数$N$，$n\geq N$时，$u_n\leq v_n$，则有以下结论：
>1) 若级数$\sum\limits_{n=1}^{\infty}u_n$发散，则$\sum\limits_{n=1}^{\infty}v_n$发散；
>2) 若级数$\sum\limits_{n=1}^{\infty}v_n$收敛，则$\sum\limits_{n=1}^{\infty}u_n$收敛.
>
>>[!note]- 极限形式
>>设$\sum\limits_{n=1}^{\infty}u_n,\sum\limits_{n=1}^{\infty}v_n$为正项级数，<u>并且</u>$\sum\limits_{n=1}^{\infty}v_n$的每一项均为正数，并且有：$$\lim_{n\rightarrow\infty}\frac{u_n}{v_n}=l$$其中$l\geq0$或者$l=+\infty$，则：
>>1) 若$0<l<\infty$，则级数$\sum\limits_{n=1}^{\infty}u_n$与级数$\sum\limits_{n=1}^{\infty}v_n$同时收敛或者同时发散；
>>2) 若$l=0$，并且级数$\sum\limits_{n=1}^{\infty}v_n$收敛，则$\sum\limits_{n=1}^{\infty}u_n$也收敛；
>>3) 若$l=+\infty$，并且级数$\sum\limits_{n=1}^{\infty}v_n$发散，则$\sum\limits_{n=1}^{\infty}u_n$也发散。
>
>>[!note]- 经常使用的用于比较判别法的级数
>>$$\begin{aligned}
&\sum\limits_{n=1}^{\infty}aq^n\\
&\sum\limits_{n=1}^{\infty}\frac{1}{n^p}\\
&\sum\limits_{n=2}^{\infty}\frac{1}{n\ln^pn}
>\end{aligned}$$
>
>>[!note]- 比较判别法的比值形式 设正项级数$\sum\limits_{}^{}a_n,\sum\limits_{}^{}b_n$，若当$n$充分大时其通项满足：$$\frac{a_{n+1}}{a_n}\leq \frac{b_{n+1}}{b_n}$$则：
>>1) 若$\sum\limits_{}^{}b_n$收敛，则$\sum\limits_{}^{}a_n$收敛；
>>2) 若$\sum\limits_{}^{}a_n$发散，则$\sum\limits_{}^{}b_n$发散.3
>
>根据比较判别法，有以下两种判定正项级数收敛性的方法，其都是以几何级数$\sum\limits_{n=1}^{\infty}q^n$作为比较级数得到的结论.
>
>>[!note]- （比较判别法拓展）达朗贝尔（d'Alembert）判别法 设$D_n=\frac{u_{n+1}}{u_n}$，若存在正整数$N$，使得$n>N$时:
>>
>>>[!note]- 极限形式 $\lim\limits_{n\rightarrow \infty}\frac{a_{n+1}}{a_n}=d$
>>当$d<1$时级数收敛，当$d>1$时级数发散
>>
>
>>[!note]- （比较判别法扩展）Cauchy根值判别法 设$C_n=\sqrt[n]{u_n}$，若存在正整数$N$，使得$n>N$时：1) 存在$0<q<1,C_n\leq q$ 2) 存在正整数列的子列$\{n_k\}$，使得$C_{n_k}\geq 1$，发散
>>
>>>[!note]- 极限形式 $\varlimsup_{n\rightarrow \infty}\sqrt[n]{a_n}=c$
>>>当$c<1$时级数收敛，当$c>1$时级数发散.
>
>如果以$p$级数作为比较级数，就可以得到下面的方法：
>
>>[!note]- （比较判别法扩展）拉阿伯（Raabe）判别法 $\lim_{n\rightarrow\infty}n\left(\frac{a_n}{a_{n+1}}-1\right)=r$
>>当$r>1$时级数收敛，$r<1$时级数发散
>
>如果以$\sum\limits_{n=1}^{\infty}\frac{1}{n\ln^pn}$作为比较级数，则可以得到下面判别法：
>
>>[!note]- （比较判别法扩展）贝特朗（Bertrand）判别法
>
>>[!note]- （比较判别法扩展）Gauss判别法
>
>需要说明的是，上面列举的各种比值类判别法（出现$\frac{a_n}{a_{n+1}}$或$\frac{a_{n+1}}{a_n}$）其实都只能应对$\{a_n\}$为<u>单调</u>的情况（当$n$充分大时），而Cauchy根值判别法则可以应对，其适用范围不能被其他的比值判别法覆盖，如下面这一例子：$$a_n=2^{-n-(-1)^n}\quad \sum\limits_{n=1}^{\infty}a_n$$

>[!example]- 判断$\sum\limits_{n=2}^{\infty}\frac{1}{\ln (n!)}$的敛散性
>**解答**：由$$\begin{aligned}
\lim_{n\rightarrow \infty}\frac{n\ln n}{\ln (n!)}&=1+\lim_{n\rightarrow\infty}\frac{\ln\frac{n^n}{n!}}{\ln n!}\\
&=1+\lim_{n\rightarrow\infty}\frac{n\ln\frac{n}{\sqrt[n]{n!}}}{\ln n!}\\
&=1+\lim_{n\rightarrow\infty}\frac{n/e}{\ln n!}\\
&=1+\lim_{n\rightarrow\infty}\frac{1/e}{\ln(n+1)}(\text{stolz  equation})
\end{aligned}$$
>- 注意：或可以直接$>\frac{1}{n\ln n}$

>[!example]- （Raabe）设$\alpha>0$，证明级数$\left\lvert \frac{\alpha(\alpha-1)\cdots(\alpha-n+1)}{n!}\right\rvert$收敛 NK.练习P143.1

>[!note]- 对数判别法
>#待完善

>[!note]- Cauchy积分判别法
>设$f(x)$为$[a,+\infty)$上的非负单调减的连续函数，其中$a>0$，则级数：$$\sum\limits_{n=1}^{\infty}f(a+n)$$（或者$\sum\limits_{n=0}^{\infty}$）与广义积分：$$\int_a^{+\infty}f(x)dx$$同敛散.
>**证明**：证明不等式：$$\sum\limits_{k=0}^{n}f(a+k+1)\leq \sum\limits_{k=0}^{n}\int_{a+k}^{a+k+1}f(x)dx= \int_{a}^{a+n+1}f(x)dx\leq \sum\limits_{k=0}^{n}f(a+k)$$

>[!example]- $\sum\limits_{n=2}^{\infty}\frac{1}{n(\ln n)^p}$
>当$p>1$时收敛，当$p\leq1$时发散；

>[!example]- Riemann函数 $\zeta(x)=\sum\limits_{n=1}^{\infty}\frac{1}{n^x}$
>在$x>1$时收敛，在$x\leq 1$时发散，则$\zeta(x)$定义了$(1,+\infty)$上的一个函数，称为Riemann函数.
>
>**证明**：由Cauchy积分比较判别法，$\zeta(x)$的敛散性等同于广义积分$\int_1^{+\infty}\frac{1}{t^x}dt$的敛散性相同，从而可得到结论.

>[!note]- Cauchy凝聚项判别法 设$\{a_n\}$是<u>单调减少的</u>正数数列，则$\sum\limits_{n=1}^{\infty}a_n$收敛的充分必要条件为$\sum\limits_{n=0}^{\infty}2^na_{2^n}$收敛

>[!note]- Sapagof判别法：设<u>正数</u>数列$\{a_n\}$单调减少，则$\lim_{n\rightarrow\infty}a_n=0$的充分必要条件是正项级数$\sum\limits_{n=1}^{\infty}\left(1-\frac{a_{n+1}}{a_n}\right)$发散
>
>>[!note]- （等价形式）设正数数列$\{a_n\}$单调增加，则$\{a_n\}$与级数$\sum\limits_{n=1}^{\infty}\left(1-\frac{a_n}{a_{n+1}}\right)$的敛散性相同
>
>>[!note]- （等价形式）设正项级数$\sum\limits_{n=1}^{\infty}a_n$的部分和数列为$\{S_n\}$，则$\sum\limits_{n=1}^{\infty}a_n$与$\sum\limits_{n=1}^{\infty}\frac{a_n}{S_n}$同敛散

>[!note]- （不存在万能的比较级数）
>#待完善 Xie.P12

>[!example]- （使用微分中值定理构造裂项不等式，以进行敛散性的判断）
>>[!example]- 设$\sum\limits_{n=1}^{\infty}a_n$为正项级数，$\{S_n\}$为其部分和数列，$p>1$，证明：无论$\sum\limits_{n=1}^{\infty}a_n$收敛与否，级数$\sum\limits_{n=1}^{\infty}\frac{a_n}{S_n^p}$总是收敛的
>>hint: 对函数$x^{1-p}$在区间$[a,b]$上使用Lagrange中值定理 #未解决 

### 一般项级数

>[!note]- Leibniz判别法
>如果$\{a_n\}$单调递减并且趋于$0$，则交错级数$\sum\limits_{n=1}^{\infty}(-1)^{n-1}a_n$收敛.

>[!note]- Abel 引理
>如果有限数列$\{a_1,a_2,\cdots,a_m\}$和$\{b_1,b_2,\cdots,b_m\}$满足下列条件：1) 数列$\{a_k\}$单调；2) $\lvert B_k\rvert\leq M,k=1,2,\cdots,m$，则有估计式$\lvert S\rvert=\left\lvert \sum\limits_{k=1}^{m}a_kb_k\right\rvert\leq M(\lvert a_1\rvert+2\lvert a_m\rvert)$

>[!note]- Abel判别法
>设$\sum\limits_{n=1}^{\infty}a_n$的部分和数列有界，数列$\{b_n\}$单调且收敛于$0$，则$\sum\limits_{n=1}^{\infty}a_nb_n$收敛

>[!note]- Dirichlet判别法
>若$\sum\limits_{n=1}^{\infty}a_n$收敛，数列$\sum\limits_{n=1}^{\infty}b_n$单调有界，则$\sum\limits_{n=1}^{\infty}a_nb_n$收敛

### 重排级数

定义 $u_n$ 的正部，负部分别为： $u_n^+=\frac{\lvert u_n\rvert+u_n}{2},u_n^-=\frac{\lvert u_n\rvert-u_n}{2}$

>[!example]- 设级数 $\sum\limits_{n=1}^{\infty}a_n$ 条件收敛，求证：$\lim_{n\rightarrow \infty}\frac{\sum\limits_{k=1}^{n}a_k^+}{\sum\limits_{k=1}^{n}a_k^-}=1$ .

>[!note]- 级数绝对收敛和条件收敛与其正部和负部的关系
>1) 级数$\sum\limits_{n=1}^{\infty}u_n$绝对收敛的充分必要条件为其正部$\sum\limits_{n=1}^{\infty}u_n^+$和负部$\sum\limits_{n=1}^{\infty}u_n^-$都收敛；
>2) 级数$\sum\limits_{n=1}^{\infty}u_n$条件收敛的必要条件为其正部和负部都发散

>[!note]- 绝对收敛级数交换任意多项或者❗无穷项的次序所得到的新数列仍然<u>绝对收敛</u>，并且两者有相同的和.
>首先证明对于收敛的正项级数有此性质，然后利用级数的正部和负部说明.

>[!example]- 讨论$\sum\limits_{n=1}^{\infty}\frac{\sin^2n^{\frac{1}{2023}}}{n}$的敛散性.
>不妨假设原来的级数收敛，因为其为正项级数，所以其重排级数也一定收敛，注意到级数$\sum\limits_{n=1}^{\infty}\frac{\sin^2n}{n}$为发散数列，现在对于$\{\frac{\sin^2n^{\frac{1}{2023}}}{n}\}$进行重排，使得其前$n$项的$n$的取值总为：$1,2^{2023},\cdots,n^{2023}$，对于重排级数，其部分和为$S_n=\sum\limits_{k=1}^{n}\frac{\sin^2n}{n}$，可知该重排级数发散，矛盾!👻这很违背直觉，有问题吗？ #issue

>[!note]- 条件收敛级数的重排，Riemann定理
>设级数$\sum\limits_{n=1}^{\infty}a_n$条件收敛，对于任意实数$\alpha$（$\alpha$可以取$-\infty,+\infty$），适当交换其项的次序，可以使得其收敛于$\alpha$

>[!note]- 绝对收敛级数按照元素乘积之后重排仍然收敛，并且和相同，Cauchy定理
>如果级数$$\sum\limits_{n=1}^{\infty}a_n,\sum\limits_{n=1}^{\infty}b_n$$都绝对收敛，分别等于$A,B$，则对应两个数列的项的乘积$a_ib_j(i=1,2,\cdots,j=1,2,\cdots)$无论按照什么方式排列，得到的级数一定绝对收敛于$AB$.
>
>**证明**：证明有上界即可.
>- 实际使用中多采用对角线排列法：$$\sum\limits_{n=1}^{\infty}\sum\limits_{j=1}^{n}a_nb_{n+1-j}\quad \sum\limits_{n=0}^{\infty}\sum\limits_{j=1}^{n}a_nb_{n-j}$$

### 无穷乘积

>[!summary]- 无穷乘积
>**无穷乘积**，**部分乘积**，**收敛**，❗$\lim_{n\rightarrow \infty}P_n=0,+\infty,-\infty,\infty$或者不存在则**发散**. 

>[!note]- 无穷乘积收敛的必要条件
>$\lim_{n\rightarrow \infty}p_n=1$.

>[!example]- 如果$\sum\limits_{n=1}^{p_n}$发散于0，不一定有：$\lim_{n\rightarrow \infty}p_n=1$
>如$p_n=\frac{1}{2}$，$p_n=\frac{(-1)^n}{2}$，$p_n=0$.

>[!note]- 无穷乘积与无穷级数敛散性的对偶定理
>❗设$p_n>0$，则有：
>1) $\prod_{n=1}^{\infty}p_n$收敛于$P>0 \Leftrightarrow \sum\limits_{n=1}^{\infty}\ln p_n$收敛于$S=\ln P$. 
>2) $\prod_{n-1}^{\infty}p_n$发散于$0\Leftrightarrow \sum\limits_{n=1}^{\infty}\ln p_n$手发散于$-\infty$.

>[!note]- 无穷乘积的等价级数（对于正项或者负项级数）
>设$\alpha_n\geq 0$（或者$\alpha_n\leq 0,1+\alpha_n>0,n=1,2,\cdots$），则$\prod_{n=1}^{\infty}(\alpha_n+1)$与$\sum\limits_{n=1}^{\infty}\alpha_n$同敛散.
>- **注意**：❗必须保证$\ln(\alpha_n+1),\alpha_n$两者同时敛散，因此需要保证其同为正项级数或者负项级数，但可以允许有限项不是.
>
>**证明**：首先由上面的定理可以得到：$\prod_{n=1}^{\infty}(\alpha_n+1)$与$\sum\limits_{n=1}^{\infty}\ln(\alpha_n+1)$同敛散，并且由同阶关系，可知$\sum\limits_{n=1}^{\infty}(\alpha_n+1)$与$\sum\limits_{n=1}^{\infty}\alpha_n$同敛散.

>[!example]- 不满足全正项或者全负项的无穷乘积不满足上述等价级数
>设$a_{2n-1}=\frac{1}{\sqrt{n}},a_{2n}=\frac{1}{n}-\frac{1}{\sqrt{n}}$，则无穷乘积$\prod_{n=1}^{\infty}(1+a_n)$收敛而$\sum\limits_{n=1}^{\infty}a_n$发散. 后者发散易证，前者需要计算偶数部分积然后再做说明.

>[!note]- 无穷级数的等价级数（对于变号情形而言）
>设级数$\sum\limits_{n=1}^{\infty}\alpha_n$收敛，则级数$\sum\limits_{n=1}^{\infty}\alpha_n^2$与无穷乘积$\prod_{n=1}^{\infty}(1+\alpha_n)$同敛散.
>
>**证明**：由$\sum\limits_{n=1}^{\infty}\alpha_n$收敛，$\alpha_n\rightarrow0(n \rightarrow 0)$，所以$\alpha_n-\ln(1+\alpha_n)\sim \frac{1}{2}\alpha_n^2(n \rightarrow0)$.
>
>- 好处在于，对于一些级数，$\sum\limits_{n=1}^{\infty}\alpha_n$收敛能够推出$\sum\limits_{n=1}^{\infty}\alpha_n^2$收敛（$\alpha_n$在$n$充分大时不变号就能通过Cauchy收敛原理轻易得到）

>[!example]- 设$a_n=\frac{(-1)^{n+1}}{\sqrt{n}}$，求证$\prod_{n=1}^{\infty}(1+a_n)$发散
>**证明**：由$\{a_n\}$收敛，可知$\prod_{n=1}^\infty(1+a_n)$与$\sum\limits_{n=1}^{\infty}a_n^2$的敛散性相同，从而可得结论.

>[!note]- （无穷乘积“绝对”收敛$\rightarrow$无穷乘积收敛）若$\prod_{n=1}^{\infty}(1+\lvert \alpha_n\rvert)$收敛，则$\prod_{n=1}^{\infty}(1+\alpha_n)$收敛.
>**证明**：由$\lvert \alpha_n\rvert\geq0$可以得到：$\prod_{n=1}^{\infty}(1+\lvert \alpha_n\rvert)$与$\sum\limits_{n=1}^{\infty}\lvert \alpha_n\rvert$的敛散性相同，分别由级数绝对收敛的性质和Cauchy收敛定理可以得到$\sum\limits_{n=1}^{\infty}\alpha_n$和$\sum\limits_{n=1}^{\infty}\alpha_n^2$均收敛，从而由上一定理可知$\prod_{n=1}^{\infty}(1+\alpha_n)$收敛.

>[!example]- Wallis公式
>$$\prod_{n=1}^{\infty}\frac{(2n)^2}{(2n-1)(2n+1)}=\frac{1}{2n+1}\left[\frac{(2n)!!}{(2n-1)!!}\right]^2=\frac{\pi}{2}$$
>进而可以得到下面的结论：
>$$\begin{aligned}
&\frac{(2n)!!}{(2n-1)!!}\sim\sqrt{\pi n}\\
&\frac{2^{2n}(n!)^2}{(2n)!}\sim\sqrt{\pi n}
\end{aligned}$$

>[!example]- 求解$\prod_{n=2}^\infty\frac{n^3-1}{n^3+1}$.
>**解答**：$$\begin{aligned}
&=\frac{n-1}{n+1}\cdot\frac{n^2+n+1}{n^2-n+1}\\
&=\frac{n-1}{n+1}\cdot\frac{n(n+1)+1}{n(n-1)+1}\\
&=\frac{n+\frac{1}{n+1}}{n+\frac{1}{n-1}}=\frac{1+\frac{1}{n(n+1)}}{1+\frac{1}{(n-1)n}}\\
\end{aligned}$$从而可以得到无穷乘积等于：$$\lim_{n\rightarrow\infty}\frac{1+\frac{1}{(n+1)n}}{1+\frac{1}{2}}=\frac{2}{3}$$

>[!summary]- 累次级数，每一次的级数和都收敛

## 函数项级数

定义一致收敛的概念：

称函数列$\{S_n(x)\}$在数集 $E$ 上一致收敛于 $S(x)$ ，如果：

- 若函数项级数 $\sum\limits_{n=1}^{\infty}u_n(x)$ 在开区间 $I$ 中的每一个<u>有界闭区间</u>上都一致收敛，则称该级数在$I$上**内闭一致收敛**；
- 如果$\sum\limits_{n=1}^{\infty}\lvert u_n(x)\rvert$在数集$E$上一致收敛，则称 $\sum\limits_{n=1}^{\infty}u_n(x)$ 在$E$上**绝对一致收敛**.

>[!note]- 求收敛域
>对级数$\sum\limits_{n=1}^{\infty}u_n(x)$：
>- $\lim_{n\rightarrow \infty}\sqrt[n]{\lvert u_n(x)\rvert}<1$收敛，$>1$发散
>- $\lim_{n\rightarrow \infty}\left\lvert \frac{u_{n+1}}{u_n}\right\rvert<1$收敛，$>1$发散

>[!example]- 讲义.P41.14.1.1 直观上看一致收敛

>[!note]- 函数项级数一致收敛的等价定义
>设$f_n$在$D$上点点收敛于$f$，则$f_n\rightrightarrows f,x\in D$等价于，对任意$\{x_n\}$都有：$\lim_{n\rightarrow \infty}\lvert f_n(x_n)-f(x)\rvert=0$
>>[!note]- 进而可以得到一个证明非一致收敛的方法
>>取$\epsilon_0,\forall N, n>N,\exists \{x_n\}\in D,\lvert f_n(x_n)-f(x_n)\rvert\geq \epsilon_0$（只需要找一个子列）

>[!note]- （判断非一致收敛）一致收敛 $\Rightarrow$ 可换序（反之不成立），逆否：不可以换序$\Rightarrow$ 不一致收敛
>- $y=x^n$在$x\in[0,1)$上不一致收敛，但是内闭一致收敛.
>- 连续性、求导只需要内闭一致收敛就可以换序（两者都是局部概念）

>[!note]- 判定函数项级数一致收敛
>>[!note]- Cauchy收敛原理 以及推论：
>>$\lVert u_n\rVert\rightarrow0(n\rightarrow \infty),\forall x\in D$
>
>>[!note]- Weierstrass定理
>>$n$充分大后：$$\lvert u_n(x)\rvert\leq M_n,\forall x\in A$$若$M_n$收敛则$\sum\limits_{}^{}u_n$一致收敛（绝对一致收敛）
>
>>[!note]- $\sum\limits_{}^{}\alpha_n \beta_n$
>>- Abel判别法：$\sum\limits_{n=1}^{\infty}\beta_n$一致收敛，$\{\alpha_n\}$一致有界，$\forall x\in A$，对于$n$单调；
>>- Dirichlet判别法：$\sum\limits_{k=1}^{n}\beta_k$一致有界，$\forall x\in A$，$\alpha_n(x)\rightrightarrows 0$，$\{\alpha_n\}$对于$n$单调.
>
>>[!note]- Dini定理
>>>[!note]- Dini定理：对于函数列而言
>>>若在闭区间$[a,b]$上<u>连续函数列</u>$\{f_n(x)\}$逐点收敛到<u>连续函数</u>$f(x)$，并且对于每一个$x_0\in[a,b]$，$\{f_n(x_0)\}$都是<u>单调数列</u>，则$\{f_n(x)\}$在$[a,b]$上一致收敛到$f(x)$
>>
>>$\{u_n(x)\}$在<u>闭区间</u>$[a,b]$上连续，并且$\sum\limits_{n=1}^{\infty}u_n(x)$逐点收敛到$S(x)$，并且对于<u>每个</u>$x_0\in[a,b],u_n(x_0)$不变号，则$\sum\limits_{n=1}^{\infty}u_n$一致收敛到$S(x)$

>[!note]- 一致收敛的<u>函数列</u>的性质
>>[!note]- 累次极限存在且相等
>>设函数列$\{f_n(x)\}$在区间$(a,b)$上一致收敛到$f(x)$，若对于每个$n$，单侧极限$\lim_{x\rightarrow a^+}f_n(x)=f(a+0)$存在，则有：$$\lim_{x\rightarrow a^+}\lim_{n\rightarrow \infty}f_n(x)=\lim_{n\rightarrow \infty}\lim_{x\rightarrow a^+}f_n(x)$$
>>>[!note]- 推论：逐项连续，则收敛函数连续
>>>设函数列$\{f_n(x)\}$在区间$I$上一致收敛到$f(x)$，若每个$f_n(x)$在区间$I$上连续，则$f(x)$在$I$上连续
>
>>[!note]- 积分换序
>>设函数列$\{f_n(x)\}$在闭区间$[a,b]$上一致收敛到$f(x)$，并且每一个$f_n(x)$都在$[a,b]$上可积，则$f(x)$在$[a,b]$上可积，并且有：$$\int_a^bf(x)dx=\lim_{n\rightarrow \infty}\int_a^bf_n(x)dx$$；并且令$F_n(x)=\int_a^xf_n(t)dt$，则函数列$\{F_n(x)\}$也在$[a,b]$上一致收敛到$F(x)=\int_a^xf(t)dt$

>[!example]- 用一致收敛换序的逆否命题. 判定函数项级数：$$\sum\limits_{n=1}^{\infty}\frac{nx}{(1+x)(1+2x)\cdots(1+nx)},0\leq x\leq1$$的一致收敛性
>注意到：$$u_n(x)=\frac{1}{(1+x)\cdots(1+(n-1)x)}-\frac{1}{(1+x)\cdots(1+nx)}$$从而可以得到级数和为：$$\sum\limits_{k=1}^{n}u_k(x)=1-\frac{1}{(1+x)\cdots(1+nx)},x\in[0,1]$$当$x=0$时级数为$0$，当$0<x\leq 1$时级数为$1$. 注意到该级数在$0$点处不连续，而函数$u_n(x)$在$0$点处连续，如果一致收敛则矛盾！所以非一致收敛

>[!example]- 判断级数$\sum\limits_{n=0}^{\infty}x^n\ln x,\sum\limits_{n=0}^{\infty}x^n(\ln x)^2$在$(0,1)$上是否一致收敛.
>1) 注意到：$\sum\limits_{n=0}^{\infty}x^n\ln x$在$[0,1]$上内闭一致收敛，由定义：$$\sum\limits_{n=0}^{\infty}x^n\ln x=\frac{\ln x}{1-x},x\in(0,1)$$显然内闭一致收敛，而当$x=1$时级数为$0$，在$x=1$处不连续，而$x^n\ln x$在$x=1$处连续，从而矛盾！
>2) 注意到$u_n'(x)=(x^n(\ln x)^2)'=x^{n-1}\ln x(n\ln x+2)$在$x=e^{-\frac{2}{n}}$时取最大，则$u_n(x)\leq e^{-2}\frac{4}{n^2}$从而由Weierstrass判别法可以得到级数一致收敛.

>[!example]- NK P140 $f_n(x)=n^{\alpha}xe^{-n x},n=1,2,\cdots$在$[0,1]$上1) 收敛；2) 一致收敛；3) 在积分号下取极限可换序$\lim_{n\rightarrow \infty}\int_0^1f_ndx=\int_0^1 \left\{\lim_{n\rightarrow \infty }f_n\right\}dx$
>1) $\forall \alpha,f_n\rightarrow0$
>2) $$\lVert f\rVert=\sup_{x\in[0,1]}\lvert n^\alpha\cdot xe^{-n  x}\rvert=\lvert f_n(\frac{1}{n})\rvert=n^{\alpha-1}e^{-1}$$则$\alpha<1$时一致收敛.
>3) 上式右边为$0$，左边：$$\int_0^1f_n(x)dx=\int_0^1n^\alpha xe^{-nx}=n^{\alpha-2}(1-(n+1)e^{-n})$$则$\alpha<2$（注意，一致收敛可换序，但可换序不要求一致收敛）

定义**幂级数**： $\sum\limits_{n=1}^{\infty}a_n(x-x_0)^n$是一个函数项级数，可以视为多项式的推广

**收敛域**：以$x_0$为中心的区间，收敛半径：

$$R=\frac{1}{\overline{\lim}_{n\rightarrow \infty}\sqrt[n]{a_n}}=\lim_{n\rightarrow in }\left\lvert \frac{a_n}{a_{n+1}}\right\rvert$$

当$\lvert x-x_0\rvert=R$时单独讨论（即为对$\sum\limits_{n=1}^{\infty}a_nR^n$的收敛性的讨论.）最后得到收敛区间

>[!example]- 求$\sum\limits_{n=1}^{\infty}\frac{(-1)^n}{2n-1}\left(\frac{1-x}{1+x}\right)^n$的收敛域
>考虑：$$\lim_{n\rightarrow \infty}\frac{1}{\sqrt[n]{2n-1}}\left\lvert \frac{1-x}{1+x}\right\rvert=\left\lvert \frac{1-x}{1+x}\right\rvert<1$$时收敛，单独讨论$x=0$时，考虑$\sum\limits_{n=1}^{\infty}\frac{(-1)^n}{2n-1}$收敛，因此收敛域为$[0,+\infty)$

>[!example]- $\sum\limits_{n=1}^{\infty}\frac{x^n}{(1+x)(1+x^2)\cdots(1+x^n)},x\neq-1$的收敛域
>根据达朗贝尔判别法，如果：$\lim_{n\rightarrow \infty}\left\lvert \frac{a_n}{a_{n+1}}\right\rvert$存在或者发散到$+\infty$，则其为幂级数的收敛半径. 该级数的收敛域为$(-\infty,+\infty)-\{-1\}$

>[!example]- 求幂级数$\sum\limits_{n=1}^{\infty}(1+\frac{1}{2}+\cdots+\frac{1}{n})x^n$的收敛区间
>1) 求半径：$$\lim_{n\rightarrow \infty}\sqrt[n]{1+\frac{1}{2}+\cdots+\frac{1}{n}}=\lim_{n\rightarrow \infty}\sqrt[n]{\ln n+r_n}=1$$
>2) 讨论边界（对数项级数的讨论）：$\sum\limits_{n=1}^{\infty}\frac{1}{n}$发散，$-1$同理；
>3) 收敛区间：$(-1,1)$.

>[!example]- 求$\sum\limits_{n=1}^{\infty}\frac{2^n\sin^n x}{n^2}$的收敛域
>解：当$\lvert 2\sin x\rvert\leq 1$时，显然一致收敛，当$\lvert 2\sin x\rvert\geq 1$时不收敛

>[!note]- （幂级数的换序问题）Abel定理
>$\sum\limits_{n=1}^{\infty}a_n(x-x_0)^n$在收敛区间$I$上<u>内闭</u>一致收敛，有如下性质：
>1) 和函数在$I$上连续；
>2) $\forall [a,b]\in I$逐项可积；
>3) 在$(x_0-R,x_0+R)\subseteq I'\subset I$上逐项可导.

>[!example]- 求和：$\sum\limits_{n=2}^{\infty}\frac{x^n}{n(n-1)}$
>收敛区间为$[-1,1]$，由Abel定理，在$(-1,1)$上，$S'(x)=\sum\limits_{n=2}^{\infty}\frac{x^{n-1}}{n-1},S''(x)=\sum\limits_{n=2}^{\infty}x^{n-2}=\frac{1}{1-x}$，从而可以得到：$$S'=\int_0^x S''dt-\int_0^x\frac{1}{1-t}dt$$

>[!example]- 求和：求下列幂级数的和：$\sum\limits_{n=1}^{\infty}n(n+2)\left(\frac{1}{2}\right)^n$
>解：首先判断收敛半径：$R=1$，进而容易判定收敛区间为$(-1,1)$. 由Abel定理，可以逐项求导，从而有：$$S(x)=\sum\limits_{n=1}^{\infty}(n+1)(n+2)x^n-(n+1)x^n-x^n=\sum\limits_{n=1}^{\infty}(x^{n+1})''-(x^{n+1})'-x^n$$由Abel定理：$$S(x)=\left(\sum\limits_{n=1}^{\infty}x^{n+2}\right)''-\left(\sum\limits_{n=1}^{\infty}x^{n+1}\right)'-\sum\limits_{n=1}^{\infty}x^n=\left(\frac{x^3}{1-x}\right)''-\left(\frac{x^2}{1-x}\right)'-\frac{x}{1-x}=\frac{3x-x^2}{(1-x)^3}$$
>这进而可以计算$\sum\limits_{n=1}^{\infty}n(n+1)\left(\frac{1}{2}\right)^n$

### Fourier级数

>[!summary]- 幂级数和Fourier级数
>- Taylor级数：任意阶导数，$x_0$附近吻合
>- Fourier级数：可积且绝对可积，<u>整体</u>上吻合.

>[!note]- 设$f(x)$的Fourier级数在$[-\pi,\pi]$上一致收敛于$f(x)$，求证Parseval等式成立：$\frac{1}{\pi}\int_{-\pi}^\pi f^2(x)dx=\frac{a_0^2}{2}+\sum\limits_{n=1}^{\infty}(a_n^2+b_n^2)$
>- Bassel不等式的过程：$$\frac{1}{\pi}\int_{-\pi}^\pi\left[f(x)-S_n(x)\right]^2dx=\frac{1}{\pi}\int_{-\pi}^\pi f^2(x)dx-\left[\frac{a_0^2}{2}+\sum\limits_{n=1}^{\infty}(a_n^2+b_n^2)\right]$$
>- 或者$f(x)$在$[-\pi,\pi]$上连续，从而有界，$f^2(x)=\frac{a_0}{2}f(x)+\sum\limits_{n=1}^{\infty}[a_nf(x)\cos nx+b_nf(x)\sin nx]$在$[-\pi,\pi]$上一致收敛，对各项积分可得

>[!note]- 求Fourier级数并求和函数的一般步骤
>- 求出级数：$$\begin{aligned}
&a_n=\frac{2}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f(x)\cos\frac{2n \pi}{T}xdx\\
&b_n=\frac{2}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f(x)\sin\frac{2n \pi}{T}xdx
\end{aligned}$$
>- 带入级数：$$f(x)\sim \frac{a_0}{2}+\sum\limits_{n=1}^{\infty}(a_n\cos\frac{2n \pi}{T}x+b_n\sin\frac{2n \pi}{T}x)$$
>- 依据收敛定理$$S(x)=\left\{\begin{aligned}
&f(x)\quad x\in(a,b)\text{是连续点}\\
&\frac{f(x+0)+f(x-0)}{2}\quad x\text{是间断点}\\
&\frac{f(a+0)+f(b-0)}{2},\quad x=a,b\\
\end{aligned}\right.$$

>[!note]- 收敛性的判别方法：
>- Dini
>
>>[!note] Lipschitz
>>$x_0$左右极限存在，$\exists L>0,\alpha>0,0<\delta\leq \pi,-\leq u\leq \delta$，使得$$\lvert f(x_0\pm u)-f(x_0\pm 0)\rvert\leq Lu^\alpha$$则$\bar{f}$在$x_0$收敛到$$\frac{f(x_0)+0}{f(x_0-0)}$$
>
>>[!note]- Dirichlet-Jordan
>>$f(x)$在$[x_0-\delta,x_0)$和$(x_0,x_0+\delta]$上都单调或者可以表示为增函数之差（有界变差），则$\bar{f}$在$x_0$点收敛到：$$\frac{f(x_0+0)+f(x_0-0)}{2}$$

>[!example]- $e^x$展开为Fourier级数
>$$\begin{aligned}
&a_n=\frac{1}{\pi}\int_{-\pi}^\pi e^x\cos nxdx=\frac{(-1)^n}{n^2+1}\frac{e^\pi-e^{-\pi}}{\pi}\\
&b_n=\frac{1}{\pi}\int_{-\pi}^\pi e^x\sin nxdx=\frac{n(-1)^{n+1}}{n^2+1}\frac{e^\pi-e^{-\pi}}{\pi}
\end{aligned}$$
>在$[-\pi,\pi]$上根据Lipschitz判别法：$$f(x)\sim\frac{e^\pi-e^{-\pi}}{\pi}\left[\frac{1}{2}+\sum\limits_{n=1}^{\infty}\frac{(-1)^n}{n^2+1}(\cos nx-n\sin nx)\right]=\left\{\begin{aligned}
&e^x,x\in(-\pi,\pi)\\
&\frac{e^\pi+e^{-\pi}}{2},x=\pm \pi
\end{aligned}\right.$$
>令$x=\pi$的：$$\frac{e^\pi-e^{-\pi}}{\pi}\left[\frac{1}{2}+\sum\limits_{n=1}^{\infty}\frac{1}{n^2+1}\right]=\frac{e^\pi+e^{-\pi}}{2}$$
>得到$$\sum\limits_{n=1}^{\infty}\frac{1}{n^2+1}=\frac{\pi}{2}\frac{e^\pi+e^{-\pi}}{e^\pi-e^{-\pi}}-\frac{1}{2}$$
>令$x=0$得到：$$\frac{e^\pi-e^{-\pi}}{\pi}\left(\frac{1}{2}+\sum\limits_{n=1}^{\infty}\frac{(-1)^n}{n^2+1}\right)=1$$从而得到：$$\sum\limits_{n=1}^{\infty}\frac{(-1)^{n+1}}{n^2+1}=-\left(\frac{\pi}{e^\pi-e^{-\pi}}-\frac{1}{2}\right)$$

>[!example]- $f(x)=\max\{2-\lvert x\rvert,0\},-\pi\leq x<\pi$
>注意到是偶函数，$b_n=0$，
>$$\begin{aligned}
&a_0=\frac{2}{\pi}\int_0^\pi(2-x)dx=\frac{4}{\pi}\\
&a_n=\frac{2}{\pi}\int_0^\pi(2-x)\cos nxdx=\frac{2(1-\cos2n)}{n^2\pi},n=1,2,\cdots
\end{aligned}$$
>根据Lipschitz判别法：$$\hat{f}=\frac{2}{\pi}+\sum\limits_{n=1}^{\infty}\frac{2(1-\cos2n)}{n^2\pi}\cos nx=\max\{2-\lvert x\rvert,0\}$$

>[!note]- Fourier级数逐项求积分，逐项求导
>- 逐项求积分：$f(x)$在$[-\pi,\pi]$上可积或者绝对可积，$T=2\pi$（不要求$f(x)$是收敛的），则$\forall x\in R$，有$$\int_0^xf(t)dt=\frac{a_0x}{2}+\sum\limits_{n=1}^{\infty}\int_0^x(a_n\cos nt+b_n\sin nt)dt$$
>- 逐项求导：一般不可以逐项求导，除了有限点之外处处可导，可积或者绝对可积

>[!note]- 设$f(x)$在$[-\pi,\pi]$上连续，且其所有Fourier系数均为$0$，求证$f(x)\equiv0$
>**证明**：$$\int_0^xf(t)dt=\frac{a_0x}{2}+\sum\limits_{n=1}^{\infty}\int_0^x(a_n\cos nt+b_n\sin nt)dt=0$$因为$f(x)$在$[-\pi,\pi]$上连续，求导即可得到结论.
>>[!note]- 推论：若$f,g$均以$2\pi$为周期且连续，且$f,g$的Fourier级数相同，则两者相等.

>[!example]- 应用举例
>- $$\sum\limits_{n=1}^{\infty}\frac{\sin nx}{n}=\left\{\begin{aligned}
&\frac{\pi-x}{2},x\in(0,2\pi)\\
&0,x=0,2\pi
\end{aligned}\right.$$ 
>在$[0,2\pi]$上非一致收敛
>- $$\sum\limits_{n=1}^{\infty}\frac{\cos nx}{n^2}=-\sum\limits_{n=1}^{\infty}\int_0^x\frac{\sin nt}{n}dt=-\int_0^x \sum\limits_{n=1}^{\infty}\frac{\sin nt}{n}dx=\frac{1}{4}x^2-\frac{\pi}{2}x+\frac{\pi^2}{6}$$

>[!note]- Riemann引理

>[!example]- 利用Riemann引理求极限：$$\begin{aligned}
&1)\lim_{\lambda\rightarrow+\infty}\int_{-\pi}^\pi\sin^2\lambda xdx\\
&2)\lim_{\lambda\rightarrow+\infty}\int_0^a\frac{\cos^2\lambda x}{1+x}dx
\end{aligned}$$
>- $\sin^2\lambda x=\frac{1}{2}(1-\cos \lambda x)$
>- $\frac{\cos^2\lambda x}{1+x}=\frac{1+\cos2\lambda x}{2(1+x)}$原极限的值为$$\int_0^a\frac{1}{2(1+x)}dx+\lim_{\lambda\rightarrow+\infty}\int_0^a\frac{\cos2\lambda x}{2(1+x)}dx=0$$（最后由Reimann引理得到）所以原极限等于：$$\frac{1}{2}\ln(1+a)$$

