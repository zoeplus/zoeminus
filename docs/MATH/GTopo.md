拓扑学是从极限和连续中抽象出来的概念. 

Prerequisites：[集合论](Set.md)，[实数理论](R.md)

# 度量空间

对于集合 $X$ ，引入**度量**的概念： 

$$d:X\times X\rightarrow \mathbb{R}$$

满足以下条件： 

$$\begin{aligned}
&\forall x,y,z\in X\\
&1)\ d(x,y)\geq0,\ d(x,y)=0\Leftrightarrow x=y\\
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

对于 $B_d(0,1)$ 以上三种度量的形状分别为[[GTopoDraw]].

此外还有：

>[!note]- 离散度量.
>$$d(x,y)=\left\{\begin{aligned} &0,x=y \\\\ &1,x\neq y \end{aligned}\right.$$

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

下面定义**极限**（收敛）的概念，称 $\lim_{n\rightarrow \infty}x_n=x$ ，如果 $\forall \epsilon>0,\exists N,n>N,d(x,x_n)<\epsilon$ . 以及**终在**这一概念（极限概念的减弱）： $\{x_n\}$ 终在集合 $U$ 中，如果 $\exists N,n>N,x_n\in U$ .

开集和极限都是借助度量定义的. 两者也可以互相定义.

>[!note]- 对于度量空间 $(X,d)$ ， $O$ 是开集的充分必要条件为对于任何序列 $\{x_n\}$ ，如果 $\lim_{n\rightarrow \infty}x_n=x\in O$ ，则 $\{x_n\}$ 终在 $O$ 中.
>证明：
>$\Rightarrow$ ：由 $\lim_{n\rightarrow \infty}x_n=x\in O$ ，由 $O$ 是开集，可得存在 $\epsilon_0>0$ ， $B_d(x,\epsilon)\subset O$ ，又 $\lim_{n\rightarrow \infty}=x$ ，对于上述 $\epsilon_0>0,\exists N,\forall n>N,x_n\in B_d(x,\epsilon_0)\subset O$ ，从而 $\{x_n\}$ 终在 $O$ 中.
>$\Leftarrow$ ：反证，假设 $O$ 不是开集，则 $\exists x\in O$ ， $\forall \epsilon>0$ ， $B_d(x,\epsilon)\not\subset O$ ，因而可以构造一个序列 $\{x_n\}\rightarrow x$ ，这与 $\{x_n\}$ 终在 $O$ 中矛盾！

>[!note]- 对于度量空间 $(X,d)$ ，$\lim_{n\rightarrow \infty}x_n=x$ 当且仅当对于任意的开集 $O:x\in O$ ， $\{x_n\}$ 终在 $O$ 中.

定义 $X$ 上的**拓扑**： $X$ 上开集的全体. 开集、极限等概念对于某一种结构从多个方面进行刻画，称该结构为**拓扑结构**.

---

在定义开集的概念之后可以引入**闭集**的概念，设 $X$ 是集合 $S$ 中的开集，则 $X^c$ 即为 $S$ 中的闭集. **列紧集**则为既有界又收敛的序列.

>[!note]- 任意个闭集的交仍然为开集.
>证明：根据 De Morgan 定律可得.

>[!example]- 既不是开集也不是闭集的集合. #imcomplete 
>$\mathbb{Q}$ ， $[0,1)$ .

类似地，可以对于闭集的概念用极限加以说明. （开集的补对于闭集的判断并没有很大帮助）

>[!note]- 对于度量空间 $(X,d)$ ， $O\subset X$ 是闭集的充分必要条件为对于任何序列 $\{x_n\}\subset O$ ，如果 $\lim_{n\rightarrow \infty}x_n=x$ ，则 $x\in O$ .
>证明：
>$\Rightarrow$ ： 反证：如 $x\notin O$ ，则存在开球 $B_d(x,\epsilon_0)\subset O^c$ ，又 $\lim_{n\rightarrow \infty}x_n=x$ ，则当 $n$ 充分大时 $x_n\in O^c$ 矛盾.
>$\Leftarrow$ ： 反证：假设 $O^c$ 不是开集，则存在 $x\in O^c$ ，对于任意 $\epsilon>0$ ， $B_d(x,\epsilon)$ 不包含于 $O^c$ ，从而可以取 $\{x_n\}_{n\geq1}\rightarrow x$ 且 $\{x_n\}_{n\geq1}\rightarrow x\in O$ 矛盾！所以 $O$ 为闭集.

引入最小闭集的概念：称 $\bar{A}=\bigcap\{C:A\subset C,C\ \text{为闭集}\}$ 为 $A$ 的**闭包**. 闭包同样有等价定义：对于集合 $A$ ，称 $x$ 为 $A$ 的**附着点**，如果对于 $x$ 的任何一个邻域 $U$ ， $U\cap A\neq\emptyset$ . 闭包即为 $A$ 的附着点全体. 注：分别记为第一定义和第二定义.

>[!note]- 上述两种对于闭包的定义等价.
>证明：设两种定义对应的集合分别为 $A_1,A_2$ ， $\forall x\in A_1$ ，不妨设 $x\notin A$ ， 如果存在 $x$ 的一个邻域 $U$ 使得 $U\cap A=\emptyset$ ，则 $A\subset U^c$ ，设 $x\in A_1$ ， $A_1$ 为包含 $A$ 的闭集，则 $U^c\cap A_1$ 仍然为包含 $A$ 的闭集，并且 $x\notin U^c\cap A_1$ ，这与 $A_1$ 的定义矛盾！
>
>反之，若 $x\in A_2$ ，若存在闭集 $B\supset A$ ， $x\in B^c$ ，则 $B^c\cap A\neq\emptyset$ . 则与 $B\supset A$ 矛盾！所以两种定义等价.

>[!note]- $A$ 为闭集的充分必要条件为 $A=\bar{A}$ .
>证明： 由第一定义即可得到.

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
>证明：由第二定义： $$\begin{aligned}
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

借助度量的概念可以建立点到集合之间的距离：设 $A$ 为度量空间 $(X,d)$ 中的非空子集，定义函数 $d(-,A):X\rightarrow \mathbb{R}$ ： $$d(x,A)=\inf\{d(x,a):a\in A\}$$

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

>[!noet]- 连续函数将紧集映射到紧集.
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

#### 稠与疏

可以将所有集合分为**第一纲集**（sets of first category, 稀疏集）和**第二纲集**（sets of second category，非稀疏集）. 需要说明的是：稠、无处稠等概念都是相对于具体的度量空间而言，e.g. $E\subset X$ 是是稠子集的意思是 $E$ 是 $X$ 的稠子集. 具体定义如下：

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

### 序列紧

设度量空间 $(X,d)$ ，定义**序列紧**： $K\subset X$ ，任何 $K$ 中的序列都有收敛到 $K$ 中点的子列. **全有界**（totally bounded）：任给 $\epsilon>0$ ，开覆盖 $\{B(x,\epsilon):\epsilon\in X\}$ 都有有限子覆盖. **紧**：任何包含 $X$ 的开覆盖都有有限子覆盖.

根据定义首先可得：

>[!note]- 紧度量空间全有界.
>证明，取 $X$ 的开覆盖 $\{B(x,\delta_x):x\in X\}$ ，由 $X$ 紧，存在 $x_1,\cdots,x_n\in X$ ， $\{B(x_i,\delta_{x_i}:1\leq i\leq n\}$ 是 $X$ 的开覆盖. 取 $\epsilon=\max\{\delta_{x_i}:1\leq i\leq n\}$ 即可.

>[!note]- 对于全有界度量空间 $(X,d)$ ，对任意 $A\subset X$ ， $(A,d)$ 也全有界.

>[!note]- Lebeague 引理：设 $U$ 是序列紧度量空间 $(X,d)$ 的一个开覆盖，则 $\exists r>0,\forall x\in X,B(x,r)$ 含于 $U$ 中的某个元素. 并称 $r$ 为 $U$ 的 **Lebeague 数**.
>证明：不妨设对于任意的 $n\geq1$ 都存在 $x_n\in X$ 使得 $B(x_n,\frac{1}{n})$ 不含于 $U$ 中的任一元素. 则 $\{x_n\}_{n\geq1}$ 有收敛子列 $\{x_{n_k}\}_{k\geq1}\rightarrow x\in X$ ，则存在 $V\in U$ 使得 $x\in V$ ，从而 $\{x_{n_k}\}_{k\geq1}$ 终在 $V$ 中，并且一定存在足够大的 $n_k$ 使得 $B(x_{n_k},\frac{1}{n_k})\subset V$ ，矛盾！

下面证明序列紧、紧、全有界且完备这三个概念是等价的.

>[!note]- 序列紧度量空间亦紧.
>证明：设 $U$ 为 $(X,d)$ 的开覆盖，但 $U$ 中无有限子覆盖. 设 $U$ 的 Lebeague 数为 $r$ ，依次取 $$x_0\in X,x_1\in X\backslash B(x_0,r),x_2\in X\backslash(B(x_0,r)\cup B(x_1,r)),\cdots$$ 从而可以得到一个序列 $\{x_n\}_{n\geq1}$ ，其任意两个点之间的距离都大于 $r$ ，因此不可能有收敛子列，这与序列紧矛盾！

>[!note]- 紧度量空间全有界并且完备.
>证明：之前已经证明过全有界. 下面证明完备：考虑利用[完备度量空间的等价条件](#^DownCapNEmpty)，设 $\{F_n\}_{n\geq1}$ 为一单调递减的非空闭集合列，不妨设 $\bigcap_{n\geq1}F_n=\emptyset$ ，从而 $$X\backslash\bigcap_{n\geq1}F_n=\bigcup_{n\geq1}X\backslash F_n=X$$ 则存在有限子覆盖 $\{X\backslash F_{n_i}\}_{1\leq i\leq k}$ ，并注意到 $X\backslash F_n$ 是单调递增的集合列，从而可得： $$X\cap F_{n_k}=\bigcup_{1\leq i\leq k}X\backslash F_{n_i}\supset X$$ 因此 $F_{n_k}=\emptyset$ 矛盾！

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

## $\mathbb{R}$ 与 $\mathbb{R}^n$上的度量空间

### 构成区间

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

### 半连续（semi-continuity）

[check](https://en.wikipedia.org/wiki/Semi-continuity)

**半连续性**：针对实值函数而言，考虑 $f:X\rightarrow \bar{\mathbb{R}}=\{-\infty,\infty\}\cup \mathbb{R}$ ，对 $x_0\in X$ ，如果 $\forall \epsilon>0$ ，存在开集 $U\ni x$ ， $\forall x\in U$ ， $f(x)< f(x_0)+\epsilon$ ，即 $\varlimsup_{x\rightarrow x_0}f(x)\leq f(x_0)$ ，则称 $f$ 在 $x_0$ 处**上半连续**；若 $\forall \epsilon>0$ ，存在开集 $U\ni x$ ， $\forall x\in U$ ， $f(x)>f(x_0)-\epsilon$ ，即 $\varliminf_{x\rightarrow x_0}f(x)\geq f(x_0)$  ，则称 $f$ 在 $x_0$ 处**下半连续**. 类似可以定义函数在定义域上半连续或者下半连续. 

直观上理解，半连续性即为 $f(x_0)$ 在经过恒正或者恒负的扰动之后，将大于（小于） $x_0$ 某一邻域内的所有 $f(x)$ . 或者，半连续性只需简单地理解为只满足极限定义的一半.

半连续性有如下等价条件：

>[!note]- 下列命题等价： 1) $f$ 下半连续； 2) 任给 $\{x_n\}\rightarrow x:f(x)\leq\liminf_{n\rightarrow \infty}f(x_n)$ ； 3) $f$ 的**上镜图**（epgraph） $\{(x,y):y\geq f(x)\}$ 是闭集.
>证明：
>$1)\Rightarrow 2):$ $$\liminf_{n\rightarrow \infty}f(x_n)=\lim_{n\rightarrow \infty}\inf\{f(x_k):k\geq n\}$$ 又因为 $f$ 下半连续并且 $\{x_n\}$ 终在 $x$ 的任一邻域中，所以 $\forall \epsilon>0$ ，存在 $n_\epsilon\in \mathbb{N}$ ，当 $n>n_\epsilon$ 时，有 $f(x_n)>f(x)-\epsilon$ ，因此 $\inf\{f(x_k):k\geq n\}>f(x)-\epsilon$ ，又由 $\epsilon$ 的任意性可以得到 $\inf\{f(x_k):k\geq n\}\geq f(x)$ ，从而可以得到结论.
>
>$2)\Rightarrow 3):$ 考虑该集合中任一收敛序列 $(x_n,y_n):y_n\geq f(x_n)$ ，收敛到 $(x,y)$ ，由 2) 可知 $f(x)\leq \liminf_{n\rightarrow \infty}f(x_n)\leq y$ ，从而 $(x,y)\in \{(x,y):y\geq f(x)\}$ 为闭集.
>
>$3)\Rightarrow 1):$ 因为 $\{(x,y):y\geq f(x)\}$ 是闭集，假设存在 $x_0\in \text{dom}(f)$ ， 存在 $\epsilon>0$ ，对于任意包含 $x_0$ 的开集 $U$ ：存在 $x\in U$ 使得 $f(x)\leq f(x_0)-\epsilon$ ，则取开集 $B(x_0,\frac{1}{n})$ 可以得到一个收敛于 $x_0$ 的序列， $(x_n,f(x_0)-\epsilon)$ 为闭集，并且收敛于 $(x_0,f(x_0)-\epsilon)$ ，所以 $f(x_0)-\epsilon>f(x_0)$ 显然矛盾.
>
>综上三者等价.

