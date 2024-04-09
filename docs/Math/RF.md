# 引

引入实变函数的原因：

在极限与积分换序这一问题下Riemann积分的有不足之处 #issue . 需要引入Lebegue积分.

$$
\lim_{n\rightarrow \infty}\int_a^bf_n(x)dx\overset{?}{=}\int_a^b\lim_{n\rightarrow\infty}f_n(x)dx
$$
其中 $f_n(x)\rightarrow f(x),x\in X$ . 以下两个问题都可以转换为对该问题的讨论 #issue  ：

$$
\frac{d}{dx}\int_a^bf(x,y)dy\overset{?}{=}\int_a^b\frac{\partial{}}{\partial{x}}f(x,y)dy
$$

$$
\int_a^{+\infty} dx\int_c^{+\infty}f(x,y)dy\overset{?}{=}\int_c^{+\infty} dy\int_a^{+\infty}f(x,y)dx
$$

Lebegue积分是Riemann积分的推广，Riemann积分要求： $$\lim_{\max{\Delta T_i}\rightarrow0}\sum\limits_{k=1}^{n}\Delta T_kf(x_k)$$ 存在，即对于定义域进行划分后求和. Lebegue积分则对于值域进行划分然后求和： $$\lim_{\max\{y_k-y_{k-1}\}\rightarrow0}\sum\limits_{k=1}^{n}\lvert \{x:y_{k-1}<f(x)<y_k\}\rvert\cdot y_{k-1}$$ Lebegue积分在理论上有用，但实际计算时一般使用 Riemann积分. 

# 实数与集合

[实数理论](R.md) ，[集合论](Set.md)

测度：定义在 $\mathbb{R}$ 上. 也可以推广，例如 $\mathcal{F}$ 上的测度 $\mathcal{P}$ . 定义外测度以定义 Lebegue 测度，最终目标是 Lebegue 可测集，如何证明一个集合是可测的（2.5）.

测度是定义在集合上的，所以需要对集合有一定了解. 涉及到集合极限、像集和原像集、等价 / 基数、拓扑（但主要用到的是开集和闭集，注意 Cantor 集和 Cantor 函数）

>[!example]- $\mathbb{R}$ 上任一实函数的连续点全体为可数个开集的交.
>引入振幅函数： $w(I)\overset{def}{=}\sup_{x\in I}f(x)-\inf_{x\in I}f(x)$ . $w(x)\overset{def}{=}\lim_{\delta\rightarrow0^+}w(B(x,\delta))$ ，因为 $f$ 在 $x$ 点连续， $\Leftrightarrow w(x)=0$ . 下面考虑 $A=\bigcap_{n=1}^\infty\{x:w(x)<\frac{1}{n}\}$ ，证明 $A$ 为开集，首先证明 $B=\{x:w(x)<\frac{1}{n}\}$ 是开集： $\forall x_0\in B,\exists \delta_0,w(B(x,\delta_0))<\frac{1}{n}$ . 可以取 $\delta_1:B(x_0,\delta_n)\subset B(x,\delta_0)$ ，则 $B$ 为开集. 所以 $A$ （连续点全体）是可数个开集的交.

## 构成区间

下面讨论 $\mathbb{R}$ 上开集，首先定义**构成区间**：设 $E\subset \mathbb{R}$ 为开集，则若 $(a,b)\subset E$ 并且 $a,b\neq E$ ，则称 $(a,b)$ 为 $E$ 的构成区间.

