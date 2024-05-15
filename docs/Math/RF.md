# 依赖与简介

[实数理论](R.md) ，[集合论](Set.md)中关于集合的势以及特殊集合（如 Cantor ）集.

引入实变函数的原因：

在极限与积分换序这一问题下 Riemann 积分的有不足之处 #issue . 需要引入 Lebegue 积分.

$$\lim_{n\rightarrow \infty}\int_a^bf_n(x)dx\overset{?}{=}\int_a^b\lim_{n\rightarrow\infty}f_n(x)dx$$

其中 $f_n(x)\rightarrow f(x),x\in X$ . 以下两个问题都可以转换为对该问题的讨论 #issue  ：

$$
\frac{d}{dx}\int_a^bf(x,y)dy\overset{?}{=}\int_a^b\frac{\partial{}}{\partial{x}}f(x,y)dy
$$

$$
\int_a^{+\infty} dx\int_c^{+\infty}f(x,y)dy\overset{?}{=}\int_c^{+\infty} dy\int_a^{+\infty}f(x,y)dx
$$

Lebegue 积分是 Riemann 积分的推广， Riemann 积分要求： 

$$\lim_{\max{\Delta T_i}\rightarrow0}\sum\limits_{k=1}^{n}\Delta T_kf(x_k)$$

存在，即对于定义域进行划分后求和. Lebegue积分则对于值域进行划分然后求和： 

$$\lim_{\max\{y_k-y_{k-1}\}\rightarrow0}\sum\limits_{k=1}^{n}\lvert \{x:y_{k-1}<f(x)<y_k\}\rvert\cdot y_{k-1}$$

Lebegue积分在理论上有用，但实际计算时一般使用 Riemann 积分. 

# 实数与集合

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

>[!hint] 上面这一定理在实变中说明任何开集都是可测集.

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

首先定义**广义实数**： $\mathbb{R}\cup\{+\infty,-\infty\}$ ，定义运算： $\forall a\in \mathbb{R}$ 

$$\begin{aligned}
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
\end{aligned}$$

>[!hint] 广义实数中定义了 $0$ 和 $\infty$ 的乘积，结果为 $0$ ，并没有考虑阶数.

注意，上面没有定义 $(+\infty)+(-\infty)$ 的运算，之后可能需要刨掉某些定义域. e.g. [[#^fAddGMeasurable]]

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

>[!summary]+ 自查表
>- 可测集的定义；

为了定义满足 $m3)$ 的测度，将 $\mathbb{R}$ 进行如下限制：定义 **Lebesgue 可测集** $E$ ，对于任意 $A\subset \mathbb{R}$ 有： $m^*(A)\geq m^*(A\cap E)+m^*(A\cap E^c)$ . 并且由外测度本身的性质可得 $m^*(A)=m^*(A\cap E)+m^*(A\cap E^c)$ .

Lebesgue 测度具有可数可加性 $m3)$ .

>[!note]- 设可测集列 $\{E_n\}_{n\geq1}$ ，若该集列单增或者 单减且 $m(E_1)<\infty$ ，则有 $\lim_{n\rightarrow \infty}m(E_n)=m(\lim_{n\rightarrow \infty}E_n)$
>证明：若 $\{E_n\}_{n\geq1}$ 单增，注意到 $m(\lim_{n\rightarrow \infty}E_n)\geq m(E_k),\forall k\geq1$ ，因此不妨设 $m(\lim_{n\rightarrow \infty}E_n)<\infty$ ，则：
>
>$$\begin{aligned}
>m(\lim_{n\rightarrow \infty}E_n)&=m\left(\bigcup_{n\geq1}E_n\right)\\
>&=m\left(\bigcup_{n\geq1}(E_n-E_{n-1})\cup E_0\right)\\
>&=\sum\limits_{n\geq1}^{}m(E_n-E_{n-1})+m(E_0)\\
>&=\lim_{n\rightarrow \infty}m(E_n)
>\end{aligned}$$
>
>其中 $E_0=\emptyset$ .
>
>若 $\{E_n\}_{n\geq1}$ 单调递减，则 $\{E_1-E_n\}_{n\geq1}$ 单调递增，所以 
>> >$$\begin{aligned}
>m(\lim_{n\rightarrow \infty}(E_1-E_n))
>&=m(E_1-\cap_{n\geq1}E_n)\\
>&=m(E_1)-m(\cap_{n\geq1}E_n)\\
>&=\lim_{n\rightarrow \infty}m(E_1-E_n)\\
>&=m(E_1)-\lim_{n\rightarrow \infty}m(E_n)
>\end{aligned}$$
>
>并且因为 $m(E_1)<\infty$ ，所以 $\lim_{n\rightarrow \infty}m(E_n)=m(\cap_{n\geq1}E_n)=m(\lim_{n\rightarrow \infty}E_n)$ .
>^MonotonousLimit

>[!note]- 零测集可测.

>[!example]- 设 $F$ 是 $[0,1]$ 中的不可测集，求证：存在 $0<\epsilon<1$ ，使对 $[0,1]$ 中任何满足 $m(E)\geq \epsilon$ 的可测集 $E$ ， $F\cap E$ 也是不可测集.
>反证：假设对于任意的 $n\geq 1$ ，存在 $E_n$ 满足 $m(E_n)\geq 1-1/n$ ， $E_n$ 为可测集，而 $F\cap E_n$ 为可测集，令 $E=\bigcup_{n\geq1}E_n$ ，从而 $m(E)\geq m(E_n)\geq1-1/n,\forall n\geq1$ ，从而可得 $m(E)=1$ ，所以 $m(F\cap E^c)\leq m(E^c)=0$ ，从而 $F\cap E^c$ 可测，并且 $F\cap E=\cap_{n\geq1}(F\cap E_n)$ 可测，所以 $F=(F\cap E^c)\cup (F\cap E)$ 可测，矛盾！

>[!example]- 设集合 $E\subset \mathbb{R}$ ，对于任意的可测集 $A$ 有 $m(A)=m^*(A\cap E)+m^*(A\cap E^c)$ ，求证 $E$ 可测.
>证明：欲证 $m^*(E)\geq m^*(E\cap D)+m^*(E\cap D^c),\forall D\subset \mathbb{R}$ ；对于任意集合 $D\subset \mathbb{R}$ 对任意的 $\epsilon>0$ ，存在 $\{I_n\}_{n\geq1}\supset D$ 使得 $D\subset \bigcup_{n\geq1}I_n$ 并且 $\sum\limits_{n\geq1}^{}l(I_n)<m^*(D)+\epsilon$ ，则令 $A=\bigcup_{n\geq1}I_n$ 从而可得：
>
>$$\begin{aligned}
>m^*(D)+\epsilon &>\sum\limits_{n\geq1}^{}l(I_n)\\
>&\geq m(A)=m^*(A\cap E)+m^*(A\cap E^c)\\
>&\geq m^*(D\cap E)+m^*(D\cap E^c)
>\end{aligned}$$
>
>由 $\epsilon$ 的任意性可得 $m^*(D)\geq m^*(D\cap E)+m^*(D\cap E^c)$ ，所以 $E$ 是可测集.

>[!example]- 设 $f:\mathbb{R}\rightarrow \mathbb{R}$ 具有连续的一阶导数，记 $A=\{x\in \mathbb{R}:f'(x)=0\}$ ，求证 $m^*(f(A))=0$ .

证明：考虑 $\{(f(x)-\epsilon,f(x)+\epsilon)\}_{x\in A}$ ，假设对于任意的 $\epsilon>0$ ，存在 $I_x\cap I_y\ni z$ ，则

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

下面来说明可测集的子集并不一定可测.

定义 $E(x)=\{y\in[0,1]:\exists x,y-x\in \mathbb{R}\}$ . 显然 $[0,1]=\bigcup_{x\in [0,1]}E(x)$ ，并且对于任意的 $x_1\neq x_2$ ， $E(x_1)=E(x_2)$ 或者 $E(x_1)\cap E(x_2)=\emptyset$ . 因此可以构造 $F\subset [0,1]$ ， $\forall f_1,f_2\in F$ ， $E(f_1)\cap E(f_2)=\emptyset$ . 下面证明 $F$ 是 $[0,1]$ 的不可测子集，利用可测集的可数可加性进行反证.

设 $\{r_n\}_{n\geq1}=\mathbb{Q}\cap [0,1]$ ，考虑 $F$ 的平移 $F_{r_n}\overset{def}{=}F_n$ ，由 $F$ 的定义可知 $F_m\cap F_n=\emptyset,\forall m\neq n$ （否则 $x=r_n+x'=r_m+x'',E(x')=E(x'')$ 矛盾！），从而由可数可加性和平移保持测度， $m\left(\bigcup_{n\geq1}F_n\right)=\sum\limits_{n\geq1}^{}m(F)$ . 又 $[0,1]\subset \bigcup_{n\geq1}F_n\subset [0,2]$ ，所以 $1\leq \sum\limits_{n\geq1}^{}m(F)\leq 2$ ，这说明 $m(F)\neq0$ ，从而 $\sum\limits_{n\geq1}^{}m(F)=\infty$ 矛盾！ 