注意到下半连续的定义也可以写为 $\forall c<f(x_0),\exists$ 开集 $U\ni x$ 满足 $\forall x\in U,f(x)>c$ . 因此下半连续还有等价条件：

>[!note]- $f$ 在 $x_0$ 下半连续的充分必要条件为 $\forall c<f(x_0)$ ，集合 $f^{-1}[(c,+\infty)]=\{x:f(x)>c\}$ 为开集. 进而： $f$ 在 $X$ 下半连续的充分必要条件为 $\forall c\in \mathbb{R}$ ，集合 $f^{-1}[(c,+\infty)]=\{x:f(x)>c\}$ 为开集.

同理有：

>[!note]- 下列命题等价： 1) $f$ 上半连续； 2) 任给 $\{x_n\}\rightarrow x:f(x)\geq\limsup_{n\rightarrow \infty}f(x_n)$ ； 3) $f$ 的**下镜图**（hypograph） $\{(x,y):y\leq f(x)\}$ 是闭集. #imcomplete-whatever 4) $\forall c\in \mathbb{R}$ ，集合 $f^{-1}[(-\infty,c)]=\{x:f(x)<c\}$ 为开集.

借助以上等价条件：可以证明半连续性的函数具有如下的运算性质：

>[!note]-  1)$f,g$ 下半连续，则 $f+g$ 下半连续；2) 若 $f,g$ 下半连续并且 $f,g>0,\forall x\in \text{dom }f\cap \text{dom }g$ ，则 $fg$ 下半连续；3) 若 $f$ 下半连续， $g$ 连续，则 $f\circ g$ 下半连续；4) 若 $\{f_k(x)\}_{k\geq1}$ 下半连续，则 $g=\sup_{k\geq1}f_k(x)$ 下半连续；若 $\{f_k(x)\}_{1\leq k\leq n}$ 下半连续，则 $g=\min_{1\leq k\leq n}f_k(x)$ 下半连续.
>证明多数可以借助下半连续函数 $f$ 诱导的集合 $\{x:f(x)>c\},\forall c$ 为开集，将问题转化为证明集合相等.
>1) $f,g$ 下半连续，注意到 $\forall c\in \mathbb{R}:$ $$\{x:(f+g)(x)>c\}=\cup_{d\in \mathbb{R}}\{x:(f(x)>c-d)\cap(g(x)>d)\}$$ 由开集的定义和 $f,g$ 下半连续的等价条件知 $\{x:(f(x)>c-d)\cap(g(x)>d)\}$ 为开集. 任意个开集之并仍然为开集. 从而可知 $f+g$ 下半连续；
>2) $\{x:fg>c\}=\bigcup_{d\in \mathbb{R}^+}\{x:f>d^{-1}c\cap g>d\}$ ；
>3) 对于任意的 $x\in \{f\circ g(x)>c\}$ ，因为 $f$ 为下半连续函数，所以 $\exists$ 开集 $U\ni g(x)$ ，对于任意的 $g(x')\in U:g(x')>c$ . 又因为 $g$ 是连续函数，所以存在 $U'\ni x$ ，从而 $\{x:f\circ g>c\}$ 为开集. 证毕.
>4) 证明： $\{x:g>c\}=\cup_{k\geq1}\{x:f_k(x)>c\}$ ， $\{x:g>c\}=\cap_{1\leq k\leq n}\{x:f_k(x)>c\}$ .