>[!note]- 设 $X\subset \mathbb{R}$ 为开集， $\forall x\in X$ ，存在包含 $x$ 的 $E$ 的构成区间.
>证明：由 $E$ 为开集，可设 $a=\inf\{a':a'<x,(a',x)\subset E\}$ ， $b=\sup\{b':b'>x,(x,b')\subset b'\}$ . $\forall y\in (a,x)$ 由 $a$ 的定义可知 $(y,x)\subset E$ ，从而可知 $(a,x)\subset E$ ，同理可证 $(x,b)\subset E$ ，因此 $(a,b)\subset E$ ，如果 $a\in E$ ，则 $\exists \delta>0,(a-\delta,a+\delta)\subset E$ ，从而 $a-\frac{\delta}{2}\in E$ ，与 $a$ 的定义矛盾. 所以 $a\notin E$ ，同理可得 $b\notin E$ ，因此 $(a,b)$ 为 $E$ 的构造区间.

>[!note]- 任何一开集都可以表示为至多可数个<u>两两不交</u>的开区间的并.
>设 $E$ 为开集，对于任意 $x\in E$ ，存在构造区间 $I_x\ni x$ ，由构造区间的定义可知 $E=\cup_{x\in E}I_x$ . 而对于任意两个构造区间 $I_x=(a,b),I_y=(c,d),x\neq y$ ，若 $I_x\neq I_y$ ，则不妨设 $b<d$ 则 $b\leq c$ ，否则 $b\in (c,d)\subset E$ ，矛盾，因此两个构造区间要么不交要么重合. 下面说明构造区间的并为至多可数个：在每一个构造区间中取一有理数 $r_x\in I_x$ （重合的构造区间算作一个），进而得到一有理数集合 $\{r_x\}_{x\in I'}$ ，该有理数集合可以与可数集 $\mathbb{Q}\times \mathbb{Q}$ 的一个子集建立双射（还需要将每个有理数 $r_x$ 映射为 $(m,n):(m,n)=1$ ），从而至多可数. 从而得证.

设 $f:X\rightarrow \mathbb{R}$ .
$$\begin{aligned}
&\limsup_{x\rightarrow x_0}f(x)=\lim_{\epsilon\rightarrow 0}\sup\{f(x):x\in X\cap B(x_0,\epsilon)\backslash\{x_0\}\}\\
&\liminf_{x\rightarrow x_0}f(x)=\lim_{\epsilon\rightarrow 0}\inf\{f(x):x\in X\cap B(x_0,\epsilon)\backslash\{x_0\}\}
\end{aligned}$$

>[!note]- $G=[0,1]-C$ 的构成区间的长度和为 $1$ ，其中 $C$ 是 Cantor 集.
>由 $G$ 的定义即可直接得到. 计算 $\sum\limits_{n=1}^{\infty}\frac{2^{n-1}}{3^n}=1$ 

## 完备

定义**聚点**： $x\in E$ ，对于任意 $x$ 的邻域 $U$ ，若 $(U-\{x\})\cap E\neq\emptyset$ ，则称 $x$ 为 $E$ 的聚点. 显然聚点一定是附着点. 称聚点的全体为**导集**，记为 $E'$ . 定义非聚点的点为**孤立点**. 根据 [[GTopo#^Closure]] 中对于闭包的第二定义， $\bar{E}=E\cup E'$ .

根据聚点的定义有等价定义：若 $x$ 为 $E$ 的聚点，则 $\exists\{x_n\}_{n\geq1},x_n\neq x,x_n\rightarrow x(n\rightarrow \infty)$ .

>[!note]- 对于任意 $\mathbb{R}^n$ 中的集合 $E$ ， $E'$ 为闭集.
>证明：说明 $E'^c$ 为开集即可.

定义**完备集**：没有孤立点的闭集. 显然完备集有以下等价定义：

>[!note]- $E$ 是完备集等价于 $E=E'$ .

$\mathbb{R}$ 上的完备集还有以下等价刻画：

>[!note]- $F\subset \mathbb{R}$ 为完备集的充分必要条件为 $F^c$ 为至多可数个两两<u>没有公共端点</u>的开区间之并.
>证明：
> $\Rightarrow$ ： $F^c$ 为开集，从而可以表示为至多可数个两两不相交的开区间的并（[[#构成区间]]），假设存在公共端点，则 $F$ 中将会出现孤立点，矛盾！
>
> $\Leftarrow$ ：显然 $F$ 为闭集，并且若存在孤立点 $x\in F,x\notin F^c$ ，则存在 $U\ni x:U\backslash\{x\}\cap F^c\neq\emptyset$ ，从而 $x$ 为两个不交开区间的端点，矛盾！

因为 $G=[0,1]\backslash C$ 可以被表示为至多可数个（ $\bigcup_{n=1}^\infty \bigcup_{k=1}^{2^n-1}I_{n,k}$ ）两两不相交且没有公共端点的开区间之并，所以 

$$C=\mathbb{R}-(-\infty,0)-(1,\infty)-G$$ 
是完备集（此处需要说明， $G$ 中的开区间均不以 $0,1$ 为公共端点）.

另外更多关于 Cantor 集的性质见 [[GTopo#Cantor 集]] .

# Lebesgue 测度

首先定义**广义实数**： $\mathbb{R}\cup\{+\infty,-\infty\}$ ，定义运算： $\forall a\in \mathbb{R}$ $$\begin{aligned}
&a+(+\infty)=(+\infty)+a=+\infty,a+(-\infty)=(-\infty)+a=-\infty\\
&a-(+\infty)=-\infty,a-(-\infty)=+\infty\\
&(+\infty)-a=+\infty,(-\infty)-a=-\infty\\
&(+\infty)+(+\infty)=+\infty,(-\infty)+(-\infty)=-\infty\\
&a\cdot (+\infty)=(+\infty)\cdots a=\left\{\begin{aligned}
&+\infty,a>0\\
&0,a=0\\
&-\infty,a<0
\end{aligned}\right.\\
&a\cdot(-\infty)=(-\infty)\cdots a=\left\{\begin{aligned}
&-\infty,a>0\\
&0,a=0\\
&+\infty,a<0\\
\end{aligned}\right.\\
&(+\infty)\cdot(+\infty)=+\infty\\
&(-\infty)\cdot(-\infty)=-\infty\\
&(+\infty)\cdot(-\infty)=(-\infty)(+\infty)=-\infty\\
&\frac{1}{+\infty}=\frac{1}{-\infty}=0\\
&\frac{+\infty}{a}=+\infty(a\neq0)\\
&\frac{-\infty}{a}=-\infty(a\neq0)\\
\end{aligned}$$ 注意，上面没有定义 $(+\infty)+(-\infty)$ 的运算.

对于 $\mathbb{R}$ 中的区间 $I$ ，如果 $I$ 有界，则其左右端点 $(a,b)$ 一定满足： $a\neq-\infty,b\neq+\infty$ . 记 $l(I)=b-a$ ，如果 $I$ 是无界区间则定义 $l(I)=\infty$ .

对于 $\mathbb{R}$ 中的区间全体构成的集族，可以为其中的每一个元素定义长度（ $I\rightarrow \mathbb{R}^+\cup\{0,\infty\}$ 的一个映射），并且该长度具有一些性质；下面考虑的问题是，对于一般的 $\mathbb{R}$ 中的子集，如何定义其“长度”. 考虑 $\mathbb{R}$ 上的集族 $\Omega$ ，希望该集族类似于区间也具有如下性质：

$\Omega1)$ 所有的区间都是 $\Omega$ 中的元素；
$\Omega2)$ $E\in \Omega$ ， $E^c=\mathbb{R}-E\in \Omega$ ；
$\Omega3)$ $\Omega$ 中任意至多可数个元素的并仍然在 $\Omega$ 中； ^LebesgueMesurableSet

并且由 2,3 可以推出 $\Omega$ 中任意至多可数个元素的交仍然在 $\Omega$ 中.

对于长度（以下称为测度） $m$ 希望其具有如下性质：

$m1)$ $\forall E\in \Omega,m(E)$ 为非负广义实数；
$m2)$ $m$ 保持区间长度：对于任意区间 $I\in \Omega,m(I)=l(I)$ ； 
$m3)$ $\{E_n\}_{n\geq1}$ 是 $\Omega$ 中一两两不相交的集合列，则 $m\left(\bigcup_{n\geq1}E_n\right)=\sum\limits_{n=1}^{\infty}m(E_n)$ .

下面尝试用区间上已经定义的长度定义 $m$ . 首先引入**外测度**的概念，在此基础上定义测度和 $\Omega$ .

## Lebesgue 外测度

对于任意的 $E\subset \mathbb{R}$ ，定义 $E$ 的**外测度**为： 

$$m^*(E)=\inf\left\{\sum\limits_{n=1}^{\infty}l(I_n):E\subset \bigcup_{n=1}^\infty I_n,I_n\ \text{是开区间, }\forall n\geq1\right\}$$

显然 $m^*(E)$ 为非负广义实数，满足 $m1)$ . 下面来讨论 $m^*$ 的性质.

>[!note]- 对任意至多可数点列 $E=\{x_n\}_{n\geq1}\subset \mathbb{R}$ ， $m^*(E)=0$ . 进一步可得 $\mathbb{R}$ 中任何至多可数集的外测度为 $0$ .
>证明：对于任意的 $\epsilon>0$ ，对任意 $x_n$ 存在区间 $I_n=\left(x_n-\frac{\epsilon}{2^{n+1}},x_n+\frac{\epsilon}{2^{n+1}}\right)\ni x_n$ ，并且 $\sum\limits_{n=1}^{\infty}l(I_n)=\epsilon$ ，从而可得 $m^*(E)\leq \epsilon$ ，由 $\epsilon$ 的任意性，结合 $m^*(E)\geq0$ 可得 $m^*(E)=0$ .
>^AtMostZero

>[!note]- 单调性：若 $E_1\subset E_2$ ，则 $m^*(E_1)\leq m^*(E_2)$ .
>证明：对任意 $E_2$ 的开覆盖 $\{I_n\}_{n\geq1}$ 显然其也为 $E_1$ 的开覆盖，因此有： $$m^*(E_1)\leq \sum\limits_{n=1}^{\infty}l(I_n)$$ 由有开覆盖的任意性，取下确界可得 $m^*(E_1)\leq m^*(E_2)$ .

下面说明定义的外测度满足 $m2)$ .