所以 $F$ 是不可测子集.

>[!example]- 设 $E\subset [0,1]$ 可测，并且 $m(E)>0$ ，求证：存在 $x,y\in E$ 使得 $\lvert x-y\rvert$ 为正有理数.
>证明：假设对任意 $x,y\in E,x\neq y$ ， $\lvert x-y\rvert\in \mathbb{R}\backslash \mathbb{Q}$ ，设 $\mathbb{Q}\cap[0,1]=\{r_n\}_{n\geq1}$ ，令 $E_n=E_{r_n}$ ，如果 $E_n\cap E_{m}\neq \emptyset,x\in E_n\cap E_m$ 则存在 $x'\in E_n,x''\in E_m,x=x'+r_n=x''+r_m$ 从而 $x'-x''=r_n-r_m\in \mathbb{Q}^+$ 矛盾！故 $E_n\cap E_m=\emptyset,\forall n,m\geq1,n\neq m$ . 考虑 $\bigcup_{n\geq1}E_n\subset[0,2]$ ，则 $m(\cup_{n\geq1}E_n)\leq 2$ ，而 $m(\cup_{n\geq1}E_n)=\sum\limits_{n\geq1}^{}m(E_n)=\sum\limits_{n\geq1}^{}m(E)=\infty$ （由 $m(E)>0$ ）矛盾！综上存在 $x,y\in E,\lvert x-y\rvert\in \mathbb{Q}^+$ .

>[!example]- （这个命题还可以更强，但都是一个思路）设 $E\subset[0,1]$ 可测并且 $m(E)>0$ ，求证：存在 $x,y\in E,n,k\in \mathbb{N},\lvert x-y\rvert=\frac{k}{2^n}$ .

类似地，有如下重要结论 [check-mse](https://math.stackexchange.com/questions/1287212/non-measurable-subset-of-a-positive-measure-set)：

>[!note]- 可测集正测当且仅当其存在不可测子集. 
>证明： $\Rightarrow$ 若 $m(G)$ 可测，设 $E_r=\{p\in \mathbb{R}:p-r\in \mathbb{R}\backslash \mathbb{Q}\cup \{0\}\}$  ，则 $\mathbb{R}=\bigcup_{r\in \mathbb{Q}}E_r$ （对于任意一个无理数，一定存在有理数使两者之差为无理数），下面考虑 $G=G\cap \mathbb{R}=\bigcap_{r\in \mathbb{Q}}G\cap E_r$ ，假设 $E_r\cap G$ 可测（ $\forall r\in \mathbb{Q}$ ），

>则存在包含于 $E_r\cap G-E_r\cap G$ 的开区间 $B(0,\delta)$ ，然而对于任意的 $y_1,y_2\in E_r$ ，如果 $y_1-y_2\in \mathbb{Q}$ ，则 $y_1-r=y_1-y_2+y_2-r\in \mathbb{R}\backslash \mathbb{Q}$ #issue 

>[!example]- 设 $f(x)$ 定义在 $\mathbb{R}$ 上，并且对于任何可测集 $E$ ， $f(E)$ 可测，求证：对于任何零测集 $Z$ ， $f(Z)$ 也是零测集.
>证明：假设存在零测集 $Z$ ， $m(f(Z))>0$ ，则存在 $f(Z)$ 的不可测子集 $G$ ，而 $m(Z)=0$ ， $G\subset f(Z)$ ，从而<u>有</u> $Z$ 的子集 $W$ 使得 $G=f(W)$ ，而且 $m^*(f(W))\leq m^*(f(Z))=0$ ，从而可得 $f(W)$ 可测，矛盾！ 

>[!example]- 设 $f(x)$ 在 $\mathbb{R}$ 上连续，求证： $f$ 将任何可测集映射为可测集的充分必要条件为 $f$ 将任何零测集映射为零测集.
>证明： $\Rightarrow$ 由上一题给出； $\Leftarrow$ ： 对于任意的有界闭集 $F\subset \mathbb{R}$ ， $f(F)$ 仍然为有界闭集（由 $f$ 连续，以及闭集的等价刻画：收敛列仍然在闭集中）；如果 $F$ 为无界闭集，则 $f(F)=\bigcup_{n\geq1}f(F\cap [-n,n])$ 可测，所以 $f(F)$ 可测. 对于任意的 $\epsilon>0$ ，存在 $F\in F_\sigma$ 使得 $m^*(E\backslash F)=0$ ，从而 $f(E\backslash F)$ 是零测集，可测，并且 $f(F)$ 可测，所以 $f(E)=f(E\backslash F)\cup f(F)$ 可测.

## 开闭集逼近可测集

以下三个命题等价：

>[!note]- 等价命题： 1) $E$ 是可测集；2) 对于任意的 $\epsilon>0$ 存在开集 $G\supset E$ 使得 $m(G\backslash E)<\epsilon$ ；3) 对于任意的 $\epsilon>0$ ，存在闭集 $F\subset E$ 使得 $m(E\backslash F)<\epsilon$ .
>证明： $1)\Rightarrow 2)$ 因为 $E$ 是可测集， <u>i)</u> 若 $m(E)<\infty$ 则对于任意的 $\epsilon>0$ 由定义可知存在 $\{I_n\}_{n\geq1},G=\bigcup_{n\geq1}I_n\supset E$ 满足 $m(G)\leq \sum\limits_{n\geq1}^{}m(I_n)<m(E)+\epsilon$ ，所以 $m(G\backslash E)\leq m(G)-m(E)<\epsilon$ <u>ii)</u> 若 $m(E)=\infty$ ，则取 $E=\bigcup_{n\in \mathbb{Z}}E\cap [n,n+1)\overset{def}{=}\bigcup_{n\geq1}E_n$ ，其中 $E_n$ 均为可测集，所以存在开集 $G_n\supset E_n,m(G_n\backslash E_n)<\frac{\epsilon}{2^{\lvert n\rvert+2}}$ 从而可得 $m(\bigcup_{n\in \mathbb{Z}}G_n\backslash E)=m\left(\bigcup_{n\in \mathbb{Z}}(G_n\backslash E_n)\right)\leq \sum\limits_{n\in \mathbb{Z}}^{}m(G_n\backslash E_n)\leq2\frac{\epsilon}{4}/\frac{1}{2}=\epsilon$ ，从而可得到结论；
>
> $2)\Rightarrow 3)$ $E^c$ 是可测集，所以存在开集 $W\supset E^c$ 使得 $m(W\backslash E^c)<\epsilon$ ，令 $F=W^c\subset E$ ，注意到 $m(W\backslash E^c)=m(F^c\cap E)=m(E\backslash F)<\epsilon$ ； 
>
>$3)\Rightarrow1)$ 对于任意的 $n\geq1$ ，存在闭集 $F_n\subset E$ 使得 $m(E\backslash F_n)<\frac{1}{n}$ ，令 $F=\bigcup_{n\geq1}F_n$ ，可得 $m(E\backslash F)\leq m(E\backslash F_n)<\frac{1}{n},\forall n\geq1$ ，所以 $m(E\backslash F)=0$ ， $E\backslash F$ 可测，所以 $E=E\backslash F\cup F$ 可测.

