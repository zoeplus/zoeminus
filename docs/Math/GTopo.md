# 依赖与简介

依赖：[集合论](Set.md)，[实数理论](R.md)（不必要）

拓扑学是从极限和连续中抽象出来的概念. 

# 度量空间

对于集合 $X$ ，引入**度量**的概念： 

$$d:X\times X\rightarrow \mathbb{R}$$

度量满足以下条件： 

$$\begin{aligned}
&\forall x,y,z\in X\\
&1)\ d(x,y)\geq0,\quad d(x,y)=0\Leftrightarrow x=y\\
&2)\ d(x,y)=d(y,x)\\
&3)\ d(x,y)+d(y,z)\geq d(x,z)
\end{aligned}$$

称有序对 $(X,d)$ 为**度量空间**.

对于 $Y\subset X$ ，已知度量空间 $(X,d)$ 可以将 $d$ 定义在 $Y$ 上，记为 $d|Y$ ，称为**子度量**.

对于已经定义的度量，可以进一步定义以满足特定的条件，例如： $$d'=\frac{d}{1+d}<1$$ 或者 $d'=\min\{1,d\}\leq1$ .

下面借助 $\mathbb{R}^2$ 上的度量空间对于度量建立一个直观上的理解.

## $\mathbb{R}^2$ 上的度量空间

