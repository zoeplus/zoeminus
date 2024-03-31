# 实数理论

## 实数域

实数域即为由 $(\mathbb{R},0,1,+,\cdot,\leq)$ 构成的一个完备的全序域. 域即为 $\mathbb{R}$ 关于 $+$ 构成交换群， $\mathbb{R}\backslash\{0\}$ 关于 $\cdot$ 构成交换群. 全序指的是 $\forall x,y\in \mathbb{R}((x\leq y)\wedge(y\leq x))$ ，完备指的是满足： $\mathbb{R}$ 中的有界子集一定有上确界（或者其他等价命题）. 最后简写为： $\mathbb{R}$

实数域也可以由集合构建，首先构建自然数集 $\mathbb{N}$ ： $$\begin{aligned}
&\emptyset \leftrightarrow 0\\
&\{\emptyset\}\leftrightarrow1\\
&\{\emptyset,\{\emptyset\}\}\leftrightarrow2\\
&\cdots
\end{aligned}$$ 构造方法由很多，这里是 $n+1=\{n,\{n\}\}$ 的形式，然后用有序对构造有理数集 $\mathbb{Q}$ ： $$\mathbb{Q}=\{(a,b):a\in \mathbb{N},b\in \mathbb{N}\backslash\{0\}\}$$ 最后用 Dedekind 分割构造无理数集合. #imcomplete 

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