这个命题相当有用，除了逼近之外，可以通过闭集和开集进行论证. 下面就用该命题证明一个重要结论，在上面用其说明任何一个可测集都存在一个不可测子集. [check-mse](https://math.stackexchange.com/questions/84491/does-the-set-of-differences-of-a-lebesgue-measurable-set-contains-elements-of-at/104126#104126)

>[!note]- 若 $E\subset \mathbb{R}^n$ 可测并且 $m(E)>0$ ，则存在 $\delta>0$ ， $B(0,\delta)\subset E-E$ .
>证明：首先证明若 $F\subset \mathbb{R}^n$ ， $F$ 可测并且 $F$ 是紧集，则存在 $\delta>0,B(0,\delta)\subset F-F$ ，因为 $F$ 可测所以存在开集 $G\supset F$ 使得 $m(G)<2m(F)$ ，并且 $G^c\cap F=\emptyset$ ，令 $\delta=d(G^c,F)>0$ （这里 $\delta$ 严格大于 $0$ ，因为两者都是闭集，否则可以构造 $G^c$ 和 $F$ 中的一个子列 $\{g_n\}_{n\geq1},\{f_n\}_{n\geq1},\lim_{n\rightarrow \infty}d(g_n,f_n)=0$ ，并且 $F$ （因为是 $\mathbb{R}$ 上的紧集，所以序列紧. 见 [[GTopo#紧]] ）存在收敛子列 $\{f_{n_i}\}_{i\geq1},f_{n_i}\rightarrow f\in F(i\rightarrow \infty)$ 从而可得 $\{g_{n_i}\}_{i\geq1}$ 收敛到 $f$ ，再由闭集的定义可知 $f\in G^c$ 矛盾！）.
>
>断言：对任意 $x\in \mathbb{R}^n:\lVert x\rVert<\delta$ 有 $F_x\subset G$ ，否则，假设存在 $x:\lVert x\rVert<\delta$  存在 $f\in F_x\cap G^c$ ，则 $f=f'+x=g'\in G^c,f'\in F$ ，进而 $d(G^c,F)\leq \lVert g'-f'\rVert=\lVert x\rVert<\delta$ ，矛盾！
>
>现在已经有 $F\subset G,F_x\subset G,\forall x:\lVert x\rVert<\delta$ ，所以 $F\cup F_x\subset G$ ，如果 $F\cap F_x= \emptyset$ ，则 $m(G)\geq m(F\cup F_x)=2m(F)$ ，矛盾！所以 $F\cap F_x\neq \emptyset$ . 对于任意的 $x\in B(0,\delta),\lVert x\rVert<\delta$ ，所以存在 $f\in F\cap F_x,f=f'+x$ ，所以 $x=f-f'\in F-F$ . 所以 $B(0,\delta)\subset F-F$ .
>
>下面讨论一般的集合 $E:m(E)>0$ ，截断： $E=\bigcup_{n\geq1}B(0,n)\cap E$ ，则存在 $G=B(0,m)\cap E$ ， $m(G)>0$ ，存在闭集 $F\subset G$ 使得 $0<m(G)/2< m(F)$ （ $m(G\backslash F)<m(F)\rightarrow 0<m(G)<2m(F)$），注意到 $F$ 为有界闭集，所以有上面的结论可知，存在 $\delta>0$ ， $B(0,\delta)\subset F-F\subset G-G\subset E-E$ .

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

设 $f:\mathbb{R}\cup\{\pm \infty\}\rightarrow \mathbb{R}\cup\{\pm \infty\}$ 的定义域为 $D$ ， $D$ 为可测集，如果 $\forall \alpha\in \mathbb{R},\{x\in D:f(x)>\alpha\}\overset{def}{=}\{f>\alpha\}$ 是可测集，则称 $f$ 为定义在 $D$ 上的**可测函数**.

>[!note] $f$ 在 $D$ 上可测， $D_1$ 为 $D$ 的可测子集，则 $f$ 在 $D_1$ 上可测.
> $\{x\in D_1:f>\alpha\}=\{f>\alpha\}\cap D_1$ 可测.

>[!example] 常值函数是可测函数：若 $f(x)\equiv c,\text{dom}(f)=D$ ，则 $\{f>\alpha\}=\left\{\begin{aligned}&\emptyset,\alpha\geq c\\&D,\alpha<c\end{aligned}\right.$ .

>[!example]+ 定义在区间 $D$ 上的连续函数是可测函数.
>证明：因为 $f$ 连续，所以 $\{f>\alpha\}=f^{-1}((\alpha,+\infty))$ 是开集，所以 $\{f>\alpha\}$ 可测；对于一般的区间 $D$ 注意到 $\{x\in D^\circ:f(x)>\alpha\}$ 是可测的，并且 $D\backslash D^\circ$ 至多只有两个点，因此也是可测的（[[RF#^AtMostZero]]），所以 $D$ 可测.

>[!example] 若 $f(x)$ 沿着可测集 $D$ 连续，则 $f$ 在 $D$ 上可测.
>证明： $\{x\in D:f>\alpha\}=f^{-1}((\alpha,+\infty))\cap D$ ，并且 $f^{-1}((\alpha,+\infty))$ 为 $\mathbb{R}$ 的中开集，进而可测，所以 $\{x\in D:f>\alpha\}$ 为可测集，所以 $f$ 在 $D$ 上可测.

>[!example] 可测集的特征函数 $\chi_D$ 可测： $\{\chi_D>\alpha\}=\left\{\begin{aligned}&\emptyset,\alpha\geq1\\&D,0\leq \alpha<1\\&\mathbb{R},\alpha<0\end{aligned}\right.$ .

可测函数的定义不是唯一的，有下列等价定义：

>[!note]- 等价命题： 1) $f$ 在 $D$ 上可测；2) $\{f\geq \alpha\}$ 可测；3) $\{f<\alpha\}$ 可测；4) $\{f\leq \alpha\}$ 可测.
>证明： $1)\rightarrow 2)$ $\{f\geq \alpha\}=\bigcap_{n\geq1}\{f>\alpha-\frac{1}{n}\}$ 可测； $2)\rightarrow 3)$ $\{f<\alpha\}=D-\{f\geq \alpha\}$ 可测； $3)\rightarrow4)$ $\{f\leq \alpha\}=\bigcap_{n\geq1}\{f<\alpha+\frac{1}{n}\}$ 可测； $4)\rightarrow 1)$ $\{f>\alpha\}=D-\{f\leq \alpha\}$ 可测.

据此可得若 $f$ 为可测函数，则 $-f$ 也为可测函数.

进一步有以下集合也可测：

- $\{f=\lambda\}=\{f\geq \lambda\}-\{f>\lambda\},\lambda\in \mathbb{R}$ ，以及 $\{f=-\infty\}=\cup_{n\geq1}\{f<-n\},\{f=\infty\}$ ；
- $\{\alpha<(\leq)f<(\leq)\beta\}$ ， $\alpha\in\mathbb{R}\cup -\infty,\beta\in \mathbb{R}\cup \infty$ ；

若 $f,g$ 均为 $D$ 上的可测函数，则下列集合为可测集，记 $\mathbb{Q}=\{r_n\}_{n\geq1}$ ：

- $\{f>g\}$ ：因为 $\{f>g\}=\bigcup_{n\geq1}(\{f>r_n\}\cap \{g<r_n\})$ ，以及 $\{f\geq g\}$；进而可以得到 $\max\{f,g\}=\{f\geq g\}\cup\{g>f\}$ 也是可测的；进而 $f$ 的正部 $\max\{f,0\}$ 和负部 $\max\{-f,0\}$ 可测；从而 $\lvert f\rvert=f^++f^{-}$ 也可测； ^fGreaterThanGMeasurable
- $\{f=g\},\{f<(\leq)g\}$ ；从而可得 $\min\{f,g\}$ 也是可测的；