>[!example]- 设 $\lVert \cdot\rVert_{l_0}=\#\{i:x_i\neq0\}$ ，则 $\lVert \cdot\rVert_{l_0}:\mathbb{R}^n\rightarrow \mathbb{R}$ 是下半连续函数.

>[!example]- 矩阵的秩函数 $\text{rank}:\mathbb{R}^{m\times n}\rightarrow \mathbb{R}$ 是下半连续的.
>证明： $c\in \mathbb{R}$ ，注意到 $$\{A:\text{rank}(A)>c\}=\bigcup_{r>c,r\in \mathbb{N}}\{A:\text{rank}(A)\geq r\}$$ 
>
>下面证明 $\{A:\text{rank}(A)\geq r\}$ 为开集，取矩阵范数 $\lVert A\rVert_{\max}=\max\{\lvert a_{ij}\rvert\}$ ，证明对于任意的 $A_0\in\{A:\text{rank}(A)\geq r\}$ ， 存在 $\delta>0$ ，对于任意的 $A'\in\{A:\text{rank}(A)\geq r\}:\lVert A-A'\rVert<\delta$ ，有 $\text{rank}(A')\geq r$ . 
>
>当 $\text{rank}(A_0)=0\geq r$ 时，上述条件显然成立；当 $\text{rank}(A_0)\geq r_0>0$ 时，可知存在 $A_0$ 的子矩阵，记为 $A_0^{r_0\times r_0}$ ，满足 $\det(A_0^{r_0\times r_0})$ ，因为 $\det$ 是连续函数，所以存在 $\delta>0$ ，使得 $\lVert B^{r_0\times r_0}-A^{r_0\times r_0}\rVert<\delta$ 时， $\det(B^{r_0\times r_0})\neq0$ . 因此 $\forall C\in \{A:\text{rank}(A)\geq r>0\}$ ，当 $\lVert C-A\rVert<\delta$ 时， $\lVert C^{r_0\times r_0}-A^{r_0\times r_0}\rVert<\lVert C-A\rVert<\delta$ ，因此也就可以得到 $\text{rank}(C)\geq\text{rank}(C)^{r_0\times r_0}\geq r_0$ ，从而得证.

### 完备

定义**聚点**： $x\in E$ ，对于任意 $x$ 的邻域 $U$ ，若 $(U-\{x\})\cap E\neq\emptyset$ ，则称 $x$ 为 $E$ 的聚点. 显然聚点一定是附着点. 称聚点的全体为**导集**，记为 $E'$ . 定义非聚点的点为**孤立点**. 根据之前对于闭包的第二定义， $\bar{E}=E\cup E'$ .

根据聚点的定义有等价定义：若 $x$ 为 $E$ 的聚点，则 $\exists\{x_n\}_{n\geq1},x_n\neq x,x_n\rightarrow x(n\rightarrow \infty)$ .

>[!note]- 对于任意 $\mathbb{R}^n$ 中的集合 $E$ ， $E'$ 为闭集.
>证明：说明 $E'^c$ 为开集即可.

定义**完备集**：没有孤立点的闭集. 显然完备集有以下等价定义：

>[!note]- $E$ 是完备集等价于 $E=E'$ .

$\mathbb{R}$ 上的完备集有以下等价刻画：

>[!note]- $F\subset \mathbb{R}$ 为完备集的充分必要条件为 $F^c$ 为至多可数个两两<u>没有公共端点</u>的开区间之并.
>证明：
>$\Rightarrow$ ： $F^c$ 为开集，从而可以表示为至多可数个两两不相交的开区间的并（见下面的[[#构成区间]]，假设有公共端点，则 $F^c$ 中将会出现孤立点，矛盾！
>
>$\Leftarrow$ ：显然 $F$ 为闭集，并且若存在孤立点 $x\in F$ ，则存在 $U\ni x:U\backslash\{x\}\cap F^c=\emptyset$ ，从而 $x$ 为两个开区间的端点，矛盾！

### $\mathbb{R}^n$ 的性质

下面将 $\mathbb{R}$ 上的一些性质推广到 $\mathbb{R}^n$ 上.

首先证明一个引理：

>[!note]-  列紧集有界.
>假设 $A$ 为列紧集， $A$ 无界，任取 $a\in A$ ，则对于任意的 $n\in \mathbb{N}$ 存在 $a_n\in A:d(a,a_n)\geq n$ . 对于序列 $\{a_n\}_{n\geq1}$ ，由 $A$ 列紧，存在子列 $\{a_{n_k}\}_{k\geq1}$ ， $\{a_{n_k}\}\rightarrow b(k\rightarrow \infty)$ ，从而 $$d(a,b)\geq d(a,a_{a_k})-d(a_{n_k},b)\geq n_k-d(a_{n_k},b)\leq n-d(a_{n_k},b),\forall n\in \mathbb{N}$$ ，当 $k$ 足够大时， $d(a_{n_k},b)<1$ ，从而有 $d(a,b)\geq n-1,\forall n\in \mathbb{N}$ ，则 $d(a,b)=+\infty$ ，而 $d(a,b)\in \mathbb{R}$ 应为一确定实数，矛盾！所以列紧集 $A$ 有界.

下面这个定理类似于 Weierstrass Bounded 和 Weierstrass extreame value 定理.

>[!note]- Weierstrass 定理： $S\subset \mathbb{R}^n$ ， $S$ 有界. $f:\mathbb{R}^n\rightarrow \mathbb{R}$ 为连续函数. 则有以下结论：取 $y\in S$ ， 1) 如果 $T=\{x\in S:f(x)\geq f(y)\}$ 是列紧集，则 $f$ 在 $S$ 上取得上确界. 2) 如果 $T=\{x\in S:f(x)\leq f(y)\}$ 是列紧的，则 $f$ 在 $S$ 上取得下确界. 3) 如果 $S$ 是列紧的，则 $f$ 在S 上取得上、下确界.
>证明：1,2 问都需要说明 $f(S)$ 是有上（下）界的，这点可以参考上面证明列紧集是有界集，利用反证法证之.
>1) 取 $u=\sup f(S)=\sup f(T)$ ，则存在 $\{x_n\}_{n\geq1}\subset T:f(x_n)>u-\frac{1}{n}$ ，因为 $T$ 列紧，所以存在子列 $\{x_{n_k}\}_{k\geq1}$ ，收敛于 $z\in T\subset S$ ，从而由 $f$ 为连续函数： $f(x_{n_k})>u-\frac{1}{n_k}$ ，取 $k\rightarrow \infty$ 可得 $f(z)\geq u$ ，所以 $f(z)=u$ . 则 $f$ 在 $S$ 上可以取得上确界.
>2) 取 $u=\inf f(X)=\inf f(T)$ ，则存在 $\{x_n\}_{n\geq1}\subset T:f(x_n)<u+\frac{1}{n}$ ，因为 $T$ 列紧，所以存在子列 $\{x_{n_k}\}_{k\geq1}$ ，收敛于 $z\in T\subset S$  ，从而由 $f$ 为连续函数： $f(x_{n_k})<u+\frac{1}{n_k}$ ，取 $k\rightarrow \infty$ 可得 $f(z)\leq u$ ，从而 $f(z)=u$ .
>3) 因为 $S$ 为列紧集，所以 $S$ 为有界集，则存在 $u=\sup S$ ，可取得数列 $\{x_n\}_{n\geq1}:f(x_n)>u-\frac{1}{n}$ ，由 $S$ 为列紧集可以取 $\{x_{n_k}\}\rightarrow z$ ，从而有 $f(z)=u$ ，取得下界同理.