和[范数](MAlg.md#范数)中的一些概念类似.

常见的度量有：

- $d_1(x,y)=\sum\limits_{i=1}^{2}\lvert x_i-y_i\rvert$ .
- $d_2(x,y)=\sqrt{\sum\limits_{i=1}^{2}(x_i-y_i)^2}$ ，欧式距离度量.
- $d_\infty(x,y)=\max_{1\leq i\leq2}\{\lvert x_i-y_i\rvert\}$ .
- 离散度量： $d(x,y)=\left\{\begin{aligned} &0,x=y \\\\ &1,x\neq y \end{aligned}\right.$

对于 $B_d(0,1)$ 以上三种度量的形状分别为[[GTopoDraw]].

## 在度量空间上建立的概念

### 开集、闭集

给定集合和度量，可定义**开球**： $B_d(x,r)=\{y\in X:d(x,y)\leq r\}$ .  $\mathbb{R}$ 上的开球一般称为开区间. 进而定义**邻域**： $A$ 为 $x$ 的邻域，则存在 $\epsilon_0$ ， $B_d(x,\epsilon_0)\subset A$ . 进而定义**开集**： 称集合 $S$ 为开集，如果 $\forall x\in S$ ， $S$ 均为 $x$ 的邻域. 

>[!note]- 任意个开集的并仍然为开集.
>证明： $\forall x\in\bigcup_{i\in I}A_i$ ，其中 $A_i\subset X$ 为开集，则 $\exists k\in I:x\in A_k$ ，从而存在包含于 $A_k$ 的开球 $B\ni x$ ，并且 $B\subset \bigcup_{i\in I}A_i$ ，再由 $x$ 的任意性可知任意个开集之并仍然为开集.

引入最大开集的概念：称 $A^\circ=\bigcup\{O:O\subset A,O\ \text{为开集}\}$ 为 $A$ 的**内部**（或者内核），显然 $A^\circ$ 为包含于 $A$ 的最大开集. $A^\circ$ 也有如下的等价定义： $A^\circ=\{x\in A:A\text{ 为 }x\text{ 的邻域 }\}$ ，其中若 $A$ 为 $x$ 的邻域，则称 $x$ 为 $A$ 的**内点**，内部即为 $A$ 的全体内点. 注：上面两个定义本文分别称为开集的第一定义和第二定义.

>[!note]- 上述两个对内部的定义是等价的.
>记上述两个集合分别为 $A_1,A_2$ ，对于任意的 $x\in A_1$ ，存在 $O\subset A:O\ni x$ ，则存在 $B(x,\epsilon)\subset O\subset A$ ，从而 $A$ 为 $x$ 的邻域， $x\in A_2$ ； $\forall x\in A_2$ ， $\exists B(x,\epsilon)\subset A$ ，又 $B(x,\epsilon)$ 为开集，所以 $x\in A_2$ . 综上两个定义等价.

>[!note]- 若 $A$ 为开集当且仅当 $A=A^c$ .
>证明：直接由第一定义.

下面定义**极限**（收敛）的概念，称 $\lim_{n\rightarrow \infty}x_n=x$ ，如果 $\forall \epsilon>0,\exists N,n>N,d(x,x_n)<\epsilon$ . 以及**终在**这一概念（极限概念的减弱）： $\{x_n\}$ 终在集合 $U$ 中，如果 $\exists N,n>N,x_n\in U$ . ^Limit

开集和极限都是借助度量定义的. 两者也可以互相定义.

>[!note]- 对于度量空间 $(X,d)$ ， $O$ 是开集的充分必要条件为对于任何序列 $\{x_n\}$ ，如果 $\lim_{n\rightarrow \infty}x_n=x\in O$ ，则 $\{x_n\}$ 终在 $O$ 中.
>证明：
> $\Rightarrow$ ：由 $\lim_{n\rightarrow \infty}x_n=x\in O$ ，由 $O$ 是开集，可得存在 $\epsilon_0>0$ ， $B_d(x,\epsilon)\subset O$ ，又 $\lim_{n\rightarrow \infty}=x$ ，对于上述 $\epsilon_0>0,\exists N,\forall n>N,x_n\in B_d(x,\epsilon_0)\subset O$ ，从而 $\{x_n\}$ 终在 $O$ 中.
>$\Leftarrow$ ：反证，假设 $O$ 不是开集，则 $\exists x\in O$ ， $\forall \epsilon>0$ ， $B_d(x,\epsilon)\not\subset O$ ，因而可以构造一个序列 $\{x_n\}\rightarrow x$ ，这与 $\{x_n\}$ 终在 $O$ 中矛盾！

>[!note]- 对于度量空间 $(X,d)$ ，$\lim_{n\rightarrow \infty}x_n=x$ 当且仅当对于任意的开集 $O:x\in O$ ， $\{x_n\}$ 终在 $O$ 中.

定义 $X$ 上的**拓扑**： $X$ 上开集的全体. 开集、极限等概念对于某一种结构从多个方面进行刻画，称该结构为**拓扑结构**.

---

在定义开集的概念之后可以引入**闭集**的概念，设 $X$ 是集合 $S$ 中的开集，则 $X^c$ 即为 $S$ 中的闭集. **列紧集**则为既有界又收敛的序列.

>[!note]- 任意个闭集的交仍然为闭集.
>证明：根据 De Morgan 定律可得.

>[!example]- 既不是开集也不是闭集的集合. #imcomplete 
>$\mathbb{Q}$ ， $[0,1)$ .

类似地，可以对于闭集的概念用极限加以说明. （开集的补对于闭集的判断并没有很大帮助）

>[!note]- 对于度量空间 $(X,d)$ ， $O\subset X$ 是闭集的充分必要条件为对于任何序列 $\{x_n\}\subset O$ ，如果 $\lim_{n\rightarrow \infty}x_n=x$ ，则 $x\in O$ .
>证明：
>$\Rightarrow$ ： 反证：如 $x\notin O$ ，则存在开球 $B_d(x,\epsilon_0)\subset O^c$ ，又 $\lim_{n\rightarrow \infty}x_n=x$ ，则当 $n$ 充分大时 $x_n\in O^c$ 矛盾.
>$\Leftarrow$ ： 反证：假设 $O^c$ 不是开集，则存在 $x\in O^c$ ，对于任意 $\epsilon>0$ ， $B_d(x,\epsilon)$ 不包含于 $O^c$ ，从而可以取 $\{x_n\}_{n\geq1}\rightarrow x$ 且 $\{x_n\}_{n\geq1}\rightarrow x\in O$ 矛盾！所以 $O$ 为闭集.

引入最小闭集的概念：称 $\bar{A}=\bigcap\{C:A\subset C,C\ \text{为闭集}\}$ 为 $A$ 的**闭包**. 闭包同样有等价定义：对于集合 $A$ ，称 $x$ 为 $A$ 的**附着点**，如果对于 $x$ 的任何一个邻域 $U$ ， $U\cap A\neq\emptyset$ . 闭包即为 $A$ 的附着点全体. 注：分别记为第一定义和第二定义. ^Closure

>[!note]- 上述两种对于闭包的定义等价.（对于一般的拓扑空间也成立）
>证明：设两种定义对应的集合分别为 $A_1,A_2$ ， $\forall x\in A_1$ ，不妨设 $x\notin A$ ， 如果存在 $x$ 的一个邻域 $U$ 使得 $U\cap A=\emptyset$ ，则 $A\subset U^c$ ，设 $x\in A_1$ ， $A_1$ 为包含 $A$ 的闭集，则 $U^c\cap A_1$ 仍然为包含 $A$ 的闭集，并且 $x\notin U^c\cap A_1$ ，这与 $A_1$ 的定义矛盾！
>
>反之，若 $x\in A_2$ ，若存在闭集 $B\supset A$ ， $x\in B^c$ ，则 $B^c\cap A\neq\emptyset$ . 则与 $B\supset A$ 矛盾！所以两种定义等价.

>[!note]- $A$ 为闭集的充分必要条件为 $A=\bar{A}$ .
>证明： 由第一定义即可得到.

>[!note]- $A$ 为闭集的充分必要条件为 $A'=\emptyset$ ， $A'$ 为 $A$ 的全体凝聚点集.

借助内部和闭包的等价定义求解：

>[!example]- 设 $A=[-1,0)\cup\{\frac{1}{n}:n\in \mathbb{N}\}$ ，求 $A^\circ,\bar{A}$ .
>$A^\circ=(-1,0)$ ， $\bar{A}=[-1,0]\cup\{\frac{1}{n},n\in \mathbb{N}\}$ .

集合的闭包还有如下等价定义：

>[!note]- 对于集合 $E$ ， $\forall x\in \bar{E}$ ，存在 $\{x_n\}_{n\geq1}\subset E$ ， $x_n\rightarrow x(n\rightarrow \infty)$ ，即 $\inf_{a\in A}d(x,a)=0$ .
>证明：
>$\Rightarrow$ ： $\forall x\in \bar{E}$ ，若 $x\in E$ ，则取 $x_k=x$ 即可. 若 $x\notin E$ ，由 $\bar{E}$ 的附着点全体定义可知存在 $\{x_n\}_{n\geq1}$ 满足条件.
>
>$\Leftarrow$ ：按照附着点定义即可得.
>^NotAlone

可以证明：

>[!note]- $A\subset B\rightarrow A^\circ\subset B^\circ,\bar{A}\subset \bar{B}$ . 
>证明：直接用内点和附着点.

>[!note]- $A^\circ\subset A\subset \bar{A}$ .
>证明：直接由第一定义：包含于 $A$ 的开集之并，包含 $A$ 的闭集只并.

>[!note]- $(A^\circ)^\circ=A^\circ$ ， $\overline{(\bar{A})}=\bar{A}$ .

注意开集和闭集在取补运算下的相互转换，在后续证明中有作用. ^OpenCloseComple

>[!note]- $X\backslash A^\circ=\overline{(X\backslash A)}$ ， $X\backslash\bar{A}=(X\backslash A)^\circ$ . 即 $(A^\circ)^c=\overline{A^c},(\bar{A})^c=(A^c)^\circ$ .
>证明：根据第一定义和 De Morgan 定律即可得. 在[[#Baire 纲定理]]中证明其推论时有用到.

>[!note]- $A^\circ=X\backslash \overline{X\backslash A},\bar{A}=X\backslash(X\backslash A)^\circ$ .
>证明：由第二定义： 
>
>$$\begin{aligned}
x\in A^\circ &\Leftrightarrow \exists B(x,\epsilon)\subset A\\
&\Leftrightarrow B(x,\epsilon)\cap (X\backslash A)=\emptyset\\
&\Leftrightarrow x\notin \overline{X\backslash A}
\end{aligned}$$ 
>
>$$\begin{aligned}
x\in \bar{A}&\Leftrightarrow \forall \epsilon>0,B(x,\epsilon)\cap A\neq\emptyset\\
&\Leftrightarrow \forall \epsilon>0,B(x,\epsilon)\not\subset X\backslash A\\
&\Leftrightarrow x\in X\backslash(X\backslash A)^\circ
\end{aligned}$$

>[!note]- 若 $A\cap B=\emptyset$ ，则 $\bar{A}\cap B^\circ=\emptyset$ . #imcomplete-whatever 

>[!note]- $\overline{A\cup B}=\bar{A}\cup \bar{B},\overline{A\cap B}\subset \bar{A}\cap \bar{B}$ .

>[!note]- $A^\circ \cup B^\circ\subset (A\cup B)^\circ,(A\cap B)^\circ=A^\circ\cap B^\circ$ .

开集和闭集除了互补以外也可以相互表示：

>[!note]- 度量空间中的每个闭集都可以表示为可数个开集的交，每个开集可以表示为可数个闭集的并. [alsocheck](https://math.stackexchange.com/questions/1546336/in-a-metric-space-is-every-open-set-the-countable-union-of-closed-sets)
>证明：设 $F$ 为 $(X,d)$ 中的闭集，则取 $F'=\bigcap_{n=1}^\infty\left(\bigcup_{x\in F}B(x,\frac{1}{n})\right)$ ，若存在 $x_0\in F'\backslash F$ ，则 $\forall n>1,x_0\in \bigcup_{x\in F}B(x,\frac{1}{n})$ ，从而可得以收敛到 $x$ 的序列 $\{x_n\}_{n\geq1}\subset F$ ，由 $F$ 为闭集可知 $x\in F$ 矛盾！所以 $F'\backslash F=\emptyset$ ，从而 $F=F'$ .
>
>另一方面，设 $O$ 为 $(X,d)$ 中的开集，则 $O^c$ 可被表示为可数个开集的交，记为 $O^c=\cap_{n=1}^\infty O_n$ ，从而由 De Morgan 定律， $O=\cup_{n=1}^\infty O^c_n$ .

### 边界

定义**边界**：称 $\partial{A}\subset X$ 为 $A$ 的边界，如果 $\forall x\in \partial{A}$ ，既存在 $A$ 中的序列收敛到 $x$ ，也存在 $A^c$ 中的序列收敛到 $x$ .

### 点与集合间的距离

借助度量的概念可以建立点到集合之间的距离：设 $A$ 为度量空间 $(X,d)$ 中的非空子集，定义函数 $d(-,A):X\rightarrow \mathbb{R}$ ： 

$$d(x,A)=\inf\{d(x,a):a\in A\}$$

>[!note]- 任给 $x,y\in X$ ， $\lvert d(x,A)-d(y,A)\rvert\leq d(x,y)$ ，因此函数 $d(-,A)$ 一致连续.
>证明： $\forall z\in A, d(x,z)\leq d(x,y)+d(y,z)$ ，从而 $$d(x,A)\leq d(x,z)\leq d(x,y)+d(y,z),\forall z\in A$$ 进而可得 $d(x,A)\leq d(x,y)+d(y,A)$ ，同理可得 $d(y,A)\leq d(x,y)+d(x,A)$ . 从而得到结论.

可以用 $d(x,A)$ 定义闭包.

>[!note]- 任给 $x\in X$ ， $x\in \bar{A}$ 当且仅当 $d(x,A)=0$ . #imcomplete-whatever 
>证明：
>$\Rightarrow$ ： 首先证明对于任意 $x\in \bar{A}$ ，存在 $\{A\}$ 中的序列 $\{x_n\}_{n\geq1}$ 收敛于 $x$ ，从而可证明 $d(x,A)=0$ .
>
>$\Leftarrow$ ： 只需要证明满足条件的 $x$ 属于任何包含 $A$ 的闭集，证明过程中用到闭集中收敛的序列的极限属于该闭集.

### 连续映射

在定义度量的概念之后自然引入**连续**的概念：考虑度量空间 $(X,d_X),(Y,d_Y)$ . 映射 $f:X\rightarrow Y$ . 如果 $\forall \epsilon>0,\exists \delta>0$ ， $\forall x'\in X:d_X(x,x')<\delta$ ，如果 $d_Y(f(x),f(x'))<\epsilon$ ，则称 $f$ 在 $x$ 连续，如果 $f$ 在 $\forall x\in X$ 连续，则称 $f$ 为**连续映射**.

下面是与连续相关的等价命题：

>[!note]- $f$ 在 $x_0$ 连续当且仅当 $\forall$ 开集 $U:f(x_0)\in U$ ， $f^{-1}(U)$ 为 $x_0$ 的邻域. 或者可以表述为：任给 $f(x_0)$ 的邻域 $V$ ，存在 $x_0$ 的邻域 $U$ 满足 $f(U)\subset V$ .
>证明：
>$\Rightarrow$ ： 因为 $U$ 为 $f(x_0)$ 的开集，所以存在 $B_{d_Y}(f(x_0),\epsilon)\subset U$ ，又 $f$ 在 $x_0$ 连续，则存在 $\delta>0$ ，满足 $\forall x'\in B_{d_X}(x_0,\delta)$ ， $f(x')\in B_{d_Y}(f(x_0),\epsilon)\subset U$ ，所以 $U$ 为 $x_0$ 的邻域.
>
>$\Leftrightarrow$ ：$\forall \epsilon>0, f(x_0)\in B_{d_Y}(f(x_0),\epsilon)$ 为包含 $f(x_0)$ 的开集，进而 $f^{-1}(B_{d_Y}(f(x_0),\epsilon))$ 为 $x_0$ 的邻域，存在开球 $B_{d_X}(x_0,\delta)$ 包含与其中，进而可得 $f$ 在 $x_0$ 连续.

连续映射的逆像保持拓扑结构:

>[!note]- $f:X\rightarrow Y$ 连续当且仅当对于任意的开集 $U\subset Y$ ， $f^{-1}(U)\subset X$ 为开集.
>证明：
>$\Rightarrow$ ： 由 $f$ 连续， $\forall x\in X$ ， $f$ 在 $x$ 连续. 对于 $f^{-1}(U)=\{x\in X:f(x)\in U\}$ ， $\forall x\in f^{-1}(U)$ ，有 $\epsilon>0:B_{d_Y}(f(x),\epsilon)\subset U$ ，存在 $\delta>0:B_{d_X}(x,\delta)$ 满足对于任意的 $x'\subset B_{d_X}(x,\delta):f(x')\subset B_{d_Y}(f(x),\epsilon)\subset U$ ，从而 $B_{d_X}(x,\delta)\subset f^{-1}(U)$ ，由 $x$ 的任意性， $f^{-1}(U)$ 是开集.
>
>$\Leftarrow$ ：$\forall x\in X$ ，对于任意的 $\epsilon>0$ 满足 $U=B_{d_Y}(f(x),\epsilon)\subset Y$ ， $B_{d_Y}(f(x),\epsilon)$ 是开集，则 $f^{-1}(U)\subset X$ 是开集，所以存在 $\delta>0$ ， $B_{d_X}(x,\delta)\subset f^{-1}(U)$ ，从而可知 $f$ 在 $x$ 连续，由 $x$ 的任意性， $f$ 连续.

进而有以下结论：

>[!note]- $f:X\rightarrow Y$ 连续当且仅当对于任意的闭集 $U\subset Y$ ， $f^{-1}(U)\subset X$ 为闭集. #imcomplete 
>证明： 注意到 $(f^{-1}(U))^c=f^{-1}(U^c)$ .

但反过来：连续映射并不一定将开集映射到开集（例如： $f:\mathbb{R}\rightarrow [-1,1],x\rightarrow \sin x$ ， 也不一定将将闭集映射到闭集（例如： $f:\mathbb{R}\rightarrow (0,1),x\rightarrow \frac{1}{\lvert x\rvert+1}$. #imcomplete-whatever  ，但有以下命题：

| #imcomplete 紧集，列紧集的定义.

>[!note]- 连续函数将列紧集映射到列紧集.
>考虑列紧集 $X$ ， 对于任意的 $\{y_n\}_{n\geq1}\subset f(X)$ ，存在 $\{x_n\}_{n\geq1}\subset X$ 满足 $y_n=f(x_n)$ ；因为 $X$ 是列紧集，所以 $\{x_n\}_{n\geq1}$ 存在收敛子列 $\{x_{n_k}\}_{k\geq1}$ ，设 $\{x_{n_k}\}\rightarrow x(k\rightarrow \infty)$ . 由 $f$ 是连续函数可以得到 $f(x_{n_k})\rightarrow f(x)(k\rightarrow \infty)$ ，并且 $\{f(x_{n_k})\}_{k\geq1}\subset \{y_n\}_{n\geq1}$ ，又根据 $\{y_n\}$ 的任意性可得 $Y$ 为列紧集.

类似的可以证明：

>[!note]- 连续函数将紧集映射到紧集.
>证明：设 $f:X\rightarrow Y$ ，其中 $X$ 为紧集，设 $f(X)$ 的一个开覆盖 $\{U_a\}_{a\in A}$ ，因为 $f$ 为连续函数，所以开集 $U_a$ 的原像 $f^{-1}(U_a)$ 仍然是开集. 并且 $f^{-1} \left(\bigcup_{a\in A}U_a\right)\subset\bigcup_{a\in A}f^{-1}(U_a)$ （对于任意的 $x:f^{x}\in \bigcup_{a\in A}U_a$ ，存在 $U_a:f(x)\in U_a$ ，从而 $x\in f^{-1}(U_a)\in \bigcup_{a\in A}f^{-1}(U_a)$ . 并且由 $Y\subset\{U_a\}_{a\in A}$ 可知 $X\subset f^{-1}(Y)\subset f^{-1}(\bigcup_{a\in A}U_a)\subset \bigcup_{a\in A}f^{-1}(U_a)$ ，又 $X$ 为紧集，所以存在有限子覆盖 $\{U_{a_1},U_{a_2},\cdots,U_{a_n}\}$ ， $X\subset \bigcup_{1\leq i\leq n}f^{-1}(U_{a_i})$ . 并且由 $f(f^{-1}(E))\subset E$ 可得 $$f(X)\subset f\left(\bigcup_{1\leq i\leq n}f^{-1}(U_{a_i})\right)\subset \bigcup_{1\leq i\leq n}f(f^{-1}(U_{a_i}))\subset \bigcup_{1\leq i\leq n}U_{a_i}$$ 所以 $\{U_a\}_{a\in A}$ 存在有限子覆盖，因此 $f(X)$ 为紧集.

也可以将连续的概念离散化：

>[!note]- 设度量空间 $(X,d_X),(Y,d_Y)$ ，映射 $f:X\rightarrow Y$ ， $a\in X$ 则 $f$ 在 $a$ 点连续等价于任给 $X$ 中的序列 $\{x_n\}_{n\geq1}$ ，若 $x_n\rightarrow a(n\rightarrow \infty)$ 则 $f(x_n)\rightarrow f(a)(n\rightarrow \infty)$ .
>证明：对于任意的 $f(a)$ 的邻域 $B_{d_Y}(f(a),\epsilon)$ ，存在 $a$ 的邻域 $U$ 满足 $f(U)\subset V$ . 又 $U$ 为 $a$ 的邻域，所以存在开球 $B_{d_X}(a,\delta)\subset U$ ，从而对于 $x_n\rightarrow x$ ，当 $N$ 足够大时 ， $\forall n>N$ ， $x_n\in U$ ， $f(x_n)\in B_{d_Y}(f(a),\epsilon)$ ，因而可以得到 $x_n\rightarrow a$ 则 $f(x_n)\rightarrow f(a)$ .

借助开集的概念引入**等价度量**的概念：对于定义在 $X$ 上的度量 $d_1,d_2$ ，称 $d_1$ 与 $d_2$ 等价，如果在 $d_1$ 下为开集的集合在 $d_2$ 下也为开集，反之也成立. 或者称为 $d_1,d_2$ 引导的拓扑. ^EqualD

等价度量这一概念也可以由连续映射定义：考虑映射 $\text{id}:(X,d_1)\rightarrow (X,d_2)$ ，和映射 $\text{id}'=\text{id}^{-1}:(X,d_2)\rightarrow (X,d_1)$ . 由上述定理结合等价度量的定义，可知 $\text{id}'$ 和 $\text{id}$ 均为连续映射，或者称 $\text{id}$ 为**同胚映射**：双射且连续.

等价度量还有以下等价概念：例如下面这个借助 $\text{id}$ 为同胚映射再建立的：

>[!note]- 定义在 $X$ 上的度量 $d_1,d_2$ 等价当且仅当 $\forall x\in X,r_1>0,\exists r_2>0$ ，有 $B_{d_2}(x,r_1)\subset B_{d_1}(x,r_2)$ ，反之也成立.

也可以离散化：

>[!note]- 定义在 $X$ 上的度量 $d_1,d_2$ 等价当且仅当 $\forall\{x_n\}_{n\geq1},d_1(x_n,x)\rightarrow 0\Leftrightarrow d_2(x_n,x)\rightarrow 0$ .

>[!example]- 设 $(X,d_X),(Y,d_Y)$ 是度量空间， $f:(X,d_X)\rightarrow(Y,d_Y)$ 连续. 任给 $x,y\in X$ ，令 $\rho(x,y)=d_X(x,y)+d_Y(f(x),f(y))$ . 证明 $\rho$ 是 $X$ 上与 $d_X$ 等价的度量，并且 $f:(X,\rho)\rightarrow(Y,d_Y)$ 一致连续.
>注意到对于任意 $(X,d)$ 中的收敛点列 $\{x_n\}_{n\geq1}$ ， 因为 $f$ 连续，所以 $\forall \epsilon>0,\exists \delta>0,d(x,x_n)<\delta$ 时有 $d_Y(f(x),f(x_n))<\epsilon/2$ ，则当 $d(x,x_n)<\min\{\delta,\epsilon/2\}$ 可得 $\rho(x,x_n)<\epsilon$ ，所以在 $(X,\rho)$ 中 $\{x_n\}_{n\geq1}\rightarrow x$ . 反之由 $d_X(x,y)\leq \rho(x,y)$ 可知 $d_\rho(x_n,x)\rightarrow0\Rightarrow d_X(x_n,x)\rightarrow 0$ ，因此 $\rho$ 和 $d_X$ 在 $X$ 上等价.
>
>并且因为 $\rho(x,y)\geq d_Y(f(x),f(y))$ ，所以 $f$ 一致连续.

>[!example]- 证明不存在连续函数列 $\{f_n;\mathbb{R}\rightarrow \mathbb{R}\}_n$ 逐点收敛于 $\mathbb{Q}$ 的特征函数 $\chi_\mathbb{Q}:\mathbb{R}\rightarrow \mathbb{R}$ 其中：
>$$\chi_\mathbb{Q}(x)=\left\{\begin{aligned}
&1,x\in \mathbb{Q}\\
&0,x\notin \mathbb{Q}
\end{aligned}\right.$$
证明：假设存在连续函数列 $\{f_n\}$ 逐点收敛到 $\chi_\mathbb{Q}$ ，考虑 $U_n=\bigcup_{m\geq n}f^{-1}_m(1/2,\infty)=\bigcup_{m\geq n}\{x\in \mathbb{R}:f_m(x)>\frac{1}{2}\}$ . 取 $x_0\in \mathbb{R}\cap \mathbb{Q}$ ，对于 $\epsilon=\frac{1}{2}>0$ ，存在 $N\in \mathbb{N},\forall n\geq N,|f_n(x_0)-\chi_\mathbb{Q}(x_0)|<\frac{1}{2}$ . 显然 $U_n,\forall n\geq N$ 为开集. 且 $x_0\in U_n,\forall n\geq N$ . 因此存在 $x_0$ 的邻域 $d(x_0,\delta_n)\subset U_n$ ，对于任意的 $n\geq N$ ，取 $x_n\in d(x_0,\min(\delta_n,\frac{1}{n}))\backslash \mathbb{Q}$ . 则 $\{x_n\}_{n\geq N}\rightarrow x$ ，从而对于任意的 $f_m,m\geq1$ ，存在 $N'>N$ 当 $n>N'$ 时 $|f_m(x_n)-f_m(x)|<\epsilon$ . 同时因为 $\{f_m(x_n)\}\rightarrow 0(m\rightarrow \infty)$ ，所以存在 $M,m>M$ 时 $\lvert f_m(x_n)\rvert<\epsilon$ ，综上可知当 $m>M,n>N'$ 时 $\lvert f_m(x)\rvert<\lvert f_m(x_n)-f_m(x)\rvert+\lvert f_m(x_n)\rvert<2\epsilon<\frac{1}{2}$ . 矛盾！ #issue %%左脚踩右脚，错了%%

### 完备度量空间

考虑度量空间 $(X,d)$ ，称 $\{x_n\}_{n\geq1}\subset X$ 为 **Cauchy列**，如果对于任意的 $\epsilon>0$ ，存在 $N$ ， $\forall m,n>N:d(x_m,x_n)<\epsilon$ .

之前在处理实数域上的数列时， Cauchy列与一定收敛. 推广到一般的度量空间上时，仍然满足该性质的度量空间称为**完备度量空间**.

>[!example]- $(\mathbb{R}^2,d_2)$ 为完备度量空间，其中 $d_2$ 为欧式距离. 
>证明：直接根据 $\max\{\lvert x_m-x_n\rvert,\lvert y_m-y_n\rvert\}\leq\sqrt{(x_m-x_n)^2+(y_m-y_n)^2}$ ，从而可知 $\{x_n\},\{y_n\}$ 均为 Cauchy 列从而收敛，因此 $\{(x_n,y_n)\}_{n\geq}$ 也收敛.

>[!example]- 若 $X\subset \mathbb{R}$ 为开集，则 $(X,d)$ 不一定为完备度量空间.
>考虑 Cauchy 列 $\{\frac{1}{n}\}_{n\geq1}\subset (0,1)\subset \mathbb{R}$ ，该 Cauchy 列在 $(0,1)$ 中不收敛.

>[!example]- $(\mathbb{Z},d)$ ，其中 $d$ 为[二进制度量](#^2bitD)，不是完备度量空间.
>证明：考虑 Cauchy 列： $$\{1+2^2+\cdots+2^{2n}\}_{n\geq1}$$ 
>
>该序列并不收敛：因为当 $\epsilon>0$ 充分小时，对于任意的 $x:\lvert x-x_n\rvert<\epsilon$ ，根据度量必须有 $2^{m}\mid \lvert x-x_n\rvert$ 同时 $\frac{1}{m+1}<\epsilon$ ，在这种情况下 $x\rightarrow \infty(\epsilon\rightarrow 0)$ .

从定义可知完备度量空间具有以下性质：

>[!note]- 完备度量空间的闭子空间仍然完备.
>证明：设 $(X,d)$ 为完备度量空间， $Y\subset X$ 为闭集，则对于 $Y$ 中任意的 Cauchy 列，由其在 $X$ 中可知该列收敛，由 $Y$ 为闭集，所以收敛到的极限位于 $Y$ 中.

>[!note]- $X$ 为度量空间，如果 $Y\subset X$ ， $(Y,d)$ 为完备度量空间，则 $Y$ 为闭集.
>证明：对于任意 $Y$ 中的收敛序列 $\{y_n\}_{n\geq1}$ ，不妨试其收敛于 $y\in X$ ，因为该收敛序列同时也是 Cauchy 列，所以在 $Y$ 中收敛于 $y'$ ，从而 $y'=y$ ，因此 $Y$ 为闭集.

$(X,d)$ 为度量空间， $A\subset X$ ，如果 $\{d(x,y):x,y\in A\}$ 为 $\mathbb{R}$ 中的有界集合，则称 $A$ **有界**. 定义集合 $A$ 的直径：$$\text{diam}(A)=\sup\{d(x,y):x,y\in A\}$$ 

类似于 $\mathbb{R}$ 上的闭区间套定理，有下结论，该结论可以用于证明度量空间完备：

>[!note]- $(X,d)$ 是完备度量空间的充分必要条件为对于任意的单调递减的非空<u>闭</u>集合列 $F_1\supset F_2\supset\cdots\supset F_n\supset \cdots$ ，并且满足 $\lim_{n\rightarrow \infty}\text{diam}(F_n)=0$ ，则 $\cap_{n=1}^\infty F_n\neq\emptyset$ .
>证明：
>$\Rightarrow$ ：取 $\{x_n\}_{n\geq1}:x_n\in F_n$ ，则 $\{x_n\}_{n\geq1}$ 为 Cauchy 列，从而收敛于 $x\in X$ ，又 $\{x_n\}_{n\geq m}\subset F_m$ ，所以 $x\in F_m,m\geq1$ ，因此 $\cap_{n=1}^\infty F_m\neq\emptyset$ .
>
>$\Leftarrow$ ：对于任意的 Cauchy 列 $\{x_n\}_{n\geq1}$ ，构造单调递减的闭集列： $F_n=\overline{\{x_k:k\geq n\}}$ ，下面，则 $\text{diam}(F_n)\rightarrow 0(n\rightarrow \infty)$ （这个断言成立需要证明 $F_n$ 是有界的，并且要用到闭集的附着点定义. #imcomplete ），所以存在 $x\in \cap_{n=1}^\infty F_n$ ，对于任意的 $\epsilon>0$ ，存在 $N\in \mathbb{N}$ ，$\forall m,n>N$ ， $d(x_m,x_n)<\frac{\epsilon}{2}$ ，又 $x\in F_N$ ，所以存在 $x_{N'},d(x_{N'},x)<\frac{\epsilon}{2},N'>N$ ，因此 $d(x,x_n)\leq d(x,x_{N'})+d(x_n,x_{N'})<\epsilon$ ，从而可知 $x$ 为 $\{x_n\}_{n\geq1}$ 收敛到的极限.
>^DownCapNEmpty

$(X,d)$ 为度量空间， $f:X\rightarrow X,$ 是**压缩映射**，如果 $\exists r\in(0,1),\forall x,y\in X,d(f(x),f(y))\leq rd(x,y)$ .

>[!note]- Banach 不动点定理： $(X,d)$ 是完备度量空间， $f$ 是压缩映射，则存在唯一不动点 $x\in X:f(x)=x$ .
>证明：唯一性是显然的，下面证明存在：
>任取 $x_0\in X$ ，令 $x_i=f(x_{i-1}),i\geq1$ ，由度量的定义： $d(x_m,x_n)\leq \sum\limits_{k=m}^{n-1}d(x_k,x_{k+1})\leq \sum\limits_{k=m}^{n-1}r^{k}d(x_0,d_1)=d(x_0,d_1)\frac{r^m(1-r^{n-m})}{1-r}$ ，显然该序列为 Cauchy 列. 因此收敛于 $x\in X$ . 即为 $\{x_n\}_{n\geq0}=\{f(x_n)\}_{n\geq1}\rightarrow x$ ，因为 $f$ 为压缩映射，所以 $f$ 在 $X$ 上连续，所以 $f(x)=x$ .

>[!note]- 存在 $\mathbb{R}$ 上处处连续而处处不可导的函数.
>证明的关键在于利用已经连续的函数构造连续函数. 构造方法见[[GTopoDraw]]，具体的构造形式为，首先取连续函数 $f\in C([0,1]),f(0)=0,f(1)=1$ ，然后做从 $C([0,1])$ 到 $C([0,1])$ 的映射 $\mathcal{F}$ ： $$\mathcal{F}(f)=\left\{\begin{aligned}
&\frac{3}{4}f(3x)\\
&-\frac{1}{2}f(3x-1)+\frac{3}{4}\\
&\frac{3}{4}f(3x-2)
\end{aligned}\right.$$ 又 $C([0,1],d_\infty)$ 为完备度量空间，且 $X=\{f\in C([0,1]):f(0)=0,f(1)=1\}$ 为 $C([0,1])$ 的闭子集. 进而 $(X,d)$ 为度量空间. 此外 $d_{\infty}(\mathcal{F}(f),\mathcal{F}(g))\leq \frac{3}{4}d_\infty(f,g)$ ，由 Banach 不动点定理可知存在唯一的 $h\in X$ 使得 $\mathcal{F}(h)=h$ ，下面考虑 $h$ ： $$h=\left\{\begin{aligned}
&\frac{3}{4}h(3x)\\
&-\frac{1}{2}h(3x-1)+\frac{3}{4}\\
&\frac{3}{4}h(3x-2)
\end{aligned}\right.$$ 下面证明 $h$ 处处不可导，对于任意 $x\in[0,1]$ ，存在包含长度为 $\frac{1}{3^n}$ 的区间 $I_n$ 包含 $x$ ， $\forall x'\in I_n$ ， $|f(x')-f(x)|\leq \frac{1}{2^n}$ 因此 $\left\lvert \frac{f(x')-f(x)}{x'-x}\right\rvert>\left(\frac{3}{2}\right)^n\rightarrow \infty(n\rightarrow \infty)$ ，所以不可导.

### Baire 纲定理

#### 疏、稠

可以将所有集合分为**第一纲集**（sets of first category, 稀疏集）和**第二纲集**（sets of second category，非稀疏集）. 需要说明的是：以下的稠、无处稠等概念都是相对于具体的度量空间而言，e.g. $E\subset X$ 是稠子集的意思是 $E$ 是 $X$ 的稠子集. 具体定义如下：

$E\subset X$ ， $\forall$ 非空开集 $G\subset X$ ，如果存在非空开集 $V\subset G$ 使得 $V\cap E=\emptyset$ ，则称 $E$ 为**疏集**（或者 $E$ 在 $X$ 中**无处稠密**（nowhere dense），或称 $E$ 为 $X$ 的**无处稠子集**），或者说任何与 $E$ 相交的开集都不包含在 $E$ 中. 疏集有以下等价刻画：

>[!note]- $E$ 是无处稠集当且仅当 $\bar{E}^\circ=\emptyset$ . 
>证明：
>$\Rightarrow$ ：设 $x\in \bar{E}^\circ$ ，则存在开集 $G\subset \bar{E},x\in G$ ，从而存在非空开集 $V\subset G\subset \bar{E}$ ， $V\cap E=\emptyset\rightarrow E\subset V^c$ ，从而 $\bar{E}\subset V^c$ （由 $V^c$ 为闭集），进而有 $V^c\cap \bar{E}\neq\emptyset$ ，这与 $V\subset \bar{E}$ 矛盾！
>
>$\Leftarrow$ ：设 $\bar{E}^\circ=\emptyset$ ，假设存在非空开集 $G\subset \mathbb{R}^n$ ，对于任意的非空开集 $V\subset G$ 有 $V\cap E\neq\emptyset$ . 则不难证明 $G$ 中的每一个点都是 $E$ 的附着点，从而 $G\subset \bar{E}$ ，因此存在 $x\in G$ ， $x$ 为 $\bar{E}^\circ$ 的内点. 矛盾！

>[!note]- 无处稠密集的闭包仍然无处稠密.
>证明：设 $E\subset X$ 无处稠密，则 $(\bar{\bar{E}})^\circ=(\bar{E})^\circ=\emptyset$ . 

如果 $E$ 在 $X$ 中可以写为可数个疏子集的并， 则称 $E$ 为**稀疏集**（meager set，贫集（瘠）），显然可数个稀疏集的并仍然为稀疏集；称 $E$ 在 $X$ 中**余稀疏**（comeager），如果 $X\backslash E$ 在 $X$ 中稀疏. ^Meager

>[!note]- 无处稠子集是稀疏集. 
>无处稠子集 $E$ 可以表示为可数个 $E$ 的并，因此根据定义可知 $E$ 是稀疏集.

然而稀疏集并不一定是无处稠子集，例如 $\mathbb{R}$ 中的 $\mathbb{Q}$ ，因为 $\mathbb{Q}=\bigcup_{q\in \mathbb{Q}}\{q\}$ ，所以 $\mathbb{Q}$ 是稀疏集，但同时对于 $\mathbb{R}$ 中的任意非空开集（开区间），都一定有 $\mathbb{Q}$ 与之相交，从而 $\mathbb{Q}$ 是稠集，因此 $(\bar{\mathbb{Q}})^\circ=\mathbb{R}$ （或者 $\mathbb{R}$ 中的任意开集，都不存在其开子集与 $\mathbb{Q}$ 不交.）#issue %%话说这是由什么保证的？%%

>[!note]- 如果 $A$ 是 $X$ 的稀疏集并且 $B\subset A$ ，则 $B$ 也为 $X$ 的稀疏集.

---

$E\subset X$ ，如果对于任意的非空开集 $G\subset X$ ， $G\cap E\neq\emptyset$ ，则称 $E$ 为**稠集**（或者 $E$ 在 $G$ 中**稠密**（dense））   . 有以下等价刻画：

>[!note]- $E$ 是稠集当且仅当 $\bar{E}=X$ .
>证明：
>$\Rightarrow$ ：显然 $\bar{E}\subset \mathbb{R}^n$ ，对于任意的 $x\in \mathbb{R}^n$ ， $x$ 的任意邻域都与 $\bar{E}$ 相交，从而 $x$ 为 $E$ 的附着点， $x\in \bar{E}$ .
>
>$\Leftarrow$ ：如果 $\bar{E}=\mathbb{R}^n$ ，则对于任意的开集 $G\subset \mathbb{R}^n$ ，有 $G\cap \bar{E}\neq\emptyset$ ，如果 $G\cap E=\emptyset$ ，则存在 $x\in G\cap \bar{E}\backslash E$ ，因为 $G$ 为 $x$ 的一个邻域，所以 $x$ 不为 $E$ 的附着点， $x\notin \bar{E}$，矛盾！  
>^Dense

由稠集的定义也可得到以下两个结论：

>[!note]- 设 $E\subset A\subset X$ ，如果 $E$ 是 $X$ 的稠子集，则 $A$ 也为 $X$ 的稠子集.
>证明： $X=\bar{E}\subset \bar{A}\subset X\rightarrow \bar{A}=X$ .

>[!note]- $E$ 是稠集当且仅当任给 $x\in X$ ， $E$ 中有序列收敛于 $x$ . 和闭包的一个[等价定义](#^NotAlone)类似，注意区别. 

下面这一定理说明了<u>开</u>稠集和无处稠密集的关系.

>[!note]- $A$ 是 $X$ 的开稠集，则 $X\backslash A$ 为无处稠密集.
>$(\overline{X\backslash A})^\circ=(X\backslash A)^\circ=\emptyset$ . 否则，假设 $(X\backslash A)^\circ\neq \emptyset$ ，因为 $A$ 为稠集，所以 $(X\backslash A)^\circ \cap A\neq\emptyset$ 矛盾！ #issue 反之是否成立?
>^OpenDenseComple

实际上有下面这个等价条件，注意区分：

>[!note]- 开集 $A$ 是稠集当且仅当 $X\backslash A$ 是无处稠集.
>证明： $\Rightarrow$ 上面已经证明. 下面考虑 $\Leftarrow$ ：已知 $X\backslash A$ 是无处稠集，则 $\bar{A}=\overline{A\backslash (\overline{X\backslash A})^\circ}=\overline{A\backslash(X\backslash A)^\circ}$   （但这个结果分析不出来，因为 $A=\emptyset$ 或者 $A=X$ 都成立）考虑 $X\backslash \bar{A}=(X\backslash A)^\circ=(\overline{X\backslash A})^\circ=\emptyset$ ，从而 $\bar{A}=X$ .

类似的也可以定义**有处稠**，即存在闭集 $U\subset X$ ，使得 $\bar{E}=U$ .

>[!example]- $\mathbb{Q}$ 为 $\mathbb{R}$ 中的稠集， $\mathbb{Z}$ 为 $\mathbb{R}$ 中的疏集.

>[!example]- $(0,1)\cap \mathbb{Q}$ 是 $(0,1)$ 的稠子集.

>[!note]- Baire 纲定理：设 $(X,d)$ 是完备度量空间，则有： 1) $X$ 中任意可数个开稠集的交仍然为稠子集； 2) 稀疏集的内部是空集.

#### Baire 纲定理的推论

下面是 Baire 纲定理的推论，这部分多需要用到[[#^OpenCloseComple]].

>[!note]- 度量空间 $(X,d)$ ，若 $A\subset X$ 为第一纲集，则 $A^\circ=\emptyset$ . 
>证明：不妨设 $A=\cup_{n=1}^\infty B_n$ ，其中 $B_n\subset X$ 为无处稠密集， $(\bar{B}_n)^\circ=\emptyset$ ，从而 $X\backslash A=\cap_{n=1}^\infty (X\backslash B_n)$ ，断言： $X\backslash B_n$ 为开稠集： $X=X\backslash(\bar{B}_n)^\circ=\overline{X\backslash \bar{B}_n}\subset \overline{X\backslash B_n}$ （Check[[#^OpenCloseComple]]），从而 $\overline{X\backslash B_n}=X$ ；由 Baire 纲定理可知 $X\backslash A$ 为稠子集. 进而$A^\circ=X\backslash\overline{X\backslash A}=\emptyset$ . （注意：不能由开稠集的补集是无处稠集来证明！不是开集）. 

>[!note]- 若 $X=\cup_{n=1}^\infty F_n$ ，其中 $F_n$ 为闭集，则存在 $n_0\geq1:(F_{n_0})^\circ\neq\emptyset$ .
>证明：注意到 $\emptyset=X\backslash\cup_{n=1}^\infty F_n=\cap_{n=1}^\infty(X\backslash F_n)$ ，从而一定存在 $n_0$ 使得 $X\backslash F_n$ 不是开稠集，否则 $\bar{\emptyset}=X$ 矛盾！进而存在 $X$ 中的开集 $U$ 使得 $U\cap(X\backslash F_n)=\emptyset$ 从而 $U\subset F_n$ .

进而可以得到下面这一定理，该定理说明如果一个度量空间满足 Baire 纲定理，则其全集不能是稀疏集：

>[!note]- $X$ 不能是 $X$ 自身的第一纲集.
>证明：若否，则 $X=\cup_{n=1}^\infty U_n$ ，其中 $U_n\subset X$ 为无处稠密集，则 $X=\cup_{n=1}^\infty \bar{U}_n$ ，从而可得存在 $n_0\geq1:(\bar{U}_n)^\circ\neq\emptyset$ ，矛盾！

进而有下定理：

>[!note]- $X$ 中的任意余贫子集（[余稀疏](#^Meager)）非空.
>证明：否则， $X\backslash A=X$ 在 $X$ 中稀疏，矛盾！

>[!example]- $(\mathbb{Q},d)$ 不满足 Baire 纲定理.
>注意到 $\mathbb{Q}=\bigcup_{q\in \mathbb{Q}}\{q\}$ 为 $\mathbb{Q}$ 中的稀疏集. 与 Baire 纲定理矛盾！

>[!example]- $\mathbb{Q}$ 是 $\mathbb{R}$ 中的第一纲集， $\mathbb{R}\backslash \mathbb{Q}$ 是 $\mathbb{R}$ 中的第二纲集.
>证明：首先由 $\mathbb{Q}=\bigcup_{q\in \mathbb{Q}}\{q\}$ ，而 $\overline{\{q\}}^\circ=\emptyset$ ，从而 $\mathbb{Q}$ 为 $\mathbb{R}$ 中的第一纲集. 而 $\mathbb{R}\backslash \mathbb{Q}$ 若为第一纲集，则 $\mathbb{R}$ 可以表示为可数个无处稠集的并，从而可知 $\mathbb{R}$ 为稀疏集，与 Baire 纲定理矛盾！（因为 $(\mathbb{R},d)$ 是完备度量空间.

>[!example]- 不存在 $f:\mathbb{R}\rightarrow \mathbb{R}$ 满足 $f$ 在所有有理数点连续，在所有无理数点不连续.
>证明：（关键在于如何刻画 $f$ 连续，从而可以构造集合）定义 $f$ 在 $x$ 点处的振幅： $$\begin{aligned}
>&\text{osc}(f,x)=\\& \inf_{\delta>0}\sup\{\lvert f(y)-f(z)\rvert:y,z\in(x-\delta,y+\delta)\}\\
>		\end{aligned}$$ 则 $f$ 在 $x$ 处连续的充分必要条件为 $\text{osc}(f,x)=0$ ，下面考虑集合： $$\{x:\text{osc}(f,x)=0\}=\bigcap_{n=1}^\infty U_n$$ 其中 $$U_n=\{x:\text{osc}(f,x)<\frac{1}{n}\}$$ 断言 $U_n$ 是开集：对于任意 $x_0\in U_n$ ，已知 $$a_\delta=\sup\{\lvert f(y)-f(z)\rvert:y,z\in(x_0-\delta,x_0+\delta\}$$ 从而显然取 $\inf_{\delta>0}a_\delta=0$ ，进而对于任意的 $x\in(x_0-\delta/2,x_0+\delta/2)$ ，考虑 $$b_\delta=\sup\{\lvert f(y)-f(z)\rvert:y,z\in(x-\delta/2,y+\delta/2)\}$$ 进而显然 $b_\delta<a_\delta$ ，从而 $\inf_{\delta>0}b_\delta=0$ ，所以 $U_n$ 为开集. 如果 $f$ 满足上述条件，则 $$\mathbb{Q}=\bigcap_{n=1}^\infty U_n$$ 因为 $\mathbb{Q}$ 是 $\mathbb{R}$ 中的稠集，所以由 $\mathbb{Q}\subset U_n$ 可知 $U_n,n\geq1$ 是开稠集. 下面考虑 $$\mathbb{R}\backslash \mathbb{Q}=\left(\bigcup_{n=1}^\infty \mathbb{R}\backslash U_n\right)$$ 其中 $\mathbb{R}\backslash U_n$ 是无处稠集，可数个无处稠集的并为稀疏集，矛盾！（否则 $\mathbb{R}$ 就是稀疏集，与 Baire 纲定理矛盾） 或者考虑下面的可数个稠子集的交： $$\bigcap_{q\in \mathbb{Q}}\mathbb{R}\backslash\{q\}\cap\bigcap_{n\geq1}U_n=\emptyset$$ 与 Baire 纲定理矛盾！

然而，存在 $f:\mathbb{R}\rightarrow \mathbb{R}$ 在 $\mathbb{R}\backslash \mathbb{Q}$ 连续，在 $\mathbb{Q}$ 不连续，即为 Rietmann 函数. #imcomplete 

### 完备化

下面讨论能否将度量空间“扩张”为完备度量空间，不过这里是在原先的度量空间的像上进行扩张.

首先定义**等距映射**（isometry）：设函数 $f:(X,d)\rightarrow(X',d')$ ，若 $\forall x,y\in X,d'(f(x),f(y))=d(x,y)$ ，则称 $f$ 为等距映射. 如果 $f$ 同时还是满映射，则称 $(X,d),(X',d')$ **等距同构**. 由度量的定义可知等距满映射为双射，在此基础上，逆映射也是等距映射.

下面定义**完备化**：设 $(X,d)$ 是度量空间， $j$ 是 $X\rightarrow \widetilde{X}$ 的等距映射， $\widetilde{X}$ 是完备度量空间， $j(X)$ 为 $\widetilde{X}$ 的稠子集，则称 $\widetilde{X}$ 是 $X$ 的完备化. 

下面这个定理说明了稠子集所在度量空间到另一度量空间的连续映射可以扩张到该稠子集所在的全集到另一度量空间全集的连续映射，同时保持连续映射的性质.

>[!note]- 引理：设 $(X,d)$ 是度量空间， $(X',d')$ 是完备度量空间 #imcomplete 

>[!note]- 任何度量空间都存在唯一的完备化. #imcomplete 

### 序列紧度量空间

设度量空间 $(X,d)$ ，定义**序列紧**： $K\subset X$ ，任何 $K$ 中的序列都有收敛到 $K$ 中点的子列； **全有界**（totally bounded）：任给 $\epsilon>0$ ，$X$ 的开覆盖 $\{B(x,\epsilon):x\in X\}$ 都有有限子覆盖； **紧**：任何包含 $X$ 的开覆盖都有有限子覆盖.

根据定义首先可得：

>[!note] 紧度量空间全有界.

>[!note]- 对于全有界度量空间 $(X,d)$ ，对任意 $A\subset X$ ， $(A,d)$ 也全有界.

>[!note]- Lebeague 引理：设 $U$ 是序列紧度量空间 $(X,d)$ 的一个开覆盖，则 $\exists r>0,\forall x\in X,B(x,r)$ 含于 $U$ 中的某个元素. 并称 $r$ 为 $U$ 的 **Lebeague 数**.
>证明：不妨设对于任意的 $n\geq1$ 都存在 $x_n\in X$ 使得 $B(x_n,\frac{1}{n})$ 不含于 $U$ 中的任一元素. 则 $\{x_n\}_{n\geq1}$ 有收敛子列 $\{x_{n_k}\}_{k\geq1}\rightarrow x\in X$ ，则存在 $V\in U$ 使得 $x\in V$ ，从而 $\{x_{n_k}\}_{k\geq1}$ 终在 $V$ 中，并且一定存在足够大的 $n_k$ 使得 $B(x_{n_k},\frac{1}{n_k})\subset V$ ，矛盾！

下面证明序列紧、紧、全有界且完备这三个概念是等价的.

>[!note]- 序列紧度量空间亦紧.
>证明：设 $U$ 为 $(X,d)$ 的开覆盖，但 $U$ 中无有限子覆盖. 设 $U$ 的 Lebeague 数为 $r$ ，依次取 
>
>$$x_0\in X,x_1\in X\backslash B(x_0,r),x_2\in X\backslash(B(x_0,r)\cup B(x_1,r)),\cdots$$
>
>从而可以得到一个序列 $\{x_n\}_{n\geq1}$ ，其任意两个点之间的距离都大于 $r$ ，因此不可能有收敛子列，这与序列紧矛盾！

>[!note]- 紧度量空间全有界并且完备.
>证明：全有界显然. 下面证明完备：考虑利用[完备度量空间的等价条件](#^DownCapNEmpty)，设 $\{F_n\}_{n\geq1}$ 为一单调递减的非空闭集合列，不妨设 $\bigcap_{n\geq1}F_n=\emptyset$ ，从而 
>
>$$X\backslash\bigcap_{n\geq1}F_n=\bigcup_{n\geq1}X\backslash F_n=X$$
>
>则存在有限子覆盖 $\{X\backslash F_{n_i}\}_{1\leq i\leq k}$ ，并注意到 $X\backslash F_n$ 是单调递增的集合列，从而可得： 
>
>$$X\cap F_{n_k}=\bigcup_{1\leq i\leq k}X\backslash F_{n_i}\supset X$$
>
>因此 $F_{n_k}=X$ 矛盾！

>[!note]- 全有界完备度量空间序列紧.
>对于 $X$ 中的序列 $\{x_n\}$ ，由 $X$ 全有界，首先取 $\epsilon=1$ ，则存在 $X$ 的有限子覆盖 $\{B(x_k,1):1\leq k\leq n\}$ ，进而可取 $B(x_{k_1},1)$ ，其包含有无限多项 $\{x_n\}_{n\geq1}$ 中的元素；由 $B(x_{k_1},1)$ 全有界，取 $\epsilon=1/2$ ，同理可得有 $B(x_{k_2},1/2)$ 包含无限多项 $\{x_n\}_{n\geq1}$ 中的元素，依此类推，可得到一 Cauchy 子列，再由完备性可知该子列收敛. #imcomplete %%证明比较粗糙%%

设 $(X,d)$ 是度量空间， $A\subset X$ ，若 $(A,d)$ 全有界，则称 $A$ 为 $(X,d)$ 的全有界子集.

>[!note]- 度量空间 $(X,d)$ 的子集 $A$ 全有界当且仅当 $A$ 的闭包全有界.
>证明： $\Rightarrow$ 任取 $\epsilon=1>0$ ，则存在 $A$ 的有限子覆盖 $\{B(x_i,\epsilon):1\leq i\leq n\}$ ，假设存在 $x_0\in \bar{A}\backslash A$ ， $x_0\notin B(x_i,\epsilon)$ . 取 $\delta=1/2$ ，对于 $x_0$ 的邻域 $B(x_0,\delta)$ ， $B(x_0,\delta)\cap A=\emptyset$ ，则 $A\subset X\backslash B(x_0,\delta)$ ，从而 $X\backslash B(x_0,\delta)\cap \bar{A}$ 也为包含 $A$ 的闭集，并且 $x_0\notin X\backslash B(x_0,\delta)\cap \bar{A}$ ，这与 $\bar{A}$ 的定义矛盾！ 
>
>$\Leftarrow$ 因为 $A\subset \bar{A}$ ，所以对于任意 $\epsilon>0$ ，如果 $A$ 没有有限子覆盖 $\{B(x_i,\epsilon)\}_{1\leq i\leq n}$ ，则 $\bar{A}$ 也不会存在有限子覆盖，矛盾！

>[!note]- 若 $(X,d)$ 是完备度量空间，则 $K\subset X$ 序列紧当且仅当 $K$ 是 $(X,d)$ 的全有界的闭子集.
>证明： $\Rightarrow$ ：对于 $K$ 中的任意收敛子列 $\{x_n\}_{n\geq1}$ ，其有收敛子列 $\{x_{n_k}\}_{k\geq1}\rightarrow x\in K$ 从而由极限的唯一性知 $\{x_n\}_{n\geq1}$ 收敛到 $x\in K$ ，从而 $K$ 为闭集. 设存在 $\epsilon>0$ ；下面首先证明 $K$ 存在 Lebeague 数：假设 $U$ 为 $K$ 的一个开覆盖，如果对于任意的 $n\geq1$ ，存在 $B(x_n,\frac{1}{n})$ 不包含于 $U$ 中的一个元素，则 $\{x_n\}_{n\geq1}$ 有收敛到 $K$ 中 $x$ 的子列，进而可得矛盾. 所以存在 $r>0$ ， $B(x,r)$ 包含于 $U$ 的任何一个元素中，如果 $U$ 没有 $K$ 的有限子覆盖，则可以依次取 $x_0\in K,x_1\in K\backslash B(x_0,r),\cdots$ ，进而得到 $\{x_n\}_{n\geq1}$ ，其不可能有收敛子列，矛盾！所以 $K$ 是 $(X,d)$ 的全有界的闭子集.
>
>$\Leftarrow$ ：对于 $K$ 中的任一子列 $\{x_n\}_{n\geq1}$ ；可以取 $\epsilon=1$ ，则存在 $B(x_1,1)$ 包含有 $\{x_n\}_{n\geq1}$ 中的任意多项，全有界集的子集仍然为全有界集，进而可取 $B(x_2,1/2),\cdots,B(x_n,1/2^n),\cdots$ 分别包含有 $\{x_n\}_{n\geq1}$ 中的无限多项，从而可以得到一个 Cauchy 子列，该子列也收敛.

>[!note]- 度量空间 $(X,d)$ 全有界当且仅当其完备化 $(\gamma X,\rho)$ 序列紧.
>证明： $\Rightarrow$ ： $\gamma X=\overline{\rho(X)}$ ，若 $(X,d)$ 全有界，则对于任意的 $\epsilon>0$ ，存在 $X$ 的有限子覆盖 $\{B(x_i,\epsilon):1\leq i\leq n\}$ ，又因为 $\rho$ 是等距映射，所以 $\{B_{\gamma X}(\rho(x_i),\epsilon):1\leq i\leq n\}$ 是 $\rho(X)$ 的有限子覆盖，由上结论： $(X,d)$ 的子集 $A$ 全有界当且仅当 $A$ 的闭包全有界可知， $\gamma X$ 全有界，并且 $\gamma X$ 完备，所以 $\gamma X$ 序列紧.
>
>$\Leftarrow$ ：因为 $(\gamma X,\rho)$ 序列紧，所以 $\gamma X$ 全有界，则 $\rho(X)\subset \gamma X$ 为全有界集，并且由 $\rho$ 是等距映射可知 $(X,d)$ 也全有界.

## 其他集合上的度量空间

### 二元数列

集合 $S=\{0,1\}^\mathbb{N}\overset{def}{=}2^{\mathbb{N}}$ . 定义度量 

$$d(x,y)=\left\{\begin{aligned}&0,x=y\\&2^{-n},n=\min\{i:x_i\neq y_i\}\end{aligned}\right.$$

### $\mathbb{Z}$

集合 $\mathbb{Z}$ ，定义度量： $$d(m,n)=\left\{\begin{aligned}
&0,m=n\\
&\frac{1}{1+k},2^k\mid (m-n),2^{k+1}\nmid(m-n)
\end{aligned}\right.$$ 称为**二进制度量**. ^2bitD

### $C([0,1])$ 上的度量空间

$C([0,1])$ 表示 $[0,1]$ 上所有的连续函数的集合.

常见的度量有： $d(f,g)=\sup\{\lvert f-g\rvert:\{x\in[0,1]\}$ . 其中对于三角不等式的证明： $$\lvert f-g\rvert+\lvert g-h\rvert\geq \lvert f-h\rvert,\forall x\in[0,1]$$ 进而对于不等式的左边两项可以取 $\sup$ 得到： $$d(f,g)+d(g,h)\geq \lvert f-h\rvert,\forall x\in[0,1]$$ 再对左侧取 $\sup$ 即可.

此外还可以定义： $d(f,g)=\left[\int_0^1\lvert f-g\rvert^pdx\right]^\frac{1}{p}$ .

>[!example]- $C[0,1]$ 上的度量 $d(f,g)=\int_0^1\lvert f(x)-g(x)\rvert dx$ 和 $d_\infty(f,g)=\sup_{x\in[0,1]}\lvert f(x)-g(x)\rvert$ 不[等价](#^EqualD).
>根据等价的定义：如 $(C([0,1]),d)$ 和 $(C([0,1]),d_\infty)$ 等价，则对于存在两个度量空间中的同胚映射. 取 $\{f_n(x)=x^n,x\in[0,1]\}_{n\geq1}$ ，则其收敛于 $0$ ，而在 $d_\infty$ 下其收敛于 $1$ .

>[!example]- 考虑 $[0,1]$ 上有界实函数全体，记为 $l^\infty([0,1])$ ，定义 $d_\infty(f,g)=\sup\{\lvert f-g\rvert:x\in[0,1]\}$ ， $(l^{\infty}([0,1]),d_\infty)$ 为完备度量空间. 进一步，由 $C([0,1])$ 为 $l^\infty([0,1])$ 的闭子空间知， $C([0,1])$ 为完备度量空间. 并且在 $d_\infty$ 下一致收敛. #issue 
>证明：对于 $l^\infty([0,1])$ 上的一个 Cauchy 列 $\{f_n\}_{n\geq1}$ ，注意到其在 $[0,1]$ 上逐点为 Cauchy 列，从而可知逐点收敛，设收敛到的函数为 $f_\infty$ ，下面需要证明 $f_\infty$ 为有界函数. 

### $(0,1],[0,1),[0,1],(0,1)$

>[!example]- 任给 $x,y\in(0,1]$ ，令 $d(x,y)=\lvert 1/x-1/y\rvert$ 证明： 1) $d$ 为 $(0,1]$ 上的度量，并且与欧式度量等价. 2) $((0,1],d)$ 是完备度量空间.
>1) $d(x,y)\geq0$ ，当且仅当 $x=y$ 时取 $0$ ，并且 $d(x,y)=d(y,x)$ ， $d(x,z)=\lvert 1/x-1/z\rvert\leq d(x,y)+d(y,z)$ . 注意到 $d(x,y)=\lvert \frac{y-x}{xy}\rvert$ . 因此若在 $(X,d)$ 中 $\{x_n\}_{n}\rightarrow x(n\rightarrow \infty)$ ，则 $\forall \epsilon >0,\exists \delta>0,\lvert x_n-x\rvert<\delta:\frac{\lvert x_n-x\rvert}{xx_n}<\epsilon$ ，从而 $\lvert x_n-x\rvert<\epsilon xx_u<\epsilon$ ，因此在 $(X,d_1)$ 中 $\{x_n\}_n\rightarrow x(n\rightarrow \infty)$ ，其中 $x>0$ ，则 $\forall \epsilon x^2/2>0$存在 $N,n>N$ 时 ， $\frac{\lvert x-x_n\rvert}{xx_n}\leq \frac{\epsilon x^2/2}{xx_n}<\frac{\epsilon x^2/2}{x^2/2}<\epsilon$ .因此两者等价.
>2) 对于 $(0,1]$ 上的 Cauchy 列 $\{x_n\}_{n\geq1}$ ，其同时也为 $[0,1]\subset \mathbb{R}$ 上的 Cauchy 列 ，因此一定收敛于 $x\in [0,1]$ ，如果 $x=0$ ，则对于任意的 $\epsilon>0$ ，存在 $N\in \mathbb{N},m>N$ 时有： $d(x_m,0)=\lvert 1/x_m\rvert<\epsilon$ ，而注意到当 $\epsilon<1$ 时就已经不可能成立.

# 特殊集合

## Cantor 集

**Cantor集** / 三分集：对于集合 $[0,1]$ 三等分之后取 $[0,\frac{1}{3}],[\frac{2}{3},1]$ ，对剩下的集合重复操作. 记 Cantor 集为 $C$ ， $G=[0,1]\backslash C$ .

或可以将 Cantor 集的构造视为三分之后首先取中间的开区间，记 $G=\bigcup_{n=1}^\infty\bigcup_{k=1}^{2^{n-1}}I_n^k$ 其中 $I_n^k$ 表示第 $n$ 次三分之后，第 $k$ 个开区间. 然后取 $C=[0,1]\backslash G$ .

>[!note]- $G$ 在 $[0,1]$ 中[稠密](#^Dense).
>反证：假设 $\exists x\in [0,1]\backslash \bar{G}$ ，因为 $\bar{G}$ 是闭集，所以 $[0,1]\backslash G$ 为开集，则 $\exists V(x,\epsilon)\cap \bar{G}=\emptyset$ ，而对于 $\epsilon$ 可以取得 $n$ 使得 $\frac{1}{3^n}<\epsilon$ . 
>这说明 $V(x,\epsilon)$ 一定会包含一个长度为 $\frac{1}{3^{n+1}}$ 的 $G$ 中的区间. 从而与 $V(x,\epsilon)\cap \bar{G}=\emptyset$ 矛盾！

可以证明 Cantor集具有以下性质：

>[!note]- Cantor 集为 1) 有界闭集； 2）不包含任何开区间（也就没有内点，从而不是开集）； 3) 不可数.
>注意到 Cantor 集可以表示为 
>
>$$C=\cap_{i=1}^\infty(F^i_1\cap\cdots\cap F^i_{2^i})$$
>
>从而 $C$ 为闭集，并且有界 $[0,1]$ . 或者由 $C=[0,1]-G$ 得.
>
>不妨设 $C$ 包含开区间 $(a,b)$ ，第 $i$ 层（划分）对应的闭区间的长度为 $\frac{1}{3^i}$ ，显然当 $i$ 足够大时， $\frac{1}{3^i}<\lvert b-a\rvert$ ，因此 Cantor 集不可能包含任何一个开区间.
>
>对于 Cantor 集中的任何一个点，都可以按照其构造方法将其对应到一个二元数列（比如，第 $i$ 层划分若该点位于左侧，则其对应数列的 $x_i=0$ ，位于右侧则 $x_i=1$ ），这是一个双射，又全体二元数列不可数，所以 Cantor集不可数.

>[!note] Cantor 集是完备疏集.
>证明：显然 Cantor 集是闭集，要证明其完备性考虑 Cauchy 列 $\{x_n\}_{n\geq1}\subset C$ #imcomplete ；由 $C$ 的定义即可得到. #issue %% [[RF#完备]] 和 [[#完备度量空间]] 是一回事吗？%%
>对于 $C$ 是疏集的证明：因为上面已经证明了 $C$ 中没有内点，所以 $\bar{C}^\circ=C^\circ=\emptyset$ . 综上 $C$ 是完备疏集.

>[!note]- Cantor集与 $2^{\mathbb{N}}$ 同胚. 从而 $C$ 具有连续统势.
>之前已经建立了映射，具体描述如下： 
>
>$$\begin{aligned}
>&f:C\rightarrow 2^{\mathbb{N}}\\
>&f(x)_n=\left\{\begin{aligned}
>&1,x\in F^{n}_m,m\text{ 为奇数}\\
>&0,x\in F^{n}_m,m\text{ 为偶数}
>\end{aligned}\right.
>\end{aligned}$$ 
>
>该映射显然为单射，满射则可以通过区间套定理证明.
>
>下面证明 $f$ 是连续映射：考虑用其等价定义
>
>用[[#二元数列]]中的度量 $d$ ，对于 $\{0,1\}^\mathbb{N}$ 中一开集 $U$ ，考虑： $f^{-1}(U)=\{x\in C,f(x)\in U\}$ ，进而 $\forall x\in f^{-1}(U)$ ，存在包含 $f(x)$ 的一个开球 $B_d(f(x),\epsilon)\subset U$ ，不妨设 $\epsilon\geq\frac{1}{2^k}$ ，由度量的定义： $d(f(x),*)$ 只能取 $\frac{1}{2},\cdots$ ，因此对于 $\epsilon\geq\frac{1}{2^k}$ ，只需要取 $C$ 中的开球 $B_{d'}(x,\frac{1}{3^{k+1}})$  即可，这样能够保证对于任意的 $x'\in B_{d'}(x,\frac{1}{3^{k+1}})$ ，均有 $f(x'),f(x)$ 在前 $k+1$ 位都完全一致，从而 $d(f(x'),f(x))<\frac{1}{2^{k+1}}<\epsilon$ . 因此 $f(x')\in U$ ，从而 $B_{d'}(x,\frac{1}{3^{k+1}})\subset U$ ，因此 $f^{-1}(U)$ 为开集. 所以 $f$ 是连续映射.
>
>证明 $C$ 具有连续统势还可将 $C$ 中的点对应到三元数列 $\{a_n\}_{n\geq1},a_n\in\{0,1,2\}$ . 对任意 $x\in[0,1]$ ， $x=\sum\limits_{n=1}^{\infty}\frac{a_n}{3^n}$ . 则 $c\leq \lvert C\rvert$ ，另一方面 $C$ 中的每一个元素都在 $[0,1]$ 中，直接可以用恒等映射构造一个 $C$ 到 $[0,1]$ 的子集的双射，从而 $\lvert C\rvert\leq c$ ，所以 $c=\lvert C\rvert$

>[!note] $C$ 没有孤立点.

由 $C$ 和 $2^\mathbb{N}$ 同胚，只需证明 $\{0,1\}^\mathbb{N}$ 没有孤立点即可. 对于任意的 $(x_n)_{n\geq1}\in\{0,1\}^\mathbb{N}$ ，对其任意邻域，不妨设存在基 $B_x=p_{1}^{-1}(U_1)\cap \cdots\cap p_m^{-1}(U_m)$ 包含 $(x_n)$ ，其中 $U_i=\{y_i\},1\leq i\leq m$ 为单点集，因此 $B_x=\prod_{1\leq i\leq m}^{}U_i \times \prod_{}^{}X_j$ ，显然包含除 $(x_n)$ 之外的点.

>[!example]- $\mathbb{R}$ （ $[0,1]$ ）上不可数的稠密零测集. [check-mse](https://math.stackexchange.com/questions/1610098/example-of-an-uncountable-dense-set-with-measure-zero)
> $C\cup\mathbb{Q}$ （ $C\cup ([0,1]\cap \mathbb{Q})$ ）

>[!note]- 存在 Cantor 集到闭区间的连续满映射 $f:C\rightarrow[0,1]$ . #imcomplete 

下面讨论定义在 $G$ 上的 **Cantor 函数** ： 

$$f(x)=\frac{2k-1}{2^n},x\in I_n^k,1\leq k\leq 2^{n-1}$$

补充 $f(0)=0,f(1)=1$ ，将 $f$ 延拓为 $[0,1]$ 上的函数. 则 $f$ 在 $[0,1]$ 上的单调递增且连续.

>[!hint]- $\mathbb{R}$ 上稠子集与连续的关系.
>假设 $g([a,b])$ 是 $[a,b]$ 的稠子集. 则对于任意 $x\in[a,b]$ ，对于任意开区间 $U\ni g(x)$ ， $U\cap[a,b]\neq \emptyset$ . 所以可取开区间 $V\subset U\cap [a,b],V\ni x$ ，使得对于任意 $x'\in V,g(x')\in U$ ，因此 $g$ 在 $[a,b]$ 上连续.
>
>注意到 $f([0,1])$ 为 $[0,1]$ 的稠子集，所以 $f$ 在 $[0,1]$ 上连续.

# 拓扑

## 子集族、算子刻画拓扑

>[!summary]+ 自查表
>- 拓扑、拓扑空间的定义；
>- 开集、闭集、内部、闭包的定义；
>- 邻域、邻域系的定义；
>- 子空间的定义；

集合 $X$ 上的**拓扑** $\mathcal{O}$ 指的是满足下列条件的 $X$ 的子集族：

1. $\emptyset,X\in \mathcal{O}$ ；
2. $\forall U,V\in \mathcal{O}$ ， $U\cap V\in \mathcal{O}$ ；
3. 若 $\Omega\subset \mathcal{O}$ ，则 $\bigcup\Omega\in \mathcal{O}$ .

称 $\mathcal{O}$ 为 $X$ 上的一个**拓扑**（topology）， $(X,\mathcal{O})$ 是一个**拓扑空间**（topological space）， $X$ 称为该拓空间的**承载集**（underlying set）， $\mathcal{O}$ 中的元素称为其**开集**（open set），为简便起见，或省去 $\mathcal{O}$ ，将拓扑空间 $(X,\mathcal{O})$ 简记为 $X$ . 由上定义可知， $X$ 上有限个开集的交仍然为开集.

设 $\mathcal{O}_1,\mathcal{O}_2$ 是 $X$ 上的拓扑，若 $\mathcal{O}_1\subset \mathcal{O}_2$ 则称 $\mathcal{O}_1$ 粗于（coarser than） $\mathcal{O}_2$ / $\mathcal{O}_2$ 细于（finer than） $\mathcal{O}_1$ ；或称 $\mathcal{O}_1$ 弱于（weaker） $\mathcal{O}_2$ ， $\mathcal{O}_2$ 强于（stronger） $\mathcal{O}_1$ .

>[!example] $\{0,1\}$ 上的拓扑.
>$\{\emptyset,\{0,1\}\}$ ； $\{\emptyset,\{0\},\{1\},\{0,1\}\}$ ； $\{\emptyset,\{0\},\{0,1\}\}$ ； $\{\emptyset,\{1\},\{0,1\}\}$ .

在[[#度量空间]]中讨论了 $(X,d)$ 中的开集 $W$ 定义为： $\forall x\in W,\exists r>0,B(x,r)\subset U$ ，并且可以验证这样定义的开集全体 $\mathcal{O}$ 是 $X$ 上的一个拓扑，称为由 $d$ 诱导的拓扑，或记为 $\mathcal{O}_d$ . 能够被度量诱导的拓扑称为**可度量拓扑**：对于 $(X,\mathcal{O})$ ，存在 $X$ 上的度量 $d$ 使得 $\mathcal{O}=\mathcal{O}_d$ . 另外也可以回顾[等价度量](#^EqualD)的概念，以 $d_1,d_2$ 诱导的拓扑是否相同来定义是否等价是非常自然的. ^dable

定义**闭集**：若 $X\backslash A$ 是开集，则称 $A$ 为闭集. 则可以由下面的**闭集族公理**刻画拓扑空间：设 $\mathcal{F}$ 为拓扑空间 $X$ 的闭集族，则有：

1. $\emptyset,X\in\mathcal{F}$ ；
2. $F,G\in \mathcal{F}\rightarrow F\cup G\in \mathcal{F}$ ；
3. 若 $\Omega\subset \mathcal{F}\rightarrow \bigcup \Omega\in \mathcal{F}$ .

>[!example]- $\overline{A\cap B}=\bar{A}\cap \bar{B},(A\cup B)^\circ=A^\circ\cup B^\circ$ 不成立.
>考虑 $A=(0,1),B=(1,2)$ ，则 $\overline{A\cap B}=\emptyset$ ， $\bar{A}\cap \bar{B}=\{1\}$ .
>
>考虑 $A=[0,1],B=[1,2]$ ，则 $(A\cup B)^\circ=(0,2)$ ， $A^\circ\cup B^\circ=(0,1)\cup(1,2)$ .

>[!note]- 设 $F$ 是拓扑空间 $X$ 的闭集， $A\subset X$ ，证明 $(F\cup A^\circ)^\circ=(F\cup A)^\circ$ .
>证明：记 $$A^\circ=\{A_i:A_i\text{ 为 }X\text{ 的开集},A_i\subset A\}=\bigcup_{i\in I}A_i$$ 进而可得 $$(F\cup A^\circ)^\circ=\left(\bigcup_{i\in I}F\cup A_i\right)^\circ$$ 任何包含于 $F\cup A^\circ\subset F\cup A$ 的开集一定包含于 $F\cup A$ ，并且任何包含于 $F\cup A$ 的开集一定包含于 $F$ 或者 $A$ 从而包含 $F$ 或者 $A_i,i\in I$ . 所以 $(F\cup A^\circ)^\circ=(F\cup A)^\circ$ .

与在度量空间中的定义一致: $A$ 的**内部**（interior） $A^\circ$ 为 $(X,\mathcal{O})$ 上包含于 $A$ 的全体开集 $U$ 的并， $A$ 的**闭包**（closure） $\bar{A}$ 为 $(X,\mathcal{O})$ 上包含 $A$ 的全体闭集的交，并定义 $A$ 的**边界**（boundary） $\partial{A}=\bar{A}-A^\circ$ .

在[度量空间](#开集、闭集)中，借助度量首先定义了开球，然后引入邻域的概念，进而定义开集.

而在借助集合族对于拓扑进行刻画时，首先定义开集，下面定义**邻域**（neighborhood）：任给 $x\in X,A\subset X$ ，如果存在开集 $U$ 使得 $x\in U\subset A$ ，则称 $A$ 为 $x$ 的邻域，并且可知 $U$ 为开集当且仅当 $U$ 为 $x$ 中任何一个点的邻域（因为 $x\in U\subset U$ ）注意，这一定义并不要求 $x$ 的邻域是开集. ^Neighborhood

在度量空间中定义了聚点和孤立点这些概念，在拓扑中同样可以定义，为与之后谈到的网收敛不混淆，称为**凝聚点**.

设 $x\in X,A\subset X$ ，称 $x$ 是 $A$ 的凝聚点，如果 $x\in \overline{A\backslash \{x\}}$ ，记 $A$ 的凝聚点全体为 $A^d$ . 有如下性质：

>[!note] $\overline{A}=A^\circ\cup A^d$ ，特别地，当 $A^d=\emptyset$ 时 $\overline{A}=A$ .

>[!note] $\forall A,B\subset X,(A\cup B)^d=A^d\cup B^d$ .

定义**孤立点**：存在该点的一个邻域 $B$ ， $B\cap X$ 为单点集.

>[!note]- $x\in A^\circ$ 当且仅当 $A$ 是 $x$ 的邻域.

在度量空间中，[稠子集](#^Dense)是用开集刻画的，并且有两个等价定义.

在借助集合族对于拓扑进行刻画时定义仍保持一致. 若 $A$ 的闭包是全集，则称 $A$ 为 $X$ 的稠子集.

设 $X$ 为拓扑空间，定义 $X$ 的**闭包算子**： $\text{cl}:\mathcal{P}(X)\rightarrow \mathcal{P}(X),A\mapsto \bar{A}$ 则不难验证闭包算子有如下性质： 

$$\begin{aligned}&(\text{cl}1)\ \text{cl}(\emptyset)=\emptyset\\&(\text{cl}2)\ \text{cl}(A)\supset A\\&(\text{cl}3)\ \text{cl}(A\cup B)=\text{cl}(A)\cup \text{cl}(B)\\&(\text{cl}4)\ \text{cl}(\text{cl}(A))=\text{cl}(A)\end{aligned}$$

下面的定理说明满足闭包算子的这四条性质的映射可以定义唯一一个 $X$ 上的拓扑，使得 $\text{cl}(A)$ 即为 $A$ 在该拓扑中的闭包， $\forall A\subset X$ .

>[!note]- Kuratowski 闭包算子定理. #imcomplete 

类似地可以定义**内部算子**： $\text{int}:\mathcal{P}(X)\rightarrow \mathcal{P}(X),A\mapsto A^\circ$ 其具有如下性质 

$$\begin{aligned}&(\text{int}1)\ \text{int}(X)=X\\&(\text{int}2)\ \text{int}(X)\subset A\\&(\text{int}3)\ \text{int}(A\cap B)=\text{int}(A)\cap \text{int}(B)\\&(\text{int}4)\ \text{int}(\text{int}(A))=\text{int}(A)\\\end{aligned}$$

并且对于满足以上四条内部算子性质的映射 $\text{int}$ ，存在唯一一个 $X$ 上的拓扑空间，使得 $\text{int}(A)=A^\circ,\forall A\subset X$ .

到目前为止已经用度量、开集族、闭集族、特殊映射刻画拓扑，此外还可以用 $X$ 的子集族刻画 $X$ 上的拓扑.

定义拓扑空间 $X$ 上的**邻域系**： $x\in X$ ，子集族 $\mathcal{N}(x)=\{V\subset X:x\in V^\circ\}$ 称为 $X$ 的邻域系. 由之前对于[邻域](#^Neighborhood)的定义， $\mathcal{N}(x)$ 即为 $x$ 的邻域全体. 邻域系具有如下性质： 

$$\begin{aligned}&(\text{N}1)\ X\in \mathcal{N}(x),\forall x\in X\\&(\text{N}2)\ \forall U\in \mathcal{N}(x),x\in U\\&(\text{N}3)\ U\in \mathcal{N}(x),U\subset V\rightarrow V\in \mathcal{N}(x)\\&(\text{N}4)\ U,V\in \mathcal{N}(x)\rightarrow U\cap V\in \mathcal{N}(x)\\&(\text{N}5)\ U\in \mathcal{N}(x),\exists V\in \mathcal{N}(x),U\in \mathcal{y},\forall y\in V\\\end{aligned}$$

>[!note]- 邻域系刻画拓扑：设 $X$ 为一集合， $\mathcal{N}(x)$ 为 $X$ 的一个子集族，如果 $\{\mathcal{N}(x)\}_{x\in X}$ 满足 $(N1)\sim(N5)$ ，则存在 $X$ 上唯一拓扑 $\mathcal{O}$ ，使得对于任意 $x\in X$ ， $\mathcal{N}(x)$ 均为 $x$ 的邻域系.

### 子空间

设 $(X,\mathcal{O})$ 为拓扑空间， $Y\subset X$ ，则 $Y$ 的子集族 $\mathcal{O}|Y=\{U\cap Y:U\in \mathcal{O}\}$ 也为一个拓扑，称 $(Y,\mathcal{O}| Y)$ 为 $(X,\mathcal{O})$ 的一个**子空间**. 若 $Y$ 是 $X$ 的开（闭）集，则称 $(Y,\mathcal{O}|Y)$ 是 $(X,\mathcal{O})$ 的一个开（闭）子空间.

>[!note]- 若 $(Y,\mathcal{O}|Y)$ 是 $(X,\mathcal{O})$ 的子空间，则 $Y$ 的子集 $A$ 是闭集当且仅当存在 $(X,\mathcal{O})$ 的闭集 $F$ 使得 $A=Y\cap F$ .
>证明： $\Rightarrow$ ：存在 $U\in \mathcal{O}$ ， $Y\backslash A=U\cap Y$ . 因此 $A=Y\backslash (U\cap Y)=Y\backslash U$ ，考虑 $X\backslash U$ ，则 $A=Y\cap U^c=Y\cap X\cap U^c=Y\cap (X\backslash U)$ ， $X\backslash U$ 为 $(X,\mathcal{O})$ 中闭集.
>
>$\Leftarrow$ ： 注意证明的是 $A$ 是 $Y$ 的闭集： $Y\backslash A=Y\backslash (Y\cap F)=Y\backslash F=Y\cap F^c$ ，所以 $Y\backslash A$ 是 $Y$ 中的开集，则 $A$ 是 $Y$ 中的闭集.

>[!note]- 闭集拼接定理

承接下面的连续映射的概念，有子空间拓扑的一个刻画：

>[!note] 设 $(X,\mathcal{O})$ 是拓扑空间， $Y\subset X$ ，则 $Y$ 的子空间拓扑是 $Y$ 上使得含入映射 $i: Y\rightarrow X$ 连续的最粗的拓扑. 
>证明：首先证明 $i$ 是连续映射：对于 $X$ 中的任意开集 $U$ 
>
>$$i^{-1}(U)=\{x\in Y:i(x)\in U\}=\{x\in Y: x\in U\}=Y\cap U$$
>
>从而 $i^{-1}(U)$ 为 $Y$ 中的开集.
>
>其次，设 $\mathcal{T}$ 为 $Y$ 中使得 $i: Y\rightarrow X$ 连续的拓扑，则对于任意的 $U\in \mathcal{O}$ ，由定义可知 $U=X\cap U'$ ，其中 $U'$ 为 $X$ 中的开集，由 $i^{-1}(U')\in \mathcal{T}$ 可得 $U\in \mathcal{T}$ ，从而 $\mathcal{O}\subset \mathcal{T}$ . 从而可得结论.


换言之，子拓扑是又一个映射确定的，在[[#乘积空间]]中会继续讨论，这种由映射确定的拓扑空间称为初始拓扑.

## 连续映射和同胚

>[!summary]+ 自查表
>- 连续映射的定义；等价刻画；
>- 含入映射的定义；

连续映射是拓扑学的核心概念.

设 $X,Y$ 为拓扑空间， $f:X\rightarrow Y$ 为映射，如果 $Y$ 的每一个开集 $V$ 在 $f$ 下的原像 $f^{-1}(V)$ 是开集则称 $f$ **连续**.

>[!hint] 证明 $f$ 是 $Y\rightarrow X$ 上的连续映射.
>还可证明 $X$ 中的子基的原像为 $Y$ 中开集，或 $X$ 中的子基的原像为 $Y$ 中开集.

定义**开映射**：任给 $X$ 的开集 $U$ ， $f(U)$ 为开集；**闭映射**：任给 $X$ 的闭集 $F$ ， $f(F)$ 为闭集.

定义**含入映射**：设 $f: X\rightarrow Y$ ，其中 $X$ 为 $Y$ 的子集，称 $f=\mathbb{1}_X$ 为含入映射. 即： $f: x\mapsto x,\forall x\in X\subset Y$ .

连续映射有以下等价刻画：

>[!note] 设拓扑空间 $X,Y$ ， $f:X\rightarrow Y$ ，有以下等价命题：1) $f$ 连续；2) $\forall x\in X$ ， $f$ 在 $x$ 连续；3) $\forall A\subset X(f(\overline{A})\subset \overline{f(A)})$ ；4) 任给闭集 $F\subset Y$ ， $f^{-1}(F)$ 为 $X$ 中的闭集；5) $\forall B\subset Y,f^{-1}(B^\circ)\subset f^{-1}(B)^\circ$ . [[2421Su153848]]

### 同胚

称一个性质是**拓扑性质**，如果在同胚映射下保持该性质.

>[!warning] 从 $X$ 到 $Y$ 存在连续双射 $\not\Rightarrow$ $X$ 和 $Y$ 同胚.
>如果 $X$ 是紧空间，  $Y$ 是 Hausdorff 空间，则该命题成立.

设 $X,Y$ 为拓扑空间， $f: X\rightarrow Y$ 为连续映射，若存在连续映射 $g:Y\rightarrow X$ 满足 $g\circ f=1_X,f\circ g=1_Y$ ，则称 $f:X\rightarrow Y$ 为**同胚映射**. 

如果 $X\rightarrow Y$ 存在同胚映射，则称 $X$ 和 $Y$ **同胚**. 

> [!example] $f: X\rightarrow Y$ 是连续双射， $f^{-1}: Y\rightarrow X$ 不是连续映射（ $f$ 不是同胚映射）的例子？
>$$f(x)=\left\{\begin{aligned}
>&x,x\in[0,1)\\
>&1+x,x\in[2,3]
>\end{aligned}\right.$$

拓扑空间同胚的例子： #imcomplete-lack-examples 

设映射 $f:X\rightarrow Y$ ，称 $f$ 是**同胚嵌入**，如果 $X$ 与 $f(X)$ 同胚，其中 $f(X)$ 上的拓扑是 $Y$ 的子拓扑.

## 遗传性质

同胚刻画的是两个拓扑空间之间的等价，同样可以刻画拓扑空间与其子空间的等价.

设 $P$ 为拓扑性质，如果具有 $P$ 的拓扑空间 $X$ 的任何子空间都具有 $P$ ，则称 $P$ 为遗传性质；如果 $X$ 的任何闭（开）子空间都具有 $P$ ，则称 $P$ 为闭（开）遗传性质.

## 基刻画拓扑

>[!summary]+ 自查表
>- 回顾：构成区间是什么？
>- 什么是基？基中元素是否是开集？
>- 基的等价定义？
>- 基的性质有哪些？什么是以基生成的拓扑？Sorgenfrey 拓扑是如何定义的？
>- 子基的定义？邻域基的定义？
>- 什么是第一可数空间、第二可数空间？两者之间的关系？
>- 回顾：什么是稠子集？
>- 什么是可分？第二可数空间为什么可分？

注意到， $\mathbb{R}$ 中的每个开集都可以写成一族端点为有理数的开区间的并. 下面考虑对于一般的拓扑空间.

设 $(X,\Omega)$ 为拓扑空间， $\mathcal{B}$ 为一族开集，若其满足： $(X,\mathcal{O})$ 中的每一个开集都可以表示为 $\mathcal{B}$ 中的一些元素的并，则称 $\mathcal{B}$ 为 $\mathcal{O}$ 的一个**基**（basis）. ^Basis

基的概念即为用部分开集刻画全体开集. 基有如下等价定义：

>[!note]- 设 $(X,\mathcal{O})$ 是拓扑空间， $\mathcal{B}$ 为一组开集，则 $\mathcal{B}$ 是 $\mathcal{O}$ 的基当且仅当给开集 $U$ 以及 $x\in U$ ，存在 $B_x\in \mathcal{B}:x\in B_x\subset U$ . #imcomplete-lack-proofs 

基具有如下性质：

$$\begin{aligned}
&1.\ X=\bigcup \mathcal{B}\\
&2.\ \forall B_1,B_2\in \mathcal{B},x\in B_1, B_2\rightarrow \exists B_3\in \mathcal{B},x\in B_3\subset B_1\cap B_2
\end{aligned}$$

>[!note]- 对于 $X$ 如果其子集族 $\mathcal{B}$ 满足上面两条性质，则存在唯一一个 $X$ 上的拓扑 $\mathcal{O}$ ，其以 $\mathcal{B}$ 为基. 称 $\mathcal{O}$ 为 $X$ 上以 $\mathcal{B}$ 为基生成的拓扑.
>构造 $\mathcal{O}=\{U\subset X:\forall x\in U,\exists B_x\in \mathcal{B}, x\in B_x\subset U\}$ .
>存在性显然，唯一性由定义即可得.

设 $(X,\mathcal{O})$ 为拓扑空间， $\mathcal{B}$ 是一族开集，如果开集族 

$$\{X\}\cup\{U_1\cap U_2\cap \cdots\cap U_n:U_i\in \mathcal{B},n\geq1\}$$ 
是 $\mathcal{O}$ 的一个基，则称 $\mathcal{B}$ 为 $\mathcal{O}$ 的一个**子基**（subbasis）. 即为，基中的每一个元素都可以表示为子基的有限交.

设 $X$ 为拓扑空间， $x\in X$ ， $\mathcal{A}$ 为 $x$ 的一族邻域. 若任给 $x$ 的邻域 $U$ ，存在 $A\in \mathcal{A}$ 使得 $A\subset U$ ，则称 $\mathcal{A}$ 为 $x$ 的一个**邻域基**.

称 $X$ **第一可数**或者有**可数邻域基**，如果 $X$ 的每一个点都有一个可数的邻域基；称 $X$ **第二可数**，若 $X$ 有一个可数的基；如果 $X$ 具有可数的稠子集，则称 $X$ 是**可分**的.

>[!note]- 第二可数空间是可分的第一可数空间.
>证明：利用基的等价定义，设 $X$ 的可数基为 $\{B_n\}_{n\geq1}$ ，则对于任意 $x\in X$ ，对于任意 $x$ 的邻域 $A$ ，存在 $x\in B_n\subset U\subset A$ ，则取 $\mathcal{B}=\{B_k:x\in B_k,k\geq1\}$ 即为 $X$ 的一个邻域基. 所以 $X$ 第二可数.
>
>另一方面：取 $x_n\in B_n$ ，则 $\{x_n\}_{n\geq1}$ 与 $X$ 的任何一个非空开集的交集非空，所以 $\{x_n\}_{n\geq1}$ 为 $X$ 的稠子集，所以第二可数空间可分.

>[!note]- 第二可数空间的开连续像第二可数；第一可数空间的开连续像第一可数.
>证明：设 $X$ 为第二可数空间，设 $f$ 为 $X$ 上的开连续函数，则对于 $f(X)$ 上的任意开集 $V$ ， $f^{-1}(V)$ 是开集，设 $\mathcal{B}=\{B_n\}_{n\geq1}$ 是 $X$ 的可数基，则存在 $I\subset \mathbb{N}$ 使得 $f^{-1}(V)\subset \bigcup_{i\in I}B_i$ ，所以 $V=f(f^{-1}(V))\subset f\left(\bigcup_{i\in I}B_i\right)=\bigcup_{i\in I}f(B_i)$ . 并且 $f(B_i)$ 为开集，则 $\{f(B_n)\}_{n\geq1}$ 是 $f(X)$ 的一个开集.
>
>设 $X$ 为第二可数空间，考虑 $f(x)\in f(X)$ ，任给 $f(x)$ 的邻域 $A$ ，则存在开集 $U$ 满足 $f(x)\in U\subset A$ ，并且 $x\in f^{-1}(U)\subset f^{-1}(A)$ ，其中 $f^{-1}(U)$ 为开集，则 $f^{-1}(A)$ 是 $x$ 的邻域，设 $x$ 的邻域基为 $\mathcal{N}$ ，则存在 $N\in \mathcal{N}$ 使得 $x\in N\subset f^{-1}(A)$ ，所以 $f(x)\in f(N)\subset A$ ，取 $\{f(N)\}_{N\in \mathcal{N}}$ ，即为 $f(x)$ 的邻域基.

>[!note]- 设 $\{\mathcal{O}_i\}_{i\in I}$ 是 $X$ 上的一族拓扑， $I\neq\emptyset$ 证明：

1) $\bigcap_{i\in I}\mathcal{O}_i$ 是 $X$ 上的拓扑，并且是比每个 $O_i$ 都粗的最细的拓扑；
2) 以 $\bigcup_{i\in I}\mathcal{O}_i$ 为子基生成的拓扑是比每个 $O_i$ 都细的最粗的拓扑；

证明：

1) 因为 $\mathcal{O}_i$ 是 $X$ 上的拓扑（ $i\in I$ ），所以 $\emptyset,X\in \mathcal{O}_i,\forall i \in I$ ，所以 $\cap_{i\in I}\mathcal{O}_i\ni \emptyset,X$ ，对于 $V,U\in \bigcap_{i\in I}\mathcal{O}_i$ ，可知 $V\cap U\in \mathcal{O_i},\forall i\in I$ ，所以 $V\cap U\in \bigcap_{i\in I}\mathcal{O_i}$ ，同理可证对于 $\Omega\subset \bigcap_{i\in I}\mathcal{O}_i$ ， $\bigcup \Omega\subset \bigcap_{i\in I}\mathcal{O}_i$ . 所以 $\bigcap_{i\in I}\mathcal{O}_i$ 是 $X$ 上的拓扑. 因为 $\bigcap_{i\in I}\mathcal{O}_i\subset \mathcal{O}_i,\forall i\in I$ ，所以 $\bigcap_{i\in I}\mathcal{O}_i$ 比任何一个 $\mathcal{O}_i$ 都要粗. 此外对于任意的比每个 $\mathcal{O_i}$ 都要粗的拓扑 $\mathcal{W}$ ，其包含于 $\bigcap_{i\in I}\mathcal{O}_i$ ，所以 $\bigcap_{i\in I}\mathcal{O}_i$ .... 

2) 设 $\mathcal{W}$ 为以 $\bigcup_{i\in I}\mathcal{O}_i$ 为子基生成的拓扑. 则开集族： $\{X\}\cup\{U_1\cap U_2\cap \cdots\cap U_n:U_i\in \bigcap_{i\in I}\mathcal{O}_i,n\geq1\}$ 是 $\mathcal{W}$ 的一个子基. 所以对于 $\mathcal{O}_i$ 中的任何一个开集 $U$ ，其 [[2422Tu085950]]

>[!note]- 设 $X$ 为第一可数空间，映射 $f:X\rightarrow Y$ 保持序列的极限，即任给 $X$ 的序列 $\{x_n\}_{n\geq1}$ ，如果 $\{x_n\}_{n}$ 收敛于 $x$ ，则 $\{f(x_n)\}_n$ 收敛于 $f(x)$ . 证明 $f$ 连续.
>证明：任取 $A\subset X$ ，取 $x\in \bar{A}$ ，由 $X$ 为第一可数空间，根据命题 4.4.2 存在 $\{x_n\}_{n\geq1}\subset A,x_n\rightarrow x(n\rightarrow \infty)$ . 所以 $f(x_n)\rightarrow f(x)(n\rightarrow \infty)$ . 所以 $f(x)\in \overline{f(A)}$ . 所以 $f(\bar{A})\subset \overline{f(A)}$ . 所以 $f$ 为连续映射.

>[!note]- 设 $X$ 为第一可数空间， $\{x_n\}_n$ 是 $X$ 的序列，证明若 $x$ 为 $\{x_n\}$ 的聚点，则 $\{x_n\}_n$ 有子列收敛于 $x$ .
>由 $x$ 为 $\{x_n\}_n$ 的聚点可知， $\{x_n\}_n$ 常在 $x$ 的每个邻域，设 $\mathcal{B}=\{B_n\}_n$ 为 $X$ 的可数邻域基，考虑 $V_n=\cap_{1\leq i\leq n} B_i$ ，则存在 $x_{n_i}\in V_i$ ，所以 $\{x_{n_i}\}_i$ 收敛于 $x$ .

## 收敛刻画拓扑

>[!summary]+ 自查表
>- 回顾：终在、收敛、极限；
>- 举例说明 $X$ 上的序列在不同的拓扑空间上的极限不一定相同；

与度量空间中定义[收敛](#^Limit)类似，设 $\{x_n\}_{n\geq1}\subset X$ ，称 $\{x_n\}_{n\geq1}$ 收敛到 $x$ ，如果 $\{x_n\}_{n\geq1}$ 终在 $x$ 的任何一个邻域中. （等价定义：终在包含 $x$ 的任何一个开集中），称 $x$ 为 $\{x_n\}_{n\geq1}$ 的极限，并记 $\lim x_n$ 为 $\{x_n\}_{n\geq1}$ 的极限全体.

>[!warning]- 同一 $X$ 上的序列在不同的拓扑空间上的极限不同，且可能不唯一.

在之前刻画度量空间上的闭包时用到了收敛作为等价定义 [check](#^NotAlone) ，而在一般的拓扑空间上收敛没有这样的性质.

>[!note]- 设 $X$ 为第一可数拓扑空间，则 $x\in \bar{A}$ 当且仅当 $A$ 中有序列收敛于 $x$ .
>证明： 首先度量空间中闭包的[第二定义](#^Closure)在一般的拓扑空间中仍然等价与闭包的定义. 
>
> $\Rightarrow$ ：考虑 $x$ 的一个可数邻域基 $\{B_n(x)\}_{n\geq1}$ ，则对于任意的 $B_n'(x)=\bigcap_{k=1}^nB_k(x),\exists U\subset B'_n(x)$ （这里利用了邻域基的第二个性质以证明 $U$ 的存在性）， $U\cap A\neq \emptyset$ ，从而存在 $x_n\in U\cap A\subset B_n(x)$ $\{x_n\}_{n\geq1}$ ，并且显然 $\{B'(x)\}$ 仍然是 $x$ 的一个邻域基，进入对于 $x$ 的任何一个邻域 $B$ ，存在 $x_i\in B_i'(x)\in B$ ，并且因为 $\{B_n'(x)\}$ 单调递减可知当 $n\geq i$ 时， $x_n\in B$ ，所以 $\{x_n\}_{n\geq1}$ 收敛于 $x$ .
>
>$\Leftarrow$ ：对于包含 $x$ 的任何一个开集 $U$ ，存在邻域基中的一个元素 $B_x\in U$ ，因为 $\{x_n\}_{n\geq1}$ 收敛于 $x$ 所以一定存在 $x_i\in B_x$ ，进而 $U\cap A\neq\emptyset$ . 所以 $x\in \bar{A}$ .

### 📍网收敛

序列收敛不能完全刻画拓扑空间中（的闭集，要求是第一可数空间），引入**网收敛**以刻画拓扑.

首先定义**预序**的概念：设 $\sqsubseteq$ 为集合 $D$ 上的一个二元关系，其满足： 1) 自反性 $\forall d\in D,d\sqsubseteq d$ ；2) 传递性 $\forall d_1,d_2,d_2\in D,d_1\sqsubseteq d_2,d_2\sqsubseteq d_3\rightarrow d_1\sqsubseteq d_3$ ，则称 $\sqsubseteq$ 为 $D$ 上的预序.

定义**定向集**（directive set）：设集合 $D$ ， $\sqsubseteq$ 为 $D$ 上的预序，并且 $\forall d_1,d_2\in D,\exists d_3\in D,s.t.$ $d_1\sqsubseteq d_3,d_2\sqsubseteq d_3$ ，则称 $(D,\sqsubseteq)$ 为定向集.

定向集的概念类似于序列 $\{x_n\}_{n\geq1}$ 的指标集 $I=\mathbb{N}$ ，但比后者要广泛许多（定向集并不要求 $d$ 中两个元素一定存在序 / 不要求全序）. 

下面这个定向集在收敛理论中很有用：

>[!example]- $(\mathcal{N}(x),\supset)$ 是定向集，其中 $\supset$ 是集合的包含关系，也称为**信息序**.

定向集的概念可以描述这种“信息大小”的差异，例如下面这个例子，比较划分的细度：

>[!example]- 设 $D$ 为 $[0,1]$ 上的划分全体（e.g. $P=\{x_1,\cdots,x_n:a<x_1<\cdots<x_n<b\}$ ，要求 $P\in D$ 为有限集）. 定义预序 $\sqsubseteq: P\sqsubseteq Q\Leftrightarrow l(P)\geq l(Q)$ ，其中 $l(P)=\max\{x_i-x_{i-1}:1\leq i\leq n+1,x_0=a,x_{n+1}=b\}$ . $(D,\sqsubseteq)$ 为定向集.
>取 $P\cap Q$ 以满足条件.

设<u>集合</u> $X$ 的一个定向集为 $(D,\sqsubseteq)$ ，称映射 $\xi:(D,\sqsubseteq)\rightarrow X$ 为 $X$ 的一个**网**（net）. 或可以用 $\{\xi(d)\}_{d\in D}$ 表示网.

下面定义**网**的终在和收敛（这里最好就将网视作一个序列 $\{\xi(d)\}_{d\in D}$ ，和 $\{x_n\}_{n\geq1}$ 保持一致，原先的 $\forall n>N$ 平行地置换为 $\forall e\sqsupseteq d$ .）

设 $\xi:(D,\sqsubseteq)\rightarrow X$ ， $A\subset X,x\in X$ ，如果存在 $d\in D,\forall e\sqsupseteq d,\xi(e)\in A$ ，则称 $\xi$ （或者 $\{\xi(d)\}_{d\in D}$ ）**终在** $A$ 中；如果 $\xi$ 终在 $x$ 的任何一个邻域中，则称 $\xi$ **收敛**于 $x$ ，用 $\lim \xi$ 表示 $\xi$ 的所有极限组成的集合.

>[!warning] $\lim \xi\neq \emptyset$ 则称 $\xi$ 收敛.

下面来讨论几个网的收敛，注意只要求存在一个点是网的极限即可.

>[!example]- 定向集 $(\mathbb{R}\{0\},\sqsubseteq)$ 其中 $x\sqsupseteq y\Leftrightarrow \lvert x\rvert\leq \lvert y\rvert$ ，设网 $\xi:(\mathbb{R},\sqsubseteq)\rightarrow \mathbb{R},x\mapsto f(x),f:\mathbb{R}\rightarrow \mathbb{R}$ . 则网 $\xi$ 收敛的充分必要条件是 $\lim_{z\rightarrow 0}f(z)$ 存在.
>假设 $x$ 为 $\xi$ 的极限，则考虑 $x$ 的邻域基 $\left\{\left(-\frac{1}{n}+x,x+\frac{1}{n}\right)\right\}_{n\geq1}$ ，易证 $\xi$ 收敛到 $x$ 的充要条件为 $\xi$ 收敛到 $x$ 的邻域基中的任何一个元素，等价于对于任意的 $n\geq1$ ，存在 $y\in \mathbb{R},\forall \lvert z\rvert\leq \lvert y\rvert$ 都有 $f(z)\in \left(-\frac{1}{n}+x,x+\frac{1}{n}\right)$ ，所以 $\lim_{z\rightarrow 0}f(z)=x$ ，因此网 $\xi$ 收敛的充分必要条件为存在 $h\in \mathbb{R}$ $\lim_{z\rightarrow 0}f(z)=h$ 等价于 $\lim_{z\rightarrow0}f(z)$ 存在.

>[!example]- 考虑定向集 $(\mathcal{N}(x),\supset)$ ，建立收敛到 $x$ 的网.
>设 $\xi:(\mathcal{N}(x),\supset)\rightarrow X$ ，对于 $x$ 的任何邻域 $U$ ，存在 $V\in \mathcal{N}(X),\forall W\subset V$ ， $\xi(W)\in U$ ，不妨构造满足 $\xi(U)\in U$ 的映射，令 $V=U$ ，对于任意的 $W\subset U$ ， $\xi(W)\in W\subset U$ ，从而可知 $\xi$ 为收敛到 $x$ 的网.

还可以用网收敛刻画积分. #imcomplete 

从以上几个例子可以看出，基于定向集定义的网收敛实际上一种推广的极限.

下面说明网收敛可以刻画拓扑，只需要说明网收敛与之前定义的等价拓扑等价即可.

>[!note]- 设 $X$ 为拓扑空间， $A\subset X,x\in X$ 则 $x\in \bar{A}$ 等价于 $A$ 中有网 $\{\xi(d):d\in D,\xi(d)\in A\}$ 收敛于 $x$ . #imcomplete-lack-proofs 
>^NetLimitClose

定义在网收敛中的聚点. 设 $X$ 是拓扑空间， $\xi:(D,\sqsubseteq)\rightarrow X$ 是 $X$ 的一个网， $A\subset X,x\in X$ ，若 $\forall d\in D,\exists e\in D$ 使得 $d\sqsubseteq e,\xi(e)\in A$ 则称 $\xi$ **常在** $A$ 中；若 $\xi$ 常在 $x$ 的每个邻域，则称 $x$ 为 $\xi$ 的**聚点**（cluster point），记 $\xi$ 的聚点全体为 $\text{clust}\xi$.

>[!note] $\lim \xi\subset \text{clust}\xi$ .

>[!note]- 设 $X,Y$ 是度量空间，证明 $f: X\rightarrow Y$ 连续当且仅当 $f$ 保持聚点：任给网 $\xi:(D,\sqsubseteq)\rightarrow X,f(\text{clust}(\xi))\subset \text{clust}(f\circ \xi))$ .
>证明：$\Rightarrow$ ：设 $x\in \text{clust}(\xi)$ ，因为 $f$ 连续，任给 $f(x)$ 的邻域 $U$ ，存在 $x$ 的邻域 $V,f(V)\subset U$ ，又因为 $x\in \text{clust}(\xi)$ ， $\forall d\in D,\exists e\in D,\xi(e)\in V$ ， $f(\xi(e))\in U$ ，所以 $f(x)\in \text{clust}(f\circ \xi)$ ，所以 $f(\text{clust}(\xi))\subset \text{clust}(f\circ \xi)$ . 
>
> $\Leftarrow$ ：对于任意的 $A\subset X$ ，若 $x\in \bar{A}$ ，则 $A$ 中有网 $\xi:(D,\sqsubseteq)\rightarrow X$ 收敛于 $x$ ，对于任意的 $x$ 的邻域 $U$ ，存在 $d',\forall e\in D: d'\sqsubseteq e$ 有 $\xi(d')\in U$ ，从而对于任意的 $d\in D$ ，因为 $D$ 是定向集，所以存在 $e\sqsupseteq d,e\sqsupseteq d'$ 从而 $\xi(e)\in U$ ，所以 $x$ 是 $\xi$ 的聚点，从而 $f(x)$ 是 $f\circ \xi$ 的聚点，对于任意的 $f(x)$ 的邻域 $V$ ，对于任意的 $d\in D$ ，存在 $e\in D,e\sqsupseteq d$ ， $f(\xi(e))\in V$ ，并且 $\xi(e)\in A$ ，所以 $f(\xi(e))\in V\cap A$ ，所以 $V\cap A\neq\emptyset$ ，所以 $f(x)\in \overline{f(A)}$ ，所以 $f(\bar{A})\subset \overline{f(A)}$ . 所以 $f: X\rightarrow Y$ 连续.

>[!note]- $\bigcap_{d\in D}\overline{A_d}=\text{clust}\xi$ ， $A_d=\{\xi(e):d\sqsubseteq e\}$ .
>证明：设 $x\in \bigcap_{d\in D}\overline{A_d}$ ，则对于 $x$ 的任一邻域 $V$ ， $V\cap A_d\neq \emptyset,\forall d\in D$ ，从而对于任意的 $d\in D,\exists \xi(e)\in V\cap A_d\subset V$ ，并且 $e\sqsupseteq d$ ，所以 $x\in \text{clust}\xi$ ；设 $x\in \text{clust}\xi$ ，则对于给定的 $d\in D$ ，任给 $x$ 的邻域 $V$ ，存在 $e\sqsupseteq d$ 满足 $\xi(e)\in V$ ，所以 $V\cap A_d\neq \emptyset$ ，所以 $x\in \overline{A_d}$ ，再由 $d$ 的任意性知 $x\in \bigcap_{d\in D}\overline{A_d}$ . 综上 $\bigcap_{d\in D}\overline{A_d}=\text{clust}\xi$ .
>^ClustXi

下面定义子网.

首先定义**共尾映射**（cofinal map）：设 $(D,\sqsubseteq_D),(E,\sqsubseteq_E)$ 是定向集，称 $h: D\rightarrow E$ 是共尾映射，如果 $\forall d\in D,\exists e\in E$ ，对于任意的 $e'\sqsubseteq_E e$ 有 $d\sqsubseteq_D h(e')$ . （以下为方便或省略 $\sqsubseteq_E,\sqsubseteq_D$ 的下标）

称网 $\eta$ 是网 $\xi$ 的子网，如果存在共尾映射 $h$ 使得 $\eta=\xi\circ h$ .

观察可知一个网的子网相当于只作用在一部分定向集上. 显然子序列是子网，但：

>[!warning]+ 以序列形式呈现的子网并不一定是子序列.
>考虑序列 $x_1,\cdots,x_n,\cdots$ ；考虑序列 $S=x_1,x_2,x_1,x_3,\cdots$  具体排列形式可以随意变化，但是要求每一个 $x_i$ 只能在 $S$ 中出现任意次，这样任给 $D=\mathbb{N}$ 中的一个元素 $n$ ，总存在 $S$ 中的一个元素 $s'$ ， $s'$ 之后的元素均大于 $n$ .

从中应该感觉到共尾想要表达的含义：只要 $(D,\sqsubseteq)$ 的任意一个尾段 $\{d':d'\sqsupseteq d\}$ 为 $(E,\sqsubseteq)$ 的一个尾段 $\{e':e'\sqsupseteq e\}$ 的像即可. 无论这个尾段在何处（事实上，定向集的两个尾段是无法比较的）.

>[!note]- 设 $\xi$ 为拓扑空间 $X$ 的网，则 $x$ 是 $\xi$ 的聚点当且仅当 $\xi$ 有子网收敛于 $x$ . #imcomplete-lack-proofs 

# 📍紧 Hausdorff 空间

紧 Hausdorff 空间是一种具有临界性质的拓扑结构，从开集角度粗略看，紧要求的是开集不能太多，而 Hasudorff 性质则要求开集不能太少；从收敛角度，紧要求每个网都有聚点 $\Leftrightarrow$ 有一个收敛子网，而 Hausdorff 要求每个网至多有一个极限（然而这好像没有冲突，因为 $\lim \xi\subset \text{clust}\xi$ ）.

之后也会说明紧 Hausdorff 的这种临界性质：承载集相同的情况下，比其严格细的拓扑将不保持紧性，比起严格粗的拓扑将不保持 Hausdorff 性质.

此外，紧 Hausdorff 也有一些更好的性质，例如 $T_4$ ，以及 Baire 性质：可数个开稠子集的交为稠子集.

## 紧

设拓扑空间 $X$ ，若 $W\subset X$ ， $W$ 的任意开覆盖都存在有限子覆盖，则称 $W$ 为 $X$ 的**紧子集**；若 $X$ 为 $X$ 的紧子集，则称 $X$ 为**紧空间**，注意：紧空间的任意子空间不一定是紧空间.

>[!note]- 紧是拓扑性质.
>证明：设 $f: X\rightarrow Y$ 是同胚映射，则对于任意 $Y$ 的开覆盖 $\{U_i\}_{i\in I}$ ，由 $Y\subset \bigcup_{i\in I}U_i$ 可得 $X\subset f^{-1}\left(\bigcup_{i\in I}U_i\right)=\bigcup_{i\in I}f^{-1}(U_i)$ ，由 $\{f^{-1}(U_i)\}_{i\in I}$ 是 $X$ 的开覆盖，可得结论.

事实上只要求连续满射，就可以保持紧. 紧集的连续像是紧集.

>[!note]- 紧是闭遗传性质.
>证明：设 $K$ 为紧空间 $X$ 的闭子空间，对于任何 $K$ 的开覆盖 $\mathcal{U}=\{V\cap Y:V\in \mathcal{V}\}$ ，其中 $\mathcal{V}$ 为 $X$ 上的开集族，进而 $\mathcal{V}\cup \{X\backslash Y\}$ 为 $X$ 的一个覆盖，从而存在 $X$ 的有限子覆盖： $\{V_1,\cdots,V_n\in \mathcal{V},X\backslash Y\}$ ，从而 $Y=X\cap Y=\bigcup_{i=1}^nV_i\cap Y=\bigcup_{i=1}^nV_i\cap Y$ ， $\{V_i\cap Y\}_{1\leq i\leq n}$ 即为 $Y$ 的有限子覆盖.

实际上可以利用紧集的闭遗传性质判断一个集合是否是闭集.

>[!example]- 考虑 Sorgenfrey 直线 $\mathbb{R}_l$ ， $[0,1]$ 不是其紧子集，所以 $[0,1]$ 不是 $\mathbb{R}_l$ 的闭集.
>考虑： $\left\{[0,1-\frac{1}{n})\right\}_{n\ge1}\cup \{[1,2)\}$ .

>[!example]- 紧不是开遗传性质.
>显然的例子是 $(0,1)\subset [0,1]$ ， $(0,1)=\bigcup_{n\geq1}(1/n,1)$ .

>[!example]- 紧空间的紧子集不一定闭.
>证明：考虑 $X=\{0,1\}$ ，定义在 $X$ 上的拓扑空间为 $\{\emptyset,\{1\},X\}$ ，则 $\{1\}$ 为 $X$ 的紧集，而 $\{1\}$ 是开集.
>

>[!warning]- 紧空间的无限紧子集是否一定闭？ #issue 

>[!example]- 两个紧子集的交不一定是紧子集.
>再如：考虑 $\mathbb{N}\cup\{e,\pi\}$ ，其拓扑为 $\mathbb{N}$ 的离散拓扑加上 $\{e\}\cup \mathbb{N},\{\pi\}\cup \mathbb{N}$ ， $\{e,\pi\}\cup \mathbb{N}$ . 可验证其是拓扑，但 $\mathbb{N}$ 不是紧子集.

>[!warning]- 闭紧集的交不一定是紧集. #imcomplete-lack-proofs 

>[!note] 对 $(X,\mathcal{O}),K\subset X$ ， $K$ 为 $X$ 中的紧子集当且仅当 $(K,\mathcal{O}|_K)$ 是紧空间.

从紧空间的定义出发很容易得到下面的条件：

>[!note] 设 $(X,\mathcal{O})$ ，则 $X$ 紧当且仅当对于任意的开集族 $\mathcal{U}\subset \mathcal{O}$ ，如果 $\mathcal{U}$ 中任意的有限子族都不覆盖 $X$ ，则 $\mathcal{U}$ 也不覆盖 $X$ .

下面给出紧空间的等价刻画. 设集族 $\mathcal{A}$ ，如果 $\mathcal{A}\neq\emptyset$ 并且对于 $\mathcal{A}$ 的任意有限个元素，其交非空，则称 $\mathcal{A}$ 具有**有限交性质**.

>[!note]- 拓扑空间 $X$ 是紧空间当且仅当其每个满足有限交性质的<u>闭集族</u>的交非空.
>证明： $\Rightarrow$ ：设 $\mathcal{A}$ 为 $X$ 上的<u></u>闭集族并且满足有限交性质，取集族 $U=\{X\backslash A:A\in \mathcal{A}\}$ ，对于任意的 $U_1,\cdots,U_n\in U,n<\infty$ ，因为 $\mathcal{A}$ 有限交，所以 $\bigcup_{1\leq i\leq n}U_i\neq X$ ，而 $X$ 是紧空间，所以 $U$ 不是 $X$ 的开覆盖，所以 $X\backslash \bigcap \mathcal{A}=\bigcup U\neq X$ ，所以 $\bigcap \mathcal{A}\neq \emptyset$ .
> $\Leftarrow$ ：设 $\mathcal{U}$ 为 $X$ 的一个开覆盖，令 $\mathcal{F}=\{X\backslash U:U\in \mathcal{U}\}$ ， $\bigcap \mathcal{F}=X\backslash \bigcup \mathcal{U}$ ，如果 $\mathcal{U}$ 没有有限子覆盖，则 $\mathcal{F}$ 满足有限交性质，从而 $\bigcap \mathcal{F}\neq \emptyset$ . 所以 $\bigcup \mathcal{U}\not\supset X$ 矛盾！

紧空间可以用网收敛刻画：

>[!note]- 等价命题： 1) $X$ 是紧空间；2) $X$ 的每个网都有聚点；3) $X$ 的每个网都有收敛子网.
>证明： $1)\rightarrow 2)$ ：由 [[#^ClustXi]] ，设 $X$ 的一个网 $\xi$ ，则 $\text{clust}\xi=\bigcap_{d\in D}\overline{A_d}$ 其中 $A_d=\{\xi(e): e\sqsupseteq d\}$ ，考虑 $X\backslash \text{clust}\xi$ ，因为 $X$ 是紧空间，且由网的定义可知集族 $\{A_d\}_{d\in D}$ 满足有限交性质，所以 $\{A_d\}_{d\in D}$ 的交非空，所以 $\text{clust}\xi\neq \emptyset$ ；
>
>$2)\rightarrow 1)$ ：考虑 $X$ 的一个满足有限交性质的闭集族 $\mathcal{F}$ ，不妨设 $\forall F_1,F_2\in \mathcal{F},F_1\cap F_2\neq \emptyset$ （不改变 $\bigcap \mathcal{F}$ ）. (下面试图构造 $\text{clust}\xi=\bigcap_{d\in D}\overline{A_d}=\bigcap \mathcal{F}\neq \emptyset$ ，为此，只需要构造 $\mathcal{F}=\{A_d\}_{d\in D}$ 即可) 考虑 $D=\{(x,F): x\in F\in \mathcal{F}\}$ ，称 $(x,F_x)\sqsubseteq (y,F_y)$ 如果 $F_x\supset F_y$ ，定义网 $\xi:(D,\sqsubseteq)\rightarrow X,\xi((x,F))=x$ ，则对 $d=(x,F)\in D$ ：：
>
>$$\begin{aligned}
>A_d &=\{\xi(e):e\sqsupseteq d\}\\
>&=\{y:(y,F_y)\sqsupseteq (x,F)\}\\
>&=\{y:F_y\subset F,y\in F_y\}\\
>&=\bigcup_{F_y\subset F_y}F=F
>\end{aligned}$$
>
>所以 $\text{clust}(\xi)=\bigcap_{d\in D}\overline{A_d}=\bigcap \mathcal{F}\neq \emptyset$ ，所以 $X$ 是紧空间. 
>
>$2)\leftrightarrow 3)$ 见 [[#网收敛]] .
>

之前在度量空间中已经定义过[[#序列紧]]的概念，也可以在拓扑空间上定义**序列紧**：任意序列都有收敛子列；定义**可数紧**： $X$ 的可数子覆盖具有有限子覆盖. 显然可数紧可以得到序列紧.

>[!note]- 若 $X$ 是第一可数紧空间，则 $X$ 序列紧.
>证明：设 $\{x_n\}_{n\geq1}$ 为 $X$ 的一个序列，因为 $X$ 是紧空间，所以 $\{x_n\}_{n\geq1}$ 有聚点 $x$ ， $\{x_n\}_{n\geq1}$ 常在 $x$ 的任何一个邻域中，因为 $X$ 是第一可数紧空间，所以 $x$ 有可数邻域基 $\{N_k(x)\}_{k\geq1}$ . 不妨设 $\{N_k(x)\}_{k\geq1}$ 单调递减，对于任意的 $N_k(x)$ ，对于任意的 $k$ ，存在 $k'>k$ 使得 $x_{k'}\in N_k(x)$ ，进而取 $\{x_{k'}\}_{k\geq1}$ 即可知其终在 $x$ 的任何一个邻域中.

>[!note]- 若 $X$ 序列紧，则 $X$ 可数紧.
>证明：设 $\mathcal{U}=\{U_{n}\}_{n\geq1}$ 是 $X$ 的一个开覆盖，假设 $\mathcal{U}$ 没有 $X$ 的有限子覆盖，则取 $x_n\in X\backslash\bigcup_{1\leq i\leq n}U_i$ ，因为 $\{x_n\}_{n\geq1}$ 有收敛子列 $\{x_{n_k}\}_{k\geq1}$ ，设 $x_{n_k}\rightarrow x(k\rightarrow \infty)$ ，并且存在 $U_m\ni x$ ，所以 $x_{n_k}$ 终在 $U_{m}$ 中，而 $x_n\notin \bigcup_{1\leq i\leq n}U_i$ ，所以当 $k>m$ 时， $x_{n_k}\notin \bigcup_{1\leq i\leq n_k}U_i\rightarrow x_{n_k}\notin \bigcup_{1\leq i\leq m}U_i\rightarrow x_{n_k}\notin U_m$ 矛盾！

>[!note]- 若 $X$ 为第二可数空间，且可数紧，则 $X$ 紧.
>证明：设 $\mathcal{U}$ 为 $X$ 的开覆盖， $\{B_n\}_{n\geq1}$ 为 $X$ 的可数基. 则由基的等价定义，对于任意 $x\in X$ ，任意 $U\in \mathcal{U}$ ，存在 $B_n,x\in B_n\subset U$ ，设 $n_x=\min\{n:x\in B_n\subset U\}$ . 令 $I=\{n_x:x\in X\}$ ，下面考虑 $\mathcal{U}'=\{U_i\in \mathcal{U}:U\supset B_{i}\}_{i\in I}$ . 对于任意的 $x\in X$ ，存在 $i_x\in I$ ，使得 $x\in B_{i_x}\subset U_{i_x}$ 所以 $\mathcal{U}'$ 为 $X$ 的一个可数子覆盖，从而有有限子覆盖，所以 $X$ 为第二可数空间.

特别地：

- 当 $X$ 是第二可数空间时，紧、序列紧、可数紧等价；
- 当 $X$ 是第一可数空间时，若 $X$ 紧，则 $X$ 序列紧、可数紧；

>[!example] 紧 $\not\Rightarrow$ 序列紧.
>考虑 $X=\{0,1\}^{\mathcal{P}(\mathbb{N})}$ ，根据 Tychonoff 定理可知 $X$ 是紧空间. 假设 $X$ 序列紧，考虑 $X$ 中的序列 $\{f_n\}_{n\ge1}$ ，其中：
>
>$$f_n(A)=\left\{\begin{aligned}
>&1,n\in A\\
>&0,n\notin A
>\end{aligned}\right.\quad \forall A\in \mathcal{P}(\mathbb{N})$$
>
>[!note]- 可数紧空间的连续像可数紧.
>证明：设 $X$ 为可数紧空间，设 $f$ 为 $X$ 上的连续函数，对于 $f(X)$ 的一个可数开覆盖 $\{U_n\}_{n\geq1}$ ， $f^{-1}(U_n),\forall n\geq1$ 为开集，并且 $\bigcup_{n\geq1}f^{-1}(U_n)\supset f^{-1}\left(\bigcup_{n\geq1}U_n\right)\supset f^{-1}(f(X))=X$ ，从而存在可数子覆盖 $\{f^{-1}(U_{n_k})\}_{1\leq k\leq m}$ ， $\bigcup_{1\leq k\leq m}f^{-1}(U_{n_k})\supset X$ ，从而 $\bigcup_{1\leq k\leq m}U_{n_k}\supset \bigcup_{1\leq k\leq m}f(f^{-1}(U_{n_k}))\supset f(X)$ ，所以 $f(X)$ 可数紧.
 
>[!note]- 拓扑空间 $X$ 可数紧当且仅当 $X$ 的每个单调降的非空闭集列都有非空的交.
>证明： $\Rightarrow$ 设 $\{F_n\}_{n\geq1}$ 为 $X$ 的单调降非空闭集列，则 $\{X\backslash F_n\}_{n\geq1}$ 为 $X$ 的非空开集列，如果 $\bigcap_{n\geq1} F_n=\emptyset$ ，则 $\{X\backslash F_n\}_{n\geq1}$ 为 $X$ 的开覆盖，从而存在有限子覆盖 $\{X\backslash F_{n_k}\}_{1\leq k\leq m}$ ，从而 $\bigcap_{1\leq k\leq m}F_{n_k}=\emptyset$ ，又 $F_n$ 单调降，所以 $F_{n_l}\subset \bigcap_{1\leq k\leq m}F_{n_k}=\emptyset$ ，所以当 $n\geq n_l(l>k)$ 时 $F_n=\emptyset$ 矛盾！ 
>
>$\Leftarrow$ 设 $\mathcal{U}=\{U_n\}_{n\geq1}$ 为 $X$ 的可数开覆盖，不妨设 $\mathcal{U}$ 单调递增，考虑 $\mathcal{F}=\{X\backslash U_n\}_{n\geq1}$ ，若 $X\backslash U_n\neq \emptyset$ ， $\bigcap_{n\geq1}\mathcal{F}=X\backslash \bigcup_{n\geq1}U_n\neq\emptyset$ ，矛盾！

>[!note]- 设 $A$ 为拓扑空间 $X$ 上的无限集，若 $A$ 是紧子集，则 $A$ 有凝聚点.
>证明：反证，若 $\forall y\in A$ 存在 $V_y$ 使得 $V_y\cap (A\backslash \{y\})=\emptyset,V_y\ni y$ ，则 $\{V_y\}_{y\in Y}$ 为 $A$ 的开覆盖，进而存在 $\{y_i\}_{1\leq i\leq n}$ ，使得 $A\subset \bigcup_{1\leq i\leq n}V_{y_i}$ ，注意到 $A=A\cap\left(\bigcup_{1\leq i\leq n}V_{y_i}\right)$ ，矛盾！

## Hausdorff

如果拓扑空间 $X$ 中的任何两个点都有不相交的邻域，则称 $X$ 具有 **Hausdorff 性质**， Hausforff 性质是一种分离性质.

>[!note]- Hausforff 是遗传拓扑性质.
>证明：设同胚映射 $f: X\rightarrow Y$ ，对任意 $y_1,y_2\in Y$ ， $f^{-1}(y_1),f^{-1}(y_2)$ 具有不相交的邻域 $U_1,U_2$ ，进而可得 $f(U_1)\ni y_1,f(U_2)\ni y_2,f(U_1)\cap f(U_2)=\emptyset$ . （只要求双射就可以）所以是拓扑性质；设 $Z$ 为 $X$ 的子空间，对任意 $z_1,z_2\in Z\subset X$ ，存在 $X$ 中的邻域 $B_1\ni z_1\cap B_2\ni z_2=\emptyset$ ，考虑 $B_1\cap Z,B_2\cap Z$ 即可.

在之前讨论网收敛时，举例说明 $\lim \xi$ 可能有多个元素. Hausdorff 限制了 $\lim \xi$ 的势.

>[!note]- 拓扑空间 $X$ 具有 Hausdorff 性质当且仅当其每一个网至多有一个极限.
>证明： $\Rightarrow$ ：设 $\xi$ 为 $X$ 的网， $\lim \xi\neq \emptyset$ ，若 $x,y\in \lim \xi$ ，则存在 $U\ni x,V\ni y,U\cap V=\emptyset$ ，而 $\xi$ 终在 $x,y$ 的任何一个邻域中，从而矛盾.
>
>$\Leftarrow$ ：设存在 $x,y\in X,x\neq y$ ， $x,y$ 的任何邻域都相交，考虑定向集 $(D,\sqsubseteq)$ ： $D=\mathcal{N}(x)\times \mathcal{N}(y)$ ， $(U,V)\sqsubseteq (U',V')\leftrightarrow U\supset U'\land V\supset V'$ ，设网 $\xi:(U,V)\rightarrow x_{U,V}\in U\cap V$ ，则 $x,y\in \lim \xi$ ，矛盾！

可以通过 $\lvert \lim \xi\rvert>1$ 说明拓扑空间 $X$ 不具备 Hausdorff 性质.

>[!note]- Hausdorff 空间的紧子集是闭集.

于是有下面这一重要结论：

>[!note] 紧空间到 Hasudorff 空间的连续映射是闭映射，连续双射是同胚映射. 
>设 $f:X\rightarrow Y$ ，其中 $X$ 为紧空间， $Y$ 为 Hausdorff 空间，对于任意的 $X$ 中的闭子集 $F$ ，由紧闭遗传知 $F$ 是 $X$ 中的紧子集，紧子集的连续像仍然紧，从而 $f(F)$ 为 $Y$ 的紧子集，而 Hasudorff 空间的紧子集为闭集. 同胚映射易证.
>^CompactToHausdorff

>[!note]- 设 $X,Y$ 是拓扑空间， $Y$ 是 Hausdorff 空间， $f,g: X\rightarrow Y$ 为连续映射，则 $E=\{x:f(x)=g(x)\}$ 是 $X$ 中的闭集.

## 滤子

**滤子**是与理想相对的概念. 关于理想见 [[#Tychnoff 乘积定理]] .

设 $X$ 是非空集， $\mathcal{F}$ 为 $X$ 的一个子集族，称 $\mathcal{F}$ 是 $X$ 上的一个**滤子**（filter），如果：

1. $\emptyset\notin \mathcal{F},X\in \mathcal{F}$ ；
2. $A\in \mathcal{F},B\supset A\Rightarrow B\in \mathcal{F}$ ；
3. $A,B\in \mathcal{F}\Rightarrow \exists C\in \mathcal{F}(C\subset A\cap B)$ .

其中由 $1,2,3$ 可以得出滤子满足有限交性质.

>[!example] $\forall x\in X,\mathcal{N}(x)$ 为 $X$ 上的一个滤子.

设 $\mathcal{A}\subset \mathcal{P}(X)$ 满足有限交性质且 $\mathcal{A}$ 非空，定义 $\mathcal{A}$ **生成的滤子**： （注：有限交性质，有限的交非空）

$$\left\{B\subset X:\exists A_1,A_2,\cdots,A_n\in \mathcal{A}\left(\bigcap_{i\leq n}A_i\subset B\right)\right\}$$

记 $X$ 上的全体滤子为 $\mathcal{F}(X)\subset \mathcal{P}\mathcal{P}(X)$ .

>[!note] 设 $\mathcal{D}\subset \mathcal{F}(X)$ ，则： 1) $\bigcap \mathcal{D}$ 为 $X$ 上的滤子； 2) 如果 $(\mathcal{D},\subset)$ 为全序集 / 定向集，则 $\bigcup \mathcal{D}$ 为 $X$ 上的滤子. [[2421Su104450]]

显然 $(\mathcal{F}(X),\subset)$ 是一个偏序集，并且由 $2)$ ， $\mathcal{F}(X)$ 中的每一条链（即全序的子集）具有上界，因此由 [[Set#Zorn 引理]] 可知 $\mathcal{F}(X)$ 有极大元.

定义 $X$ 的**超滤**（ultrafilter） / **极大滤子**（maximal filter）： $(\mathcal{F}(X),\subset)$ 的极大元.

>[!example] 主滤
>设 $A\subset X,A\neq \emptyset$ ，则 $\uparrow A=\{B\subset X:A\subset B\}$ 为 $X$ 上的滤子；
>
>称 $\uparrow x=\{A\subset X:x\in A\}$ 为由 $x$ 生成的**主滤**（principal filter），主滤都是超滤.
>
>证明：若 $X$ 上的滤子 $\mathcal{F}\supset \uparrow x$ ，则存在 $A\in \mathcal{F},x\in A$ ， $\forall F\in \mathcal{F}$ ， $A\cap F\in \uparrow x$ ，因此存在 $C\in\uparrow x: x\in C\in A\cap F\Rightarrow x\in F$ ，从而 $F\in \uparrow x$ ，所以 $\mathcal{F}=\uparrow x$ .

>[!example] Frechet 滤子
>设无限集 $X$ ， $\mathcal{F}=\{A\subset X:\lvert X\backslash A\rvert<\infty\}$ 为 $X$ 上的滤子，称为 Frechet 滤子.
>
>包含 $\mathcal{F}$ 的超滤不是主滤.
>
> [[2421Su112722]]

超滤有如下的等价定义：

>[!note] 以下条件等价：1) $\mathcal{F}$ 是超滤；2) 若 $\forall F\in \mathcal{F}(A\cap F\neq \emptyset)$ ，则 $A\in \mathcal{F}$ ；3) $A\cup B\in \mathcal{F}\Rightarrow A\in \mathcal{F}\vee B\in \mathcal{F}$ ；4) $\forall A\subset X(A\subset \mathcal{F}\vee A^c\subset \mathcal{F})$ .

>[!note] 每个滤子都能写为一族超滤的交.

对于两个滤子 $\mathcal{F},\mathcal{G}$ ，称两者**相容**，如果 $\forall F\in \mathcal{F},G\in \mathcal{G}(F\cap G)\neq\emptyset$ .

设拓扑空间 $X$ ， $X$ 上的滤子 $\mathcal{F}$ ， $x\in X$ ，称 $x$ 为 $\mathcal{F}$ 的**极限**或者 $\mathcal{F}$ 收敛到 $x$ ，如果 $\mathcal{F}\supset \mathcal{N}(x)$ ；称 $x$ 为 $\mathcal{F}$ 的一个**聚点**，如果 $\mathcal{F}$ 与 $\mathcal{N}(x)$ 相容.

>[!note] $\mathcal{F}$ 是滤子， $x\in \text{clust}\mathcal{F}$ 当且仅当存在包含 $\mathcal{F}$ 的滤子收敛于 $x$ .
>证明： $\Rightarrow$ $x\in \text{clust} \mathcal{F}$ ，则 $\forall F\in \mathcal{F},U\in \mathcal{N}(x)(F\cap U\neq \emptyset)$ ，考虑滤子：
>
> $$\mathcal{G}=\{G\subset X:\exists F\in \mathcal{F}(F\cap G\neq \emptyset)\}$$
>
>显然 $\mathcal{F}\subset \mathcal{G}$ ，并且 $\mathcal{N}(x)\subset \mathcal{G}$ ，且 $\emptyset\notin \mathcal{G},X\in \mathcal{G}$ ，若 $G\in \mathcal{G},H\supset G$ ，则 $H\in \mathcal{G}$ ，若 $A,B\in \mathcal{G}$ ，则存在 $F_1(A\cap F_1\neq \emptyset),F_2(B\cap F_2\neq \emptyset)$ ， $F_1,F_2\in \mathcal{F}$ ，从而 $F_1\cup F_2\in \mathcal{F}$ ，所以 $(A\cap B)\cap (F_1\cup F_2)\neq \emptyset$ ，因此 $A\cap B\in \mathcal{G}$ . 所以 $\mathcal{G}$ 收敛到 $x$ .
>
> $\Leftarrow$ ：存在 $\mathcal{G}\supset \mathcal{F}$ ， $\mathcal{G}\supset \mathcal{N}(x)$ ，则对于任意的 $F\in \mathcal{F},N\in \mathcal{N}(x)$ ，存在 $C\in \mathcal{G},C\neq \emptyset$ 使得 $C\in F\cap N$ ，所以 $F\cap N\neq \emptyset$ ，所以 $x\in \text{clust}\mathcal{F}$ .

>[!note] 设拓扑空间 $X$ ， $\mathcal{F},\mathcal{G}\in \mathcal{F}(X)$ ，则有：1) $\text{clust}f=\bigcap_{F\in \mathcal{F}}\overline{F}$ ；2) $\mathcal{F}\subset \mathcal{G}\Rightarrow \lim \mathcal{F}\subset \lim \mathcal{G},\text{clust}\mathcal{F}\subset \text{clust}\mathcal{G}$ ；3) $\mathcal{F}$ 是 $X$ 上的超滤则有： $\lim \mathcal{F}=\text{clust}\mathcal{F}$ .

下面用滤子的收敛刻画闭包：

>[!note] 设 $X$ 为拓扑空间， $A\subset X,x\in X$ ，下列条件等价： 1) $x\in \bar{A}$ ；2) 存在 $X$ 上的超滤 $\mathcal{G}$ 使得 $A\in \mathcal{G}$ 并且 $x\in \lim \mathcal{G}$ ；3) 存在 $X$ 上的滤子 $\mathcal{F}$ 使得 $A\in \mathcal{F}$ 并且 $x\in\lim \mathcal{F}$ .

设映射 $f:X\rightarrow Y,\mathcal{F}\in \mathcal{F}(X)$ ，定义滤子 $\mathcal{F}$ 在 $f$ 下的像为：

$$f(\mathcal{F})=\{B\subset Y:f^{-1}(B)\in \mathcal{F}\}$$

不难验证 $f(\mathcal{F})$ 是 $Y$ 上的滤子. [[2421Su151408]]

>[!note] $f:X\rightarrow Y$ ，若 $\mathcal{F}$ 是 $X$ 上的超滤，则 $f(\mathcal{F})$ 是 $Y$ 上的超滤.

下面用滤子刻画连续映射：

>[!note]- 设 $X,Y$ 为拓扑空间， $f:X\rightarrow Y$ 为映射，以下命题等价：1) $f:X\rightarrow Y$ 连续；2) 任给 $X$ 上的滤子 $\mathcal{F}$ ，$f(\lim \mathcal{F})\subset \lim f(\mathcal{F})$ ；3) 任给 $X$ 上的超滤 $\mathcal{G}$ ， $f(\lim \mathcal{G})\subset \lim f(\mathcal{G})$ .
> $1)\Rightarrow 2)$ ：对于任意的 $x\in\lim \mathcal{F}$ ， $\mathcal{F}\supset \mathcal{N}(x)$ ，下面证明 $f(x)\in\lim f(\mathcal{F})$ ，只需证明 $f(\mathcal{F})\supset \mathcal{N}(f(x))$ . $f(\mathcal{F})=\{B\subset Y:f^{-1}(B)\in \mathcal{F}\}$ ，对任意 $N\in \mathcal{N}(f(x))$ ，存在开集 $U:f(x)\in U\subset N$ ，从而 $x\in f^{-1}(f(x))\in f^{-1}(U)\subset f^{-1}(N)$ ，注意 $f^{-1}(U)$ 为开集，因此 $f^{-1}(N)\in \mathcal{N}(x)\subset \mathcal{F}$ ，所以 $f(\mathcal{F})\supset \mathcal{N}(f(x))$ .
>
> $2)\Rightarrow3)$ ：显然；
>
> $3)\Rightarrow1)$ ：对于任意的 $Y$ 上的集合 $V$ ，考虑主滤 $\mathcal{G}=\{B\subset Y:V\subset B\}$ ，则有 $f(\lim \mathcal{G})\subset \lim f(\mathcal{G})$ .
>
>因为 $\mathcal{G}$ 是超滤，所以 $\lim \mathcal{G}=\text{clust}\mathcal{G}=\bigcap_{A\in \mathcal{G}}\bar{A}$ ，由 $\mathcal{G}$ 的定义可知 $\lim \mathcal{G}=\bar{V}$ ，同理可得 $\lim f(\mathcal{G})=\overline{f(V)}$ ，因此 $f(\overline{V})\subset \overline{f(V)},\forall V\subset Y$ ，所以 $f$ 是连续映射.