>[!note]- 对任意区间 $I\in \Omega,m^*(I)=l(I)$ .
>证明：首先考虑有界闭区间 $I=[a,b]$ ，设 $\{I_n\}_{n\geq1}$ 为 $I$ 的一个开覆盖，则由紧集的性质可得存在有限子覆盖 $\{I_{n_k}\}_{1\leq k\leq m}$ ，从而有 $l^(I)\leq \sum\limits_{k=1}^{m}l(I_{n_k})\leq \sum\limits_{n=1}^{\infty}l(I_n)$ ，取下确界即可得到 $l(I)\leq m^*(I)$ . 另一方面，取 $I\subset (a-\epsilon/2,b+\epsilon/2)$ ，由外测度的单调性可知 $m^*(I)\leq \epsilon+b-a$ ，由 $\epsilon$ 的任意性， $m^*(I)\leq l(I)$ ，综上 $m^*(I)=l(I)$ .
>
>考虑有界半开半闭区间 $I=(a,b]$ ，注意到 $m^*(I)\leq m^*([a,b])$ ，并取 $[a+\epsilon,b]\subset I$ ，可得 $m^*(I)\geq b-a-\epsilon$ ，由 $\epsilon$ 的任意性可得 $m^*(I)=m^*([a,b])$ ，从而有 $m^*(I)=l(I)$ . （注意这里区间长度的定义只算端点，不考虑开闭） $I=[a,b)$ 以及有界开区间 $I=(a,b)$ 同理.
>
>设 $I$ 为无界区间 $[a,+\infty)$ ，则对于任意 $b>a$ 有 $m^*(I)\geq b-a$ ，令 $b\rightarrow \infty$ 可得 $m^*(I)=\infty$ .

已经说明了外测度满足 $m1),m2)$ ，但是不足以保证其具有 $m3)$ ，只能证明下面的次可加性（下面的条件没有要求两两不交）：

>[!note]- 设 $\{E_n\}_{n\geq1}$ 是 $\mathbb{R}$ 上的一子集族，则 $m^*(\cup_{n=1}^\infty E_n)\leq \sum\limits_{n=1}^{\infty}m^*(E_n)$ .
>不妨设 $m^*(E_n)\neq \infty,\forall \epsilon>0,n\geq1$ ，存在 $\{I_n^k\}_{k\geq1}$ 满足 $E_n\subset \bigcup_{k\geq1}I_n^k$ 同时 $\sum\limits_{k=1}^{\infty}l(I_n^k)<m^*(E_n)+\frac{\epsilon}{2^n}$ . 从而有： $$\begin{aligned}
>m^*(\cup_{n=1}^\infty E_n)&\leq m^*\left(\bigcup_{n=1}^\infty \bigcup_{k=1}^\infty I_n^k\right)\leq \sum\limits_{n=1}^{\infty}\sum\limits_{k=1}^{\infty}m^*(I_n^k)\\
>&\leq \sum\limits_{n=1}^{\infty}m^*(E_n)+\frac{\epsilon}{2^n}=\sum\limits_{n=1}^{\infty}m^*(E_n)+\epsilon
>\end{aligned}$$ 再由 $\epsilon$ 的任意性可得 $m^*(\bigcup_{n=1}^\infty E_n)\leq \sum\limits_{n=1}^{\infty}m^*(E_n)$ .

## Lebesgue 可测集和 Lebesgue 测度