## 其他集合上的度量空间

### 二元数列

集合 $S=\{0,1\}^\mathbb{N}\overset{def}{=}2^{\mathbb{N}}$ . 定义度量 $$d(x,y)=\left\{\begin{aligned}
&0,x=y\\
&2^{-n},n=\min\{i:x_i\neq y_i\}
\end{aligned}\right.$$

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

或可以将 $G$ 表示为： $$\bigcup_{n=1}^\infty\bigcup_{k=1}^{2^{n-1}}I_n^k$$ 其中 $I_n^k$ 表示第 $n$ 次三分之后，第 $k$ 个开区间.

>[!note]- $G$ 在 $[0,1]$ 中[稠密](#^Dense).
>反证：假设 $\exists x\in [0,1]\backslash \bar{G}$ ，则 $\exists V(x,\epsilon)\cap \bar{G}=\emptyset$ ，而对于 $\epsilon$ 可以取得 $n$ 使得 $\frac{1}{3^n}<\epsilon$ . 
>这说明 $V(x,\epsilon)$ 一定会包含一个长度为 $\frac{1}{3^{n+1}}$ 的 $G$ 中的区间. 从而与 $V(x,\epsilon)\cap \bar{G}=\emptyset$ 矛盾！

>[!note]- $G$ 的[[#构成区间]]的长度和为 $1$ .
>由 $G$ 的定义即可直接得到. 计算 $$\sum\limits_{n=1}^{\infty}\frac{2^{n-1}}{3^n}=1$$ 

可以证明 Cantor集具有以下性质：

>[!note]- Cantor 集为 1) 有界闭集； 2）不包含任何开区间（也就没有内点，从而不是开集）； 3) 不可数.
>1) 注意到 Cantor 集可以表示为 $$C=\cap_{i=1}^\infty(F^i_1\cap\cdots\cap F^i_{2^i})$$ 从而 $C$ 为闭集，并且有界 $[0,1]$ . 或者由 $C=[0,1]-G$ 得.
>2) 不妨设 $C$ 包含开区间 $(a,b)$ ，第 $i$ 层（划分）对应的闭区间的长度为 $\frac{1}{3^i}$ ，显然当 $i$ 足够大时， $\frac{1}{3^i}<\lvert b-a\rvert$ ，因此 Cantor 集不可能包含任何一个开区间.
>3) 对于 Cantor 集中的任何一个点，都可以按照其构造方法将其对应到一个二元数列（比如，第 $i$ 层划分若该点位于左侧，则其对应数列的 $x_i=0$ ，位于右侧则 $x_i=1$ ），这是一个双射，又全体二元数列不可数，所以 Cantor集不可数.