## Tychnoff 空间、Hausdorff 紧化

设 $X$ 为拓扑空间，定义 $X$ 的**紧化** $(Y,c)$ ，其中 $Y$ 为紧空间， $c:X\rightarrow Y$ 是同胚嵌入， $c(X)$ 是 $Y$ 的稠子集；当 $Y$ 还是 Hasudorff 空间时，称  $(Y,c)$ 为 $X$ 的 **Hausdorff 紧化**；定义紧化 $(Y,c)$ 的**剩于**（remainder）为 $Y\backslash c(X)$ .

设拓扑空间 $(X,\mathcal{O})$ ，若 $\forall U\in \mathcal{O},\forall x\in U$ ，存在连续函数 $f:X\rightarrow[0,1]$ 使得 $f(x)=0$ ， $f(X\backslash U)\subset\{1\}$ 则称 $X$ **完全正则**.

完全正则的 $T_0$ 空间称为 Tychnoff 空间（ $T_{3.5}$ 空间）

>[!note] 完全正则空间是正则空间.

>[!example]- 拓扑空间 $X$ 有一个由既开又闭的集构成的基，证明 $X$ 为完全正则空间.
>证明：首先证明 $X$ 是正规空间，然后由 Urysohn 引理得到结论（并不能证明 $X$ 是 $T_1$ 空间，然后利用单点集是闭集）
>
>对于 $X$ 中的任意不交闭集 $F,G$ ，存在基中元素 $\{U_i\}_{i\in I},\{V_i\}_{i\in I'}$ 使得 $X\backslash F=\bigcup_{i\in I}U_i,X\backslash G=\bigcup_{i\in I}V_i$  ，从而 $W=X\backslash \bigcup_{i\in I}U_i,H=X\backslash \bigcup_{i\in I}V_i$ 为不交开集，并且包含 $F,G$ ，所以 $X$ 正规.
>
>对任意的 $U\in \mathcal{O},x\in U$ ，存在基中元素 $V: x\in V\subset U$ ， $V$ 既为开也闭， $X\backslash U\subset V^c$ . 进而有 Urysohn 引理，存在连续映射 $f$ 使得 $f(V^c)=\{1\},f(V)=\{0\}$ 从而可得结论.

>[!example]- 设 $X$ 是完全正则空间， $C\subset X$ 为紧子集， $U\subset X$ 为开子集并且 $C\subset U$ ，证明存在连续映射 $k:X\rightarrow[0,1]$ 满足 $k(C)\subset\{ 0\},k(X\backslash U)\subset\{1\}$ .
>证明：
>
>$\forall x\in C$ ，存在连续映射 $f_x$ 使得 $f_x(x)=0,f_x(X\backslash C)=\{1\}$ ，从而 $f_x(X\backslash U)\subset\{1\}$ .
>
>考虑包含 $x$ 的开集 $f_x^{-1}([0,1/2)$ ，则 $\{f_x^{-1}([0,1/2))\}_{x\in C}$ 为 $C$ 的一个开覆盖，由 $C$ 紧，存在 $C$ 的有限子覆盖： $\{f_{x_k}^{-1}([0,1/2))\}_{1\leq k\leq n}$ ，再取连续映射：
>
>$$g(x)=\left\{\begin{aligned}
>&0,\quad x\in[0,1/2)\\
>&2(x-1/2),x\in[1/2,1]
>\end{aligned}\right.$$
>
>考虑映射： $k=\prod_{k=1}^{n}g\circ f_{x_n}$ ，对于任意的 $x\in C$ ，存在 $f_{x_m}^{-1}([0,1/2))\ni x$ ，从而 $k(x)=0$ ，并且 $f_{x_i}(X\backslash U)\subset\{1\}$ 从而 $g\circ f_{x_i}\subset\{1\},k(X\backslash U)\subset\{1\}$ .

## 最大 Hausdorff 紧化

## 最小 Hasudorff 紧化

对于拓扑空间 $X$ ， 定义**局部紧**：对任意的 $x\in X$ 和邻域 $U\ni x$ ，总存在 $X$ 中的紧子集 $K$ 使得 $x\in K^\circ\subset K\subset U$ .

>[!note]- 局部紧是拓扑性质.
>证明：局部紧空间的开连续像局部紧.
>设 $f$ 为定义在局部紧空间 $X$ 上的开连续映射，对任意 $y\in f(X)$ 和 $y$ 的邻域 $U$ ，可知 $f^{-1}(y)\subset f^{-1}(U)$ ，设 $x\in f^{-1}(y)$ 则存在 $X$ 中的紧子集 $K$ 使得 $x\in K^\circ\subset K\subset f^{-1}(U)$ ，从而 $y\in f(K^\circ)\subset f(K)\subset U$ .
>
>因为 $f$ 连续开映射，所以 $f(K)$ 是紧集. 并且因为 $f$ 是开映射，所以 $f(K^\circ)=f(K)^\circ$ . 因此是局部紧空间.

>[!note]- 设 $\{X_i\}_{i\in I}$ 是一族非空的局部紧空间，证明乘积空间 $\prod_{i\in I}^{}X_i$ 局部紧当且仅当每个 $X_i$ 局部紧，并且存在 $I$ 的有限子集 $J$ 使得对每个 $i\notin J$ ， $X_j$ 是紧空间.
>$\Rightarrow$ ：考虑投影映射 $p_j:\prod_{i\in I}^{}X_i\rightarrow X_j$ ， $p_j$ 是连续开映射，进而由局部紧是拓扑性质可知 $X_j,\forall j\in I$ 是局部紧空间.
>
>对于 $(x_i)_{i\in I}\in\prod_{i\in I}^{}X_i$ ，和邻域 $W\ni (x_i)_{i\in I}$ ，存在紧集 $K$ 使得： $(x_i)_{i\in I}\in K^\circ\subset K\subset W$ ，因为 $K^\circ$ 是 $(x_i)_{i\in I}$ 的邻域（开集），所以存在包含 $(x_i)_{i\in I}$ 的开集 $U=\{U_{i_j}\}_{1\leq j\leq m}\times\prod_{i\neq i_1,\cdots,i_m}^{}X_i\subset K^\circ\subset K$ ，因此有 $X_j\subset p_j(U)\subset p_j(K)\subset X_j$ ，所以 $p_j(K)=X_j$ ，又 $p_j$ 是连续映射，所以 $X_j=p_j(K)$ 是紧集.
>
>$\Leftarrow$ ：对于任意的 $(x_i)_{i\in I}\in \prod_{i\in I}^{}X_i$ 和包含 $(x_i)_{i\in I}$ 的基本开集 $\prod_{1\leq j\leq m}^{}U_{i_j}\times\prod_{i\neq i_1,\cdots,i_m}^{}X_i$ ，其中 $U_{i_j}$ 为 $X_{i_j}$ 的开集.
>
>则由 $X_{i_j}$ 为局部紧可知存在紧集 $K_{i_j}$ 使得 $x_{i_j}\in K_{i_j}^\circ\subset K_{i_j}\subset U_{i_j}$ ，以及紧集 $K_i$ 使得 $x_{i}\in K_i^\circ\subset K_i\subset U_i,\forall i\neq i_1,\cdots,i_m$ . 进而由紧的任意可乘性（Tychnoff 乘积定理）可得结论. [[2422Su174730]]

定义**单点紧化**：设 $X$ 是非紧的局部紧 Hasudorff 空间，令 $\alpha X=X\cup\{\infty\}$ ，其中 $\infty\not\in X$ ，在 $X$ 上定义拓扑：

$$\mathcal{O}=\{X\text{ 的全体开集}\}\cup\{U\subset \alpha X:\infty\in U,X\backslash U\text{ 为 }X\text{ 的紧子集}\}$$

有如下结论：

>[!note] $(\alpha X,\mathcal{O})$ 为紧 Hausdorff 空间.

>[!example]- 对 $\mathbb{N}$ 赋予离散拓扑，证明 $\mathbb{N}$ 的<u>单点紧化</u> $\alpha \mathbb{N}$ 同胚于实直线 $\mathbb{R}$ 的<u>子空间</u> $\{0\}\cup\{1/n:n=1,\cdots,n,\cdots\}$
>证明：
>
>若 $U\subset \alpha \mathbb{N}$ ，即 $X\backslash U=\mathbb{N}\backslash U$ 为 $X$ 的紧子集，则 $X\backslash U$ 为有限集.
>
>$$\mathcal{O}=\mathcal{P}(\mathbb{N})\cup\{U\subset \alpha X:\lvert X\backslash U\rvert<\infty\}$$
>
>下面构造连续双射：
>
>$$\begin{aligned}
>f:\quad &\alpha\mathbb{N}\rightarrow Y\\
>&n\mapsto \frac{1}{n},0\rightarrow \infty
>\end{aligned}$$
>
>对于任意的包含 $n$ 的 $\alpha \mathbb{N}$ 中的开集 $U$ ，若 $U\in \mathcal{P}(\mathbb{N})$ ，不妨设 $U=\{n_i\}_{i\in I\subset \mathbb{N}}$ ，则 $\mathcal{P}(U)=\{1/n_i\}_{i\in I\subset \mathbb{N}}$ 为 $Y$ 中的包含 $f(n)$ 的开集；若 $U\subset \alpha X:\lvert X\backslash U\rvert<\infty$ ，则同理可以得到 $Y$ 中的开集.
>
>（然而，注意到 $Y$ 是 Hausdorff 空间，紧空间到 Hausdorff 空间的连续双射是同胚映射，所以只需要证明 $f$ 是连续的即可）
>
>对于任意的 $Y$ 中的开集 $U$ ，如果 $U$ 包含 $0$ ，则 $Y\backslash U$ 中应当包含有限多个元素，从而 $X\backslash f^{-1}(U)$ 有限，因此 $f^{-1}(U)$ 在 $X$ 中开. [[2422Su180714]] ，如果 $\infty\notin U$ ，则 $f^{-1}(U)\in \mathcal{P}(\mathbb{N})$ 为开集.
>
>综上 $f$ 是同胚映射.

>[!example] 证明商空间 $\mathbb{R}/\mathbb{Z}$ 不是局部紧空间. 由于商映射 $q:\mathbb{R}\rightarrow \mathbb{R}/\mathbb{Z}$ 是闭映射，因此局部紧 Hausdorff 空间的闭连续像不必是局部紧的.

证明：

假设 $\mathbb{R}/\mathbb{Z}$ 为局部紧空间，则存在紧集 $K\subset \mathbb{R}/Z$ 使得 $[0]\subset K^\circ\subset K\subset U$ . 从而对任意的 $n\in \mathbb{Z}$ ， $n\in q^{-1}(K^\circ)\subset q^{-1}(K)$ ，可以取 $r_n>0$ 使得 $(n-r_n,n+r_n)\subset q^{-1}(K^\circ)$ ，不妨设 $r_n<1/3$ .

因为 $\mathbb{R}$ 是局部紧的，对于任意的 $n\in \mathbb{Z}$ ，存在紧子集 $K_n$ 使得：

$$n\in K_n^\circ\subset K_n$$

# 乘积空间

设 $X,Y_i,1\leq i\leq n$ 为拓扑空间， $\{f_i:X\rightarrow Y_i\}_{1\leq i\leq n}$ 是一族映射.

定义由映射族 $\{f_i\}_{1\leq i\leq n}$ 生成的 $X$ 上的**初始拓扑**（initial topology）或者**弱拓扑**（weak topology）为由：

$$\mathcal{B}=\{f^{-1}_i(V_i):V_i\text{ 为 }Y_i\text{ 中的开集},i\in I\}$$

作为<u>子基</u>生成的拓扑 $\mathcal{O}$ .

>[!note] $f_i:(X,\mathcal{O})\rightarrow Y_i$ 连续.

>[!note]- 任给 $X$ 上的拓扑 $\tau$ ，如果 $f_i:(X,\tau)\rightarrow Y$ 连续，则 $\mathcal{O}\subset \tau$ . 即 $\mathcal{O}$ 是使得 $X$ 上的 $\{f_i\}_{i\in I}$ 连续的最粗拓扑.
>证明：对于 $\mathcal{O}$ 中的任意开集 $U$ ，其都可以表示为 $\mathcal{B}$ 中的元素的有限交的并，并且 $f_i$ 连续，从而 $\mathcal{B}$ 中的任何一个元素都是 $\tau$ 中的开集，从而 $U\in \tau$ .

>[!example] 子空间是一个初始拓扑.
>考虑含入映射： $i: X\rightarrow Y$ ，其中 $X$ 是拓扑空间 $Y$ 的子空间，由[[#子空间]]中的讨论可知含入映射 $i$ 生成的子基为 $\{U\cap X: U\subset Y\}$ ，即为子空间拓扑. $i$ 是使得 $X\rightarrow Y$ 连续的最粗拓扑.

>[!note]- 映射 $f: X\rightarrow Y$ 是同胚嵌入当且仅当 $f$ 是单射并且 $X$ 的拓扑恰好是 $f$ 生成的初始拓扑.
>证明： $\Rightarrow$ ：因为 $f$ 同胚，所以 $f$ 是单射；设 $X$ 的拓扑为 $\mathcal{O}$ ， $f$ 生成的拓扑的子基为：
>
> $$\mathcal{T}=\{f^{-1}(U):U\text{ 为 }Y\text{ 中的开集}\}=\{U\cap X:U\text{ 为 }Y\text{ 中的开集}\}$$
>
>从而 $\mathcal{T}=\mathcal{O}$ .
>
>$\Leftarrow$ ：因为 $X$ 的拓扑恰好是 $f$ 生成的连续拓扑，所以 $f: X\rightarrow Y$ 连续，又因为 $f$ 是单射，对于 $Y$ 中的任意元素 $y\in Y$ ，有 $f^{-1}(Y)$ 为 $X$ 的子基，所以 $f$ 是满射，则 $f$ 是连续双射.
>
>所以对于 $X$ 中的任意基本开集 $W=f^{-1}(U_1)\cap \cdots\cap f^{-1}(U_m)$ ，令 $g=f^{-1}$ ，则 $g^{-1}=f$ ， $f(W)=U_1\cap \cdots\cap U_m$ 为 $Y$ 中的开集，从而 $g$ 连续，则 $f$ 是同胚映射，并且也是嵌入（单连续映射的逆映射还是连续的，则称该映射为同胚嵌入）

>[!example]- 度量诱导的拓扑是初始拓扑.
>设 $X$ 上由度量诱导引导的拓扑空间为 $\mathcal{O}_d$
>
>考虑函数族： $\{h_x: X\rightarrow \mathbb{R}\}_{x\in \mathbb{R}}$ ，其中 $h_x(y)=d(x,y)$ . 设该函数族生成的初始拓扑为 $\mathcal{T}$ .
>
>注意到 $\mathcal{O}_d$ 使得 $h_x,x\in \mathbb{R}$ 连续：对于任意的开集 $U\in \mathbb{R}$ ， $h_x^{-1}(U)=\{y\in X:d(x,y)\in U\}$ 是 $\mathcal{O}_d$ 中的开集：对于任意的 $z\in h_y^{-1}(U)$ ，有 $r=d(x,z)\in U$ ，而 $U$ 是 $\mathbb{R}$ 中的开集，所以存在 $U\supset (r-\delta,r+\delta)$ ，而对于任意的 $z':d(z,z')<\delta$ ， $d(x,z')\leq r+d(z,z')\in U$ ，因此 $B(z,\delta)\subset U$ ，从而 $h^{-1}_x(U)$ 为 $\mathcal{O}_d$ 中的开集.
>
>因此由初始拓扑的性质： $\mathcal{T}$ 粗于 $\mathcal{O}_d$ .
>
>对于 $\mathcal{O}_d$ 中的任何一个开集 $U$ ，对于任意的 $x\in U$ ，存在 $B(x,r_x)\subset U$ ，对于 $\{y:d(x,y)<r_x\}=\{y:h_x(y)\in(0,r_x)\}=h_x^{-1}(0,r_x)$ 为 $\mathcal{T}$ 的子基中的元素，从而可得 $U=\bigcup_{x\in U}B(x,r_x)$ 为 $\mathcal{T}$ 中的开集.

设 $\{(X_i,\tau_i)\}_{i\in I}$ 为一族拓扑空间，定义 $\prod_{i\in I}^{}X_i=\{f:I\rightarrow \bigcup_{i\in I}X_i:f(i)\in X_i\}$ ，进而定义**投影映射** $P_{i_0}:\prod_{i\in I}^{}X_i\rightarrow X_{i_0},P_{i_0}(f)=f(i_0)$ ，定义**乘积拓扑**： $\prod_{i\in I}^{}\tau_i$ 是由<u>子基</u> $\{P_i^{-1}(U_i):i\in I,U_i\in \tau_i\}$ 生成的拓扑.

>[!hint] 可以采取其他方式定义 $\prod_{i\in I}^{}X_i$ .
>一种更符合直觉的做法是：
>
> $$\prod_{i\in I}^{}X_i=\{(x_i)_{i\in I}:x_i\in X_i,\forall i\in I\}$$
> 
>注意，这一定义需要用到选择公理. （对于非空的集族 $\{S_i\}_{i\in I}$ ，总是存在 $\{x_i\}_{i\in I}$ 使得 $x_i\in S_i$ ）

由定义可以得出： $P_i^{-1}(U_i)=U_i\times \prod_{j\neq i}^{}X_j$ .

>[!question] 采用 $\left\{\prod_{i\in I}^{}U_i:U_i\in \tau_i\right\}$ 作为基？
>用 $\left\{\prod_{i\in I}^{}U_i:U_i\in \tau_i\right\}$ 作为基生成的拓扑空间称为 Box Topology ，其是比乘积拓扑更细的拓扑：乘积拓扑中的基为 $\prod_{i\in I',\lvert I'\rvert<\infty}^{}U_i \times \prod_{j\notin I'}^{}X_j$ （有限个限制 + 无限个限制）.
>
>可以证明，乘积拓扑是使得 $P_i,i\in I$ 连续的最粗拓扑，并且许多性质在 Box Topology 中不再保持.

投影映射 $P_j$ 具有如下性质：

>[!note] 投射 $p_j:\prod_{i\in I}^{}X_i\rightarrow X_j,\forall j\in I$ 是连续开映射.

>[!note] 映射 $h:Z\rightarrow \prod_{i\in I}^{}X_i$ 连续当且仅当每个复合映射 $p_j\circ h:Z\rightarrow X_j$ 连续.

定义对角映射 $\Delta_{i\in I}f_i:Z\rightarrow\prod_{i\in I}^{}X_i,\quad z\mapsto(f_i(z))_{i\in I}$ .

则有如下结论：

>[!note] 任给一族连续映射 $\{f_i:Z\rightarrow X_i\}_{i\in I}$ ，对角映射 $\Delta_{i\in I}f_i$ 连续.

## 可乘

| 性质   | 是否可乘 | 备注  |
| ---- | ---- | --- |
| 可度量化 | 可数可乘 |     |
|      |      |     |


设 $P$ 是拓扑空间的某种性质，如果有限 / 可数 / 任意多个具有 $P$ 的拓扑空间的乘积仍然具有性质 $P$ ，则称性质 $P$ 是**有限 / 可数 / 任意可乘**的.

>[!note] 第一可数和第二可数是可数可乘的.

证明：设 $\{X_n\}_{n\geq1}$ 是一列第一可数空间，考虑 $\prod_{n\geq1}^{}X_n$ ，对于任意的 $(x_i)_{i\geq1}\in \prod_{n\geq1}^{}X_n$ ，对于任意的 $i\geq1$ ，因为 $X_i$ 是第一可数空间，所以存在 $x_i$ 的可数邻域基 $\mathcal{B}_i=\{B_i^n\}_{n\geq1}$ ，

则取集族：

$$\mathcal{B}=\bigcup_{I_n\subset \mathbb{N}}\{\prod_{i\in I_n}^{}B_i\times \prod_{j\notin I_n}^{}X_j:B_i\in \mathcal{B}_i,\forall i\geq1\}$$

其中 $I_n=\{1,\cdots,n\}$ . 显然 $\mathcal{B}'_n=\{(B_i)_{i\in I_n}:B_i\in \mathcal{B}_i,\forall i\geq1\}$ 为有限个可数集族的积，因此该集族是可数的，并且可数个可数集的并可数，所以 $\mathcal{B}$ 是可数的.

对于任意包含 $(x_i)_{i\geq1}$ 的邻域，存在基本开集 $U=\prod_{i\in I'}^{}U_i\times \prod_{j\notin I'}^{}X_i$ ，设 $\max\{ I'\}=i_0$ ，则存在 $B_i^{n_i}\subset U_i,\forall i\in I'$ ，进而 $\prod_{i\in I'}^{}B_i^{n_i}\times \prod_{j\notin I'}^{}B_j^1\subset U$ ，因此 $\mathcal{B}$ 为 $(x_i)_{i\geq1}$ 的一个可数邻域基.

如果 $\{X_n\}_{n\geq1}$ 是一列第二可数空间，则对于 $n\geq1$ ，存在 $X_n$ 的可数基 $\mathcal{B}_n=\{B_n^i\}_{i\geq1}$ ，同理，构造集族：

$$\mathcal{B}=\bigcup_{I_n\subset \mathbb{N}}\{(B_i)_{i\in I_n}:B_i\in \mathcal{B}_i,\forall i\geq1\}$$

对于任何包含 $x$ 的邻域，首先存在基本开集 $U=\prod_{i\in I'}^{}U_i\times \prod_{j\notin I'}^{}X_i$ ，其次类似地可以找到包含于 $U$ 且包含 $x$ 的 $\mathcal{B}$ 中的元素，因此 $\mathcal{B}$ 是可数基.

>[!example] 举出反例说明第一可数、第二可数不是任意可乘的.

考虑第一（二）可数空间 $(\{0,1\},\mathcal{P}(\{0,1\}))$ ， $I$ 为不可数集合，对于 $\prod_{i\in I}^{}X_i$ ，如果其第一可数，则对于 $(x_i)_{i\in I}$ ，其具有可数邻域基，不妨设为 $\{B_j\}_{j\geq1}$ ， 并且（因为对任意基本开集总存在邻域基包含在其中） $B_j=\prod_{i\in I',\lvert I'\rvert<\infty}^{}U_i\times \prod_{j\notin I'}^{}\{0,1\}$ 可知， $\bigcup_{j\geq1}B_j$  可以写作 $\prod_{i\in I',\lvert I'\rvert\subset \mathbb{N}}^{}U_i\times \prod_{j\notin I'}^{}\{0,1\}$ 的形式，因此取 $\prod_{i\in I'}^{}U_i\times \{0\}\prod_{j\in I'\backslash\{j_0\}}^{}X_j$ 即可.

假设其具有可数基，取该可数基的并，则同样有 （因为对任意基本开集总存在邻域基包含在其中） $B_j=\prod_{i\in I',\lvert I'\rvert<\infty}^{}U_i\times \prod_{j\notin I'}^{}\{0,1\}$ ，剩下的同理可证明.

>[!hint] 关键：基 / 邻域基总包含在基本开集中，因此形如基本开集 #issue ；不可数集减去可数集总有多余的元素.

>[!note] 序列紧可数可乘.

证明：设 $\{X_n\}_{n\geq1}$ 为一列序列紧空间，考虑任意的 $\prod_{n\geq1}^{}X_n$ 中的子列 $\{(x^n_l)_{n\geq1}\}_{l\geq1}$ ，

$$\begin{aligned}
&x_1^1\ x_2^1\ x_3^1\ \cdots\ x_n^1\ \cdots\\
&x_1^2\ x_2^2\ x_3^2\ \cdots\ x_n^2\ \cdots\\
&\cdots
\end{aligned}$$

因为 $X_1$ 序列紧，所以可以在 $X_1$ 中得到收敛于 $x_1$ 的子列 $\{x^1_{i_{1,m}}\}_{m\geq1}$ ，对于 $X_2$ 中的子列 $\{x^2_{i_{1,m}}\}$ ，存在该序列的子列 $\{x^2_{i_{2,m}}\}$ 收敛到 $x_2\in X_2$ ，依次类推.

>[!note] 可度量可数可乘.

>[!example] 设 $\{(X_n,d_n)\}_{n\geq1}$ 为一列度量空间，任给 $x,y\in \prod_{n\geq1}^{}X_n$ ，令 $\rho(x,y)=\sup_{n\geq1}\frac{1}{2^n}\min\{d_n(x_n,y_n),1\}$ . 证明 $\rho$ 是 $\prod_{n\geq1}^{}X_n$ 上的度量并且诱导它的乘积拓扑.

首先验证 $\rho$ 是 $\prod_{n\geq1}^{}X_n$ 上的度量：

1) $\rho(x,y)\geq0$ ，若 $\rho(x,y)=0$ ，则对于任意的 $n\geq1$ ， $\frac{1}{2^n}\min\{d_n(x_n,y_n),1\}\leq 0$ ，从而 $d(x_n,y_n)=0$ 故 $x=y$ ，反之显然成立；
2) $\rho(x,y)=\rho(y,x)$ ；
3) $\rho(x,z)\leq \sup_{n\geq1}\frac{1}{2^n}\min\{d_n(x_n,y_n)+d_n(y_n,z_n),1\}$ ，注意到 $\min\{a+b,1\}\leq \min\{a,1\}+\min\{b,1\},\forall a,b\geq0$ . 从而可得结论.

下面证明 $\rho$ 诱导的拓扑与 $\prod_{n\geq1}^{}X_n$ 的乘积拓扑相同：

1) 首先说明 $\rho$ 在 $\prod_{n\geq1}^{}X_n$ 上诱导的拓扑 $\mathcal{O}$ 要粗于其乘积拓扑：对于任意的 $U\in \mathcal{O},x\in U$ ，存在包含 $r>0$ ， $B(x,r)\subset U$ ；取 $N$ 充分大使得 $\frac{1}{2^N}<r$ ，再取 $V_i=B(x_i,\min\{r,1\}/2),\forall i\leq N$ ，从而对于任意的 $y\in \prod_{i=1}^{N}V_i\times \prod_{j>N}^{}X_j$ ，都有 $\rho(x,y)<r$ ，所以 $x\in V\subset B(x,r)\subset U$ ，由 $x$ 的任意性， $U=\cup V_x$ 为乘积拓扑的开集.
2) 说明 $\rho$ 在 $\prod_{n\geq1}^{}X_n$ 上诱导的拓扑 $\mathcal{O}$ 要细于其乘积拓扑：只需说明对于乘积拓扑中的开集 $p_n^{-1}(U_n)$ ，其都为 $\mathcal{O}$ 中的开集：对于任意的 $x\in p_n^{-1}(U_n)$ ， $p_n^{-1}(U_n)=U_n\times \prod_{j\neq n}^{}X_j$ ，又 $U_n$ 为 $X_n$ 中的开集，从而存在 $r>0$ 使得 $B(x_n,r)\subset U_n$ ，考虑 $V_\rho(x,r/2^n)$ ，则对于任意的 $y\in V_\rho(x,r/2^n)$ ， $d_n(x_n,y_n)<r$ ，从而可知 $y\in U_n$ ， $x\in V_\rho(x,r/2^n)\subset p_n^{-1}(U_n)$ ，所以 $p_n^{-1}(U_n)=\bigcup V_\rho(x,r/2^n)$ 是 $\mathcal{O}$ 中的开集.

>[!note] 可分可数可乘.

>[!note] $T_0,T_1,T_2,T_3$ 任意可乘.

>[!note] 正规任意可乘.

>[!note] Cantor 集同胚于离散空间 $\{0,1\}$ 的可数乘积（记为 $\prod_{n\in \mathbb{N}}^{}\{0,1\}=\{0,1\}=2^\mathbb{N}$ ）

证明：只需要说明 $C$ 中的基本开集都是 $\{0,1\}^\mathbb{N}$ 中的基本开集，反之也是. 用度量 $d(x,y)=\frac{1}{2^n}$ 诱导 $C$ 上的拓扑. #imcomplete-lack-proofs 

>[!note] Cantor 集 $C$ 同胚于其自身的可数次幂 $C^\mathbb{N}$ .

已经证明了 $C$ 同胚于 $\{0,1\}^\mathbb{N}$ ，下面只需证明 $C$ 同胚于 $\{0,1\}^{\mathbb{N}\times \mathbb{N}}$ ，注意到 $\{0,1\}^\mathbb{N}$ 是紧空间，且具有 $T_2$ 性质，由 $T_2$ 可数可乘可知 $\{0,1\}^{\mathbb{N}\times \mathbb{N}}$ 具有 $T_2$ 性质，[进而](#^CompactToHausdorff)只需要证明存在 $\{0,1\}^\mathbb{N}$ 到 $\{0,1\}^{\mathbb{N}\times \mathbb{N}}$ 的连续双射即可， $\lvert \mathbb{N}\rvert=\lvert \mathbb{N}\times \mathbb{N}\rvert$ ，所以存在双射 $\varphi(n):\mathbb{N}\rightarrow \mathbb{N}\times \mathbb{N}$ ，对于任意的 $(x_n)_{n\geq1}\in\{0,1\}^\mathbb{N}$ ， $\{\varphi(n)\}_{n\geq1}$ 将 $\mathbb{N}$ 映射到 $\mathbb{N}\times \mathbb{N}$ 中，因此 $x_n$ 将对应于 $x_{\varphi(n)_0},x_{\varphi(n)_1}$ 两个元素，记为 $x_{\varphi(n)}\in\{0,1\}^{\mathbb{N}\times \mathbb{N}}$ . 由 $\varphi(n)$ 为双射， $f:(x_n)_{n\geq1}\mapsto (x_{\varphi(n)})_{n\geq1}$ 为双射. 对于连续性的证明：设投影映射 $p_j:\prod_{n\geq1}^{}X_i\rightarrow X_j,\forall j\geq1,X_l=\{0,1\}^\mathbb{N},\forall l\geq1$ .

则对于 $p_j\circ f:\{0,1\}^\mathbb{N}\rightarrow \{0,1\}^\mathbb{N}$ ，考虑 $\{0,1\}^\mathbb{N}$ 中的子基 $\{P_l^{-1}(0),P_l^{-1}(1):l\geq1\}$ ，考虑 $(p_j\circ f)^{-1}(P_l^{-1}(0))=f^{-1}(p_j^{-1}(P_l^{-1}(0)))$ ，其中 $P_l^{-1}(0)=\prod_{i\neq l}^{}X_i\times\{0\}$ ， $p_j^{-1}(P_l^{-1}(0))$ 相当于将 $\prod_{i\geq1}^{}\{0,1\}^{\mathbb{N}\times \mathbb{N}}$ 中的第 $j$ 个 $\{0,1\}^\mathbb{N}$ 中的第 $l$ 个元素改为 $\{0\}$ ，其余均保持不变，然后再求在 $f$ 下的原像，根据双射 $f$ 的定义，这实际上相当于求 $\varphi^{-1}(j,l)$ ，等同于 $p^{-1}_{\varphi^{-1}(j,l)}(0)$ . #issue

>[!note] Cantor 集没有孤立点.

## 商映射

设 $X,Y$ 是拓扑空间， $f:X\rightarrow Y$ ，如果 $f$ 是满射并且 $Y$ 的拓扑是由 $f$ 生成的终拓扑，则称 $f$ 为**商映射**（quotient map）.

>[!note] 满映射 $f:X\rightarrow Y$ 是商映射当且仅当 $V$ 为 $Y$ 中的开集 $\Leftrightarrow$ $f^{-1}(V)$ 是 $X$ 中的开集.

>[!example] 设 $f:X\rightarrow Y,g:Y\rightarrow Z$ 是连续映射，证明： 1) 若 $f,g$ 均为商映射，则 $g\circ f$ 也是商映射； 2) 若 $g\circ f$ 也是商映射，则 $g$ 也是商映射.

证明：若 $f,g$ 均为商映射，则 $f,g$ 均为满射，对于任意的开集 $V\subset Z$ ， $(g\circ f)^{-1}(V)=f^{-1}(g^{-1}(V))$ 在 $X$ 中为开集，反之若 $(g\circ f)^{-1}(V)$ 为 $X$ 中的开集，则 $g^{-1}(V)$ 为 $Y$ 中的开集，进而 $V$ 为 $Z$ 中的开集；

若 $g\circ f$ 也是商映射，则 $g\circ f$ 为满射，从而对于任意的 $z\in Z$ ，存在 $x\in X$ 使得 $z=g\circ f(x)$ ，而 $f(x)\in Y$ ，所以 $g$ 为连续满射；如果 $g^{-1}(V)$ 为 $Y$ 中的开集，则 $f^{-1}(g^{-1}(V))$ 为 $X$ 中的开集，由 $g\circ f$ 是商映射， $V$ 为 $Z$ 中的开集. 从而 $g$ 是商映射.

>[!example] 设 $A=[0,1,1/2,1/3,\cdots]$ ，证明商空间 $[0,1]/A$ 同胚于 $\mathbb{R}^2$ 的子空间 $\bigcup_{n\geq1}S_n$ ，其中 $S_n$ 表示圆周 $\{(x,y):(x-1/n)^2+y^2=1/n^2\}$ .

证明：构造从 $[0,1]$ 到 $\bigcup_{n\geq1}S_n$ 的商映射 $f$ ，并使得 $E(f)=A$ 即可. 定义 $f(1/n)=(0,0)$ ，以及 $f(0)=f(1)=(0,0)$ ，对于 $x\in\left(\frac{1}{n+1},\frac{1}{n}\right)$ ，将其映射到 $S_n$ 上即可. 从而 $E(f)=A$ .

>[!note] 设 $f:X\rightarrow Y$ 是连续映射， $E(f)$ 是 $f$ 诱导的等价关系，则对映射 $\bar{f}:X\backslash E(f)\rightarrow Y,\bar{f}([x])=f(x)$ 有：1) $\bar{f}$ 连续；2) $\bar{f}$ 同胚当且仅当 $f$ 是满映射. 