注： $\{f>g\}$ 是可测的这一命题很有用，在之后处理收敛一类的命题是可保证构造的集合是可测的，例如 [[#^Egoroff]]

$f+g,f-g$ 也是 $D'$ 上的可测函数：由 $\{f+g>\alpha\}=\bigcup_{n=1}^\infty\{f>r_n\}\cap \{g>\alpha-r_n\}$ （证明：若 $x\in \{f+g>\alpha\}$ ，则 $\exists r_n\in \mathbb{Q},f(x)>r_n>\alpha-g(x)$ ，并且 $g(x)>\alpha-r_n$ ，另一方面显然），注意为保持定义的合理性（广义实数没有定义 $-\infty+\infty$ ） $f+g$ 的定义域为 $D-(\{f=-\infty\}\cap\{g=+\infty\})-(\{f=+\infty\}\cap\{g=-\infty\})$ ； ^fAddGMeasurable

若 $\{f_n\}_{n\geq1}$ 是可测函数，则 $\{\sup_{n\geq1}f_n>\alpha\}=\bigcup_{n=1}^\infty\{f_n>\alpha\}$ ， $\{\inf_{n\geq1}f_n<\alpha\}=\bigcup_{n=1}^\infty \{f_n<\alpha\}$ ；从而 $\varlimsup_{n\rightarrow \infty}f_n(x)=\inf_{n\geq1}\sup_{k\geq n}f_k(x)$ ， $\varliminf_{n\rightarrow \infty}f_n(x)=\sup_{n\geq1}\inf_{n\geq n}f_k(x)$ $\sup f_n,\inf f_n,\varlimsup f_n,\varliminf f_n$ 均为可测函数. 若 $\{f_n\}$ 存在极限，则 $\lim_{n\rightarrow \infty}f_n$ 也为可测函数.

>[!hint] 以上，证明一个函数是可测函数可以找一处处收敛于该函数的可测函数列（i.e. 连续函数、简单函数）.

>[!example]- $f$ 是可测集 $D$ 上的可测函数， $m(\{f>\alpha\})$ 为 $\alpha$ 的右连续函数， $m(\{f<\alpha\})$ 为 $\alpha$ 的左连续函数；进一步， $m(\{f\geq \alpha\})$ 为 $\alpha$ 的左连续函数， $m(\{f\leq \alpha\}$ 为 $\alpha$ 的右连续函数.
>证明：令 $g(\alpha)=m(\{f>\alpha\})$ ，则 $g(\alpha+1/n)=g(\alpha)-m(\{1/n+\alpha\geq f>\alpha\})$ . 注意到集列 $\{1/n+\alpha\geq f>\alpha\}_{n\geq1}$ 单调递减并且不妨设 $m(1+\alpha\geq f>\alpha)$ 有限（否则 $m\{f>\alpha+1/n\}=m\{f>\alpha\}\equiv\infty$ ），所以：
>
>$$\begin{aligned}
>\lim_{n\rightarrow \infty}(g(\alpha+1/n))&=g(\alpha)-\lim_{n\rightarrow \infty}m(\{1/n+\alpha\geq f>\alpha\})\\
>&=g(\alpha)-m(\lim_{n\rightarrow \infty}\{1/n+\alpha\geq f>\alpha\})\\
>&=g(\alpha)-m(\emptyset)=g(\alpha)
>\end{aligned}$$
>
>由 $g$ 单调，所以 $g$ 关于 $\alpha$ 右连续，同理可得 $m(\{f<\alpha\})$ 关于 $\alpha$ 左连续.
>
>另一方面，若 $D$ 为有限集，令 $g(\alpha)=m(\{f\geq \alpha\})$ ，则：
>
>$$\begin{aligned}
>\lim_{n\rightarrow \infty}g(\alpha-1/n)&=g(\alpha)+\lim_{n\rightarrow \infty}m(\alpha>f\geq \alpha-1/n)\\
>&=g(\alpha)
>\end{aligned}$$
>
>又 $g(\alpha)$ 单调，所以 $g(\alpha)$ 关于 $\alpha$ 左连续，同理可得另一个；

>[!example]- 如果对于任意 $[\alpha,\beta]\subset (a,b)$ ， $f(x)$ 在 $[\alpha,\beta]$ 上可测，则 $f(x)$ 在 $(a,b)$ 上可测.
>证明：由题可知，对于任意的 $a\in \mathbb{R}$ ， $\{x\in[a-1/n,b+1/n]:f(x)>a\}$ 为可测集，进而可得 $\{x\in(a,b):f(x)>a\}=\bigcup_{n\geq1}\{x\in[a-1/n,b+1/n]:f(x)>a\}$ 可测. 所以 $f(x)$ 在 $(a,b)$ 上可测.

>[!example]- 设 $f$ 定义在可测集 $D$ 上，如果 $f^2$ 在 $D$ 上可测并且 $\{f>0\}$ 是可测集，求证： $f$ 在 $D$ 上可测.
>证明：对任意 $\alpha<0$ ， $\{x\in D:f(x)^2>\alpha^2\}$ 为可测集，所以 $\{x\in D:f(x)<\alpha\}\cup \{x\in D:f(x)>-\alpha\}$ 为可测集，所以 $\{x\in D:\alpha\leq f(x)\leq -\alpha\}$ 为可测集，又 $\{f>0\}$ 是可测集，所以 $\{x\in D:0<f(x)\leq -\alpha\}$ 是可测集，所以 $\{f>-\alpha\}$ 是可测集.

定义**几乎处处成立**：若 $D-E=\{x\in D:P(x)\}$ ，其中 $E\subset D$ 为一零测集，则称性质 $P(x)$ 在 $D$ 上几乎处处成立，记为 $P(x)\ a.e.\ x\in D$ .

>[!example] $\sin x$ 在 $\mathbb{R}$ 上几乎处处非 $0$ ， $\sin^nx$ 在 $\mathbb{R}$ 上几乎处处收敛于 $0$ .

>[!example] $\chi_\mathbb{Q}$ 在 $\mathbb{R}$ 上几乎处处为 $0$ （由 $m(\mathbb{Q})=0$ ）.

定义**简单函数**：设 $f$ 为可测集 $D$ 上的一个可测函数，若 $f(D)=\{a_1,\cdots,a_n\},n<\infty$ ，则称 $f$ 为 $D$ 上的简单函数；

若令 $E_k=\{f=a_k\},1\leq k\leq n$ 则 $E_k$ 为可测集并且 $f=\sum\limits_{1\leq k\leq n}^{}a_k\chi_{E_k}$ . 并且 $\forall \lambda\in \mathbb{R}$ ， $\lambda f,\lvert f\rvert,f^+,f^-$ 也是简单函数，若 $g$ 为简单函数，则 $g\pm f,\max(\min)\{f,g\},fg$ 也为简单函数.  显然：

>[!note] 简单函数是可测函数.

反之，若 $f=\sum\limits_{k=1}^{n}a_k\chi_{E_k}$ 并且 $E_k$ 为两两不交的<u>可测集</u>，则 $f$ 为 $D$ 上的简单函数.

下面这个定理说明任何一个可测函数都可以由简单函数逼近. 进而，因为非负简单函数是可积的，通过适当的定义可以使得可测函数可积.

>[!note]- 设 $f$ 为可测集 $D$ 上的可测函数，则存在 $D$ 上的简单函数列 $\{f_n\}_{n\geq1}$ 逐点收敛到 $f(x)$ . 并且： 1) 当 $f\geq0$ 时，存在逐点单调递增的函数列 $\{f_n\}_{n\geq1}$ 收敛到 $f$ ；2) 当 $f$ 有界时，存在函数列 $\{f_n\}_{n\geq1}$ 一致收敛到 $f$ .
>证明：令：
>
> $$f_n(x)=\left\{\begin{aligned}
>&n,f(x)\geq n\\
>&\frac{k-1}{2^n},\frac{k-1}{2^n}\leq f(x)<\frac{k}{2^n},k=-n2^n+1,\cdots,n2^n\\
>&-n,f(x)<-n
>\end{aligned}\right.$$
>
>对任意 $x\in D$ ，若 $f(x)=(-)\infty$ ，则 $f_n(x)=(-)n$ ，从而 $f_n\rightarrow f(n\rightarrow \infty)$ ；若 $f(x)\in \mathbb{R}$ 则 $\lvert f_n-f\rvert\leq \frac{1}{2^n}$ ，从而 $f_n\rightarrow f(n\rightarrow \infty)$ .
>
>若 $f\geq0$ ， $\forall x\in D$ ，若 $f(x)=\infty$ ，则 $f_n(x)=n$ ， $\{f_n\}_{n\geq1}$ 单调递增；若 $f(x)<\infty$ ，则存在 $k\in \mathbb{N},k\leq f(x)<k+1$ ，分成两段对于 $f_n$ 讨论，当 $n\leq k$ 时 $f_n(x)=n$ 递增，当 $n>k$ 时，显然 $f_n>f_k$ ，且对于任意的 $n>k$ ，存在 $k_n$ 使得：
>
>$$\frac{2k_n-2}{2^{n+1}}=\frac{k_n-1}{2^n}\leq f(x)<\frac{k_n}{2^n}=\frac{2k_n}{2^{n+1}}$$
>
>如果 $f(x)\in\left[\frac{2k_n-2}{2^{n+1}},\frac{2k_n-1}{2^{n+1}}\right)$ ，由 $-(n+1)2^{n+1}+1=-n2^{n+1}\leq2k_n-2\leq n2^{n+1}-2\leq (n+1)2^{n+1}$  ，可得 $f_{n+1}(x)=\frac{2k_n-2}{2^{n+1}}$ ，从而 $f_{n+1}(x)=f_n(x)$ ，若 $f(x)\in \left[\frac{2k_n-1}{2^{n+1}},\frac{2k_n}{2^{n+1}}\right)$ ，同理可验证 $f_{n+1}(x)>f_n(x)$ ，所以 $\{f_n\}_{n\geq1}$ 单调递增；
>
>若 $f$ 有界，设 $\lvert f\rvert<M$ ，则当 $n>M$ 时，因为 $\{f\geq n\}=\emptyset=\{f<-n\}$ ，所以 $\lvert f_n-f\rvert<\frac{1}{2^n}$ ，从而 $\{f_n\}_{n\geq 1}$ 一致收敛于 $f$ .

据此，根据 $\lim_{n\rightarrow \infty}f_n$ 仍可测，可以从有收敛的简单函数列证明：若 $f,g$ 为可测集 $D$ 上的可测函数， $\forall \lambda\in \mathbb{R}$ ， $\lambda f,\lvert f\rvert,fg$ 均为可测函数.

>[!example]- 设 $f(x_1,x_2)\in C(\mathbb{R}^2)$ ， $g_1(t),g_2(t)$ 为 $[a,b]$ 上的实值可测函数，求证： $f(g_1(t),g_2(t))$ 为 $[a,b]$ 上的可测函数.
>证明：存在简单函数列 $\{g_{1,n}\}_{n\geq1},\{g_{2,n}\}_{n\geq1}$ 分别逐点收敛到 $g_1,g_2$ ，又 $f\in C(\mathbb{R}^2)$ ，所以 $f(g_{1,n},g_{2,n})$ 逐点收敛到 $g_1,g_2$ 并且 $f(g_{1,n},g_{2,n})$ 为简单函数，所以 $f(g_1,g_2)$ 为 $[a,b]$ 上的可测函数.
>
>其中，关于 $f(g_{1,n},g_{2,n})$ 为可测函数：首先 $f(g_{1,n},g_{2,n})$ 只能取有限值，不妨记为 $\{a_1,\cdots,a_n\}$ ，并且 $f(g_{1,n},g_{2,n})=a_i$ ，则存在有限个值 $\{b_{1,1},\cdots,b_{1,n_1}\}$ 和 $\{b_{2,1},\cdots,b_{2,n_2}\}$ 作为 $g_{1,n},g_{2,n}$ 的取值，因此 $\{f(g_{1,n},g_{2,n})=\bigcup_{i=1}^{n_1}D_{1,i}\cup \bigcup_{i=1}^{n_2}D_{2,i}$ 为可测集. 证明是简单函数并不要求 $f$ 连续.

利用这一结论可以从 $\mathbb{R}$ 得到 $\mathbb{R}^2$ 上的可测函数.

>[!example]- 设 $f,g$ 都在 $\mathbb{R}$ 上可测，求证： $f(x)g(y)$ 在 $\mathbb{R}^2$ 上可测.
>证明： $h(x,y)=xy\in \mathbb{R}^2$ ，进而 $h(f,g)$ 可测. 

>[!hint]+ 约定
>以下，若 $f$ 在 $D-E$ 上可测， $m(E)=0$ ，则无论 $f$ 在 $E$ 上是否有定义，均称 $f$ 在 $D$ 上可测. 在这个约定下，如果使 $f+g$ 无意义（e.g. $f=-\infty,g=\infty$ ）的点全体为零测集，则可以忽略. 以上只是约定.

由上定理可得推论：

>[!note]- 可测函数列几乎处处收敛的极限是可测的.
>证明：设可测函数列 $\{f_n\}_{n\geq1}$ 在 $D-E$ 上收敛于 $f$ ， $m(E)=0$ ，则对于任意的 $\epsilon>0$ ，存在 $N,\forall n>N$ ， $\lvert f_n-f\rvert<\frac{\epsilon}{2}$ ，并且由 $f_n$ 可测，所以存在简单函数 $f_n'$ ， $\lvert f_n'-f_n\rvert<\frac{\epsilon}{2}$ ，所以 $\lvert f_n'-f\rvert<\epsilon$ ，所以简单函数列 $\{f_n'\}_{n\geq N}$ 在 $D-E$ 上逐点收敛到 $f$ ，所以 $f$ 可测.

下面这个定理说明了几乎处处收敛的几乎处处有限的可测函数列可以几乎没有损失地加强为一致收敛.

>[!note]- Egoroff 定理：设 $f,f_n(n\geq1)$ 都是有限可测集 $D$ 上的几乎处处有限的可测函数，如果 $f_n$ 在 $D$ 上几乎处处收敛于 $f$ ，则对于任意的 $\epsilon>0$ ，存在 $D$ 的闭子集 $F$ ， $m(D-F)<\epsilon$ 并且 $f_n$ 在 $F$ 上一致收敛于 $f$ .
>证明：首先证明存在可测集 $E$ 使得 $m(D-E)<\frac{\epsilon}{2}$ ，然后利用 [[#开闭集逼近可测集]]证明存在 $F$ 使得 $m(D-F)<\epsilon$ .
>
>首先刨去几乎处处之外的集合，令 $D_1=D_1^1\cap D_2^2$
>
>$$\begin{aligned}
>&D_1^1=\{x\in D:f_n(x),f(x)<\infty,\forall n\geq1\}\\
>&D_1^2=\{x\in D:f_n(x)\rightarrow f(x)(n\rightarrow \infty)\}
>\end{aligned}$$
>
>进而可知 $m(D-D_1)\leq m(D\cap D_1^1)+m(D\cap D_1^2)=0$ ，所以 $m(D_1)=m(D)$ ，只需要构造 $E\subset D_1$ 使得 $m(D_1-E)<\frac{\epsilon}{2}$ .
>
>令 
>
>$$A_n^r=D_1\cap \left[\bigcap_{k\geq n}\left\lvert f_k(x)-f(x)\right\rvert<\frac{1}{r}\right],n,r\in \mathbb{N}$$
>
>易证 $A_n^r$ 是可测集，并且
> 
>$$\bigcup_{n\geq1}A_n^r=D_1\cap \left[\bigcup_{n\geq1}\bigcap_{k\geq n}\lvert f_k(x)-f(x)\rvert<\frac{1}{r}\right]$$
>
>由 $D_1$ 的定义可知 $D_1=\bigcup_{n\geq1}A_n^r$ ，并且 $\{A_n^r\}_{n\geq1}$ 单调递增，所以由 [[#^MonotonousLimit]] 可知 $m(\lim_{n\rightarrow \infty}A_n^r)=m(D_1)=\lim_{n\rightarrow \infty}m(A_n^r)$ . 
>
>对于任意的 $\epsilon>0$ 和给定的 $r$ ，存在 $n_r$ 使得 $m(D_1-A^r_{n_r})<\epsilon/2^{r+1}$ .
>
>考虑集合 $E=\bigcap_{r\geq1}A_{n_r}^r$ ，对于任意的 $\epsilon'>0$ ，存在 $r_0\geq 1$ ， $\frac{1}{r_0}<\epsilon'$ ，对任意的 $x\in E$ 由 $A_n^r$ 的定义可知，存在 $n_{r_1}$ 使得 $\forall k>n_{r_1}(\forall x\in E,\lvert f_k(x)-f(x)\rvert<\frac{1}{r_1})$ ，取 $r_2=\max\{r_0,r_1\}$ 可得对于任意的 $k>n_{r_2}$ 有 $\forall x\in E,\lvert f_k(x)-f(x)\rvert<\epsilon'$ ，所以 $\{f_n\}_{n\geq1}$ 在 $E$ 上一致收敛于 $f$ .
>
>因为 $E$ 是可测集，所以存在闭集 $F\subset E$ ， $m(E\backslash F)<\epsilon/2$ ，从而：
>
>$$\begin{aligned}
>m(D-F)&=m(D)-m(F)=m(D_1)-m(F)\\
>&=m(D_1-F)\\
>&\leq m(D_1-E)+m(E-F)= m(\cup_{r\geq1}(D_1-A_{n_r}^r))+\epsilon/2\\
>&\leq \sum\limits_{r\geq1}^{}m(D_1-A_{n_r}^r)+\epsilon/2\\
>&\leq \epsilon
>\end{aligned}$$
>
>从而可得结论.
>^Egoroff

>[!note]- Egoroff 定理的逆命题也成立.
>证明：对于任意的 $k\geq1$ ，存在 $D$ 的闭子集 $F_k$ 使得 $m(D-F_k)\leq \frac{1}{k}$ 并且 $f_n$ 在 $F$ 上一致收敛于 $f$ . 令 $F=\bigcup_{k\geq1}F_k$ ，则 $m(D-F)=m\left(\bigcap_{k\geq1}D-F_k\right)\leq \frac{1}{k}$ ，所以 $m(D-F)=0$ . 并且对于任意的 $x\in F$ ，存在 $F_{k_0}\ni x$ ， $f_n$ 在 $F_{k_0}$ 上一致收敛于 $f$ ，从而 $\{f_n(x)\}_{n\geq1}$ 收敛到 $f(x)$ .

>[!warning]+ 在满足 Egoroff 定理的条件下，即使存在 $D$ 的子集 $F$ 使得 $m(D-F)=0$ 也不能保证 $f_n$ 在 $F$ 上一致收敛于 $f$ .
>例如，对于 $f_n(x)=x^n,x\in[0,1]$ ，注意到 $\{f_n\}_{n\geq1}$ 在 $[0,1)$ 上并不一致收敛于 $0$ （而在 $[0,1-\delta)$ 上一致收敛）

>[!warning]+  $m(D)=\infty$ 时 Egoroff 定理不一定成立.
>考虑 $D=\mathbb{R}$ ， $f_n=\chi_{[n,+\infty)}$ ，注意到 $f_n$ 逐点收敛到 $f=0$ ，而不存在闭集 $F$ 满足 $m(D-F)<1$ 使得 $f_n$ 在 $F$ 上一致收敛于 $f=0$ . （ $\forall N\in \mathbb{N},\exists n_0>N$ ，$\lvert f_{n_0}-f\rvert=1,\forall x\in[n_0,+\infty)$ ）

## 逼近可测函数

>[!note]- 延拓定理：设 $F\subset \mathbb{R}$ 为闭集， $f$ 沿着 $F$ 连续，则 $f$ 可以延拓为 $\mathbb{R}$ 上的连续函数 $f^*$ 并且 $\sup_{x\in \mathbb{R}}\lvert f^*(x)\rvert=\sup_{x\in \mathbb{F}}\lvert f(x)\rvert$ .
>证明：对 $F^c$ 进行函数定义即可，由 $F^c$ 是开集，存在两两不交开区间列 $\{(a_n,b_n)\}_{n\geq1}$ ，令 $f^*(x)=f(x),x\in F$ ，对于每一个开区间 $(a_n,b_n)$ ，如果 $(a_n,b_n)$ 有界，则定义在 $[a_n,b_n]$ 上的连续函数（线性函数即可）并满足 $\lvert f^*\rvert\leq \sup_{x\in F}\lvert f(x)\rvert$ ；如果 $(a_n,b_n)$ 无界（即 $a_n=-\infty$ 或者 $b_n=\infty$ ）则将 $(-\infty,b_n]$ 上的函数值定义为 $f(b_n)$ ， $[a_n,+\infty)$ 上的函数值定义为 $f(a_n)$ 即可.
>
>下面来证明 $f^*$ 在 $\mathbb{R}$ 上连续，首先对于任意的 $x\in F^c$ ，存在 $F^c$ 的一个构成区间包含 $x$ ，因此连续是显然的；对于任意的 $x\in F$ ，由 $f$ 在 $F$ 上连续， $\forall \epsilon>0,\exists \delta>0,\forall y\in V(x,\delta)\cap F$ 有 $\lvert f(x)-f(y)\rvert<\epsilon$ . 
>
>证明 $\lim_{y\rightarrow x+}f^*(y)=f^*(x)$ 另一半同理. 如果 $(x,x+\delta)\cap F=\emptyset$ ，则 $(x,x+\delta)\subset F^c$ ，进而 $(x,x+\delta)$ 包含在 $F^c$ 的一个构成区间中，因此 $f^*$ 在 $[x,x+\delta]$ 上是线性函数，所以有 $\lim_{y\rightarrow x^+}f^*(y)=f^*(x)$ ；如果 $(x,x+\delta)\cap F\neq \emptyset$ ，则设 $x'\in (x,x+\delta)\cap F$ ，令 $\eta=x'-x$ ，对于任意的 $y\in(x,x+\eta)$ ，若 $y\in F$ ，则 $|f^*(y)-f^*(x)|=\lvert f(y)-f(x)\rvert<\epsilon$ ，如果 $y\notin F$ ，则存在 $F^c$ 的构成区间 $(x_1,x_2),x_1,x_2\in F,x_1\geq x$ ，并且 $f^*$ 在 $(x_1,x_2)$ 上是线性函数，所以存在 $c_1,c_2\in[0,1],f^*(x)=c_1f^*(x_1)+c_2f^*(x_2),c_1+c_2=1$ ，因此 $\lvert f^*(y)-f^*(x)\rvert=\lvert c_1f^*(x_1)+c_2f^*(x_2)-f^*(x)\rvert\leq \epsilon$ ，所以 $\lim_{y\rightarrow x^+}f^*(y)=f^*(x)$ .

以下这个定理说明了可测集 $D$ 上的可测函数都可以由一个连续函数逼近（但不是 $a.e$ ）

>[!note]- Lusin：设 $f$ 是可测集 $D$ 上的<u>几乎处处有限</u>的可测函数，则对于任意 $\epsilon>0$ ，存在沿着 $D$ 连续的函数 $f^*$ 使得 $m(\{f\neq f^*\})<\epsilon$ ，并且 $\sup_{x\in D}\lvert f^*(x)\rvert\leq \sup_{x\in D}\lvert f(x)\rvert$ .

$D$ 为有界可测集：

$D$ 为一般可测集：

## 依测度收敛

在实数域中，处处收敛是建立在欧式距离上的. 类似地可以定义依测度收敛.

设 $\{f_n\}_{n\geq1},f$ 为可测集 $D$ 上的<u>几乎处处有限</u>的可测函数列，称 $\{f_n\}_{n\geq1}$ **依测度收敛**于 $f$ ，如果对于任意的 $\delta>0$ ， $\lim_{n\rightarrow \infty}m(\{\lvert f_n-f\rvert\geq\delta\})=0$ . 注：用 $f_n\Rightarrow f$ 表示 $f_n$ 依测度收敛于 $f$ ，区别于 $f_n\rightarrow f$ .

>[!warning] 依测度收敛要求函数列和函数都是可测函数.

>[!note] 如果 $D_1$ 为 $D$ 的可测子集， $f_k\Rightarrow f$ ，则在 $D_1$ 上 $f_k\Rightarrow f$ .

>[!note]- 依测度收敛等价定义：对于任意的 $\delta>0$ ，存在 $N\in \mathbb{N}$ ，对任意 $n>N$ ， $m(\{\lvert f_n-f\rvert\geq \delta\})<\delta$ .
>证明：以上两个定义分别记为 1) 2)； $1)\Rightarrow 2)$ 显然； $2)\Rightarrow1)$ ：注意到 $\{\lvert f_n-f\rvert\geq \delta\}\subset \{\lvert f_n-f\rvert\geq \epsilon\},\forall \epsilon<\delta$ ，因此对于任意的 $\delta>0$  对于任意的 $\delta>\epsilon>0$ ：
>
>$$m(\{\lvert f_n-f\rvert\geq \delta\})\leq m(\{\lvert f_n-f\rvert\geq \epsilon\})<\epsilon$$
>
>从而可得结论.