为了定义满足 $m3)$ 的测度，将 $\mathbb{R}$ 进行如下限制：定义 **Lebesgue 可测集** $E$ ，对于任意 $A\subset \mathbb{R}$ 有： $m^*(A)\geq m^*(A\cap E)+m^*(A\cap E^c)$ . 并且由外测度本身的性质可得 $m^*(A)=m^*(A\cap E)+m^*(A\cap E^c)$ .

Lebesgue 测度具有可数可加性 $m3)$ .




>[!note]- 设可测集列 $\{E_n\}_{n\geq1}$ ，若该集列单增或者 单减且 $m(E_1)<\infty$ ，则有 $\lim_{n\rightarrow \infty}m(E_n)=m(\lim_{n\rightarrow \infty}E_n)$

证明：若 $\{E_n\}_{n\geq1}$ 单增，注意到 $m(\lim_{n\rightarrow \infty}E_n)\geq m(E_k),\forall k\geq1$ ，因此不妨设 $m(\lim_{n\rightarrow \infty}E_n)<\infty$ ，则：

$$\begin{aligned}
m(\lim_{n\rightarrow \infty}E_n)&=m\left(\bigcup_{n\geq1}E_n\right)\\
&=m\left(\bigcup_{n\geq1}(E_n-E_{n-1})\cup E_0\right)\\
&=\sum\limits_{n\geq1}^{}m(E_n-E_{n-1})+m(E_0)\\
&=\lim_{n\rightarrow \infty}m(E_n)
\end{aligned}$$

其中 $E_0=\emptyset$ .

若 $\{E_n\}_{n\geq1}$ 单调递减，则 $\{E_1-E_n\}_{n\geq1}$ 单调递增，所以 

$$\begin{aligned}
m(\lim_{n\rightarrow \infty}(E_1-E_n))
&=m(E_1-\cap_{n\geq1}E_n)\\
&=m(E_1)-m(\cap_{n\geq1}E_n)\\
&=\lim_{n\rightarrow \infty}m(E_1-E_n)\\
&=m(E_1)-\lim_{n\rightarrow \infty}m(E_n)
\end{aligned}$$

并且因为 $m(E_1)<\infty$ ，所以 $\lim_{n\rightarrow \infty}m(E_n)=m(\cap_{n\geq1}E_n)=m(\lim_{n\rightarrow \infty}E_n)$ .
^MonotonousLimit

## 可测集的变换

设 $E\subset \mathbb{R},y\in \mathbb{R}$ 称 $E_y=\{x+y:x\in E\}$ 为 $E$ 关于 $y$ 的**平移**.

容易得到 $E\cap F_y=(E_{-y}\cap F)_y$ ， $(E^c)_y=(E_y)^c$ .

注意到对于区间 $I_y$ ， $l(I_y)=l(I)$ ，平移的一个非常重要的性质是不改变外测度.

>[!note]- $m^*(E)=m^*(E_y)$ .
>证明：对于任意的 $\epsilon>0$ ，存在开区间列 $\{I_n\}_{n\geq1}$ ， $\bigcup_{n\geq1}I_n\supset E\Rightarrow\bigcup_{n\geq1}(I_n)_y\supset E_y$ ，从而 $m^*(E_y)\leq \sum\limits_{n\geq1}^{}l(I_n)<m^*(E)+\epsilon$ ，所以 $m^*(E_y)\leq m^*(E)$ ，同理可得 $m^*(E)\leq m^*(E_y)$ .

在此基础上可以证明测度也保持平移不变：

>[!note]- 设 $E$ 是可测集，则 $\forall y\in \mathbb{R},E_y$ 也可测并且 $m(E)=m(E_y)$ .
>证明：对任意的 $A\subset \mathbb{R},y\in \mathbb{R}$ ， 
>
>$$\begin{aligned}
>m^*(A)&=m^*(A_{-y})\\
>&\geq m^*(A_{-y}\cap E)+m^*(A_{-y}\cap E^c)\\
>&\overset{*}{=}m^*(A\cap E_y)+m^*(A\cap E_u^c)
>\end{aligned}$$
>
>$\overset{*}{=}$ 依赖于平移的两个性质. 所以 $E_y$ 也可测. $m(E_y)=m^*(E_y)=m^*(E)=m(E)$ .

对于仿射变换也有这一结论：

>[!note]- $E\subset \mathbb{R}$ 可测，则 $\forall a,b\in \mathbb{R},F=aE+b$ 也可测，并且 $m(F)=\lvert a\rvert m(E)$ .
>证明：为证明 $F$ 可测只需要证明 $G=aE$ 可测. 首先讨论 $m^*(aA)$ ，对于任意的 $A\subset \mathbb{R},a\in \mathbb{R}$ ，对于任意 $\epsilon>0$ ，存在开区间列 $\{I_n\}_{n\geq1}$ ，使得 $\bigcup_{n\geq1}aI_n\supset aA$ ， $\sum\limits_{n\geq1}^{}\lvert a\rvert l(I_n)=\sum\limits_{n\geq1}^{}l(aI_n)<\lvert a\rvert m^*(A)+\lvert a\rvert\epsilon$ ，从而可得 $m^*(aA)<\lvert a\rvert m^*(A)+\epsilon \lvert a\rvert$ ，进而由 $\epsilon$ 的任意性的 $m^*(aA)\leq \lvert a\rvert m^*(A)$ ；并且 $m^*(A)=m^*(a^{-1}aA)\leq \lvert a\rvert^{-1}m^*(aA)$ 从而可得 $m^*(aA)=\lvert a\rvert m^*(A)$ .
>
>$$\begin{aligned}
>m^*(a^{-1}A)&\geq m^*(a^{-1}A\cap E)+m^*(a^{-1}A\cap E^c)\\
>&=m^*(a^{-1}(A\cap aE))+m^*(a^{-1}(A\cap aE^c))\\
>&=\lvert a\rvert^{-1}m^*(A\cap aE)+\lvert a\rvert^{-1}m^*(A\cap aE^c)
>\end{aligned}$$
>
>从而可得结论.