> [!example] 设 $X$ 是拓扑空间， $Y$ 是 Hausdorff 空间， $f:X\rightarrow Y$ 连续，证明 $X\backslash E(f)$ 是 Hausdorff 空间.

证明：因为 $f$ 连续，所以诱导得到的 $\bar{f}:X\backslash E(f)\rightarrow Y$ 也连续，由 $Y$ 为 Hausdorff 空间，对于任意的 $[x]\neq [y]$ ， $f(x)\neq f(y)$ 即 $\bar{f}([x])\neq \bar{f}([y])$ ，存在开集 $V_1,V_2:V_1\cap V_2=\emptyset$ ，从而 $\bar{f}^{-1}(V_1),\bar{f}^{-1}(V_2)$ 分别为 $[x],[y]$ 的开邻域，若 $\exists [z]\in \bar{f}^{-1}(V_1)\cap \bar{f}^{-1}(V_2)$ 则 $f(z)\in V_1\cap V_2$ 矛盾！ 

>[!example] 设 $X$ 是拓扑空间， $E$ 是 $X$ 上的等价关系，证明若 $E\subset X\times X$ 是闭集，并且 $q:X\rightarrow X\backslash E$ 是开映射，则 $X\backslash E$ 是 Hausdorff 空间.

## Tychnoff 乘积定理

