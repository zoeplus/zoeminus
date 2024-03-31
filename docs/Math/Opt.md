最优化方法（简）

# 前置

## 常用符号说明

闭包： $\text{cl}(D)$ ，内部： $\text{int}(D)$ ，边界 $\partial{D}$ .

## Pre 和简介

对于范数和矩阵理论的[介绍](MAlg.md#范数).

最优化方法主要分为两个步骤：**优化建模**和**求解**. 优化建模与特定的专业领域有关，本篇专注求解.

最优化方法的分类：**离散** & **连续**；**有限维** & **无限维**（泛函优化 / 极值问题，采取变分方法 #imcomplete-whatever ）. 这里主要考虑的是 $\mathbb{R}^n$ 上的连续有限维优化.

$\mathbb{R}^n$ 中的优化问题. 通常记**标准内积** $x,y\in \mathbb{R}^n,\langle x,y \rangle=\sum\limits_{i=1}^{n}x_iy_i$ ，若给定一个[正定](LAlg.md#正定矩阵)对称矩阵 $P$ ，记 $\langle x,y \rangle_P=x^TPy$ . 并可以定义**矩阵内积** $A,B\in \mathbb{R}^{m\times n}, \langle A,B \rangle=\sum\limits_{i=1}^{m}\sum\limits_{j=1}^{n}a_{ij}b_{ij}=\text{tr}(A^TB)=\text{tr}(B^TA)$ .

连续优化的形式为： $$\begin{aligned}
&\min_{x} f(x)\\
&\left\{\begin{aligned}
&c_i(x)=0,i=1,\cdots,m\\
&c_j(x)\geq0,j=m+1,\cdots,p
\end{aligned}\right.
\end{aligned}$$ 其中 $c_i,i=1,\cdots,n$ 为连续函数. 称 $c_i(x)=0$ 为**等式约束**， $c_j(x)\geq0$ 为**不等式约束**. 定义**可行集**： $$F=\{x:c_i(x)=0,i=1,\cdots,m,c_j(x)\geq0,j=m+1,\cdots,p\}$$ 对于任意 $x\in F$ ，定义**指标集合**： $\mathcal{A}(x)=\{1,2,\cdots ,n\}\backslash \{k:c_k(x)>0\}=\{1,\cdots,m\}\cup\{k:c_k(x)\leq 0\}$ 为 $x$ 的**积极约束**， $\{1,2,\cdots,n\}\backslash \mathcal{A}(x)$ 称为 $x$ 的**非积极约束**. （此处的积极，指的是对于 $x$ 进行轻微绕动之后是否影响约束条件，一般来说对于 $c_{i}(x)>0$ 约束，不会产生变化，因此称为非积极）. 定义**整体最优解** $x^*$ ，如果 $\forall x\in F,f(x^*)\leq f(x)$ ；并可以定义**严格整体最优解** $x^*$ ： $\forall x\in F,x\neq x^*,f(x^*)<f(x)$ . **局部最优解**则为：对于 $x^*$ ，存在某一邻域 $N$ ， $\forall x\in N\cap F,x\neq x^*,f(x^*)\leq f(x)$ ，**严格局部最优解**类似.

按照可行集可以将优化问题划分为**凸优化**和**非凸优化**，多数情况下凸优化简单，凸优化情形下局部最优即为整体最优.

# 凸集和凸函数

## 凸集

凸优化中的可行集是**凸集**：对于 $D\subset \mathbb{R}^n$ ，称 $D$ 为凸集，如果 $\forall x,y\in D,\forall \lambda\in(0,1)$ ， $\lambda x+(1-\lambda)y\in D$ . 定义**凸组合**：对于 $x_i\in \mathbb{R}^n$ ， $\alpha_i\in \mathbb{R}^n,\alpha_i>0,\sum\limits_{i=1}^{m}\alpha_i=1$ ， $,i=1,\cdots,m$ ，称 $\sum\limits_{i=1}^{m}\alpha_ix_i$ 为 $x_1,\cdots,x_m$ 的凸组合. 定义**凸包**： $D\subset \mathbb{R}^n$ ，称 $H(D)=\{D\text{ 中有限多个点的凸组合}\}$ 为 $D$ 的凸包.

>[!warning]- 凸组合中 $\alpha_i>0$ ，而不是 $\geq$ .

注意上述对于凸包 $H(D)$ 的叙述并不要求 $D$ 为凸集，但若 $D$ 为凸集则有以下结论：

>[!note]- 设 $D$ 为凸集，则 $D$ 中任意 $m$ 个点的凸组合都在 $D$ 中. 也即有 $H(D)\subset D$ .
>证明：用归纳法证明， $n=2$ 是显然成立，设 $n=k$ 时也成立，对于 $n=k+1$ ： 设 $x_1,\cdots,x_{k+1}$ ，注意到 $$\begin{aligned}
\sum\limits_{i=1}^{k+1}\alpha_ix_i &=\alpha_{k+1}x_{k+1}+\sum\limits_{i=1}^{k}\alpha_ix_i\\
&=\alpha_{k+1}x_{k+1}+(1-\alpha_{k+1})\sum\limits_{i=1}^{k}\frac{\alpha_i}{1-\alpha_{k+1}}x_i
\end{aligned}$$ 注意到后者为凸组合包含于 $D$ 中，从而得证.

进而可以证明：

>[!note]- 对于 $D\subset \mathbb{R}^n$ ， $H(D)$ 是所有包含 $D$ 的凸集中最小的凸集.
>证明：
>$$H(D)=\left\{\sum\limits_{i=1}^{k}\lambda_ix_i:k\in \mathbb{N},\lambda_i>0,\sum\limits_{i=1}^{k}\lambda_i=1,x_i\in D\right\}$$ 对于任意的 $\sum\limits_{i=1}^{k_1}\lambda^1_ix^1_i,\cdots,\sum\limits_{i=1}^{k_m}\lambda^m_ix^m_i$ ，考虑 $$\sum\limits_{j=1}^{m}\alpha_j\left(\sum\limits_{i=1}^{k_j}\lambda^j_ix_i^j\right)=\sum\limits_{j=1}^{m}\sum\limits_{i=1}^{k_j}\alpha_j\lambda_i^jx_i^j$$ 注意到 $\sum\limits_{j=1}^{m}\sum\limits_{i=1}^{k_j}\alpha_j\lambda_i^j=\sum\limits_{j=1}^{m}\alpha_j\sum\limits_{i=1}^{k_j}\lambda_i^j=\sum\limits_{j=1}^{m}\alpha_j=1$ . 从而可知 $H(D)$ 为凸集. 下面证明 $H(D)$ 为包含 $D$ 的最小凸集：设 $B_i\supset D$ 为凸集显然 $\bigcap_{i\in I}B_i$ 仍然为包含 $D$ 的凸集，显然 $H(D)$ 包含 $D$ 所以： $$H(D)\supset \bigcap_{i\in I}B_i$$ 另一方面注意到 $D\subset \bigcap_{i\in I}B_i$ ，所以 $$H(D)\subset H(\cap_{i\in I}B_i)\subset \cap_{i\in I}B_i$$ 所以 $H(D)=\bigcap_{i\in I}B_i$ .

注意这里没有限制 $D$ 本身是不是凸集. 

>[!note]- 设 $D\subset \mathbb{R}^n$ ， $\forall x\in H(D)$ ，其可以表示为 $D$ 中至多 $n+1$ 个点的凸组合.
>证明：不妨设 $x=\sum\limits_{i=1}^{N}\lambda_ix_i,x_i\in D$ 并且 $\sum\limits_{i=1}^{N}\lambda_i=1,\lambda_i>0$ . 不妨设 $N>n+1$ ，则对于 $x_i,1\leq i\leq N$ ，存在不全为 $0$ 的数 $\mu_i,2\leq i\leq N,\sum\limits_{i=2}^{N}\mu_i(x_i-x_1)=0$ ，令 $\mu_1=-\sum\limits_{i=2}^{N}\mu_i$ ，则有 $\sum\limits_{i=1}^{N}\mu_ix_i=0$ . 断言： $\mu_i,1\leq i\leq N$ 中至少有一个正数，若不然 $\mu_1$ 则为正数，矛盾！下面取 $\alpha\geq0$ ，使得 $$x=\sum\limits_{i=1}^{N}\lambda_ix_i-\alpha \sum\limits_{i=1}^{N}\mu_ix_i=\sum\limits_{i=1}^{N}(\lambda_i-\alpha \mu_i)x_i$$ 因为 $\lambda_i>0$ ，所以对于 $\mu_i,1\leq i\leq N$ 中的正项（已经证明至少存在一个） $\{\mu_{i_1},\cdots \mu_{i_k}\}$可以取 $\alpha=\min\{\frac{\lambda_{i_m}}{\mu_{i_m}}:1\leq m\leq k\}=\frac{\lambda_j}{\mu_j}$ ，进而 $x=\sum\limits_{i\neq j}^{}(\lambda_i-\alpha \mu_i)x_i$ ，由归纳法即可得到结论.
>^AtMostnplus1

不难证明以下**保凸运算**：

>[!note]- 任意多个凸集的交仍然是凸集.

>[!note]- 凸集的内部和闭包仍然为凸集.
>证明：设 $D$ 为凸集，对于 $D^\circ$ ，首先固定 $t\in(0,1)$ ，对于 $U=tD^\circ+(1-t)D^\circ\subset D$ ，不难证明 $tD^\circ$ 是开集，注意到 $$U=\bigcup_{x\in (1-t)D^\circ}(tD^\circ+x)$$ 为开集，从而有 $U=U^\circ\subset D^\circ$ ，因此 $D^\circ$ 是凸集.
>
>对于凸集 $D\subset \mathbb{R}^n$ 的闭包 $\bar{D}$ ，取其中任意两点 $a,b$ ，从而存在 $D$ 中收敛到 $a,b$ 的子列 $\{a_n\}_{n\geq1}$ ， $\{b_n\}_{n\geq1}$ ，对于任意给定的 $\lambda\in(0,1)$ 有： $$\lambda a_n+(1-\lambda)b_n\in D,\forall n\geq1$$ 反证： $\lambda a+(1-\lambda)b\in \bar{D}^c$ ，则 $\lambda a_n+(1-\lambda)b_n$ 将终在 $\bar{D}^c$ 中，矛盾！可得到结论.

>[!note]- 设仿射函数 $f:\mathbb{R}^m\rightarrow \mathbb{R}^n,x\mapsto Ax+b,A\in \mathbb{R}^{n\times m},b\in \mathbb{R}^n$ ，对于凸集 $S$ ， $f(S)$ 和 $f^{-1}(S)$ 都是凸集. 更一般的，凸集的数量乘积和平移都不改变凸性.
>证明： $f(S)$ 的显然，对于 $f^{-1}(S)$ 中的凸组合 $\sum\limits_{i=1}^{N}\lambda_ix_i$ ，注意到 $f\left(\sum\limits_{i=1}^{N}\lambda_i x_i\right)=\sum\limits_{i=1}^{N}\lambda_i (Ax_i+b)$ ，从而可得结论.

>[!note]- 凸集的和仍然为凸集.

>[!note]- 凸集到几个象限的投影仍然是凸集. e.g. 设 $S\in \mathbb{R}^2$ 是凸集，则 $S_x=\{x:(x,y)\in S\}$ 是凸集.

>[!example]- 定义多面体： $H=\{x\in \mathbb{R}^n:Ax\leq b,Cx=d\}$ . 则 $H$ 为凸集.
>证明：注意到 $A\sum\limits_{i=1}^{N}\lambda_ix_i\leq \sum\limits_{i=1}^{N}\lambda_ib=b$ ，另一个同理.

>[!example]- $n$ 阶半正定矩阵全体 $S_+^n=\cap _{z\neq0}\{X\in S^n:z^TXz\geq0\}$ 是凸集. 线性矩阵不等式的解集为凸集.
>$S_+^n$ 半正定矩阵为凸集容易验证. 设 $A_i,B\in S^m$ ，均为实矩阵，考虑线性不等式 $$A(x)=x_1A_1+\cdots +x_nA_n\preceq B$$ 即 $B-A(x)$ 是半正定的，令 $f(x)=B-A(x)$ ，不难验证 $f:\mathbb{R}^n\rightarrow S^m$ 的原像仍然为凸集，进而可得结论. #imcomplete-whatever %%答案的说法是 $f$ 是一个仿射函数，没看出来%%

>[!note]- 线性分式函数保凸.

定义**透视函数**： $P:\mathbb{R}^{n+1}\rightarrow \mathbb{R}^n,P(z,t)=z/t$ ， $\text{dom}(P)=\mathbb{R}^n\times \mathbb{R}_{++}$ ，其中 $\mathbb{R}_{++}$ 表示正实数集. 

>[!note]- 若 $C\subset \text{dom}(P)$ 是凸集，则 $P(C)$ 是凸集. 反之也成立.
>证明：需要用到透视函数的性质：首先由凸集的定义可知 $\forall x_1,x_2\in C$ ，线段 $L=\{\lambda(\bar{x}_1,x_1)+(1-\lambda)(\bar{x}_2,x_2),\lambda\in[0,1]\}$ 仍然包含在 $C$ 中，并且 $$P(L)=(\lambda \bar{x}_1+(1-\lambda)\bar{x}_2)/(\lambda x_1+(1-\lambda)x_2)$$ 令 $\mu=\frac{\lambda x_1}{\lambda x_1+(1-\lambda)x_2}$ ，从而可得 $P(L)=\mu P((\bar{x}_1,x_1))+(1-\mu)P(\bar{x}_2,x_2)$ . 也就是说任何两个 $P(C)$ 中的点形成的线段都包含在 $P(C)$ 中（因为 $P(L)\subset P(C)$ ）任何凸组合都可以有限的表示为在线段上取一点. 从而可得结论.
>
>另一方面： #imcomplete-whatever 

**线性分式函数**则是由透视函数和仿射函数复合定义的：设 $g:\mathbb{R}^n\rightarrow \mathbb{R}^{m+1}$ ： $$g(x)=\begin{bmatrix}A \\ c^T\end{bmatrix}x+\begin{bmatrix}b  \\ d\end{bmatrix}$$ 其中 $A\in \mathbb{R}^{m\times n},c\in \mathbb{R}^{n},b\in \mathbb{R}^m,d\in \mathbb{R}$ ，定义线性分式函数： $f=P\circ g$ ，即： $$f(x)=(Ax+b)/(c^Tx+d)$$

下面定义凸集的**分离**：设 $D_1,D_2\subset \mathbb{R}^n$ 是两个凸集，如果存在 $\alpha\in \mathbb{R}^n,\alpha\neq0,\beta\in \mathbb{R}$ ，使得 $$\begin{aligned}
&D_1\subset H^+=\{x\in \mathbb{R}^n:\alpha^Tx\geq \beta\}\\
&D_2\subset H^-=\{x\in \mathbb{R}^n:\alpha^Tx\leq \beta\}
\end{aligned}$$ 则称**超平面** $H=\{x\in \mathbb{R}^n:\alpha^Tx=\beta\}$ 为 $D_1,D_2$ 的**分离**. 若 $D_1,D_2$ 中取 $>,<$ 则称 $H$ 为 $D_1,D_2$ 的**严格分离**.

类似于二维或者三维上的凸集，有下面的存在唯一最近点定理：

>[!note]- 设 $D\subset \mathbb{R}^n$ 是非空<u>闭</u>凸集， $y\notin D$ ，则 1) 存在唯一 $\bar{x}\in D$ 满足 $\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ ；2) $\bar{x}:\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ 当且仅当 $(x-\bar{x})^T(\bar{x}-y)\geq0$ .
>证明：利用连续函数可以在紧集（在 $\mathbb{R}^n$ 中，等价于有界闭集）中可以取得最小值. #imcomplete %%这里最好能更新一下[实数理论](R)%% 首先取 $z\in D$ . 取 $R=\lVert y-z\rVert$ ，从而可得 $C=\bar{B}(z,R)\cap D$ 为 $\mathbb{R}^n$ 上的有界闭集，又 $\lVert \cdot\rVert$ 为连续函数（事实上，一致连续），从而可在 $C$ 上取得 $\inf$ ，记 $\lVert \bar{x}-y\rVert=\inf_{x\in C}\lVert x-y\rVert$ ，当 $x\notin C$ 时， $\lVert x-y\rVert\geq R\geq \lVert \bar{x}-y\rVert$ 因此 $\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ .
>对于唯一性的证明：考虑 $$\begin{aligned}
>\left\lVert \frac{1}{2}\bar{x}-\frac{1}{2}y-\frac{1}{2}y+\frac{1}{2}\bar{x}'\right\rVert &\leq \frac{1}{2}\left\lVert \bar{x}-y\right\rVert+\frac{1}{2}\lVert \bar{x}'-y\rVert\\
>&=\lVert \bar{x}-y\rVert
>\end{aligned}$$ 并且 $$\left\lVert \frac{\bar{x}+\bar{x}'}{2}-y\right\rVert\geq\lVert \bar{x}-y\rVert$$ 则上不等式可取等，满足取等条件： $$\frac{1}{2}(\bar{x}-y)=\frac{\alpha}{2}(\bar{x}'-y)$$ 取模长可得 $\alpha=1$ ，从而可得 $\bar{x}=\bar{x}'$ .
>
>对 2) ， $\rightarrow$ 观察可得 $$\begin{aligned}
>\lVert x-y\rVert^2 &=\lVert x-\bar{x}+\bar{x}-y\rVert^2\\
>&=\lVert x-\bar{x}\rVert^2+\lVert \bar{x}-y\rVert^2+2(x-\bar{x})^T(\bar{x}-y)\\
>\end{aligned}$$ 但这一形式无法解决问题，因此考虑利用凸集的性质，和上面的 $$\begin{aligned}
>\lVert \lambda x+(1-\lambda)\bar{x}-y\rVert^2&=\lVert \bar{x}-y+\lambda(x-\bar{x})\rVert^2\\
>&=\lVert \bar{x}-y\rVert^2+\lambda^2\lVert x-\bar{x}\rVert^2\\
>&+2\lambda(x-\bar{x})^T(\bar{x}-y)\\
>&\geq \lVert \bar{x}-y\rVert^2
>\end{aligned}$$ 从而可以得到 $$\lambda^2\lVert x-\bar{x}\rVert^2+2\lambda(x-\bar{x})^T(\bar{x}-y)\geq0$$ 其中 $\lambda\in(0,1)$ ，因此 $(x-\bar{x})^T(\bar{x}-y)\geq0$ . 利用参数的任意性求解，和[[#^AtMostnplus1]]相似.
>
>$\Leftarrow$ ：直接由 $$\begin{aligned}\lVert x-y\rVert^2 &=\lVert x-\bar{x}+\bar{x}-y\rVert^2\\ 
>&=\lVert x-\bar{x}\rVert^2+\lVert \bar{x}-y\rVert^2+2(x-\bar{x})^T(\bar{x}-y)\\
>\end{aligned}
>$$ 得到结论.

下面是一个重要的引理，即存在超平面将位于非空闭凸集 $D$ 外的一点 $y$ 与凸集 $D$ 分开：

>[!note]- 设 $D\subset \mathbb{R}^n$ 是非空<u>闭</u>凸集， $y\notin D$ ，则存在 $\alpha\in \mathbb{R}^n,\alpha\neq0$ ， $\beta\in \mathbb{R}$ 使得 $\alpha^Tx\leq\beta<\alpha^Ty,\forall x\in D$ . 
>证明：已知 $(x-\bar{x})^T(\bar{x}-y)\geq0$ . 从而 $(\bar{x}-y)^T(x-\bar{x})\geq0$ ，进而可得 $$(y-\bar{x})^Tx\leq (y-\bar{x})^T\bar{x}$$ 令 $\alpha=y-\bar{x}$ 从而可得： $$\alpha^Tx\leq \alpha^T\bar{x}=\alpha^T(\bar{x}-y+y)=-\alpha^T\alpha+\alpha^Ty<\alpha^Ty$$ 并且可取 $\beta=\alpha^T\alpha+\alpha^Ty$ 得到结论.

下面这个定理建立在特定条件下的线性不等式和线性等式之间的等价关系.

>[!note]- Farkas 引理：设 $A\in \mathbb{R}^{m\times n}$ ， $b\in \mathbb{R}^n$ ，则 1. $Ax\leq 0,b^Tx>0$ 2. $A^Ty=b,y\geq0$ 中有且仅有一个有解.
>证明：假设 $1,2$ 均有解 $x_0,y_0$ ，则 $A^Ty_0=b\rightarrow x\rightarrow x_0^TA^Ty_0=x_0^Tb=(Ax_0)^Ty_0$ ，注意到 $Ax_0\leq 0,x_0^Tb>0,y_0\geq0$ 从而可得矛盾. 
>
>另一方面，假设 $1,2$ 均无解，则取 $$D=\{z:z=A^Ty,y\geq0\}$$ 显然 $D$ 为非空<u>闭</u>凸集（仿射变换将凸集映射到凸集）并且 $b\notin D$ ，从而对于存在 $\alpha\in \mathbb{R}^n,\beta\in \mathbb{R}$ ，对任意的 $z\in D$ ，有： $$(A\alpha)^Ty=\alpha^TA^Ty=\alpha^Tz\leq\beta<\alpha^Tb=b^T\alpha,\forall y\geq0$$ 
>
>注意到 $b^T\alpha>(A\alpha)^T0=0$ . 而若 $A\alpha$ 中存在分量 $>0$ 由 $y$ 的任意性，可以取对应分量位置的正值而其余位置为 $0$ ，可得 $\exists y',(A\alpha)^Ty'>b^T\alpha$ ，所以 $A\alpha\leq0$ ，这与 $1$ 无解矛盾！
>综上 1. 2. 有且只有一个有解.
>^Farkas

下面定义**支撑**的概念：设 $D$ 为非空集合， $\bar{x}\in \partial{D}$ ，若存在 $\alpha\neq0$ 使得 $$D\subset H_{\bar{x}}^+=\{x:\alpha^T(x-\bar{x})\geq0\}$$ 或者 $$D\subset H_{\bar{x}}^-=\{x:\alpha(x-\bar{x})\leq0\}$$ 则称超平面 $H_{\bar{x}}=\{x:\alpha(x-\bar{x})=0\}$ 为 $D$ 在 $\bar{x}$ 处的**支撑超平面**.

下面这个定理说明了凸集的边界上的点的特殊性质：存在一个包含该点的超平面，使得凸集的闭包上的所有点均位于该超平面的一侧（可以位于该超平面上）

>[!note]- 设 $D$ 为非空凸集， $\bar{x}\in\partial{D}$ ，则存在 $\alpha\neq0,\alpha\in \mathbb{R}^n$ 使得 $\alpha^Tx\leq \alpha^T\bar{x},\forall x\in \bar{D}$ .
>证明：因为 $\bar{x}\in \partial{D}$ ，所以存在点列 $\{x_n\}_{n\geq1}\rightarrow \bar{x},x_n\notin \bar{D},\forall n\geq1$ ，注意到 $\bar{D}$ 为非空<u>闭</u>凸集（凸集的闭包是凸集之前已经证明过），根据上面的引理可知，存在 $\{\alpha_n\}_{n\geq1}$ 使得： $$\alpha_n^Tx<\alpha_n^Tx_n,\forall x\in \bar{D}$$ 进而有： $$\frac{\alpha_n^T}{\lVert \alpha_n\rVert}x<\frac{\alpha_n^T}{\lVert \alpha_n\rVert}x_n,\forall x\in \bar{D}$$ 有界序列有收敛子列： $\left\{\frac{\alpha_{n_k}^T}{\lVert \alpha_{n_k}\rVert}\right\}_{k\geq1}\rightarrow \alpha$  ，从而可得 $\alpha^T x\leq \alpha^T x_n$ ，再令 $n\rightarrow \infty$ 可得 $\alpha^Tx\leq \alpha^T \bar{x}$ .

下面这个定义说明了更一般的情况：讨论 $\bar{x}\notin D$ 但不再限制 $D$ 是闭集.

>[!note]- 设 $D$ 是非空凸集， $\bar{x}\notin D$ ，则存在 $\alpha\neq0$ 使得 $\alpha^T x\leq \alpha^T\bar{x},\forall x\in \bar{D}$ .
>证明：不妨设 $\bar{x}\notin \partial{D}\cup D$ ，由 $\bar{D}$ 为非空闭凸集即可得到结论.

下面这个定理说明了两个不相交非空凸集之间存在分离超平面：

>[!note]- 设 $D_1,D_2$ 是两个非空凸集并且 $D_1\cap D_2=\emptyset$ ，则存在 $\alpha\neq0$ 使得 $\alpha^Tx\leq \alpha^Ty,\forall x\in \bar{D}_1,x_2\in \bar{D}_2$ . 
>证明：令 $D=D_1-D_2$ 则 $D$ 为并且 $0\neq D$ ，从而存在 $\alpha\in \mathbb{R}^n$ 使得： $$\alpha^T(x-y)\leq \alpha^T0=0,\forall x\in D_1,y\in D_2$$ 从而可得 $\alpha^Tx\leq \alpha^Ty$ （这里因为 $D\subset \bar{D}$ ，所以可以直接这样写） 令 $\beta=\sup\{\alpha^Tx:x\in D_1\}$ ，从而可得 $$\alpha^Tx\leq \beta\leq \alpha^Ty,\forall x,y\in D_1,D_2$$ 注意到 $f(x)=\alpha^Tx$ 是连续函数，所以 $$\alpha^Tx\leq \beta\leq \alpha^Ty,\forall x,y\in D_1,D_2$$ 否则若 $\alpha^Tx_0>\beta,x_0\in \bar{D_1}-D_1$ ，则存在 $x_0$ 的一个最够小的邻域仍然满足，并且与 $D_1$ 有交点，矛盾！

之前已经介绍了[Farkas 引理](#^Farkas)，下面介绍的引理