下面来说明可测集的子集并不一定可测，首先引入 **Vitali 集**的概念： $E(x)=\{y\in[0,1]:\exists x,y-x\in \mathbb{R}\}$ . 显然 $[0,1]=\bigcup_{x\in [0,1]}E(x)$ ，并且对于任意的 $x_1\neq x_2$ ， $E(x_1)=E(x_2)$ 或者 $E(x_1)\cap E(x_2)=\emptyset$ . 因此可以构造 $F\subset [0,1]$ ， $\forall f_1,f_2\in F$ ， $E(f_1)\cap E(f_2)=\emptyset$ . 下面证明 $F$ 是 $[0,1]$ 的不可测子集，利用可测集的可数可加性进行反证.

设 $\{r_n\}_{n\geq1}=\mathbb{Q}\cap [0,1]$ ，考虑 $F$ 的平移 $F_{r_n}\overset{def}{=}F_n$ ，由 $F$ 的定义可知 $F_m\cap F_n=\emptyset,\forall m\neq n$ ，从而由可数可加性和平移保持测度， $m\left(\bigcup_{n\geq1}F_n\right)=\sum\limits_{n\geq1}^{}m(F)$ . 又 $[0,1]\subset \bigcup_{n\geq1}F_n\subset [0,2]$ ，所以 $1\leq \sum\limits_{n\geq1}^{}m(F)\leq 2$ ，这说明 $m(F)\neq0$ ，从而 $\sum\limits_{n\geq1}^{}m(F)=\infty$ 矛盾！ 

所以 $F$ 是不可测子集.

类似地，有如下结论：

>[!note]- 测度集为正测当且仅当其存在不可测子集. 

证明： $\Rightarrow$ ：假设 $G$ 是正测集，考虑 Vatali 集 $E(x)$ ，则 $\mathbb{R}=\bigcup_{x\in \mathbb{R}}E(x)$ ，同样存在 $F\subset \mathbb{R}$ 使得 $\mathbb{R}=\bigcup_{x\in F}E(x)$ 并且 $F$ 中任意两个集合

## 开闭集逼近可测集

以下三个命题等价：

>[!note]- 等价命题： 1) $E$ 是可测集；2) 对于任意的 $\epsilon>0$ 存在开集 $G\supset E$ 使得 $m(G\backslash E)<\epsilon$ ；3) 对于任意的 $\epsilon>0$ ，存在闭集 $F\subset E$ 使得 $m(E\backslash F)<\epsilon$ .
>证明： $1)\Rightarrow 2)$ 因为 $E$ 是可测集， <u>i)</u> 若 $m(E)<\infty$ 则对于任意的 $\epsilon>0$ 由定义可知存在 $\{I_n\}_{n\geq1},G=\bigcup_{n\geq1}I_n\supset E$ 满足 $m(G)\leq \sum\limits_{n\geq1}^{}m(I_n)<m(E)+\epsilon$ ，所以 $m(G\backslash E)\leq m(G)-m(E)<\epsilon$ <u>ii)</u> 若 $m(E)=\infty$ ，则取 $E=\bigcup_{n\in \mathbb{Z}}E\cap [n,n+1)\overset{def}{=}\bigcup_{n\geq1}E_n$ ，其中 $E_n$ 均为可测集，所以存在开集 $G_n\supset E_n,m(G_n\backslash E_n)<\frac{\epsilon}{2^{\lvert n\rvert+2}}$ 从而可得 $m(\bigcup_{n\in \mathbb{Z}}G_n\backslash E)=m\left(\bigcup_{n\in \mathbb{Z}}(G_n\backslash E_n)\right)\leq \sum\limits_{n\in \mathbb{Z}}^{}m(G_n\backslash E_n)\leq2\frac{\epsilon}{4}/\frac{1}{2}=\epsilon$ ，从而可得到结论；
>
> $2)\Rightarrow 3)$ $E^c$ 是可测集，所以存在开集 $W\supset E^c$ 使得 $m(W\backslash E^c)<\epsilon$ ，令 $F=W^c\subset E$ ，注意到 $m(W\backslash E^c)=m(F^c\cap E)=m(E\backslash F)<\epsilon$ ； 
>
>$3)\Rightarrow1)$ 对于任意的 $n\geq1$ ，存在闭集 $F_n\subset E$ 使得 $m(E\backslash F_n)<\frac{1}{n}$ ，令 $F=\bigcup_{n\geq1}F_n$ ，可得 $m(E\backslash F)\leq m(E\backslash F_n)<\frac{1}{n},\forall n\geq1$ ，所以 $m(E\backslash F)=0$ ， $E\backslash F$ 可测，所以 $E=E\backslash F\cup F$ 可测.

这个命题想当有用，除了逼近之外，下面证明一个重要结论，之后用其说明任何一个可测集都存在一个不可测子集.

>[!note]- 若 $E\subset \mathbb{R}^n$ 可测并且 $m(E)>0$ ，则存在 $\delta>0$ ， $B(0,\delta)\subset E-E$ .

证明：首先证明若 $F\subset \mathbb{R}^n$ $F$ 可测并且 $F$ 是紧集则存在 $\delta>0,B(0,\delta)\subset F-F$ ，因为 $F$ 可测所以存在开集 $G\supset F$ 使得 $m(G)<2m(F)$ ，并且 $G^c\cap F=\emptyset$ ，则 $\delta=d(G^c,F)>0$ （这里严格大于 $0$ ，因为两者都是闭集，否则可以构造 $G^c$ 和 $F$ 中的一个子列 $\{g_n\}_{n\geq1},\{f_n\}_{n\geq1},\lim_{n\rightarrow \infty}d(g_n,f_n)=0$ ，并且 $F$ 存在收敛子列 $\{f_{n_i}\}_{i\geq1},f_{n_i}\rightarrow f\in F(i\rightarrow \infty)$ 从而可得 $\{g_{n_i}\}_{i\geq1}$ 收敛到 $f$ ，再由闭集的定义可知 $f\in G^c$ 矛盾！）.