>[!example]- 设 $\{f_k\}_{k\geq1}$ 为 $[0,1]$ 上的一列实值可测函数，如果 $\frac{\lvert f_k(x)\rvert}{1+\lvert f_k(x)\rvert}\rightarrow 0,a.e.$ 证明： $f_k\Rightarrow 0$  ，反之是否成立.
>证明：因为 $\{f_k\}_k$ 可测，所以 $\frac{\lvert f_k(x)\rvert}{1+\lvert f_k(x)\rvert}$ 是可测函数，因为 $\frac{\lvert f_k(x)\rvert}{1+\lvert f_k(x)\rvert}\rightarrow0$ 并且 $m([0,1])<\infty$ 所以 $\frac{\lvert f_k(x)\rvert}{1+\lvert f_k(x)\rvert}\Rightarrow0$ ，对于任意的 $\delta>0$ ，存在 $\delta'>0$ 使得 $\frac{1}{\delta}+1<\frac{1}{\delta'}$ ，从而可得 $\frac{1}{\frac{1}{\delta'}-1}<\delta$ ，从而：
>
>$$\begin{aligned}
>m(\{\lvert f_k\rvert>\delta\})&<m\left(\left\{\lvert f_k\rvert>\frac{1}{\frac{1}{\delta'}-1}\right\}\right)\\
>&=m\left(\left\{\frac{\lvert f_k\rvert}{1+\lvert f_k\rvert}>\delta'\right\}\right)
>\end{aligned}$$
>
>从而可得 $m(\{\lvert f_k\rvert>\delta\})\rightarrow0(k\rightarrow \infty)$ ，所以 $f_k\Rightarrow0$ .
>
>反之，对于任意的 $\delta'>0$ ，取得 $\delta$ 满足： $\frac{1}{\delta}+1>\frac{1}{\delta'}$ 即可，类似可得证. #issue %%是否正确？%%

>[!example] 测度收敛 $\not\Rightarrow$ 处处收敛.
>考虑定义在可测集 $[0,1]$ 上的可测函数列 $f_{n+k}=\chi_{I_{n,k}}$ 可测函数 $f=0$ ，其中 $I_{n,k}=\left[\frac{k-1}{n},\frac{k}{n}\right],1\leq k\leq n$ （特征函数是简单函数因而可测）. 并且对于 $\delta=\frac{1}{2}$ ， 由 $\{|\chi_{I_{n,k}}-0|\geq \delta\}=I_{n,k}$ 可知 $\lim_{n\rightarrow \infty}m(\{\lvert f_n-f\rvert\})=0$ . 然而对于任意的 $x\in[0,1]$ ，对于任意的 $N$ 都存在 $n$ 使得 $f_{n}(x)-f(x)=1$ ，因而 $\{f_n\}_{n\geq1}$ 在任何一点都不收敛于 $f$ .

>[!example] 处处收敛 $\not\Rightarrow$ 测度收敛.
>设 $\mathbb{R}$ 上的可测函数列 $\{f_n\}_{n\geq1}$ ， $f=0$ ， $f_n=\chi_{[n,+\infty)}$ ，则 $\{f_n\}_{n\geq1}$ 处处收敛于 $f$ ，而对 $\delta=\frac{1}{2}$ ， $\{\lvert f_n-f\rvert>\delta\}=[n,+\infty)$ ，因而不测度收敛.

下面这个定理说明了测度收敛和处处收敛之间的关系.

>[!note]- Riesz：设 $f,f_n(n\geq1)$ 均为可测集 $D$ 上几乎处处有限的可测函数，则： 1) 若 $f_n$ 依测度收敛于 $f$ ， $\{f_n\}_{n\geq1}$ 中必然有子列几乎处处收敛于 $f$ ；2) 若 $m(D)<\infty$ 并且 $f_n$ 几乎处处收敛于 $f$ ，则 $f_n$ 依测度收敛于 $f$ .

>[!example] 设在 $[a,b]$ 上 $f_k$ 依测度收敛于 $f$ ， $g\in C(\mathbb{R})$ ，证明 $g\circ f_k\Rightarrow g\circ f$ .
>证明：假设 $g\circ f_k\not\Rightarrow g\circ f$ ，则存在子列 $\{f_{k_l}\},\epsilon_{0},\delta_0$ 使得 $m(\lvert g\circ f_{k_l}-g\circ f\rvert>\delta_0)\geq \epsilon_0$ ，由 Riesz 定理不妨设子列 $\{f_{k_l}\}$ 收敛于 $f$ . 因为 $g\in C(\mathbb{R})$ ，所以 $g\circ f_{l_k}$ 几乎处处收敛于 $g\circ f$ ，并且 $m([a,b])<\infty$ ，所以又由 Riesz 定理可知 $g\circ f_{k_l}$ 依测度收敛于 $g\circ f$ ，矛盾！

>[!example] 设 $\{D_k\}_{k\geq1}$ 为可测集列， $\sum\limits_{k=1}^{\infty}m(D_k)<\infty$ ，如果 $\{f_p\}_{p\geq1}$ 在 $D_k$ 上测度收敛，证明 $\{f_p\}_{p\geq1}$ 在 $D=\bigcup_{k\geq1}D_k$ 上测度收敛.
>证明：设 $\{f_p\}_{p\geq1}$ 在 $D_k$ 上测度收敛于 $f^k$ ，若 $D_i\cap D_j\neq\emptyset$ ，则可知 $\{f_p\}_{p\geq1}$ 在 $D_i,D_j$ 上分别测度收敛于 $f^i,f^j$ ，进而存在子列 $\{f_{p_n}\}_{n\geq1}$ 几乎处处收敛于 $f^i$ ，同时该子列也测度收敛于 $f^i$ ，因此有子列 $\{f_{p_{n_l}}\}_{l\geq1}$ 几乎处处收敛于 $f^j$ ，所以 $f^i=f^j,a.e. D_i\cap D_j$ . 因此可以取函数： $f=f^k,x\in D_k,k\geq1$ . 
>
>假设 $\{f_p\}_{p\geq1}$ 在 $D$ 上不测度收敛于 $f$ ，则可以取 $\delta_0,\epsilon_0,\{f_{p_k}\}_{n\geq1}$ 满足： $m(\{\lvert f_{p_k}-f\rvert>\delta_0\})\geq \epsilon_0$ ， #issue 

在数学分析中，实数完备性指出： $\mathbb{R}$ 中的 Cauchy 列（也称基本列）和收敛列是等价的 #imcomplete .

对于测度收敛也具有相同的结论. 首先定义何为测度中的基本列.

设 $\{f_n\}_{n\geq1}$ 为定义在可测集 $D$ 上的几乎处处有限的可测函数列，如果 $\forall \delta>0$ ， $m(\lvert f_m-f_n\rvert>\delta)\rightarrow0(m,n\rightarrow \infty)$ ，则称 $\{f_n\}_{n\geq1}$ 为**测度基本列** / 测度 Cauchy 列.

>[!note]- 测度收敛列等价于测度基本列. $\{f_n\}_{n\geq1}$ 为定义在可测集 $D$ 上的几乎处处有限的可测函数列，则存在 $D$ 上几乎处处可测的函数 $f$ 使得 $\{f_n\}_{n\geq1}$ 处处收敛于 $f$ 等价于 $\{f_n\}_{n\geq1}$ 是基本列.

证明：

# Lebesgue 积分

>[!summary] 自查表
>- 非负简单函数的 Lebesgue 积分定义； Lebesgue 可积和 Riemann 积分无关的反例；非负简单函数 Lebesgue 积分的性质；
>- 

在之前介绍了可测集、可测函数的定义. 下面介绍可测函数在可测集上的积分.

首先定义非负简单函数的 Lebesgue 积分，因为每一个可测函数都可以由简单函数列逼近，所以可以定义可测函数的积分，并且可以证明该积分与函数列的选取无关.

设 $f(x)$ 为可测集 $D$ 上的简单函数，则存在两两不交的可测集 $\{E_i\}_{1\leq i\leq n}$ ， $D=\bigcup_{1\leq i\leq n}E_i$ （称 $\{E_i\}_{1\leq i\leq n}$ 为 $D$ 的**分划** ），以及 $\{a_i\}_{1\leq i\leq n},a_i\geq0,\forall 1\leq i\leq n$ 使得 $f=\sum\limits_{1\leq i\leq n}^{}a_i \chi_{E_i}$ .

定义非负简单函数 $f$ 在 $D$ 上的 **Lebesgue 积分**：

$$\int_Df(x)dx=\sum\limits_{1\leq i\leq n}^{}a_im(E_i)$$

如果 $\int_Df(x)dx<\infty$ ，则称 $f$ 在 $D$ 上 Lebesgue 可积，简记为 $L$ 可积（下面或直接称可积）.

>[!example]- Lebesgue 可积 $\not\Rightarrow$ Riemann 可积.
>考虑非负简单函数 $\chi_\mathbb{Q}$ ， $\int_{\mathbb{R}}\chi_\mathbb{Q}dx=0$ ，而 $\chi_\mathbb{Q}$ 不是 Riemann 可积的.

>[!note]- $f,g$ 均为可测集 $D$ 上的非负简单函数， $f=g,a.e. x\in D$ ，则 $f,g$ 在 $D$ 上具有相同的积分.

非负简单函数的 $L$ 积分具有如下性质：

>[!note]- 设 $f,g$ 均为可测集 $D$ 上的非负简单函数，则 $i)$ 若 $f(x)\leq g(x),a.e.x\in D$ ，则 $\int_Dfdx\leq \int_Dgdx$ ； $ii)$ $\int_Dfdx\leq \max f(x)m(D)$ ； $iii)$ 对任意 $\lambda,\mu\geq0$ 有 $\int_D(\lambda f+\mu g)dx=\lambda\int_Dfdx+\mu\int_Dgdx$ ； $iv)$ 若 $A,B$ 为 $D$ 的两个不相交可测集，则 $\int_{A\cup B}fdx=\int_Afdx+\int_Bfdx$ ；

>[!note]- 设 $g,f_n(n\geq1)$ 都是可测集 $D$ 上的非负简单函数，并且满足： $i)$ $\{f_n\}_{n\geq1}$ 单调递增 $a.e. x\in D$ . $ii)$ $0\leq g(x)\leq\lim_{n\rightarrow \infty}f_n(x),a.e.x\in D$ ，则 $\int_Dgdx\leq \lim_{n\rightarrow \infty}\int_Df_ndx$ .