紧性是任意可乘的.

引入**理想**的概念：对于拓扑空间 $(X,\mathcal{O})$ ，称 $\mathcal{I}\subset \mathcal{O}$ 是理想，如果：

1. $\emptyset\in \mathcal{I},X\notin \mathcal{I}$ ；
2. $U\in \mathcal{I},V\subset U\Rightarrow V\in \mathcal{I}$ ；
3. $U,V\in \mathcal{I}\Rightarrow U\cup V\in \mathcal{I}$ .

[[2421Su110351]]

## 分离公理

上面提到的 Hausdoff 空间即为 $T_2$ 空间，下面介绍 $T_0, T_1, T_2, T_3, T_4$ .

### $T_0$ 空间

称拓扑空间 $X$ 是 $T_0$ 空间，如果 $X$ 的不同点有不同的邻域系（因此也有结论 $\mathcal{N}(x)=\mathcal{N}(y)\Rightarrow x=y$ ），其具有等价定义： $\forall x,y\in X,x\neq y,\exists U\in \mathcal{O}$ ，使得 $(x\in U\land y\notin U)\vee (x\notin U\land y\in U)$ .

>[!note]- 证明上述两个定义是等价的.
>证明： $\Rightarrow$ ：若 $X$ 的不同点具有不同的邻域系，则对于任意的 $x,y\in X,x\neq y$ ，存在 $x$ 的邻域 $A$ 不为 $y$ 的邻域，进而存在开集 $U$ ： $x\in U\subset A,U\not\ni y$ ，或者存在 $y$ 的邻域 $B$ 不为 $x$ 的邻域，进而存在开集 $V$ ： $y\in V\subset B,V\not\ni x$ .
>
>$\Leftarrow$ ：假设 $x,y\in X,x\neq y$ 具有相同的邻域系，由条件可知存在 $U\in \mathcal{O}$ ，不妨设 $x\in U\land y\notin U$ ，则 $U$ 为 $x$ 的一个邻域而不是 $y$ 的邻域，矛盾！