断言：对任意 $x\in \mathbb{R}^n:\lVert x\rVert<\delta$ 有 $F_x\subset G$ （ $K_x$）

---

定义 $G_\delta$ 集： $E\in G_\delta\Leftrightarrow$ $E$ 能表示为可数个开集的交；定义 $F_\delta$ 集： $E\in F_\delta\Leftrightarrow$ $E$ 能表示为可数个闭集的并；

## 等测包


## Borel $\sigma-$ 代数

设 $\mathcal{F}$ 为 $X$ 上的集族，考虑如下三条性质：

1. $\mathcal{F}$ 对于补运算封闭；
2. $\mathcal{F}$ 对于有限并运算封闭；

如果 $\mathcal{F}$ 满足 1. 2. ，则称 $\mathcal{F}$ 为**代数**；如果 $\mathcal{F}$ 满足 1. 2. ，同时对可数并运算封闭（可以推出对有限并运算封闭），则称 $\mathcal{F}$ 是 $\sigma-$ 代数（可以证明 $\sigma-$ 代数是代数）.

设 $\mathcal{F}$ 为 $X$ 上的子集族，记 $A(\mathcal{F})$ 为包含 $\mathcal{F}$ 的所有<u>代数</u>的交，为包含 $\mathcal{F}$ 的最小代数；记 $B(\mathcal{F})$ 为包含 $\mathcal{F}$ 的所有 $\sigma-$ 代数的交，称为由 $\mathcal{F}$ 生成的 $\sigma-$ 代数.

定义 Borel $\sigma-$ 代数：由 $\mathbb{R}$ 上的开区间全体生成的 $\sigma-$ 代数，记为 $\mathcal{B}$ 或 $\mathcal{B}(\mathbb{R})$ ，并称 $\mathcal{B}$ 中的元素为**Borel 集**. 

因为 $\mathbb{R}$ 上的开（闭）集都是至多可数个开（闭）区间的并（交），所以 $\mathbb{R}$ 上的开集和闭集都是 Borel 集. 但是也存在既非开集也非闭集的 Borel 集，例如 $U\cap V^c$ 其中 $U,V$ 为开集并且 $U\subset V$ .

而由 Lebesgue 可测集的性质可知其也为 $\sigma-$ 代数，所以 $\mathcal{B}\subset \Omega$ ，因此 Borel 集可测.

因为 $\mathbb{R}$ 中的开区间是 Lebesgue 可测集，并且至多可数个可测集的并仍然可测，所以 $\mathcal{B}\subset \Omega$ .

>[!note]- Borel $\sigma-$ 代数是包含所有端点为有理数的开区间的最小 $\sigma-$ 代数.
>证明：显然 Borel $\sigma-$ 代数为包含所有端点为有理数的开区间的 $\sigma-$ 代数. 对于任意的 $a,b\in \mathbb{R},a<b$ ，取 $\{r_n\}_{n\geq1},\{R_n\}_{n\geq1}\subset \mathbb{Q}$ ，且 $r_n\rightarrow a,R_n\rightarrow b,r_n<\frac{a+b}{2}<R_n$ . 从而可得 $(a,b)=\sum\limits_{n=1}^{\infty}(r_n,R_n)$ . 因此，任何包含所有端点为有理数的开区间的 $\sigma-$ 代数都为所有开区间生成的 $\sigma-$ 代数. 再由 $\mathcal{B}$ 是由所有开区间生成的最小的 $\sigma-$ 代数可得到结论.