>[!note]- Cantor 集是完备疏集.
>证明：已经证明 Cantor 集是闭集，要证明其完备性借助[[#$ mathbb{R}$ 上的完备集]]中的刻画，由 $C$ 的定义即可得到.
>对于 $C$ 是疏集的证明：因为上面已经证明了 $C$ 中没有内点，所以 $\bar{C}^\circ=C^\circ=\emptyset$ . 综上 $C$ 是完备疏集.

>[!note]- Cantor集与 $2^{\mathbb{N}}$ 同胚. 从而 $C$ 具有连续统势.
>之前已经建立了映射，具体描述如下： $$\begin{aligned}
&f:C\rightarrow 2^{\mathbb{N}}\\
&f(x)_n=\left\{\begin{aligned}
&1,x\in F^{n}_m,m\text{ 为奇数}\\
&0,x\in F^{n}_m,m\text{ 为偶数}
\end{aligned}\right.
\end{aligned}$$ 该映射显然为单射，满射则可以通过区间套定理证明.
>
>下面证明 $f$ 是连续映射：考虑用其等价定义
>
>用[[#二元数列]]中的度量 $d$ ，对于 $\{0,1\}^\mathbb{N}$ 中一开集 $U$ ，考虑： $f^{-1}(U)=\{x\in C,f(x)\in U\}$ ，进而 $\forall x\in f^{-1}(U)$ ，存在包含 $f(x)$ 的一个开球 $B_d(f(x),\epsilon)\subset U$ ，不妨设 $\epsilon\geq\frac{1}{2^k}$ ，由度量的定义： $d(f(x),*)$ 只能取 $\frac{1}{2},\cdots$ ，因此对于 $\epsilon\geq\frac{1}{2^k}$ ，只需要取 $C$ 中的开球 $B_{d'}(x,\frac{1}{3^{k+1}})$  即可，这样能够保证对于任意的 $x'\in B_{d'}(x,\frac{1}{3^{k+1}})$ ，均有 $f(x'),f(x)$ 在前 $k+1$ 位都完全一致，从而 $d(f(x'),f(x))<\frac{1}{2^{k+1}}<\epsilon$ . 因此 $f(x')\in U$ ，从而 $B_{d'}(x,\frac{1}{3^{k+1}})\subset U$ ，因此 $f^{-1}(U)$ 为开集. 所以 $f$ 是连续映射.
>
>证明 $C$ 具有连续统势还可将 $C$ 中的点对应到三元数列 $\{a_n\}_{n\geq1},a_n\in\{0,1,2\}$ . 对任意 $x\in[0,1]$ ， $x=\sum\limits_{n=1}^{\infty}\frac{a_n}{3^n}$ . 则 $c\leq \lvert C\rvert$ ，另一方面 $C$ 中的每一个元素都在 $[0,1]$ 中，直接可以用恒等映射构造一个 $C$ 到 $[0,1]$ 的子集的双射，从而 $\lvert C\rvert\leq c$ ，所以 $c=\lvert C\rvert$

>[!note]- 存在 Cantor 集到闭区间的连续满映射 $f:C\rightarrow[0,1]$ . #imcomplete 

下面讨论定义在 $G$ 上的 **Cantor 函数** ： $$f(x)=\frac{2k-1}{2^n},x\in I_n^k,1\leq k\leq 2^{n-1}$$ 并且可以证明 $f$ 在 $G$ 上是单调递增的函数.  

# 拓扑

## 从多个角度刻画拓扑

集合 $X$ 上的**拓扑** $\mathcal{O}$ 指的是满足下列条件的 $X$ 的子集族：

1. $\emptyset,X\in \mathcal{O}$ ；
2. $\forall U,V\in \mathcal{O}$ ， $U\cap V\in \mathcal{O}$ ；
3. 若 $\Omega\subset \mathcal{O}$ ，则 $\bigcup\Omega\in \mathcal{O}$ .

称 $\mathcal{O}$ 为 $X$ 上的一个**拓扑**（topology）， $(X,\mathcal{O})$ 是一个**拓扑空间**（topological space）， $X$ 称为该拓空间的**承载集**（underlying set）， $\mathcal{O}$ 中的元素称为其**开集**（open set），为简便起见，或省去 $\mathcal{O}$ ，将拓扑空间 $(X,\mathcal{O})$ 简记为 $X$ . 由上定义可知， $X$ 上有限个开集的交仍然为开集.

设 $\mathcal{O}_1,\mathcal{O}_2$ 是 $X$ 上的拓扑，若 $\mathcal{O}_1\subset \mathcal{O}_2$ 则称 $\mathcal{O}_1$ 粗于（coarser than） $\mathcal{O}_2$ / $\mathcal{O}_2$ 细于（finer than） $\mathcal{O}_1$ ；或称 $\mathcal{O}_1$ 弱于（weaker） $\mathcal{O}_2$ ， $\mathcal{O}_2$ 强于（stronger） $\mathcal{O}_1$ .

>[!example]- $\{0,1\}$ 上的拓扑.
>$\{\emptyset,\{0,1\}\}$ ； $\{\emptyset,\{0\},\{1\},\{0,1\}\}$ ； $\{\emptyset,\{0\},\{0,1\}\}$ ； $\{\emptyset,\{1\},\{0,1\}\}$ .

在[[#度量空间]]中讨论了 $(X,d)$ 中的开集 $W$ 定义为： $\forall x\in W,\exists r>0,B(x,r)\subset U$ ，并且可以验证这样定义的开集全体 $\mathcal{O}$ 是 $X$ 上的一个拓扑，称为由 $d$ 诱导的拓扑，或记为 $\mathcal{O}_d$ . 能够被度量诱导的拓扑称为**可度量拓扑**：对于 $(X,\mathcal{O})$ ，存在 $X$ 上的度量 $d$ 使得 $\mathcal{O}=\mathcal{O}_d$ . 另外也可以回顾[等价度量](#^EqualD)的概念，以 $d_1,d_2$ 诱导的拓扑是否相同来定义是否等价是非常自然的.

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

>[!note]- $x\in A^\circ$ 当且仅当 $A$ 是 $x$ 的邻域.

在度量空间中，[稠子集](#^Dense)是用开集刻画的，并且有两个等价定义.

在借助集合族对于拓扑进行刻画时定义仍保持一致. 若 $A$ 的闭包是全集，则称 $A$ 为 $X$ 的稠子集.

设 $X$ 为拓扑空间，定义 $X$ 的**闭包算子**： $$\text{cl}:\mathcal{P}(X)\rightarrow \mathcal{P}(X),A\mapsto \bar{A}$$ 则不难验证闭包算子有如下性质： $$\begin{aligned}
&(\text{cl}1)\ \text{cl}(\emptyset)=\emptyset\\
&(\text{cl}2)\ \text{cl}(A)\supset A\\
&(\text{cl}3)\ \text{cl}(A\cup B)=\text{cl}(A)\cup \text{cl}(B)\\
&(\text{cl}4)\ \text{cl}(\text{cl}(A))=\text{cl}(A)
\end{aligned}$$ 下面的定理说明满足闭包算子的这四条性质的映射可以定义唯一一个 $X$ 上的拓扑，使得 $\text{cl}(A)$ 即为 $A$ 在该拓扑中的闭包， $\forall A\subset X$ .

>[!note]- Kuratowski 闭包算子定理. #imcomplete 

类似地可以定义**内部算子**： $$\text{int}:\mathcal{P}(X)\rightarrow \mathcal{P}(X),A\mapsto A^\circ$$ 其具有如下性质 $$\begin{aligned}
&(\text{int}1)\ \text{int}(X)=X\\
&(\text{int}2)\ \text{int}(X)\subset A\\
&(\text{int}3)\ \text{int}(A\cap B)=\text{int}(A)\cap \text{int}(B)\\
&(\text{int}4)\ \text{int}(\text{int}(A))=\text{int}(A)\\
\end{aligned}$$ 并且对于满足以上四条内部算子性质的映射 $\text{int}$ ，存在唯一一个 $X$ 上的拓扑空间，使得 $\text{int}(A)=A^\circ,\forall A\subset X$ .

到目前为止已经用度量、开集族、闭集族、特殊映射刻画拓扑，此外还可以用 $X$ 的子集族刻画 $X$ 上的拓扑.

定义拓扑空间 $X$ 上的**邻域系**： $x\in X$ ，子集族 $$\mathcal{N}(x)=\{V\subset X:x\in V^\circ\}$$ 称为 $X$ 的邻域系. 由之前对于[邻域](#^Neighborhood)的定义， $\mathcal{N}(x)$ 即为 $x$ 的邻域全体. 邻域系具有如下性质： $$\begin{aligned}
&(\text{N}1)\ X\in \mathcal{N}(x),\forall x\in X\\
&(\text{N}2)\ \forall U\in \mathcal{N}(x),x\in U\\
&(\text{N}3)\ U\in \mathcal{N}(x),U\subset V\rightarrow V\in \mathcal{N}(x)\\
&(\text{N}4)\ U,V\in \mathcal{N}(x)\rightarrow U\cap V\in \mathcal{N}(x)\\
&(\text{N}5)\ U\in \mathcal{N}(x),\exists V\in \mathcal{N}(x),U\in \mathcal{y},\forall y\in V\\
\end{aligned}$$

>[!note]- 邻域系刻画拓扑：设 $X$ 为一集合， $\mathcal{N}(x)$ 为 $X$ 的一个子集族，如果 $\{\mathcal{N}(x)\}_{x\in X}$ 满足 $(N1)\sim(N5)$ ，则存在 $X$ 上唯一拓扑 $\mathcal{O}$ ，使得对于任意 $x\in X$ ， $\mathcal{N}(x)$ 均为 $x$ 的邻域系.

设 $(X,\mathcal{O})$ 为拓扑空间， $Y\subset X$ ，则 $Y$ 的子集族 $$\mathcal{O}|Y=\{U\cap Y:U\in \mathcal{O}\}$$ 也为一个拓扑，称 $(Y,\mathcal{O}| Y)$ 为 $(X,\mathcal{O})$ 上的一个**子空间**. 如果 $Y$ 是 $X$ 的开（闭）集，则称 $(Y,\mathcal{O}|Y)$ 是 $(X,\mathcal{O})$ 的一个开（闭）子空间.

>[!note]- 闭集拼接定理：

## 连续映射和同胚

连续映射是拓扑学的核心概念.

设 $X,Y$ 为拓扑空间， $f:X\rightarrow Y$ 为映射，如果 $Y$ 的每一个开集 $V$ 在 $f$ 下的原像 $f^{-1}(V)$ 是开集则称 $f$ **连续**.

定义**开映射**：任给 $X$ 的开集 $U$ ， $f(U)$ 为开集；**闭映射**：任给 $X$ 的闭集 $F$ ， $f(F)$ 为闭集.

## $\mathbb{R}$ 上拓扑

$\mathbb{R}$ 上有八大拓扑.

### 平凡拓扑

开集最少的拓扑（最小 / 粗 / 弱的拓扑）： $\{\emptyset, \mathbb{R}\}$ . 由 $\emptyset,\mathbb{R}$ 既是开集也是闭集，可以得到 $\bar{\emptyset}=\emptyset,\bar{\mathbb{R}}=\mathbb{R},\emptyset^\circ=\emptyset,\mathbb{R}^\circ=\mathbb{R}$ .

### 离散拓扑

形如 $(X,\mathcal{P}(X))$ 的拓扑空间称为**离散空间**（discrete space）.

最大 / 细 / 强的拓扑，离散拓扑可以由离散度量定义（只有完全相同的两个元素距离才为 $1$ ，其余皆为 $0$ ）： $\mathcal{P}(\mathbb{R})$ .

### 欧式拓扑

由欧式度量给出.

### 左拓扑

$\{(-\infty,a):a\in \mathbb{R}\cup\{+\infty\}\}\cup\emptyset$ ；

### 右拓扑

$\{(a,+\infty):a\in \mathbb{R}\cup\{-\infty\}\}\cup\emptyset$ ；

### 余有限拓扑

$\emptyset\cup\{\mathbb{R}\backslash F:F=F\text{ 为有限集}\}$ .

### Surgenfrey 平面

## 基

注意到， $\mathbb{R}$ 中的每个开集都可以写成一族端点为有理数的开区间的并. 下面考虑对于一般的拓扑空间.

设 $(X,\Omega)$ 为拓扑空间， $\mathcal{B}$ 为一族开集，如果 $(X,\mathcal{O})$ 中的每一个开集都可以表示为 $\mathcal{B}$ 中的一些元素的并，则称 $\mathcal{B}$ 为 $\mathcal{O}$ 的一个**基**（basis）. 

基有如下等价定义：

>[!note]- 设 $(X,\mathcal{O})$ 是拓扑空间， $\mathcal{B}$ 为一组开集，则 $\mathcal{B}$ 是 $\mathcal{O}$ 的基当且仅当给开集 $U$ 以及 $x\in U$ ，存在 $B_x\in \mathcal{B}:x\in B_x\subset U$ .

设 $(X,\mathcal{O})$ 为拓扑空间， $\mathcal{B}$ 是一族开集，如果开集族 

$$\{X\}\cup\{U_1\cap U_2\cap \cdots\cap U_n:U_i\in \mathcal{B},n\geq1\}$$ 
是 $\mathcal{O}$ 的一个基，则称 $\mathcal{B}$ 为 $\mathcal{O}$ 的一个**子基**（subbasis）.

设 $X$ 为拓扑空间， $x\in X$ ， $\mathcal{A}$ 为 $x$ 的一族邻域. 若任给 $x$ 的邻域 $U$ ，存在 $A\in \mathcal{A}$ 使得 $A\subset U$ ，则称 $\mathcal{A}$ 为 $x$ 的一个**邻域基**.

称 $X$ **第一可数**或者有**可数邻域基**，如果 $X$ 的每一个点都有一个可数的邻域基；称 $X$ **第二可数**，若 $X$ 有一个可数的基；

>[!note]- 第二可数空间的开连续像第二可数；第一可数空间的开连续像第一可数.
>证明：设 $X$ 为第二可数空间，设 $f$ 为 $X$ 上的开连续函数，则对于 $f(X)$ 上的任意开集 $V$ ， $f^{-1}(V)$ 是开集，设 $\mathcal{B}=\{B_n\}_{n\geq1}$ 是 $X$ 的可数基，则存在 $I\subset \mathbb{N}$ 使得 $f^{-1}(V)\subset \bigcup_{i\in I}B_i$ ，所以 $V=f(f^{-1}(V))\subset f\left(\bigcup_{i\in I}B_i\right)=\bigcup_{i\in I}f(B_i)$ . 并且 $f(B_i)$ 为开集，则 $\{f(B_n)\}_{n\geq1}$ 是 $f(X)$ 的一个开集.
>
>设 $X$ 为第二可数空间，考虑 $f(x)\in f(X)$ ，任给 $f(x)$ 的邻域 $A$ ，则存在开集 $U$ 满足 $f(x)\in U\subset A$ ，并且 $x\in f^{-1}(U)\subset f^{-1}(A)$ ，其中 $f^{-1}(U)$ 为开集，则 $f^{-1}(A)$ 是 $x$ 的邻域，设 $x$ 的邻域基为 $\mathcal{N}$ ，则存在 $N\in \mathcal{N}$ 使得 $x\in N\subset f^{-1}(A)$ ，所以 $f(x)\in f(N)\subset A$ ，取 $\{f(N)\}_{N\in \mathcal{N}}$ ，即为 $f(x)$ 的邻域基.

>[!note]- 设 $\{\mathcal{O}_i\}_{i\in I}$ 是 $X$ 上的一族拓扑， $I\neq\emptyset$ 证明：

1) $\bigcap_{i\in I}\mathcal{O}_i$ 是 $X$ 上的拓扑，并且是比每个 $O_i$ 都粗的最细的拓扑；
2) 以 $\bigcup_{i\in I}\mathcal{O}_i$ 为子基生成的拓扑是比每个 $O_i$ 都细的最粗的拓扑；

证明：

1) 因为 $\mathcal{O}_i$ 是 $X$ 上的拓扑（ $i\in I$ ），所以 $\emptyset,X\in \mathcal{O}_i,\forall i \in I$ ，所以 $\cap_{i\in I}\mathcal{O}_i\ni \emptyset,X$ ，对于 $V,U\in \bigcap_{i\in I}\mathcal{O}_i$ ，可知 $V\cap U\in \mathcal{O_i},\forall i\in I$ ，所以 $V\cap U\in \bigcap_{i\in I}\mathcal{O_i}$ ，同理可证对于 $\Omega\subset \bigcap_{i\in I}\mathcal{O}_i$ ， $\bigcup \Omega\subset \bigcap_{i\in I}\mathcal{O}_i$ . 所以 $\bigcap_{i\in I}\mathcal{O}_i$ 是 $X$ 上的拓扑. 因为 $\bigcap_{i\in I}\mathcal{O}_i\subset \mathcal{O}_i,\forall i\in I$ ，所以 $\bigcap_{i\in I}\mathcal{O}_i$ 比任何一个 $\mathcal{O}_i$ 都要粗. 此外对于任意的比每个 $\mathcal{O_i}$ 都要粗的拓扑 $\mathcal{W}$ ，其包含于 $\bigcap_{i\in I}\mathcal{O}_i$ ，所以 $\bigcap_{i\in I}\mathcal{O}_i$ .... 

2) 设 $\mathcal{W}$ 为以 $\bigcup_{i\in I}\mathcal{O}_i$ 为子基生成的拓扑. 则开集族： $\{X\}\cup\{U_1\cap U_2\cap \cdots\cap U_n:U_i\in \bigcap_{i\in I}\mathcal{O}_i,n\geq1\}$ 是 $\mathcal{W}$ 的一个子基. 所以对于 $\mathcal{O}_i$ 中的任何一个开集 $U$ ，其

>[!note]- 设 $X$ 为第一可数空间，映射 $f:X\rightarrow Y$ 保持序列的极限，即任给 $X$ 的序列 $\{x_n\}_{n\geq1}$ ，如果 $\{x_n\}_{n}$ 收敛于 $x$ ，则 $\{f(x_n)\}_n$ 收敛于 $f(x)$ . 证明 $f$ 连续.
>证明：任取 $A\subset X$ ，取 $x\in \bar{A}$ ，由 $X$ 为第一可数空间，根据命题 4.4.2 存在 $\{x_n\}_{n\geq1}\subset A,x_n\rightarrow x(n\rightarrow \infty)$ . 所以 $f(x_n)\rightarrow f(x)(n\rightarrow \infty)$ . 所以 $f(x)\in \overline{f(A)}$ . 所以 $f(\bar{A})\subset \overline{f(A)}$ . 所以 $f$ 为连续映射.

>[!note]- 设 $X$ 为第一可数空间， $\{x_n\}_n$ 是 $X$ 的序列，证明若 $x$ 为 $\{x_n\}$ 的聚点，则 $\{x_n\}_n$ 有子列收敛于 $x$ .
>由 $x$ 为 $\{x_n\}_n$ 的聚点可知， $\{x_n\}_n$ 常在 $x$ 的每个邻域，设 $\mathcal{B}=\{B_n\}_n$ 为 $X$ 的可数邻域基，考虑 $V_n=\cap_{1\leq i\leq n} B_i$ ，则存在 $x_{n_i}\in V_i$ ，所以 $\{x_{n_i}\}_i$ 收敛于 $x$ .