>[!note]- 若 $X$ 是 $T_0$ 空间，则 $\overline{\{x\}}=\overline{\{y\}}\Rightarrow x=y$ .
>证明： $X\backslash \overline{\{x\}}$ 为所有不包含 $x$ 的开集的并，由 $X\backslash \overline{\{x\}}=X\backslash \overline{\{y\}}$ ，如果存在 $U\in \mathcal{O}$ ，使得 $x\in U\land y\notin U$ ，则 $U\in X\backslash \overline{\{y\}}\Rightarrow U\in X\backslash \overline{\{x\}}$   矛盾！同理不存在 $U\in \mathcal{O},x\notin U\land y\in U$ .

>[!example]- $T_0 / T_1$ 的连续像不一定 $T_0 / T_1$ .
>考虑： $\mathcal{O}_1=\{\{0\},\{1\},\emptyset,\{0,1\}\}$ 和 $\mathcal{O}_2=\{\emptyset,\{0,1\}\}$ . 令 $f:(X=\{0,1\},\mathcal{O}_1)\rightarrow (X,\mathcal{O}_2),x\mapsto 1-x$ . 显然 $(X,\mathcal{O}_1)$ 为 $T_2$ ，而 $(X,\mathcal{O}_1)$ 非 $T_0$ 也非 $T_1$ .

