实数理论.

# 实数理论

## 实数域

实数域即为由 $(\mathbb{R},0,1,+,\cdot,\leq)$ 构成的一个完备的全序域. 域即为 $\mathbb{R}$ 关于 $+$ 构成交换群， $\mathbb{R}\backslash\{0\}$ 关于 $\cdot$ 构成交换群. 全序指的是 $\forall x,y\in \mathbb{R}((x\leq y)\wedge(y\leq x))$ ，完备指的是满足： $\mathbb{R}$ 中的有界子集一定有上确界（或者其他等价命题）. 最后简写为： $\mathbb{R}$

实数域也可以由集合构建，首先构建自然数集 $\mathbb{N}$ ： 

$$\begin{aligned}
&\emptyset \leftrightarrow 0\\
&\{\emptyset\}\leftrightarrow1\\
&\{\emptyset,\{\emptyset\}\}\leftrightarrow2\\
&\cdots
\end{aligned}$$

用集合构造 $\mathbb{N}$ 的方法有很多，这里是 $n+1=\{n,\{n\}\}$ 的形式，然后用有序对构造有理数集 $\mathbb{Q}$ ： $\mathbb{Q}=\{(a,b):a\in \mathbb{N},b\in \mathbb{N}\backslash\{0\}\}$ 最后用 Dedekind 分割构造无理数集合. #imcomplete 

## 实数域的性质

### 阿基米德性质

>[!note]- 对于任意 $x\in \mathbb{R}$ ，存在 $n\in \mathbb{N}$ 使得 $x<n$ .
>假设 $\exists x\in \mathbb{R},\forall n\in \mathbb{N}(x>n)$ ，进而可以得到 $\mathbb{N}$ 为有界集合，依据实数域的完备性可得，存在 $y\in \mathbb{R}$ 为 $\mathbb{N}$ 的最小上界，所以 $\exists n_0\in \mathbb{N},y-1<n$ 所以 $y<n+1$ ，与 $y$ 为 $\mathbb{N}$ 的上界矛盾.

### 自然数的良序性

### 有理数的稠密性

### 区间套定理

对于闭区间套： $$[a_1,b_1]\supset [a_2,b_2]\supset\cdots\supset[a_n,b_n]\supset\cdots$$ 有 $\bigcap_{n=1}^{\infty}[a_i,b_i]\neq\emptyset$

>[!note]- 证明
>注意到 $\{a_n\},\{b_n\}$ 均为有界集合，从而根据完备性， $\{a_n\}$ 有最小上界，记为 $c$ ，且 $c\leq b_n,\forall n\geq1$ ，所以可以得到 $a_n\leq c\leq b_n,\forall n\geq1$ ，所以 $\bigcap_{n=1}^{\infty}[a_i,b_i]\neq\emptyset$ .

# $\mathbb{R}^n$ 上

下面将 $\mathbb{R}$ 上的一些性质推广到 $\mathbb{R}^n$ 上.

首先证明一个引理：

>[!note]-  列紧集有界.
>假设 $A$ 为列紧集， $A$ 无界，任取 $a\in A$ ，则对于任意的 $n\in \mathbb{N}$ 存在 $a_n\in A:d(a,a_n)\geq n$ . 对于序列 $\{a_n\}_{n\geq1}$ ，由 $A$ 列紧，存在子列 $\{a_{n_k}\}_{k\geq1}$ ， $\{a_{n_k}\}\rightarrow b(k\rightarrow \infty)$ ，从而 $$d(a,b)\geq d(a,a_{a_k})-d(a_{n_k},b)\geq n_k-d(a_{n_k},b)\leq n-d(a_{n_k},b),\forall n\in \mathbb{N}$$ ，当 $k$ 足够大时， $d(a_{n_k},b)<1$ ，从而有 $d(a,b)\geq n-1,\forall n\in \mathbb{N}$ ，则 $d(a,b)=+\infty$ ，而 $d(a,b)\in \mathbb{R}$ 应为一确定实数，矛盾！所以列紧集 $A$ 有界.

下面这个定理类似于 Weierstrass Bounded 和 Weierstrass extreame value 定理.

>[!note]- Weierstrass 定理： $S\subset \mathbb{R}^n$ ， $S$ 有界. $f:\mathbb{R}^n\rightarrow \mathbb{R}$ 为连续函数. 则有以下结论：取 $y\in S$ ， 1) 如果 $T=\{x\in S:f(x)\geq f(y)\}$ 是列紧集，则 $f$ 在 $S$ 上取得上确界. 2) 如果 $T=\{x\in S:f(x)\leq f(y)\}$ 是列紧的，则 $f$ 在 $S$ 上取得下确界. 3) 如果 $S$ 是列紧的，则 $f$ 在 S 上取得上、下确界.
>证明：1,2 问都需要说明 $f(S)$ 是有上（下）界的，这点可以参考上面证明列紧集是有界集，利用反证法证之.
>1) 取 $u=\sup f(S)=\sup f(T)$ ，则存在 $\{x_n\}_{n\geq1}\subset T:f(x_n)>u-\frac{1}{n}$ ，因为 $T$ 列紧，所以存在子列 $\{x_{n_k}\}_{k\geq1}$ ，收敛于 $z\in T\subset S$ ，从而由 $f$ 为连续函数： $f(x_{n_k})>u-\frac{1}{n_k}$ ，取 $k\rightarrow \infty$ 可得 $f(z)\geq u$ ，所以 $f(z)=u$ . 则 $f$ 在 $S$ 上可以取得上确界.
>2) 取 $u=\inf f(X)=\inf f(T)$ ，则存在 $\{x_n\}_{n\geq1}\subset T:f(x_n)<u+\frac{1}{n}$ ，因为 $T$ 列紧，所以存在子列 $\{x_{n_k}\}_{k\geq1}$ ，收敛于 $z\in T\subset S$  ，从而由 $f$ 为连续函数： $f(x_{n_k})<u+\frac{1}{n_k}$ ，取 $k\rightarrow \infty$ 可得 $f(z)\leq u$ ，从而 $f(z)=u$ .
>3) 因为 $S$ 为列紧集，所以 $S$ 为有界集，则存在 $u=\sup S$ ，可取得数列 $\{x_n\}_{n\geq1}:f(x_n)>u-\frac{1}{n}$ ，由 $S$ 为列紧集可以取 $\{x_{n_k}\}\rightarrow z$ ，从而有 $f(z)=u$ ，取得下界同理.