>[!note]- 任意多个 ( $\sigma-$ ）代数的交仍然为（ $\sigma-$ ）代数.

>[!example]- 任意多个（ $\sigma-$ ）代数的并不一定是（ $\sigma-$ ）代数.
>考虑 $X=\{1,2,3\}$ ， $\mathcal{F}_1=\{\emptyset,X,\{1\}\},\mathcal{F}_2=\{\emptyset,X,\{2,3\}\}$ ，则 $\mathcal{F}_1$ 和 $\mathcal{F}_2$ 均为（ $\sigma-$ ）代数，但是 $\mathcal{F}_1\cup \mathcal{F}_2$ 不是 ( $\sigma-$ ）代数.

下面这个定理是为了进一步讨论非 Borel 集的可测集.

>[!note]- 设 $h$ 为 $\mathbb{R}$ 上的<u>严格</u>单调连续函数，则 $h$ 将 Borel 集映射为 Borel 集.
>证明：令 $\mathcal{B}^*=\{B:B,h(B)\text{ 均为 Borel 集}\}$ ，下面证明 $\mathcal{B}^*=\mathcal{B}$ ，对于任意的 $B\in \mathcal{B}^*$ ， $B^c\in \mathcal{B}$ ，因为 $h$ 是 $\mathbb{R}$ 上的严格单调连续函数，所以 $h(B^c)=h(\mathbb{R})-h(B)$ （事实上， $h$ 保持并运算，首先有 $h(\mathbb{R})=h(B^c\cup B)=h(B^c)\cup h(B)$ ，其次因为 $h$ 是严格单调映射（是单射），所以 $h(B^c)\cap h(B)=\emptyset$ ，所以 $h(B^c)=h(\mathbb{R})-h(B)$ ）. 注意到 $h(\mathbb{R})$ 和 $h(B)$ 都是 Borel 集（前者是开区间），从而可得 $h(B^c)$ 是 Borel 集. 所以 $B^c\in \mathcal{B}^*$ . 设 $\{B_n\}_{n\geq1}\subset \mathcal{B}^*$ ，则 $h\left(\bigcup_{n=1}^\infty B_n\right)=\bigcup_{n=1}^\infty h(B_n)$ ，所以 $h\left(\bigcup_{n=1}^\infty B_n\right)\in \mathcal{B}$ ，进而可知 $h\left(\bigcup_{n=1}^\infty B_n\right)\in \mathcal{B}^*$ ，所以 $\mathcal{B}^*$ 是一个 $\sigma-$ 代数. 此外因为 $h$ 是 $\mathbb{R}$ 上的严格单调连续函数，将开区间映射为开区间，所以开区间全体也在 $\mathcal{B}^*$ 中. 所以 $\mathcal{B}\subset \mathcal{B}^*$ ，并且 $\mathcal{B}^*\supset \mathcal{B}$ ，所以 $\mathcal{B}=\mathcal{B}^*$ .

已知 Borel 集都是可测集，但也存在不是 Borel 集的可测集：

考虑 [[GTopo#Cantor 集]] 上的 Cantor 函数 $f$ ，其在 $[0,1]$ 上单调递增且连续. 令 $g(x)=f(x)+x$ ，则 $g$ 为 $[0,1]$ 上的严格单调递增函数，并且 $g([0,1])=[0,2]$ . $m\left(g\left(\bigcup_{n,k}I_{n,k}\right)\right)=\sum\limits_{n,k}^{}m(g(I_{n,k}))$ . 设 $f(I_{n,k})=c_{n,k}$ ，则 $g(I_{n,k})=c_{n,k}+I_{n,k}$ ，所以 $m(g(I_{n,k}))=l(I_{n,k})$ （可测集平移测度不变），所以 $m\left(g\left(\bigcup_{n,k}I_{n,k}\right)\right)=\sum\limits_{n,k}^{}l(I_{n,k})=1$ . 所以 

$$m(g(C))=m(g([0,1]-\cup_{n,k}I_{n,k}))=m(g[0,1])-m(g(\cup _{n,k}I_{n,k}))=1$$

因为 $g(C)$ 是正测度集，所以可以构造 $g(C)$ 的不可测子集 $E$ ， $g^{-1}(E)\subset C$ . 而 $m^*(g^{-1}(E))\leq m^*(C)=0$ ，所以 $g^{-1}(E)$ 可测. 如果 $g^{-1}(E)$ 是 Borel 集，则由 $g$ 是严格单调连续递增函数， $E=g(g^{-1}(E))$ 也是 Borel 集，矛盾！

## $\mathbb{R}^n$ 中的 Lebesgue 测度和可测集

下面这个命题符合直观上的面积概念.

>[!note]- 设 $P\subset \mathbb{R}^n,Q\subset \mathbb{R}^m$ ，若 $P,Q$ 可测，则 $P\times Q$ 可测，并且 $m(P\times Q)=m(P)m(Q)$.
>证明：1) 若 $P,Q$ 为 $\mathbb{R}^n,\mathbb{R}^m$ 中的长方体，则 $P\times Q$ 可测，并且 $m(P\times Q)=m(P)m(Q)$ ；2) 若 $P,Q$ 分别为 $\mathbb{R}^n,\mathbb{R}^m$ 中的开集，则存在长方体集族 $\{I_n^p\}_{n\geq1},\{I_n^q\}_{n\geq1}$  其中 $\{I_n^p\}_{n\geq1},\{I_n^q\}_{n\geq1}$ 中的元素分别两两不交， $P\times Q=\bigcup_{n\geq1}I_n^p\times \bigcup_{n\geq1}I_n^q=\bigcup_{m\geq1}\bigcup_{n\geq1}I_m^p\times I_n^q$ 可测，并且 $m(P\times Q)=\sum\limits_{m,n\geq1}^{}m(I_m^p\times I_n^q)=\sum\limits_{m\geq1}^{}m(I_m^p)\sum\limits_{n\geq1}^{}m(I_n^p)$ 从而可得结论；3) 若 $P,Q$ 为一般可测集并且有限，为了证明 $P\times Q$ ，试图说明对于任意的 $\epsilon>0$ 存在 $G_p\times G_q\supset P\times Q\supset F_p\times F_q$ ，其中 $G_p\times G_q,F_p\times F_q$ 分别为开、闭集，满足 $m(G_p\times G_q-F_p\times F_q)<\epsilon$ ，利用 [[Set#^ProductMinus]] 中的结论有：
>
>$$\begin{aligned}
>m(G_p\times G_q-F_p\times F_q)&=m((G_p-F_p)\times G_q\cup(G_q-F_q)\times G_p)\\
>&\leq m((G_p-F_p)\times G_q)+m((G_q-F_q)\times G_p)\\
>\end{aligned}$$
>
>而因为因为 $P,Q$ 是可测集，所以对于任意的 $\epsilon>0$ 存在 $G_p\supset P\supset F_p,G_q\supset Q\supset F_q$ ，使得 $m(G_p\backslash F_p)<\epsilon,m(G_q\backslash F_q)<\epsilon$ $m(G_p)<m(P)+\epsilon_1,m(G_q)<m(Q)+\epsilon$ ，并且 $G_p\backslash F_p,G_q\backslash F_q$ 均为开集，从而由 2) 的结论可得： 
>
>$$\begin{aligned}
>m(G_p\times G_q-F_p\times F_q)\leq \epsilon(m(P)+m(Q)+2\epsilon)
>\end{aligned}$$
>
>由 $\epsilon$ 的任意性，并且 $m(P),m(Q)<\infty$ ，可得 $P\times Q$ 可测. 由上面得到的结论，对于任意的 $\epsilon>0$ 存在 $G_p,G_q$ ， $m(G_p\times G_q)-m(P\times Q)\leq \epsilon$ ，从而：
> 
>$$\begin{aligned}
>m(P)m(Q)-\epsilon &\leq m(G_p)m(G_q)-\epsilon\\
>&=m(G_p\times G_q)-\epsilon\\
>&\leq m(P\times Q)\leq m(G_p\times G_q)\\
>&= m(G_p)m(G_q)\\
>&<(m(P)+\epsilon)(m(Q)+\epsilon)
>\end{aligned}$$
>
>再由 $\epsilon$ 的任意性可得 $m(P)m(Q)=m(P\times Q)$ ；4) 对于一般的可测集采取截断法：注意到 $P=\bigcup_{k\geq1}P\cap[-k,k]^n\overset{def}{=}\bigcup_{k\geq1}P_k$ ，并且 $m(P_k)<\infty$ 从而可得：> >
>$$\begin{aligned}
>m(P\times Q)&=m\left(\bigcup_{n\geq1}P_n\times Q_n\right)\\
>&\overset{*}{=}\lim_{n\rightarrow \infty}m(P_n\times Q_n)\\
>&=\lim_{n\rightarrow \infty}m(P_n) m(Q_n)\\
>&\overset{*}{=}m(P)m(Q)
>\end{aligned}$$
>
>其中 $\overset{*}{=}$ 的成立是因为 $\{P_n\}_{n\geq1},\{Q_n\}_{n\geq1},\{P_n\times Q_n\}_{n\geq1}$ 是单调递增的有限可测集. [[RF#^MonotonousLimit]] .

# 可测函数

设 $f:\mathbb{R}\rightarrow \mathbb{R}$ 的定义域为 $D$ ， $D$ 为可测集，如果 $\forall \alpha\in \mathbb{R},\{x\in D:f(x)>\alpha\}\overset{def}{=}\{f>\alpha\}$ 是可测集，则称 $f$ 为定义在 $D$ 上的可测函数.

>[!example] 常值函数是可测函数，若 $f(x)\equiv c,\text{dom}(f)=D$ ，则 $\{f>\alpha\}=\left\{\begin{aligned}&\emptyset,\alpha\geq c\\&D,\alpha<c\end{aligned}\right.$

>[!example]+ 定义在区间 $D$ 上的连续函数是可测函数.
>证明：当 $D$ 是开区间时，因为 $f$ 连续，所以 $\{f>\alpha\}=f^{-1}((\alpha,+\infty))$ 是开集，所以 $\{f>\alpha\}$ 可测；对于一般的区间 $D$ 注意到 $\{x\in D^\circ:f(x)>\alpha\}$ 是可测的，并且 $D\backslash D^\circ$ 至多只有两个点，因此也是可测的（[[RF#^AtMostZero]]），所以 $D$ 可测.

>[!example] 可测集的特征函数 $\chi_D$ 可测. $\{\chi_D>\alpha\}=\left\{\begin{aligned}&\emptyset,\alpha\geq1\\&D,0\leq \alpha<1\\&\mathbb{R},\alpha<0\end{aligned}\right.$

可测函数的定义不是唯一的，有下列等价：

>[!note]- 等价命题： 1) $f$ 在 $D$ 上可测；2) $\{f\geq \alpha\}$ 可测；3) $\{f<\alpha\}$ 可测；4) $\{f\leq \alpha\}$ 可测.
>证明： $1)\rightarrow 2)$ $\{f\geq \alpha\}=\bigcap_{n\geq1}\{f>\alpha-\frac{1}{n}\}$ 可测； $2)\rightarrow 3)$ $\{f<\alpha\}=D-\{f\geq \alpha\}$ 可测； $3)\rightarrow4)$ $\{f\leq \alpha\}=\bigcap_{n\geq1}\{f<\alpha+\frac{1}{n}\}$ 可测； $4)\rightarrow 1)$ $\{f>\alpha\}=D-\{f\leq \alpha\}$ 可测.