之前已经证明，任意的非负可测函数都有单调递增的处处收敛子列. 因此在定义简单函数的 Lebesgue 积分之后，可以定义非负可测函数的积分为： $\int_Dfdx=\lim_{n\rightarrow \infty}\int_Df_ndx$ ，但不同的 $\{f_n\}_{n\geq1}$ 是否会影响 $\int_Dfdx$ 的取值？下面讨论这一问题.

Lebesgue 积分区别与 Riemann 积分的一个方面：

>[!note]- $f\in L(D)$ 的充分必要条件为 $\lvert f\rvert\in L(D)$ .

>[!example] 设 $f\in L(E)$ ，求证： $k\cdot m(\{\lvert f\rvert>k\})\rightarrow0(k\rightarrow \infty)$ .

证明：由 $f\in L(E)$ 可知 $\lvert f\rvert\in L(E)$ ， $\lvert f\rvert\geq0$ ，所以存在单调收敛到 $\lvert f\rvert$ 的函数列 $\{f_n\}_{n\geq1}$ 并且 $\lim_{n\rightarrow \infty}\int_Ef_ndx<\infty$ ，所以当 $n$ 充分大时 $\int_Ef_ndx<\infty$ . 注意到对于给定的 $k$ ， $\{f_m>k\}_{m\geq1}$ 单调递增.