### $T_1$ 空间

>[!summary]+ 自查表
>- $T1$ 空间的定义，与 $T_0$ 空间的区别；

称拓扑空间 $X$ 是 $T_1$ 空间，如果 $X$ 的不同点的邻域系互不包含（ $\forall x\neq y,\mathcal{N}(x)\not\subset \mathcal{N}(y),\mathcal{N}(y)\not\subset \mathcal{N}(x)$ ，从而有 $\mathcal{N}(x)\subset \mathcal{N}(y)\Rightarrow x=y$ ），其具有等价定义， $\forall x,y\in X,x\neq y,\exists U\in \mathcal{O}(x\in U\land y\notin U)$ .

>[!hint]+ $T_1$ 和 $T_0$ 的区别. [check-mse](https://math.stackexchange.com/questions/231031/difference-between-t-0-spaces-and-t-1-spaces)
> $T_1$ 的定义中注意到 $x,y$ 是对称的，所以对于任意的 $x,y$ ，其各自存在一个开集将其与另一个点分开；而对于 $T_0$ ，存在一个开集将 $x,y$ 分开，但并不是能够保证哪一个点在这个开集中.

>[!note]- 证明上述两个定义是等价的.
>证明： $\Rightarrow$ ：由已设可知存在 $x$ 的不包含 $y$ 的邻域 $A$ ，从而有包含 $x$ 不包含 $y$ 的开集 $U$ ；
>
> $\Leftarrow$ 显然.

>[!note]- $T_1$ 空间中的单点集是闭集. 从而 $\{x\}=\overline{\{x\}}$ .
>证明：考虑 $x\in X$ ， $X$ 为 $T_1$ 空间，对任意 $y\in X\backslash \{x\}$ ，存在 $y$ 的开集 $U_y$ 不包含 $x$ ，所以 $U_y\subset X\backslash\{x\}$ ，所以 $X\backslash \{x\}=\bigcup_{y\in X\backslash \{x\}}U_y$ 为开集，所以 $\{x\}$ 是闭集.

>[!note]- 若 $X$ 是 $T_1$ 空间，则任给 $A\subset X$ ， $A$ 的凝聚点之集 $A^d$ 是闭集. （注：凝聚点，该点的任何一个邻域中都包含有 $A$ 中的非该点的点，又导集 $A'$ ）
>证明：设 $x\in X\backslash A^d$ ，则存在包含 $x$ 的开集 $U_x,U_x\cap A$ 至多包含一个点（若 $x\in A$ ） ，假设 $U_x\cap A^d\neq \emptyset$ ，若 $y\in U_x\cap A^d$ 并且 $y\neq x$ ，则存在包含 $y$ 的开集 $U$ 不包含 $x$ ，进而 $V=U\cap U_x$ 包含 $y$ 但不包含 $x$ ，进而 $V\cap A\neq \emptyset$ ，说明 $U_x\cap A\neq \{x\}$ 矛盾！综上 $U_x\cap A^d=\emptyset$ ，所以 $X\backslash A^d=\bigcup_{x\in X\backslash A^d} U_x$ 为开集，所以 $A^d$ 是闭集.
>
>（伪）证明：对于任意的 $x\in \overline{A^d}\backslash A^d$ ，对任意 $x$ 的开集 $V$ ， $V\cap A^d\neq \emptyset$ ，设 $y\in V\cap A^d$ ，则对于包含 $y$ 的开集 $V$ ， $V\cap A\neq \emptyset$ （但这说明不了 $x$ 的任意邻域都与 $A$ 交非空.）

>[!note]- 若 $X$ 是 $T_1$ 空间，则 $X$ 可数紧当且仅当 $X$ 的每个无限子集都有凝聚点. [check-mse](https://math.stackexchange.com/questions/1360019/prob-4-sec-28-in-munkres-topology-2nd-ed-for-t-1-spaces-countable-compa) [check-mseII](https://math.stackexchange.com/questions/1817245/a-topological-space-is-countably-compact-iff-every-countably-infinite-subset-has)
>证明： $\Rightarrow$ ：设 $A\subset X$ 为无限子集， $A$ 没有凝聚点，则任取 $A$ 的可数子集 $\{x_n\}_{n\geq1}$ ，考虑 $W_n=\{x_n,x_{n+1},\cdots\}$ ，则 $W_n$ 也没有凝聚点，所以 $\overline{W_n}=W_n\cup W'_n=W_n$ ，所以 $W_n$ 是闭集，则 $X\backslash W_n$ 是开集并且 $X=\bigcup_{n\geq1}X\backslash W_n$ ，然而对于 $\{X\backslash W_n\}_{n\geq1}$ 没有有限子覆盖，矛盾！
>
>$\Leftarrow$ ：设 $X$ 不是可数紧， $\{U_n\}_{n\geq1}$ 为 $X$ 的可数开覆盖，取 $x_n\in X\backslash \bigcup_{n\geq1}U_n$ ，考虑 $A=\{x_n\}_{n\geq1}$ ，对于任意的 $x_n,n\geq1$ ，当 $m>n$ 时 $x_m\notin U_n$ ，即只有有限个 $A$ 中的点在 $x_n$ 的邻域 $U_n$ 中，所以 $x_n$ 不是 $A$ 的凝聚点（这里需要证明，如果 $x$ 是 $A$ 的凝聚点，并且 $x$ 的某个邻域 $B$ 中只有有限个点，则考虑 $x\in U\subset B$ ， $U$ 中只有有限个 $A$ 中的点，记为 $\{y_1,\cdots,y_n\}$ ， $T_1$ 中的单点集也是闭集，因此 $U\backslash \{y_1,\cdots,y_n\}$ 是开集，但其作为 $x$ 的邻域已经不含 $A$ 中的任何点，与 $x$ 是凝聚点矛盾！）

>[!example]- $T_0\not\Rightarrow T_1$ .
>考虑 $\mathbb{R}$ 上的左拓扑： $x_1<x_2$ 都可以被 $(-\infty,\max\{x_1,x_2\}+\epsilon)$ 分开，但若 $x_1>x_2$ 则不存在 $x_1$ 的开集与 $x_2$ 分隔开.

### $T_2$ 空间（Hausdorff 空间）

称拓扑空间 $X$ 为 $T_2$ 空间如果对于任意的 $x,y\in X$ 存在开集 $U\ni x,V\ni y,U\cap V=\emptyset$ .

显然有：

>[!note] $T_2\Rightarrow T_1\Rightarrow T_0$ .

>[!example]- $T_2\not\Leftarrow T_1$ 
>考虑 $X=\mathbb{R}$ 上的余有限拓扑，假设对于 $x,y\in X$ ，存在 $U_x\ni x,U_y\ni y$ ， $U_x\cap U_y=\emptyset$ ，则 $(X\backslash U_x)\cup (X\backslash U_y)=X\backslash (U_x\cap U_y)=X$ ，这与 $X\backslash U_x,X\backslash U_y$ 矛盾！所以余有限拓扑为 $T_2$ 空间.
>
>而对于任意的 $x,y\in X$ ，考虑 $U_x=X\backslash \{y\}$ ，可得 $U_x\ni x,U_x\not\ni y$ . 所以余有限拓扑为 $T_1$ 空间.

### $T_3$ 空间

称拓扑空间 $X$ **正则**，如果任给闭集 $F\subset X,x\in X\backslash F$ ，存在开集 $U,V\subset X,x\in U,F\subset V$ 并且 $U\cap V=\emptyset$ .

$T_3$ 空间为正则的 $T_0$ 空间.

>[!note]- 正则是遗传性质.
>证明：设拓扑空间 $X$ 正则， $Y$ 为 $X$ 的子空间，对于任意 $Y$ 中的闭集 $W$ ，存在 $X$ 中的闭集 $F$ 使得 $W=Y\cap F$ . 对于 $x\in Y\backslash W$ . 如果 $x\notin F$ ，则由 $X$ 正则，存在开集 $U,V\subset X$ ， $x\in U,W\subset F\subset V$ ， $U\cap V=\emptyset$ . 如果 $x\in F,x\in Y$ 则 $x\in F\cap Y=W$ 矛盾！所以 $Y$ 具有遗传性质. 

>[!note]- $T_3\Rightarrow T_2$ .

>[!example]- $T_3\not\Rightarrow T_2$ .
>设 $K=\{1/n:n=1,\cdots,n,\cdots\}$ ， $\mathcal{O}_K$ 表示实数集 $\mathbb{R}$ 上以：
>
>$$\{(a,b):a,b\in \mathbb{R}\}\cup\{(a,b)\backslash K:ab<0,a,b\in \mathbb{R}\}$$
>
>为基生成的拓扑. 证明 $(\mathbb{R},\mathcal{O}_k)$ 是 Hausdorff 空间但不是正则空间.
>
>证明：对于 $(\mathbb{R},\mathcal{O}_k)$ 上的任意两点 $x,y$ ，可以取 $n$ 充分大使得 $\epsilon=\frac{1}{2}\left(\lvert x-y\rvert-\frac{1}{n}\right)>0$ ，进而取 $(x-\epsilon,x+\epsilon)\ni x,(y-\epsilon,y+\epsilon)\ni y$ 即可得 $T_2$ .
>
>考虑 $0\in \mathbb{R}$ ， $\mathbb{R}\backslash K=(-2,2)\backslash K\cup\bigcup_{n\geq 2}(-n-1,-n+1)\cup \bigcup_{n\geq2}(n-1,n+1)$ 为开集，因此 $K$ 为闭集，若存在开集 $U\supset K,U\not\ni 0$ 和开集 $V\ni 0,V\cap U=\emptyset$ ，则对 $U=\bigcup_{i\in I}B_i$ ，假设存在 $B_m=(a_m,b_m)\backslash K,a_mb_m<0$ ，则 $B_m\ni 0$ 矛盾！所以任意的 $B_i\in\{(a,b):a,b\in \mathbb{R}\}$ ，由 $0\in V$ ，存在开集 $(c,d)\backslash K\subset V$ ，然而总存在充分大的 $N$ 使得 $\frac{1}{N}\in(c,d)$ ，同时 $\frac{1}{N}\subset U$ ，因此存在 $(a_N,b_N)\ni \frac{1}{N},(a_N,b_N\in \{B_i\}_{i\in I})$ ，所以有 $(c,d)\backslash K\cap (a_N,b_N)\neq \emptyset$ ，所以 $V\cap U\neq \emptyset$ . 所以 $\mathbb{R,\mathcal{O}_K}$ 不正则.

### $T_4$ 空间

>[!summary] 自查表
>- 正规的定义； $T_4$ 空间的定义；

称拓扑空间 $X$ **正规**（normal），如果任给不交闭集 $F,G\subset X$ ，存在不交开集 $U\supset F,V\supset G$ .

$T_4$ 空间为正规的 $T_1$ 空间.

>[!note]- 正规是闭遗传性质.
>证明：设 $Y$ 为 $X$ 的闭子空间. 对于任意的 $W=Y\cap F,Z=Y\cap G$ ， $W,Z$ 仍然为 $X$ 中的开集，因此 $Y$ 正规. 

>[!hint] 如果 $(X,\mathcal{O})$ 中没有不交闭集，那么也认为 $X$ 是正规的.

>[!example]- 设 $\mathcal{O}=\{\emptyset,\mathbb{N}\}\cup \{U\subset \mathbb{N}:0\notin U,\lvert X\backslash U\rvert<\infty\}$ ，求证： 1) $\mathcal{O}$ 是 $\mathbb{N}$ 上的一个拓扑；2) $(\mathbb{N},\mathcal{O})$ 是正规空间；3) $(\mathbb{N},\mathcal{O})$ 的开子空间 $\mathbb{N}\backslash\{0\}$ 不是正规空间.
>证明：
>1) i) $\emptyset,\mathbb{N}\in \mathcal{O}$ ，ii) 对于任意的 $U,V\in \mathcal{O}$ ，若 $U=\emptyset$ 则对任意 $V\in \mathcal{O}$ ， $U\cap V=\emptyset$ ，若 $U=\mathbb{N},V\in \{U\subset \mathbb{N}:\lvert X\backslash U\rvert<\infty\}$ ，则 $U\cap V=V$ ，若 $U,V\in\{U\subset \mathbb{N}:\lvert X\backslash U\rvert<\infty\}$ ，则 $X\backslash(U\cap V)=(X\backslash U)\cup(X\backslash V)$ 为有限集；
>2) （不存在非空的不交闭集，主要原因是在 $\mathcal{O}$ 的定义下任何闭集都含有 $\{0\}$ ）假设 $A,B$ 为不交闭集， $A^c,B^c$ 为开集且非 $\{\emptyset,\mathbb{N}\}$ 中元素，并且 $0\notin A^c,0\notin B^c$ ，从而 $0\in A\cap B$ ，所以 $\mathbb{N},\mathcal{O}$ 中没有非平凡不交闭集，而如果 $A$ 取 $\emptyset$ 则 $A,B$ 交为空，取 $\emptyset\supset A,\mathbb{N}\supset B$ 即可，所以 $X$ 正规. 
>3) （如 2) 陈述， $0\notin X$ ，因此可以定义非平凡的不交闭集，而这显然会产生矛盾）$\mathbb{N}\backslash \{0\},\mathcal{O}'$ 上的拓扑为： $\{\emptyset,\mathbb{N}\backslash\{0\}\}\cup\{U\backslash\{0\}:0\notin U,U\subset \mathbb{N},\lvert X\backslash U\rvert<\infty\}$ . 取不交闭集 $\{1\}=(\mathbb{N}\backslash\{0\})\cap\{0,1\},\{2\}=(\mathbb{N}\backslash\{0\})\cap\{0,2\}$ ，设存在开集 $U\backslash\{0\}\ni \{1\},V\backslash\{0\}\ni \{2\}$ ， $\mathbb{N}\backslash (U\cap V)=\mathbb{N}\backslash U\cup \mathbb{N}\backslash V$ 为有限集，所以 $U\cap V$ 为 $\mathbb{N}$ 中的无限集，进而 $U\backslash\{0\}\cap V\backslash\{0\}=U\cap V\backslash\{0\}$ 为 $\mathbb{N}\backslash\{0\}$ 中的无限集. 所以非正则空间.