据此可得若 $f$ 为可测函数，则 $-f$ 也为可测函数.

进一步有以下集合也可测：

- $\{f=\lambda\}=\{f\geq \lambda\}-\{f>\lambda\},\lambda\in \mathbb{R}$ ，以及 $\{f=-\infty\}=\cup_{n\geq1}\{f<-n\},\{f=\infty\}$ ；
- $\{\alpha<(\leq)f<(\leq)\beta\}$ ；

若 $f,g$ 均为 $D$ 上的可测函数，则下列集合为可测集，记 $\mathbb{Q}=\{r_n\}_{n\geq1}$ ：

- $\{f>g\}$ ：因为 $\{f>g\}=\bigcup_{n\geq1}(\{f>r_n\}\cap \{g<r_n\})$ ，以及 $\{f\geq g\}$；
- $\{f=g\},\{f<(\leq)g\}$ ；

$f+g,f-g$ 也是 $D'$ 上的可测函数：由 $\{f+g>\alpha\}=\bigcup_{n=1}^\infty\{f>r_n\}\cap \{g>\alpha-r_n\}$ ，注意此处 $f+g$ 的定义域为 $D-$；

以及 $\{\sup_{n\geq1}f_n>\alpha\}=\bigcup_{n=1}^\infty\{f_n>\alpha\}$ ， $\{\inf_{n\geq1}f_n<\alpha\}=\bigcup_{n=1}^\infty \{f_n<\alpha\}$ ； $\varlimsup_{n\rightarrow \infty}f_n(x)=\inf_{n\geq1}\sup_{k\geq n}f_k(x)$ ， $\varliminf_{n\rightarrow \infty}f_n(x)=\sup_{n\geq1}\inf_{n\geq n}f_k(x)$ $\sup f_n,\inf f_n,\varlimsup f_n,\varliminf f_n$ 均为可测函数. 若 $\{f_n\}$ 存在极限，则 $\lim_{n\rightarrow \infty}f_n$ 也为可测函数.