注意到：

$$\begin{aligned}
m(\{\lvert f\rvert>k\})&=m\left(\left\{\lim_{n\rightarrow \infty}f_n>k\right\}\right)\\
&=m \left(\lim_{n\rightarrow \infty}\left\{f_m>k\right\}\right)\\
&=\lim_{n\rightarrow \infty}m(\{f_n>k\})
\end{aligned}$$

注意到：

$$k \cdot m(\{f_n\geq k\})\leq \int_{[k,\infty)}\lvert f_n\rvert dx=\sum\limits_{i\in I}^{}a_i m(E_i)$$

其中 $a_i>k$ ，而 $I$ 为有限集，并且 $f$ 几乎处处有限，所以当 $k$ 充分大时 $f_n$ 也处处有限，所以若 $a_{i_0}=\infty$ 那么 $m(E_{i_0})=0$ ，因此可得 $\sum\limits_{i\in I}^{}a_im(E_i)\rightarrow 0(k\rightarrow \infty)$ .

证明：因为 $f\in L(E)$ ，所以对单调收敛到

下面介绍三个重要定理，均关于<u>积分与极限是否能够换序</u>.

>[!note] Levi 单调递增收敛定理：设 $f,f_n(n\geq1)$ 都是可测集 $D$ 上的<u>非负</u>可测函数，并且对几乎所有的 $x\in D$ ， $\{f_n\}_{n\geq1}$ 单调收敛于 $f$ ，则 $\int_Dfdx=\lim_{n\rightarrow \infty}\int_Df_ndx$ .