>[!note] 度量空间是正规空间.
>证明：构造连续函数 $f(x)=\frac{d(x,F)}{d(x,F)+d(x,G)}$

## 拓扑完备

设拓扑空间 $X$ ，如果 $X$ 可<u>完备</u>度量化：存在 $X$ 上的度量 $d$ 诱导 $X$ 上的拓扑，则称 $X$ 是**拓扑完备**的.

>[!note] 拓扑完备是闭遗传性质.

>[!note] 拓扑完备是开遗传性质.

>[!note] 拓扑完备可数可乘.

称 $A$ 是 $G_\sigma$ 集，若 $A$ 可以表示为 $X$ 的可数个开集的交；称 $B$ 是 $F_\sigma$ 集，如果 $B$ 可以表示为 $X$ 的可数个闭集的并.

>[!note] 若 $X$ 拓扑完备， $A\subset X$ 是 $G_\sigma$ 集，则 $A$ 拓扑完备.

>[!note] 若 $A$ 拓扑完备， $X$ 可度量化，则 $A$ 为 $G_\sigma$ 集.

>[!example] 设 $A$ 为度量空间 $(X,d)$ 的一个子集， $(Y,d)$ 是完备度量空间， $f: A\rightarrow Y$ 连续. $\forall x\in \bar{A}$ ，定义 $f$ 在 $x$ 处的振幅： $\text{osc}(f,x)=\inf_{U\in \mathcal{N}(x)}\sup_{y,z\in A\cap U}\rho(f(y),f(z))$ . 证明：1) $A^\sharp=\{x\in \overline{A}:\text{osc}(f,x)=0\}$ 是 $x$ 的 $G_\delta$ 集；2) $f$ 可以连续延拓到 $A^\sharp$ 上.

称拓扑空间 $X$ 是 **Cech 完备**的，如果 $X$ 同胚于某一紧 Hasudorff 空间的一个可度量化 $G_\sigma$ 集.

>[!note] Cech 完备可数可乘.

证明：设 $\{X_n\}_{n\ge1}$ 是一列 Cech 完备空间，则存在 $\{Y_n\}_{n\ge1}$ ， $X_n$ 同胚于 $Y_n$ 的一个可度量化 $G_\sigma$ 集 $H_n=\bigcap_{k\ge1}H_n^{k}$ ，其中 $H_n^k$ 为 $Y_n$ 中的开集，并且 $Y_n$ 是紧 Hasudorff 空间. 

可数个紧 Hausdorff 空间的乘积仍然为紧 Hausdorff 空间？

$\prod_{n\ge1}^{}X_n$ 同胚于 $\prod_{n\ge1}^{}H_n$ ，并且 $\prod_{n\ge1}^{}H_n$ 为 $\prod_{n\ge1}^{}Y_n$ 的 $G_\sigma$ 集，并且该 $G_\sigma$ 集可度量化.





# 度量化定理

## Urysohn 引理

>[!note] Urysohn 引理：对于正规空间 $X$ 中任意两个不交非空闭集 $F,G$ ，存在连续函数 $f: X\rightarrow[0,1]$ 使得 $f(F)=\{0\},f(G)=1$ .

Urysohn 引理建立起正规空间到闭区间 $[0,1]$ 之间的联系.

首先给出 $X$ 上的连续函数 $f: X\rightarrow \mathbb{R}$ 的一个性质，设 $D$ 为 $\mathbb{R}$ 中的稠密子集，则有：

>[!note] 若 $f: X\rightarrow \mathbb{R}$ 为连续函数则： $f(x)=\sup\{r\in D:x\in U_r\}$ ，其中 $U_r=f^{-1}(r,+\infty)$ .
>证明：因为 $x\in U_r$ ，所以 $f(x)>r$ ，因为 $D$ 为 $\mathbb{R}$ 中的稠子集，所以对于任意的 $\epsilon>0$ ，存在 $r$ 使得： $r>f(x)-\epsilon$ ，所以 $\sup\{r\in D: x\in U_r\}=f(x)$ .

并且具有以下性质：

>[!note]- $\bigcup_{r\in D}U_r=X$ ； $\bigcap_{r\in D}U_r=\emptyset$ ； $\forall r<s,\overline{U_s}\subset U_r$ .
>证明：前两个显然. 对于任意的 $r<s$ 有： $U_s\subset U_r$ ， $f^{-1}(s,+\infty)\subset f^{-1}([s,+\infty))\subset f^{-1}(r,+\infty)$ ，并且 $f^{-1}([s,+\infty))$ 是闭集，所以 $\overline{U_s}\subset f^{-1}([s,+\infty))\subset f^{-1}(r,+\infty)$ .

反之，可以证明具有以上三条性质的集合族可以定义一个连续函数：

>[!note] 设拓扑空间 $X$ ， $D$ 为 $\mathbb{R}$ 上的稠子集， $\{U_r\}_{r\in D}$ 为 $X$ 中的一族开集，如果满足： $\bigcup_{r\in D}U_r=X,\bigcap_{r\in D}U_r=\emptyset,\forall r<s(\overline{U_s}\subset U_r)$ ，则 $f(x)=\sup\{r:x\in U_r\}$ 是 $X\rightarrow \mathbb{R}$ 上的连续函数. 
>证明：因为 $\{(-\infty,c),(c,+\infty):c\in \mathbb{R}\}$ 是 $\mathbb{R}$ 上的一组基，所以只需要证明 $f^{-1}(-\infty,c),f^{-1}(c,+\infty)$ 是 $X$ 中的开集即可.
>
>因为 $D$ 是 $\mathbb{R}$ 上的稠子集，所以 $f^{-1}(c,+\infty)=\bigcup_{r>c}U_r$ 为 $X$ 中的开集；
>
>对于 $x\in f^{-1}(-\infty,c)$ 有 $f(x)<c$ ，考虑 $X\backslash f^{-1}(-\infty,c)=f^{-1}([c,\infty)$ ， $x\in f^{-1}([c,\infty])$ 当且仅当对于任意的 $r<c,x\in U_r$ ，从而 $x\in f^{-1}(c,\infty)$ 当且仅当存在 $s<c$ 使得 $x\in X\backslash U_s$ ， $x\notin U_s$ ，所以对于任意的 $r\in \{r:x\in U_r\}$ ，有 $s>r$ ，从而 $U_s\subset \overline{U_s}\subsetneq U_r$ ，从而 $x\notin \overline{U_s}$ ，所以 $f^{-1}(-\infty,c)=\bigcup_{s<c}(X\backslash \overline{U_s})$ 为开集.

下面证明 Urysohn 引理：对于不交闭集 $F,G$ ，首先取开集 $U_0=X\backslash F$ ，因为 $X$ 是正规空间，所以存在 $U_1$ 使得： $G\subset U_1\subset \overline{U_1}\subset U_0=X\backslash F$ . 再由正规的性质，存在开集 $U_{\frac{1}{2}}:\overline{U_1}\subset U_{\frac{1}{2}}\subset \overline{U_\frac{1}{2}}\subset U_0$ ， $U_1\subset \overline{U_1}\subset U_\frac{1}{2}\subset \overline{U_{\frac{1}{2}}}\subset U_0$ ，继续由正规性质即可得到 $[0,1]$ 中的稠子集 $\left\{\frac{k}{2^n}:0\leq k\leq 2^{n}\right\}_{n\ge1}$ . 再令 $U_s=X,\forall s>1,U_r=\emptyset,\forall s<0$ ，构造指标集 $E=(-\infty,0)\cup D\cup (1,\infty)$ ，其为 $\mathbb{R}$ 中的稠子集，并且集合族 $\{U_r\}_{r\in E}$ 满足上面的三个条件，定义函数 $f(x)=\sup\{r:x\in U_r\}$ ，则 $f$ 是连续函数，且对于任意的 $x\in G\subset U_1$ ，可知 $f(x)=1$ ，对任意的 $x\in F=X\backslash U_0$ ，有 $f(x)=0$ .从而可得结论.

>[!note] 设 $F$ 是正规空间 $X$ 的非空闭子集，证明 $F$ 能写成可数个开集的交当且仅当存在连续函数 $f: X\rightarrow[0,1]$ 使得 $F=f^{-1}(0)$ .

证明：

$\Rightarrow$ ：设存在开集列 $\{U_n\}_{n\geq1}$ 使得 $F=\bigcap_{n\ge1}U_n\ne\emptyset$ ，则 $F\subset U_1$ ，取 $G=X\backslash U_1$ ，从而 $G,F$ 为不交的非空闭集，由 Urysohn 引理可知存在连续函数 $f$ 使得 $f(F)=\{0\}$ 即得结论.

$\Leftarrow$ ： $F=f^{-1}(0)=f^{-1}\left(\bigcap_{n\geq1}\left[0,\frac{1}{n}\right)\right)=\bigcap_{n\geq1}f^{-1}\left(\left[0,\frac{1}{n}\right)\right)$ ，由 $f$ 连续可知 $F$ 为可数个开集的交.

>[!example] 设 $X$ 是正规空间， $U_1,U_2,\cdots,U_n$ 为 $X$ 中的开集， $\bigcup_{i\leq n}U_i=X$ 则有： 1) 存在开集 $V_1,\cdots,V_n$ 为 $X$ 中的开集，使得 $\bigcup_{i\leq n}V_i=X$ ，并且对任意 $i\leq n,\overline{V_i}\subset U_i$ . 2) 存在连续函数 $f_1,f_2,\cdots,f_n:X\rightarrow[0,1]$ ，满足 i) $\forall x\in X,\sum\limits_{i\leq n}^{}f_i(x)=1$ ；ii) $\forall i\leq n,\overline{f^{-1}_i(0,1]}\subset U_i$ .

证明：因为 $X=\bigcup_{i\leq n}U_i=U_1\cup\bigcup_{i=2}^nU_i$ ，所以 $X\backslash\bigcup_{i=2}^nU_i=\bigcap_{i=2}^nU_i^c\subset U_1$ ，进而由 $X$ 是正规空间，存在开集 $V_1$ 使得： $W_1=\bigcap_{i=2}^nU_i^c\subset V_1\subset \overline{V_1}\subset U_1$ ，同理可得 $V_i\subset U_i,\forall i\leq n$ . 并且： 

$$\bigcup_{i\leq n}V_i\supset \bigcup_{i\leq n} X\backslash \bigcup_{j\neq i}U_j=X\backslash \bigcap_{i\leq n}\bigcup_{j\neq i}U_j=X$$

从而 1) 成立.

对于任意的 $i\leq n$ ，存在闭集 $W_i\subset V_i\subset \overline{V_i}\subset U_i$ ，进而 $W_i,X\backslash V_i$ 为不交的闭集，由 Urysohn 引理，存在连续函数 $g_i: X\rightarrow [0,1]$ 使得 $g_i(X\backslash V_i)=0,g(W_i)=1$ ，从而：

$$g^{-1}(0,1]\subset V_1\Rightarrow \overline{g^{-1}(0,1]}\subset \overline{V_1}$$

考虑 $\sum\limits_{i=1}^{n}g_i$ ，注意到对于任意的 $x\in X$ ，总存在 $W_i\in x$ ，从而 $\sum\limits_{i=1}^{n}g_i\neq 0$ . 

令 $f_i=\frac{g_i}{\sum\limits_{j=1}^{n}g_i}$ ，则有 $\sum\limits_{i=1}^{n}f_i=1$ ，并且 $f_i^{-1}(0,1]=g^{-1}(0,1]$ ，从而有 ii) 成立.

>[!example] 若拓扑空间 $X$ 中的每个子空间都是正规空间，则称 $X$ 完全正规，证明 $X$ 完全正规当且仅当任给 $X$ 的两个分离集 $A,B$ （ $\bar{A}\cap B=A\cap \bar{B}=\emptyset$ ），存在 $X$ 的不交开集 $U,V$ 使得 $A\subset U,B\subset V$ .

证明：

$\Rightarrow$ ： 取 $Y=X\backslash (\bar{A}\cap \bar{B})$ ，从而 $Y$ 为正规空间，则 $Y\cap \bar{A},Y\cap \bar{B}$ 为 $Y$ 中的不交闭集，因此存在不交开集 $U',V'$ 使得 $Y\cap \bar{A}\subset U',Y\cap \bar{B}\subset V'$ . 注意到：

$$\begin{aligned}
Y\cap \bar{A}&=(X\cap (\bar{A}\cap \bar{B})^c)\cap \bar{A}\\
&=(X\cap (\bar{A}^c\cup \bar{B}^c))\cap \bar{A}\\
&=((X\cap \bar{A}^c)\cup (X\cap \bar{B}^c))\cap \bar{A}\\
&=X\cap \bar{B}^c\cap \bar{A}\\
&=(X\backslash \bar{B})^c\cap \bar{A}\\
&\supset A
\end{aligned}$$

其中由 $\bar{B}\cap A=\emptyset$ 可得到最后结论. 从而开集 $U'\supset A$ ，同理 $V'\supset B$ .

$\Leftarrow$ ：设 $Y$ 为 $X$ 的子空间，对于 $Y$ 中任意两个不交闭集 $F=F'\cap X,G=G'\cap X$ ，假设 $\bar{F}\cap G\neq \emptyset$ ，则存在 $G$ 中的点 $x$ ， $x\in \overline{F}\subset F'\cap X$ ，从而 $x\in F'$ ，所以 $x\in F\cap G$ ，矛盾！因此 $F,G$ 是分离集，从而可得结论.

## Urysohn 度量化定理

有可数集的 $T_3$ 空间可以度量化，特别地，有可数集的紧 Hausdorff 空间可度量化.




# $\mathbb{R}$ 上拓扑

$\mathbb{R}$ 上有八大拓扑. 对照上面介绍的拓扑的刻画分别进行分析：

1. 拓扑（开集族）；
2. 闭集族；
3. 邻域系；
4. 第一可数；
5. 基；
6. 第二可数；
7. 收敛；
9. 紧、可数紧、序列紧；
10. Hausdorff 性质

### 平凡拓扑

| 拓扑     | 闭集族 | 邻域系 | 第一可数           | 基   | 第二可数 | 收敛  |
| ------ | --- | --- | -------------- | --- | ---- | --- |
|        |     |     |                |     |      | ✅   |
| 紧      | 可数紧 | 序列紧 |                |     |      |     |
| ✅ 是紧空间 |     |     |                |     |      |     |
| （分离性质） | T 0 | T 1 | T 2（Hausdorff） | T 3 | T 4  |     |
|        |  否  | 否   | 否              | 否   | 否    |     |

开集最少的拓扑（最小 / 粗 / 弱的拓扑）： $\{\emptyset, \mathbb{R}\}$ . 由 $\emptyset,\mathbb{R}$ 既是开集也是闭集，可以得到 $\bar{\emptyset}=\emptyset,\bar{\mathbb{R}}=\mathbb{R},\emptyset^\circ=\emptyset,\mathbb{R}^\circ=\mathbb{R}$ .

平凡拓扑上对任意 $x$ ，任意 $\{x_n\}_{n\geq1}$ 都收敛于 $x$ .

平凡拓扑只有两个开集，所以是紧空间.

对于任意的 $x_1,x_2\in X$ ，其邻域均为 $X$ ，因此不满足 Hausdorff 性质. （平凡拓扑中的任意两个点都是只有一个共同开集，因此不满足任何分离性质.）

### 离散拓扑

| 拓扑        | 闭集族 | 邻域系 | 第一可数 | 基   | 第二可数 | 收敛  |
| --------- | --- | --- | ---- | --- | ---- | --- |
|           |     |     |      |     |      | ✅   |
| 紧         | 可数紧 | 序列紧 |      |     |      |     |
| ✅ 有限集是紧子集 |     |     |      |     |      |     |
| （分离性质）    | T 0 | T 1 | T 2  | T 3 | T 4  |     |
|           |     |     | ✅ 满足 |     |      |     |

形如 $(X,\mathcal{P}(X))$ 的拓扑空间称为**离散空间**（discrete space）.

最大 / 细 / 强的拓扑，离散拓扑可以由离散度量定义（只有完全相同的两个元素距离才为 $1$ ，其余皆为 $0$ ）： $\mathcal{P}(\mathbb{R})$ .

离散拓扑中的收敛： $x_n\rightarrow x$ 当且仅当存在 $N,n>N$ 时 $x_n=x$ .

离散拓扑中任何子集的开覆盖为单点集组成的集族，紧当且仅当该子集是有限集.

对任意 $x_1,x_2\in X$ ，取 $\{x_1\},\{x_2\}$ 作为邻域. 由此 $X$ 具有 Hausdorff 性质.

### 欧式拓扑

| 拓扑  | 闭集族 | 邻域系 | 第一可数 | 第二可数 | 基   | 收敛  | 紧         |
| --- | --- | --- | ---- | ---- | --- | --- | --------- |
|     |     |     |      | ✅    | ✅   |     | ✅ 有界闭集是紧集 |

由欧式度量给出.

欧式拓扑中的开集都能够写为一族端点为有理数 / 无理数的开区间的并. 而 $\mathcal{B}=\{(r,R):r<R,r,R\in \mathbb{Q}\}\subset \mathbb{Q}\times \mathbb{Q}$ 可数，所以欧式拓扑第二可数，从而第一可数.

欧式拓扑中有界闭和紧是等价的. [[zoeminus/docs/Math/R#^Henie-Borel|R]] 

### 左拓扑

| 拓扑     | 闭集族 | 邻域系 | 第一可数           | 基   | 第二可数 | 收敛  |
| ------ | --- | --- | -------------- | --- | ---- | --- |
| ✅      | ✅   | ✅   | ✅ 是            |     |      |     |
| 紧      | 可数紧 | 序列紧 |                |     |      |     |
| ✅      |     |     |                |     |      |     |
| （分离性质） | T 0 | T 1 | T 2（Hausdorff） | T 3 | T 4  |     |
|        |     |     | 否              |     |      |     |

$\{(-\infty,a):a\in \mathbb{R}\cup\{+\infty\}\}\cup\emptyset$ ，以下记为 $L\mathbb{R}$ ；

>[!note]- 左拓扑与右拓扑同胚.
>证明：考虑映射 $f: L\mathbb{R}\rightarrow R\mathbb{R}, (-\infty,-a)\rightarrow (a,+\infty)$ . 则 $f$ 为双射并且连续. 所以左右拓扑同胚.

下面来讨论左拓扑空间的紧性，很容易看出左拓扑空间不是紧空间，例如，考虑 $(-\infty,a),a<\infty$ ，对其开覆盖 $\{(-\infty,a-1/n)\}$ ，没有有限子覆盖. 猜测左拓扑空间中的紧集具有最大值.

若 $K\subset \mathbb{R}$ 为 $(\mathbb{R},L\mathbb{R})$ 上的紧子集，设 $k=\sup K$ ，如果 $K$ 不能取到 $k$ ，则取 $K$ 的开覆盖： $\{(-\infty,k-\epsilon)\}_{\epsilon>0}$ ，对于该开覆盖的任意的有限子集 $\{(-\infty,k-\epsilon_{n})\}_{1\leq n\leq m}$ ，由 $k$ 的定义，存在 $k'\in K$ ， $k'\in (k-\inf\{\epsilon_n\}_{n\geq1},k)$ ，因此无有限子覆盖.

若 $K$ 能够取得 $k$ ，则对于任意的 $K$ 的开覆盖 $\mathcal{U}$ ，一定存在 $(-\infty,a)\in \mathcal{U}:a>k$ ， $\{(-\infty,a)\}$ 即为 $K$ 的一个有限子覆盖.

$K$ 为空集时也为紧子集.

对于左拓扑， $X$ 上的任意两个点的邻域的交都非空，因此不具有 Hausdorff 性质.

### 右拓扑

| 拓扑  | 闭集族 | 邻域系 | 邻域基       | 第一可数 | 基   | 第二可数 | 收敛  |
| --- | --- | --- | --------- | ---- | --- | ---- | --- |
| ✅   | ✅   | ✅   | ✅         | ✅ 是  |     |      |     |
| 紧   | 可数紧 | 序列紧 | Hausdorff |      |     |      |     |
|     |     |     | ✅ 不满足     |      |     |      |     |
|     |     |     |           |      |     |      |     |

$\{(a,+\infty):a\in \mathbb{R}\}\cup\emptyset$ ；右拓扑的闭集族则为 $\{(-\infty,b]: b\in \mathbb{R}\}\cup\emptyset$ .

右拓扑中每一个点 $x$ 的邻域系 $\mathcal{N}(x)=\{(y,+\infty):y<x\}$ .

$x$ 的一个邻域基可以写为： $\{\left(x-\frac{1}{n},+\infty\right)\}_{n\geq1}$ ，所以右拓扑第一可数.

### 余有限拓扑

| 拓扑     | 闭集族 | 邻域系 | 第一可数 | 基   | 第二可数 | 收敛  |
| ------ | --- | --- | ---- | --- | ---- | --- |
|        |     |     |      |     |      |     |
| 紧      |     |     |      |     |      |     |
| ✅ 是紧空间 |     |     |      |     |      |     |
| （分离性质） | T 0 | T 1 | T 2  | T 3 | T 4  |     |
|        | 是   | 是   | 否    | 否   | 否    |     |

$\emptyset\cup\{\mathbb{R}\backslash F:F=F\text{ 为有限集}\}$ .

>[!note] 余有限拓扑的闭集是有限集，进而是紧集.

对于余有限拓扑空间 $X$ ，设其一开覆盖为 $\mathcal{U}$ ， $X\subset \bigcup \mathcal{U}$ ，取 $U\in \mathcal{U}$ ，则 $U^c=X\backslash U$ 有限，设 $U^c=\{u_1,\cdots,u_n\},n<\infty$ ， $U^c=\bigcup \mathcal{U}\backslash U$ ，从而有至多 $n$ 个 $\bigcup \mathcal{U}\backslash U$ 中的元素可以覆盖 $U^c$ ，所以 $X$ 是紧空间.

### 余可数拓扑

| 拓扑  | 闭集族 | 邻域系 | 第一可数 | 基   | 第二可数 | 收敛  |
| --- | --- | --- | ---- | --- | ---- | --- |
|     |     |     |      |     |      |     |
| 紧   |     |     |      |     |      |     |
|     |     |     |      |     |      |     |

### 📍Sorgenfrey 拓扑

S<u>o</u>rgenfrey 直线是由 $\mathcal{B}=\{[a,b):a,b\in \mathbb{R},a<b\}$ 为基生成的拓扑.

| 基   | 第二可数 | 拓扑  | 闭集族 | 邻域基 | 第一可数 | 收敛  |
| --- | ---- | --- | --- | --- | ---- | --- |
| ✅   | ✅ 否  |     |     | ✅   | ✅ 是  | ✅   |
| 紧   |      |     |     |     |      |     |
| 否   |      |     |     |     |      |     |

下面借助基的等价定义说明 Sorgenfrey 第二可数：对于任意的包含 $x$ 的开集 $U$ ，存在 $B_x\in \mathcal{B}$ 使得 $x\in B_x\subset U$ ，因为 $[x,+\infty)$ 也是包含 $x$ 的开集，所以存在 $B_x'\in \mathcal{B}$ ： $B_x'=[x,a')\subset [x,+\infty]$ ，进而建立起 $\mathbb{R}$ 和 $\mathcal{B}$ 之间的一个双射. 所以 Sorgenfrey 直线第二可数. 类似地， Sorgenfrey 拓扑均非第二可数. [ste](https://math.stackexchange.com/questions/1135993/mathbbr-with-the-lower-limit-topology-is-not-second-countable)

对 $x\in X$ ， $x$ 的邻域系：； $x$ 的一个邻域基为 $\left\{\left[x,x+\frac{1}{n})\right)\right\}_{n\geq1}$ ，所以 Sorgenfrey 直线第一可数.

下面讨论 Sorgenfrey 直线上的收敛： $\{x_n\}_{n\geq1}$ 收敛到 $x$ 的充分必要条件为 $\{x_n\}_{n\geq1}$ 终在 $x$ 的任意邻域基中的任何一个元素. 考虑上面的邻域基， $\{x_n\}_{n\geq1}$ 收敛到 $x$ 的充分必要条件为对任意 $m\geq1,\exists N\in \mathbb{N},\forall n\geq N$ ， $x_n\geq1 x,x_n-x<\frac{1}{m}$ . 对于其他 Sorgenfrey 拓扑，例如 Sorgenfrey 平面，每一个坐标对应的序列都向左逼近 $x$ 的相应坐标.

>[!note]- Sorgenfrey 直线不是紧的.
> $\bigcup_{n\in \mathbb{Z}}[n,n+1)$ .

>[!note]- Sorgenfrey 直线可分.
> $\mathbb{Q}$ 是 $\mathbb{R}_l$ 的稠子集. 