>[!note] Fatou 定理：设 $f_n(n\geq1)$ 都是可测集 $D$ 上的<u>非负</u>可测函数，则 $\int_D\varliminf_{n\rightarrow \infty}f_ndx\leq \varliminf_{n\rightarrow \infty}\int_Df_ndx$ .

>[!note]- 控制收敛定理：设 $f,f_n$ 均为可测集 $D$ 上的可测函数，如果以下条件满足： 1) 存在 $g\in L(D)$ ，使得对于任意 $n\geq1$ ，在 $D$ 上几乎处处有 $\lvert f_n(x)\rvert\leq g(x)$ ；2) 在 $D$ 上 $f_n$ 几乎处处收敛于 $f$ . 则 $f,f_n(n\geq1)$ 都在 $D$ 上可积. 并且 $\lim_{n\rightarrow \infty}\int_Df_ndx=\int_Dfdx$ .
>由 $\lvert f_n(x)\rvert\leq g(x)$ 可得 $\lvert f_n(x)-f(x)\rvert\leq 2g(x)$ ，由 Fatous 定理：
>
>$$\begin{aligned}
>\int_D2g(x)dx &=\int _D\varliminf_{n\rightarrow \infty}2g(x)-\lvert f_n(x)-f(x)\rvert dx\\
>&\leq\varliminf_{n\rightarrow \infty}\int_D2g-\lvert f_n-f\rvert  dx\\
>&\leq \varlimsup_{n\rightarrow \infty}\int_D2g-\lvert f_n-f\rvert dx
>\end{aligned}$$
>
>所以 $\varlimsup_{n\rightarrow \infty}\int_D\lvert f_n-f\rvert dx=0$ ，所以 $\lim_{n\rightarrow \infty}\int_D\lvert f_n-f\rvert dx=0$ ，所以 $\lim_{n\rightarrow \infty}\int_Df_ndx=0$ .
>
>另证：由 $g(x)\geq \lvert f_n(x)\rvert$ 可得 $g(x)\pm f_n(x)\geq0$ ，进而由 Fatous 定理：
>
>$$\int_D\varliminf_{n\rightarrow \infty}g(x)\pm f_n(x)dx\leq \varliminf_{n\rightarrow \infty}\int_Dg(x)\pm f_n(x)dx$$
>
>则：
>
>$$\begin{aligned}
>&\int_D\varliminf_{n\rightarrow \infty}f_n(x)dx\leq \varliminf_{n\rightarrow \infty}\int_D f_n(x)dx\quad (1)\\
>&\varlimsup_{n\rightarrow \infty}\int_Df_n(x)dx\leq \int_D\varlimsup_{n\rightarrow \infty}f_n(x)dx\quad (2)
>\end{aligned}$$
>
>其中 $(2)$ 式：
>
>$$\begin{aligned}
>&\int_D\varliminf_{n\rightarrow \infty}-f_n(x)\leq \varliminf_{n\rightarrow \infty}\int_D-f(x)dx\leq \varlimsup_{n\rightarrow \infty}\int_Df(x)dx\\
>&-\int_D\varliminf_{n\rightarrow \infty}f_n(x)\ge -\int_D\varlimsup_{n\rightarrow \infty}f_n(x)
>\end{aligned}$$
>
>因此有：
>
>$$\varlimsup_{n\rightarrow \infty}\int_Df_n(x)dx\leq \int_Df(x)dx\leq \varliminf_{n\rightarrow \infty}\int_Df_n(x)dx$$
>
>从而可得结论.

>[!example] 设 $f,f_k\in L(\mathbb{R})$ 并且 $\lvert f_k(x)\rvert\leq f(x)$ ，求证：  $\begin{aligned}\int_D \varliminf_{k\rightarrow \infty}f_k(x)dx &\leq \varliminf_{k\rightarrow \infty}\int_{\mathbb{R}}f_(x)dx\\&\leq \varlimsup_{k\rightarrow \infty}\int_\mathbb{R}f_k(x)dx\leq \int_\mathbb{R}\varlimsup_{k\rightarrow \infty}f_k(x)dx\end{aligned}$ #imcomplete-lack-proofs 
    
>[!example]- 设在可测集- $E$ 上非负可测函数 $f_k\Rightarrow f$ ，求证： $\int_Ef(x)dx\leq \varliminf_{k\rightarrow \infty}\int_Ef_k(x)dx$ . [mse](https://math.stackexchange.com/questions/276138/if-f-n-geq-0-and-f-n-to-f-in-measure-then-int-f-leq-liminf-int-f-n)
>证明：由下极限的性质，存在 $\{f_k\}_{k}$ 的子列 $\{f_{k_n}\}_{n\geq1}$ ，使得 $\lim_{n\rightarrow \infty}\int_Ef_{k_n}dx=\varliminf_{k\rightarrow \infty}\int_Ef_k(x)dx$ ，并且由 $f_k\Rightarrow f$ 可知 $f_{k_n}\Rightarrow f$ ，由 Riesz 定理可知，存在 $f_{k_n}$ 的收敛到 $f$ 的子列 $\{f_{k_{n_j}}\}_{j\geq1}$ ，再由 $f\geq0$ ，根据 Fatou 定理：
>
>$$\int_Ef(x)dx\leq \varliminf_{j\rightarrow \infty}\int_E f_{k_{n_j}}(x)dx\leq \lim_{j\rightarrow \infty}\int_Ef_{k_{n_j}}dx=\varliminf_{k\rightarrow \infty}\int_Ef_k(x)dx$$

## 函数在 $L$ 积分下的稠密性

>[!hint] 从特殊（简单函数、多项式函数、有界）到一般.
>方法如截断、三角不等式.

讨论几种特殊的可测函数：简单函数、多项式函数、




