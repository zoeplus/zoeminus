# 依赖和简介

对于范数和矩阵理论的[介绍](MAlg.md#范数).

最优化方法主要分为两个步骤：**优化建模**和**求解**. 优化建模与特定的专业领域有关，本篇专述求解（算法）.

最优化方法的分类：**离散** & **连续**；**有限维** & **无限维**. 本篇考虑的是 $\mathbb{R}^n$ 上的连续有限维优化.

$\mathbb{R}^n$ 中的优化问题. 通常记**标准内积** $x,y\in \mathbb{R}^n,\langle x,y \rangle=\sum\limits_{i=1}^{n}x_iy_i$ ，若给定一个[正定](LAlg.md#正定矩阵)对称矩阵 $P$ ，记 $\langle x,y \rangle_P=x^TPy$ . 并可以定义**矩阵内积** $A,B\in \mathbb{R}^{m\times n}, \langle A,B \rangle=\sum\limits_{i=1}^{m}\sum\limits_{j=1}^{n}a_{ij}b_{ij}=\text{tr}(A^TB)=\text{tr}(B^TA)$ .

连续优化的形式为： 

$$\begin{aligned}
&\min_{x} f(x)\\
&s.t.\left\{\begin{aligned}
&c_i(x)=0,i=1,\cdots,m\\
&c_j(x)\geq0,j=m+1,\cdots,p
\end{aligned}\right.
\end{aligned}$$

其中 $c_i,i=1,\cdots,n$ 为连续函数. 称 $c_i(x)=0$ 为**等式约束**， $c_j(x)\geq0$ 为**不等式约束**. 定义**可行集**： 

$$F=\{x:c_i(x)=0,i=1,\cdots,m,c_j(x)\geq0,j=m+1,\cdots,p\}$$

对于任意 $x\in F$ ，定义**指标集合**： 

$$\mathcal{A}(x)=\{1,2,\cdots ,n\}\backslash \{k:c_k(x)>0\}=\{1,\cdots,m\}\cup\{k:c_k(x)\leq 0\}$$

为 $x$ 的**积极约束**， $\{1,2,\cdots,n\}\backslash \mathcal{A}(x)$ 称为 $x$ 的**非积极约束**. （此处的积极，指的是对于 $x$ 进行轻微绕动之后是否影响约束条件，一般来说对于 $c_{i}(x)>0$ 约束，不会产生变化，因此称为非积极）. 

定义**整体最优解** $x^*$ ： $\forall x\in F,f(x^*)\leq f(x)$ ；定义**严格整体最优解** $x^*$ ： $\forall x\in F,x\neq x^*,f(x^*)<f(x)$ . **局部最优解**：对于 $x^*$ ，存在某一邻域 $N$ ， $\forall x\in N\cap F,x\neq x^*,f(x^*)\leq f(x)$ ，**严格局部最优解**类似.

按照可行集可以将优化问题划分为**凸优化**和**非凸优化**，多数情况下凸优化简单，因为凸优化情形下局部最优即为整体最优.

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
> $$H(D)=\left\{\sum\limits_{i=1}^{k}\lambda_ix_i:k\in \mathbb{N},\lambda_i>0,\sum\limits_{i=1}^{k}\lambda_i=1,x_i\in D\right\}$$ 对于任意的 $\sum\limits_{i=1}^{k_1}\lambda^1_ix^1_i,\cdots,\sum\limits_{i=1}^{k_m}\lambda^m_ix^m_i$ ，考虑 $$\sum\limits_{j=1}^{m}\alpha_j\left(\sum\limits_{i=1}^{k_j}\lambda^j_ix_i^j\right)=\sum\limits_{j=1}^{m}\sum\limits_{i=1}^{k_j}\alpha_j\lambda_i^jx_i^j$$ 注意到 $\sum\limits_{j=1}^{m}\sum\limits_{i=1}^{k_j}\alpha_j\lambda_i^j=\sum\limits_{j=1}^{m}\alpha_j\sum\limits_{i=1}^{k_j}\lambda_i^j=\sum\limits_{j=1}^{m}\alpha_j=1$ . 从而可知 $H(D)$ 为凸集. 下面证明 $H(D)$ 为包含 $D$ 的最小凸集：设 $B_i\supset D$ 为凸集显然 $\bigcap_{i\in I}B_i$ 仍然为包含 $D$ 的凸集，显然 $H(D)$ 包含 $D$ 所以： $$H(D)\supset \bigcap_{i\in I}B_i$$ 另一方面注意到 $D\subset \bigcap_{i\in I}B_i$ ，所以 $$H(D)\subset H(\cap_{i\in I}B_i)\subset \cap_{i\in I}B_i$$ 所以 $H(D)=\bigcap_{i\in I}B_i$ .

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

定义**透视函数**： $P:\mathbb{R}^{n+1}\rightarrow \mathbb{R}^n,P(z,t)=z/t$ , $\text{dom}(P)=\mathbb{R}^n\times\mathbb{R}_{+ +}$ , $\mathbb{R}_{++}$ 表示正实数集. 

>[!note]- 若 $C\subset \text{dom}(P)$ 是凸集，则 $P(C)$ 是凸集. 反之也成立.
>证明：需要用到透视函数的性质：首先由凸集的定义可知 $\forall x_1,x_2\in C$ ，线段 $L=\{\lambda(\bar{x}_1,x_1)+(1-\lambda)(\bar{x}_2,x_2),\lambda\in[0,1]\}$ 仍然包含在 $C$ 中，并且 $$P(L)=(\lambda \bar{x}_1+(1-\lambda)\bar{x}_2)/(\lambda x_1+(1-\lambda)x_2)$$ 令 $\mu=\frac{\lambda x_1}{\lambda x_1+(1-\lambda)x_2}$ ，从而可得 $P(L)=\mu P((\bar{x}_1,x_1))+(1-\mu)P(\bar{x}_2,x_2)$ . 也就是说任何两个 $P(C)$ 中的点形成的线段都包含在 $P(C)$ 中（因为 $P(L)\subset P(C)$ ）任何凸组合都可以有限的表示为在线段上取一点. 从而可得结论.
>
>另一方面： #imcomplete-whatever 

**线性分式函数**则是由透视函数和仿射函数复合定义的：设 $g:\mathbb{R}^n\rightarrow \mathbb{R}^{m+1}$ ： $$g(x)=\begin{bmatrix}A \\ c^T\end{bmatrix}x+\begin{bmatrix}b  \\ d\end{bmatrix}$$ 其中 $A\in \mathbb{R}^{m\times n},c\in \mathbb{R}^{n},b\in \mathbb{R}^m,d\in \mathbb{R}$ ，定义线性分式函数： $f=P\circ g$ ，即： $$f(x)=(Ax+b)/(c^Tx+d)$$

下面定义凸集的**分离**：设 $D_1,D_2\subset \mathbb{R}^n$ 是两个凸集，如果存在 $\alpha\in \mathbb{R}^n,\alpha\neq0,\beta\in \mathbb{R}$ ，使得 $$\begin{aligned}
&D_1\subset H^+=\{x\in \mathbb{R}^n:\alpha^Tx\geq \beta\}\\
&D_2\subset H^-=\{x\in \mathbb{R}^n:\alpha^Tx\leq \beta\}
\end{aligned}$$ 则称**超平面** $H=\{x\in \mathbb{R}^n:\alpha^Tx=\beta\}$ 为 $D_1,D_2$ 的**分离**. 若 $D_1,D_2$ 中取 $>,<$ 则称 $H$ 为 $D_1,D_2$ 的**严格分离**. ^SeperateHyperplane

类似于二维或者三维上的凸集，有下面的存在唯一最近点定理：

>[!note]- 设 $D\subset \mathbb{R}^n$ 是非空<u>闭</u>凸集， $y\notin D$ ，则 1) 存在唯一 $\bar{x}\in D$ 满足 $\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ ；2) $\bar{x}:\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ 当且仅当 $(x-\bar{x})^T(\bar{x}-y)\geq0$ .
>证明：利用连续函数可以在紧集（在 $\mathbb{R}^n$ 中，等价于有界闭集）中可以取得最小值. #imcomplete %%这里最好能更新一下[实数理论](R.md)%% 首先取 $z\in D$ . 取 $R=\lVert y-z\rVert$ ，从而可得 $C=\bar{B}(z,R)\cap D$ 为 $\mathbb{R}^n$ 上的有界闭集，又 $\lVert \cdot\rVert$ 为连续函数（事实上，一致连续），从而可在 $C$ 上取得 $\inf$ ，记 $\lVert \bar{x}-y\rVert=\inf_{x\in C}\lVert x-y\rVert$ ，当 $x\notin C$ 时， $\lVert x-y\rVert\geq R\geq \lVert \bar{x}-y\rVert$ 因此 $\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ .
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

## 凸函数

凸函数的局部最优点即为全局最优点.

>[!note] 设 $f(x)$ 是定义在凸集 $D$ 上的连续可微函数，则 1) $f$ 为 $D$ 上的充分必要条件是 $f(y)\geq f(x)+\nabla f(x)^T(y-x),\forall x,y\in D$ ；2) $f$ 是 $D$ 上的严格凸函数的充要条件是 $f(y)>f(x)+\nabla f(x)^T(y-x),\forall y,x\in D,x\neq y$ .

>[!note] 设 $f(x)$ 是<u>非空开凸集</u> $D\subset \mathbb{R}^n$ 上的<u>二阶连续可微</u>函数，则 1) $f$ 是 $D$ 上的凸函数的充要条件是 $\nabla^2f(x)$ 在 $D$ 中<u>半正定</u>；2) 若 $\nabla^2f(x)$ 在 $D$ 中正定，则 $f(x)$ 是 $D$ 上的严格凸函数.

# 线性规划

**线性规划**（linear programming ，LP）的标准形式为：

$$\begin{aligned}
&\min\ a_1x_1+\cdots+a_nx_n\\
&s.t. \ a_{i_1}x_1+\cdots+a_{i_n}x_n=b_i\\
&\quad\ i=1,\cdots,m,x_j\geq0,j=1,\cdots,n
\end{aligned}$$

矩阵形式：

$$\begin{aligned}
&\min\ c^Tx\\
&s.t.\ Ax=b\\
&\quad\quad x\geq0
\end{aligned}$$

一般设 $\text{rank}(A)=m,b\geq0$ ，并且 $m\leq n$ . 

线性规划的可行域是一个**多面体**.

可以通过引入变量的方式以将非标准形式的线性规划转化为标准形式. #imcomplete-lack-examples .

由 $\text{rank}(A)=m$ ，设 $A=(B\ N)$ ， $B$ 为 $m$ 阶非奇异矩阵，相应地令 $x=\begin{bmatrix}x_B & x_N\end{bmatrix}$ 从而可得 $Ax=Bx_B+Nx_N=b$ ，从而 $x_B=B^{-1}b-B^{-1}Nx_N$ ，所以 $Ax=b$ 有一解 $\begin{bmatrix}B^{-1}b\\ 0\end{bmatrix}$ ，称为**基本解**；如果 $B^{-1}b\geq0$ ，则 $\begin{bmatrix}B^{-1}b\\ 0\end{bmatrix}$ 即为该线性规划问题的解，称为**基本可行解**. （ $A$ 中的 $m$ 阶非奇异矩阵可能有多个，所以可能有多个基本可行解，此外注意，将 $A$ 写作 $(B,N)$ 只是方便表示，实际计算时，只需要确定 $A$ 中的 $m$ 个线性无关列对应的列索引（基指标）即可，下面的所有表示都是如此）

在处理简单的二维线性规划问题时，极值一般都在多边形（多面体）的顶点处取得，在线性规划中也有这一结论.

定义**顶点**（极点）：设 $S\subset \mathbb{R}^n$ 是凸集，如果对于任意的 $\lambda\in(0,1),y,z\in S$ ， $x=\lambda y+(1-\lambda)z\Rightarrow x=y=z$ .  

>[!example]- 闭球体 $S:\{x:x^Tx=1\}$ 的顶点全体为 $\partial{S}$ .

>[!example]- $\{x:x_1+x_2+x_3\leq1,x_i\geq0,i=1,2,3\}$ 的顶点为 $(1,0,0)^T,(0,1,0)^T,(0,0,1)^T$ .

>[!note]- $x$ 是可行域 $F=\{x:Ax=b,x\geq0\}$ 的一个顶点的充要条件是 $x$ 是 LP 标准形式的一个基本可行解 $\begin{bmatrix}B^{-1}b\\ 0\end{bmatrix}$ .  #imcomplete-lack-proofs 

由上结论，依据 $B^{-1}$ 为从 $A$ 的线性无关列中选取而组成的可知，线性规划的可行域 $F$ 的顶点有限.

>[!note]- 若 $F$ 有界，则 $F=\{F\text{ 的顶点的凸组合}\}$ . #imcomplete-lack-proofs 

设 $D$ 是一个凸集， $d$ 是一个向量，如果 $\forall x\in D,\alpha\geq0$ ，都有 $x+\alpha d\in D$ 则称 $d$ 为 $D$ 的一个**方向**.

>[!note]- 若 $F$ 无界，则任一可行域中的点 $x$ 都可以表示为 $x=\sum\limits_{i=1}^{k}\alpha_iv_i+\alpha d$ ，其中 $\sum\limits_{i=1}^{k}\alpha_i=1,\alpha_i\geq0$ ， $v_i$ 为 $F$ 的顶点， $\alpha\geq0$ ， $d$ 为 $F$ 的一个方向.

>[!note]- 若线性规划标准形式有解，则其必然在可行域 $F$ 的某个顶点处达到最优值.

## 单纯形算法

```python title="修正单纯形算法" linenums="1"
输入： 初始基本可行解 x_0, c, A, b
输出： 最优解 x

x = x_0
1. 确定 A 中基阵 B 对应的指标集 I_B, c_B; 非基阵 N 对应的指标集 I_N, c_N; 
# 计算 .t() 表示转置 .inv() 表示求逆
Delta = c_N.t() - c_N.t() * B.inv() * N;
# 初始化单纯形表（simplex table）
St = con(c, A, dim = 0)
St = con(St, [0, b].t(), dim = 1)

# 直到 Delta >= 0 时停止迭代
while (not Delta >= 0)
    k = c_N[Delta.argmin()]
    if (B.inv()) * A[k] <= 0) print("无解") return none;
    # 计算用于 Gauss-Jordan 消元的主元素的位置
    filter = I_B[(B.inv() * A[k])[I_B] > 0)];
    check_list = (B.inv() * b) / (B.inv() * A[k])[filter])
    r = (I_B[filter])[check_list.argmin()]
    main_ele = (B.inv * A[k])[r]
    # 下面用主元素 main_ele 对单纯形进行 Gauss-Jordan 消元
    
    # 调整基指标和非基指标
return x
```

## 两阶段法

## M 法

## 对偶单纯性法

标准线性规划问题 $(P)$ 及其**对偶问题** $(D)$ ：

$$\begin{aligned}
&(P)\quad \begin{aligned}
&\min\ c^Tx\\
&\ \text{s.t.}\ Ax=b\\
&\quad \quad x\geq0
\end{aligned}\\
\\
&(D)\quad \begin{aligned}
&\max\ b^Ty\\
&\ \text{s.t.}\ A^Ty\leq c
\end{aligned}
\end{aligned}$$

>[!note] 弱对偶定理： $x,y$ 分别为 $(P),(D)$ 的可行解，则有 $c^Tx\geq b^Ty$ .

>[!note] 强对偶定理：如果 $(P)$ 有最优解，则 $D$ 有最优解，并且<u>两者最优目标值相同</u> .
>对偶问题 $(D)$ 的最优解 $y^*=B^{-T}c_B$ .

在单纯形法中， $(P)$ 的一个<u>基本可行解</u> $x$ 对应的检验向量 $\Delta=c_N^T-c_B^TB^{-1}N\geq0$ 时， $x$ 为 $(P)$ 的最优解. 

在这种情况下令 $y=(B^{-1})^Tc_B$ 可得 $c_N^T-y^TN\geq0$ 从而 $A^Ty=(B^T\  N^T)y=(c_B\ N^Ty)\leq c$ . 称 $y=B^{-T}c_B$ 为 $x$ 的**对偶变量**.

对偶单纯形算法如下： #imcomplete-lack-proofs 

1. <u>选取</u> $(P)$ 的一个基矩阵 $B$ ，使得满足 $c_N^T-c_B^TB^{-1}N\geq0$ ，列出单纯形表；
2. 求 $\bar{b}_{i_r}=\min\{(B^{-1}b)_{i_j}:j=1,\cdots,m\}$ ，其中基指标集 $I_B=\{i_1,\cdots,i_m\}$ ；
3. 若 $\bar{b}_{i_r}\geq0$ ，停止，返回上述得到的解；否则继续到步骤 4.
4. 获取 $B^{-1}N$ 的第 $i_r$ 行，若 $e_{i_r}^T(B^{-1}N)\geq0$ ，停止，对偶问题无解；否则继续到步骤 5；
5. 求 $k=\arg\max\left\{\frac{c_j-c_B^TB^{-1}a_j}{e_{i_r}^TB^{-1}a_j}:e^{T}_{i_r}B^{-1}a_j<0\right\}$ 
6. 以 $e^T_{i_r}B^{-1}a_k$ 为主元素（即 $(B^{-1}N)_{i_r,k}$ ）对单纯形表进行 Gauss-Jordan 消元，并以 $k$ 替换 $I_B$ 中的 $i_r$ ，转到步骤 2.

# 整数线性规划

**整数线性规划**（ILP）的标准型为：

$$(P)\quad \begin{aligned}
&\min\ c^Tx\\
&s.t.\ Ax=b\\
&\quad\quad x\geq0\\
&\qquad x_i\in I,i=1,\cdots,n\\
&\qquad I\subset \mathbb{N}
\end{aligned}$$

并定义松弛问题：

$$(P_0)\quad \begin{aligned}
&\min\ c^Tx\\
&s.t.\ Ax=b\\
&\quad\quad x\geq0
\end{aligned}$$

如果 $I=\{0,1\}$ 则称为 $0-1$ 规划问题（背包问题）.

## 分枝界定法

## Gemory 割平面法

Gemory 割平面法讨论的问题是：

$$(P)\quad \begin{aligned}
&\min\ c^Tx\\
&s.t.\ Ax=b\\
&\quad\quad x\geq0\\
&\qquad x_i\in \mathbb{N}
\end{aligned}$$

用单纯形法求解松弛问题 $(P_0)$ 之后得到： $\bar{x}=\begin{bmatrix}B^{-1}b  \\ 0\end{bmatrix}$ ，若 $\bar{x}$ 为整数变量，则为 $(P)$ 的解. 

若 $B^{-1}b$ 中有<u>正分数分量</u>，考虑单纯形算法结束时：

$$x_B+(B^{-1}N)x_N=B^{-1}b$$

记 $I_N$ 为 $N$ 的列指标，上式等同于：

$$x_B+\sum\limits_{j\in I_N}^{}(B^{-1}a_j)x_j=B^{-1}b$$

记作：

$$x_B+\sum\limits_{j\in I_N}^{}\bar{a}_jx_j=\bar{b}$$ 
设 $B^{-1}b\overset{def}{=}\bar{b}$ 的第 $l$ 个分量 $\bar{b}_l$ 为分数，则 $(P_0)$ 的可行解应当满足：

$$x_{B_l}+\sum\limits_{j\in I_N}^{}\bar{a}_{lj}x_j=\bar{b}_l$$

进而：

$$x_{B_l}+\sum\limits_{j\in I_N}^{}[\bar{a}_{lj}]x_j\leq \bar{b}_l$$

并且因为 $(P)$ 的可行解为整数：

$$x_{B_l}+\sum\limits_{j\in I_N}^{}[\bar{a}_{lj}]x_j\leq [\bar{b_l}]$$

从而得到：

$$\sum\limits_{j\in I_N}^{}(\bar{a}_{lj}-[\bar{a}_{lj}])x_j\geq \bar{b}_l-[\bar{b}_l]$$


1. 用单纯形法求解 $(P_0)$ ，若无解，返回无解；若求得 $(P_0)$ 的解 $x_0$ ， $x_0$ 是整数向量，则返回 $x_0$ ；否则转步骤 2；
2. 取 $x_0$ 的非整数分量 $\bar{b}$ ，求割平面方程；
3. 将割平面方程加入到单纯形表中；用对偶单纯形算法求解问题. 若问题无界，停止；若解为整数解，返回；否则转入步骤 2.

# 无约束优化

无约束优化的形式为：

$$\min\ f(x),f\in C(\mathbb{R})$$


$$\begin{aligned}
&x_{k+1}=x_k+\alpha_kd_k\\
&\text{s.t.}\ f(x_{k+1})<f(x_k)
\end{aligned}$$

若记 $\varphi(\alpha)=f(x_k+\alpha d_k)$ ，则上式可以表示为：

$$\varphi(\alpha_k)<\varphi(0)$$

因此求解的 $\alpha_k$ 即为对应的 $\varphi$ 值小于原点对应的 $\varphi$ 值的点.

**下降方向**（descent direction） ： $d_k\in\mathbb{R}^n$ ；
**步长**（step length） $\alpha_k$ ；

## 线性搜索

**线性搜索**采取迭代算法不断获得新的点，以接近最优值：

对于 $x_k$ ，确定搜索方向 $d_k$ 和步长 $\alpha_k$ ，下一个迭代点 $x_{k+1}=x_k+\alpha_k d_k$ .

要求 $d_k$ 为下降方向 #imcomplete ，即 $d_k^T \nabla f(x_k)<0$ .

线性搜索算法需要解决两个问题： $d_k$ 的选取和 $\alpha_k$ 的选取；

假设已经确定了 $d_k$ ，构造辅助函数：

$$\varphi(\alpha)=f(x_k+\alpha d_k)$$

注意到 $\varphi(\alpha)$ 即为 $f|_{\{x_k+\alpha d_k:\alpha>0\}}$ ，且是一元函数，因此求解步长 $\alpha_k$ 使其满足 $\varphi(\alpha_k)<\varphi(0)$ 相当于在射线 $\{x_k+\alpha d_k:\alpha>0\}$ 上搜索得到 $f$ 的一个小于 $f(0)$ 的值，线性搜索因此得名. 

>[!hint] 线性搜索算法将多元函数无约束问题转化为一元函数无约束问题，在这种情况下，针对 $\varphi(\alpha)$ 搜索只有两个方向， $d_k\in\{-1,1\}$ .

$\alpha_k$ 的选取应该能够充分地降低 $\varphi$ 的值，同时不应在确定 $\alpha_k$ 上浪费太多时间.

一种最理想的情况是： $\alpha_k=\arg\min_{\alpha>0}\varphi(\alpha)$ ，即最优步长，获取最优步长的线性搜索算法称为**精确线性搜索算法**，显然这不是必要的且难以实现. 实际应用中通常采用**非精确线性搜索算法**，要求 $\varphi(\alpha)$ 或者 $\alpha$ 满足某些性质以确定步长 $\alpha_k$ .

### 线性搜索准则

**线性搜索准则**是非精确线性搜索算法中对于 $\alpha$ （而不是对于 $\varphi(\alpha)$ ）的限制条件，将直接影响线性搜索算法是否收敛以及快慢.

>[!note] Armijo 准则

$$\text{Armijo})\quad f(x_k+\alpha d_k)\leq f(x_k)+c_1\alpha \nabla f(x_k)^Td_k,c_1\in(0,1)$$

即为：

$$\text{Armijo}')\quad \varphi(\alpha)\leq \varphi(0)+c_1 \varphi'(0)\cdot\alpha$$

Armijo 准则要求 $(\alpha,\varphi(\alpha))$ 应在直线 $\{\varphi(0)+c_1 \nabla f(x_k)^Td_k \alpha:\alpha\geq0\}$ 下方，注意要求 $d_k$ 是下降方向，因此 $\nabla f(x_k)^Td_k<0$ ，所以 $\varphi(\alpha)\leq \varphi(0)$ ，这就保证 $\varphi(\alpha)$ 下降.

通常选取 $c_1=10^{-3}$ 或者其他很小的数，这样可以很容易地满足 Armijo 准则. 但是 Armijo 准则并不能保证步长充分大，取一非常接近于 $0$ 的 $\alpha$ 即可. 因此通常需要和其他准则配合.

>[!hint] 因为 $d_k$ 是下降方向，所以总能够找到 $\alpha$ 满足 Armijo 准则. #issue 

>[!note] 回退法确定满足 Armijo 准则的步长.
>首先给定 $\alpha_0$ ， $\gamma\in(0,1)$ 初始化 $\alpha\leftarrow \alpha_0$ ；当 $\alpha$ 不满足 Armijo 时： $\alpha\leftarrow \gamma \alpha$ . 最终输出 $\alpha_k\leftarrow \alpha$ .

>[!note] Goldstein 准则

Armijo 准则要求 $(\alpha,\varphi(\alpha))$ 在直线 $\{\varphi(0)+c \nabla f(x_k)^Td_k \alpha:\alpha\geq0\}$ 的下方，自然地，也可以要求其在某条直线的上方，这样可以保证 $\alpha$ 不会过小. **Goldstein** 准则（或 Armijo - Goldstein 准则）：

$$\begin{aligned}
&\text{Goldstein 1)}\quad f(x_k+\alpha d_k)\leq f(x_k)+c \alpha \nabla f(x_k)^Td_k\\
&\text{Goldstein 2)}\quad f(x_k+\alpha d_k)\geq f(x_k)+(1-c)\alpha \nabla f(x_k)^Td_k
\end{aligned}$$

其中 $c\in(0,\frac{1}{2})$ .

Goldstein 要求 $(\alpha,\varphi(\alpha))$ 在下面两条直线之间：

$$\begin{aligned}
&l_1:\quad \{(\alpha,\varphi(\alpha)+c \varphi'(0)\cdot \alpha):\alpha\ge0\}\\
&l_2:\quad \{(\alpha,\varphi(\alpha)+(1-c)\varphi'(0)\cdot \alpha):\alpha\geq0\}
\end{aligned}$$

>[!note] 采用回退法确定满足 Goldstein 准则的步长.

首先确定 Goldstein 准则成立的区间 $[a_0,b_0]$ ，给定 $\alpha_0\in[a_0,b_0],c\in(0,\frac{1}{2}),\gamma>1$ ， $k\leftarrow 0$ .

当 $\alpha_0$ 不满足 Goldstein 1) 时： 

$$\begin{aligned}
&a_{k+1}\leftarrow a_k\\
&b_{k+1}\leftarrow \alpha_k\\
&\alpha_{k+1}\leftarrow \frac{a_{k+1}+b_{k+1}}{2}\\
&k\leftarrow k+1
\end{aligned}$$

当 $\alpha_0$ 不满足 Goldstein 2) 时：

$$\begin{aligned}
&a_{k+1}\leftarrow \alpha_k\\
&b_{k+1}\leftarrow b_k\\
&\alpha_{k+1}\leftarrow t \alpha_k\\
&k\leftarrow k+1
\end{aligned}$$

#### 黄金分割法

设 $\varphi(\alpha)$ 定义在 $[a,b]$ 上，如果存在唯一的 $\alpha^*\in(a,b)$ 使得 $\varphi$ 在 $[a,\alpha^*]$ 上严格单调递减，在 $[\alpha^*,b]$ 上严格单调增加，则称 $\varphi$ 为单峰函数. 

任取 $\lambda,\mu\in(a,b)$ ：

1. 如果 $\varphi(\lambda)\leq \varphi(\mu)$ 则 $\alpha^*\in[a,\mu]$ ；
2. 如果 $\varphi(\lambda)>\varphi(\mu)$ 则 $\alpha^*\in[\lambda,b]$ .

黄金分割法：

1. 初始化区间 $[a_1,b_1]$ ，给定精度 $\epsilon\geq0$ . 计算：

$$\begin{aligned}
&\lambda_1=a_1+0.382(b_1-a_1)\\
&\mu_1=a_1+0.618(b_1-a_1)
\end{aligned}$$

2. 如果 $\varphi(\lambda_k)>\varphi(\mu_k)$ ，转步骤 $3.$ ，否则转入步骤 $4.$
3. 若 $b_k-a_k\leq \epsilon$ ，停止，输出 $x^*=\mu_k$ ；否则 $a_{k+1}=\lambda_k,b_{k+1}=b_k$

/// collapse-code
```python title="黄金分割法" linenums="1"
import math
from math import exp

def golden_section_search(f, a, b, ep=1e-6):
    golden_ratio = (math.sqrt(5) - 1) / 2
    
    # 初始化 lam, mu
    lam = a + (1 - golden_ratio) * (b - a)
    mu = a + golden_ratio * (b - a)
    
    # 计算 f(lamda_1) f(mu_1)
    f1 = f(lam)
    f2 = f(mu)
    
    # 直到小于精度停止
    while b - a > ep:
        if f1 < f2:
            if mu - a < ep: return mu, f(mu)
            b = mu
            mu = lam
            lam = a + (1 - golden_ratio) * (b - a)
            f2 = f1
            f1 = f(lam)
            print(f"a: {a:.6f}, b: {b:.6f}, b-a: {b-a:.6f}")
        else:
            a = lam
            lam = mu
            mu = a + golden_ratio * (b - a)
            f1 = f2
            f2 = f(mu)
            print(f"a: {a:.6f}, b: {b:.6f}, b-a: {b-a:.6f}")
    
    return lam, f(lam)


f = lambda x: exp(x) + exp(-x)

a = -1
b = 1

x_min, min_value = golden_section_search(f, a, b)

print("近似极小点:", x_min)
print("近似极小值:", min_value)
```
///

$$f(x_k+\alpha d_k)=f(x_k)+\alpha\nabla^Tf(x_k)d_k+\frac{\mathcal{o}(\alpha)}{\alpha}$$

注意到右式的线性部分： $f(x_k)+\alpha\nabla^Tf(x_k)d_k$ ，考虑： 

**Wolfe 条件**：包含 Armijo 条件和曲率条件：

Armijo: $f(x_k+\alpha d_k)\leq f(x_k)+c_1\alpha d_k^T\nabla f(x_k),c_1\in(0,1)$ 该条件保证 $f(x_k+\alpha d_k)$ 取得的值比 $f(x_k)$ 要小；

Goldstein 条件：

### 精确线性搜索


## 多元无约束优化问题

### 最速下降法

考虑无约束优化问题：

$$\begin{aligned}
&\min f(x),f\in C^1(\mathbb{R}^n)
\end{aligned}$$

>[!example] 取初始点 $x_0=[0,0]^T$ ，设定精确误差 $\epsilon=0.01$ ，利用最速下降法求解下面的优化问题： $\min_{x\in \mathbb{R}^2}\quad x_1^2-2x_1x_2+4x_2^2+x_1-3x_2$ .

回顾： [[MA#极值理论]]

$$\nabla f(x_1,x_2)=[2x_1-2x_2+1,-2x_1+8x_2-3]^T$$

下面采用的是最速下降法，使用 Goldstein 算法确定步长：

/// collapse-code
```python title="Goldstein + 最速下降" linenums="1"
import numpy as np
import matplotlib.pyplot as plt

def varphi(arr):
    if (arr.ndim) != 1:
        x_1 = arr[:, 0]
        x_2 = arr[:, 1]
    else:
        x_1 = arr[0]
        x_2 = arr[1]
    return x_1 ** 2 - 2 * x_1 * x_2 + 4 * x_2 ** 2 + x_1 -3 * x_2

def d(arr):
    x_1 = arr[0]
    x_2 = arr[1]
    return -np.array([2 * x_1 - 2 * x_2 + 1, -2 * x_1 + 8 * x_2 -3])

def varphi_p(arr):
    return np.dot(d(arr), -d(arr))

# 按照算法 4.14 Goldstein 算法设置的两个超参数，符号是一致的
rho = 0.1
t  = 2

# 计算 Goldstein 条件
def goldstein_condition(alpha, arr, rho = rho):
    condition_1 = (varphi(arr) + rho * alpha * varphi_p(arr)) >= varphi(arr + alpha * d(arr))
    # if not condition_1:
    #     print(f"Condition 1 not satisfied")
    condition_2 = (varphi(arr) + (1 - rho) * alpha * varphi_p(arr)) <= varphi(arr + alpha * d(arr))
    # if not condition_2:
    #     print(f"Condition 2 not satisfied")
    return condition_1, condition_2

def goldstein_cal_step(alpha, arr, rho=rho, t=t, ep=1e-4):
    a = ep
    b = 1
    condition_1, condition_2 = goldstein_condition(alpha, arr, rho)
    while not (condition_1 & condition_2):
        if not condition_1:
            b = alpha
            alpha = (a + b) / 2
        if not condition_2:
            a = alpha
            alpha = t * alpha
        condition_1, condition_2 = goldstein_condition(alpha, arr, rho)
    return alpha

def plot_func(f, x_min=0, x_max=10):
    x = np.linspace(x_min, x_max, 100)
    y = f(x)
    plt.plot(x, y)

# 下面是试图通过图像找步长编写的函数，但是发现人工太慢了...
def plot_goldstein(arr, rho = rho, x_min=0, x_max=5):
    line_1 = lambda alpha: varphi(arr) + rho * alpha * varphi_p(arr)
    line_2 = lambda alpha: varphi(arr) + (1 - rho) * alpha * varphi_p(arr)
    graph_varphi = lambda alpha: varphi(arr + np.tile(alpha.reshape(-1,1), (1, 2)) * d(arr))
    plot_func(line_1, x_min, x_max)
    plot_func(line_2, x_min, x_max)
    plot_func(graph_varphi, x_min, x_max)
    plt.show()

def update_arr(arr, alpha):
    return arr + alpha * d(arr)

def goldstein_steep(arr):
    # 这里这个 1 是我提前通过绘制图像确定的
    alpha = goldstein_cal_step(1, arr)
    while (alpha >= 1e-03):
        """当步长小于 1e-03 时停止迭代"""
        alpha = goldstein_cal_step(1, arr)
        arr = update_arr(arr, alpha)
        print(f"alpha: {alpha}, x: {arr}")
    return arr
```
///

程序输出（在终端的 Python 交互模式下运行，Linux 环境，用的是 python3）：

/// collapse-code
```shell title="程序输出" linenums="1"
$ python3 -i steepGoldstein.py
>>> x = np.array([0,0])
>>> goldstein_steep(x)
alpha: 0.1250875, x: [-0.1250875  0.3752625]
alpha: 0.1250875, x: [-0.12499994  0.34370605]
alpha: 0.50005, x: [-0.15629708  0.34388193]
alpha: 0.1250875, x: [-0.1562523   0.33592016]
alpha: 0.50005, x: [-0.16408062  0.33598723]
alpha: 0.1250875, x: [-0.16406365  0.33397844]
alpha: 0.50005, x: [-0.16602176  0.33400104]
alpha: 0.1250875, x: [-0.16601605  0.33349421]
alpha: 0.50005, x: [-0.16650584  0.33350133]
alpha: 0.1250875, x: [-0.16650405  0.33337345]
alpha: 0.50005, x: [-0.16662656  0.3333756 ]
alpha: 0.1250875, x: [-0.16662602  0.33334334]
alpha: 0.50005, x: [-0.16665667  0.33334397]
alpha: 0.1250875, x: [-0.16665651  0.33333583]
alpha: 0.50005, x: [-0.16666417  0.33333601]
alpha: 0.1250875, x: [-0.16666413  0.33333396]
alpha: 0.50005, x: [-0.16666604  0.33333401]
alpha: 0.1250875, x: [-0.16666603  0.33333349]
alpha: 0.50005, x: [-0.16666651  0.3333335 ]
alpha: 0.1250875, x: [-0.16666651  0.33333337]
alpha: 0.50005, x: [-0.16666663  0.33333338]
alpha: 0.1250875, x: [-0.16666663  0.33333334]
alpha: 0.50005, x: [-0.16666666  0.33333334]
alpha: 0.1250875, x: [-0.16666666  0.33333334]
alpha: 1, x: [-0.16666667  0.33333334]
alpha: 0.06259374999999999, x: [-0.16666667  0.33333333]
alpha: 0.039183593749999995, x: [-0.16666667  0.33333333]
alpha: 0.250075, x: [-0.16666667  0.33333333]
alpha: 0.50005, x: [-0.16666667  0.33333334]
alpha: 0.1250875, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333334]
alpha: 0.09389062499999998, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333333]
alpha: 0.1250875, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333333]
alpha: 0.06259374999999999, x: [-0.16666667  0.33333333]
alpha: 0.5001720825195313, x: [-0.16666667  0.33333334]
alpha: 0.1250875, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333334]
alpha: 0.250075, x: [-0.16666667  0.33333333]
alpha: 0.1250875, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333333]
alpha: 0.250075, x: [-0.16666667  0.33333333]
alpha: 0.1250875, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333333]
alpha: 0.50015, x: [-0.16666667  0.33333333]
alpha: 0.1250875, x: [-0.16666667  0.33333333]
alpha: 1, x: [-0.16666667  0.33333333]
alpha: 0.250075, x: [-0.16666667  0.33333334]
alpha: 0.0003441162109375, x: [-0.16666667  0.33333334]
array([-0.16666667,  0.33333334])
>>> 
```
///

最终的解为： $[-0.16666667,  0.33333334]$ ，即为 $[-1/6,1/3]$ （和手算（由 $H_f(X_0)>0,\nabla f(X_0)=0$ 得到）的一致）

>[!question] 从上面的输出可以看到算法早就收敛了，但是直到步长小于 $0.001$ 才停止，有没有可以解决这一问题的方法？比如早停？ #imcomplete-further-wanted 

>[!example] 已知 Rosenbrock 函数： $f(x)=100(x_2-x_1^2)^2+(1-x_1)^2$ ，求 $\nabla f(x),\nabla^2f(x)$ ，说明 $x^*=[1,1]^T$ 是这个函数的<u>唯一局部极小点</u>，并且 $\nabla^2f(x)$ 在这个点是正定的.

解：

$$\begin{aligned}
&\nabla f=[-400(x_2-x_1^2)x_1-2(1-x_1),200(x_2-x_1^2)]^T\\
&\nabla^2f=\begin{bmatrix}-400x_2+1200x_1^2+2& -400x_1\\ -400x_1 &200\end{bmatrix}
\end{aligned}$$

$$\nabla^2f(x^*)=\begin{bmatrix}802& -400 \\ -400  &200\end{bmatrix}$$

计算得到 $\nabla^2f(x^*)$ 的两个特征值均大于 $0$ ，因此正定；

下面说明唯一性：任何极值点都应当满足 $\nabla f=0$ ，求解得到： $[1,1]^T$ .

>[!warning] 上述， $f$ 并不是一个凸函数：因为 $H_f(X)$ 对于所有点（e.g. $[0,1]$ ）不总是半正定的.
>因此，所求得的 $[1,1]^T$ 不一定是全局最优点.

---

非局部最小值的驻点（一阶导数为 $0$ 的点）称为**鞍点**. 数学含义是： 目标函数在此点上的梯度（一阶导数）值为 0， 但从改点出发的一个方向是函数的极大值点，而在另一个方向是函数的极小值点.

>[!note] 鞍点的充分条件：函数在一阶导数为零处（驻点）的黑塞矩阵为不定矩阵。

>[!example] 已知函数 $f(x)=8x_1+12x_2+x_1^2-2x_2^2$ ，说明其只有一个驻点，并且这个点既不是最小值点，也不是最大值点，而是这个函数的鞍点. 画出 $f$ 的轮廓线.

证明：

$$\begin{aligned}
&\nabla f=[8+2x_1,12-4x_2]^T=0\\
&\nabla^2 f=\begin{bmatrix}2 & 0  \\ 0 & -4\end{bmatrix}
\end{aligned}$$

得到： $[-4,3]^T$ . 然而 $\nabla^2f$ 为不定矩阵，所以 $[-4,3]^T$ 是鞍点.

下面用 Sage 绘制函数 $f$ 的轮廓线：

```sage title="绘制轮廓线" linenums="1"
x1, x2 = var('x1, x2')
f(x1, x2) = 8 * x1 + 12 * x2 + x1^2 - 2 * x2^2
contour_plot(f, (-10, 10), (-10, 10), fill=False, contours=100)
```

![[contours.png|300]]

>[!example]- $a$ 是给定的 $n$ 维向量， $A$ 是给定的 $n$ 阶对称矩阵，计算 $f_1(x)=a^TAx,f_2(x)=x^TAx$ 的梯度和 Hesse 阵.

解：

$$\begin{aligned}
&\nabla f_1(x)=\begin{bmatrix}\sum\limits_{k=1}^{n}A_{k1}a_k & \cdots  & \sum\limits_{k=1}^{n}A_{kn}a_k\end{bmatrix}=a^TA\\
&\nabla^2f_1(x)=0\\
&\\
&f_2(x)=\begin{bmatrix}\sum\limits_{l=1}^{n}\sum\limits_{k=1}^{n}(A_{k1}x_kx_l) & \cdots & \sum\limits_{l=1}^{n}\sum\limits_{k=1}^{n}(A_{kn}x_kx_l)\end{bmatrix}\\
&\nabla f_2(x)=\begin{bmatrix}\end{bmatrix}
\end{aligned}$$

| #imcomplete 

### Newton 迭代法

>[!example] 使用 Newton 法求解： $\min_{x\in \mathbb{R}}\ f(x)=0.5[(x+1)^3+x^2]^2-3$ 的所有极小点.

```sage title="Newton" linenums="1"
x = var('x')
f(x) = 0.5 * ((x + 1)^3 + x^2)^2 - 3
df = diff(f,x);

# 定义 Newton 迭代函数
NewtonIt(x)=x - (f / df)(x);

x = 1;
n_iter = 100
for i in range(n_iter):
    if i < 10:
        print(x)
    x = N(NewtonIt(x), digits=20)
print("...\n最优值为: ", x);
```

程序输出（只打印了前 10 次迭代的结果，但发现很快就收敛了）

```sage
1
0.70238095238095243911
0.48842897036899579621
0.36779232931902688941
0.33099276491496676389
0.32799604485073835525
0.32797749905441364593
0.32797749834862277574
0.32797749834862277574
0.32797749834862277574
...
最优值为:  0.32797749834862277574
```

多元函数的 Newton 法：

考虑： $\min\ f(x)\quad f\in C^2(\mathbb{R}^2)$ .

对于迭代点 $x^k$ ，将 $f$ 在 $x^k$ Taylor 展开得到：

$$f(x)=f(x^k)+\nabla f(x^k)^T(x-x^k)+\frac{1}{2}(x-x^k)^T\nabla^2f(x^k)(x-x^k)+\mathcal{o}(\lVert x-x^k\rVert_2^2)$$

迭代：

$$x^{k+1}\leftarrow x^k-(\nabla^2f(x^k))^{-1}\nabla f(x^k)$$

>[!example] 用最速下降法、 Newton 法和阻尼 Newton 法求解： $\min x_1^2+2x_2^2$ .

Newton 法：

$$\begin{aligned}
&\nabla f=\begin{bmatrix}2x_1 \\ 4x_2\end{bmatrix}\\
&\nabla^2 f=\begin{bmatrix}2 &  0  \\ 0 & 4\end{bmatrix}\\
&\nabla^2f^{-1}=\begin{bmatrix}\frac{1}{2} & 0 \\ 0 & \frac{1}{4}\end{bmatrix}
\end{aligned}$$

因为 $\nabla^2f$ 正定，所以 $f$ 是（强）凸函数.

取 $x^0=[1,1]$ ，计算：

$$x^1=x^0-(\nabla^2f)^{-1}\nabla f(x^0)= \begin{bmatrix}x_1 \\ x_2\end{bmatrix}-\begin{bmatrix}x_1 \\ x_2\end{bmatrix}=0$$

并且此时 $\nabla f=0$ ，所以 $[0,0]$ 是最优解.

下面用带步长的 Newton 方法求解：

```sage title="多元函数 Newton 法"linenums="1"

```

收敛性分析：

$$\lvert \frac{\partial^3{f}}{\partial{x_i}\partial{x_j}\partial{x_l}}\rvert\leq M$$

### 共轭梯度法

共轭梯度法中，每一次迭代的方向都与之前的方向共轭，并且，对于 $\mathbb{R}^n$ 上的无约束严格凸二次优化问题，可以证明至多经过 $n+1$ 次迭代就会收敛.

设 $d_1,d_2\in \mathbb{R}^n,d_1,d_2\neq0$ ， $G$ 为 $n$ 阶对称正定阵，称 $d_1,d_2$ 是 $G$ 共轭的，如果 $d_1^TGd_2=0$ ，特别地，当 $G=I$ 时，称 $d_1,d_2$ 正交.

>[!note] 如果 $d_1,\cdots,d_n\in \mathbb{R}^n$ 两两 $G$ 共轭，则其线性无关.
>证明：对于任意的 $\sum\limits_{i=1}^{n}\alpha_id_i=0$ ，左乘 $d_j^TG$ ，由 $G$ 共轭可得 $\alpha_jd_j^TGd_j=0,1\leq j\leq n$ ，由 $G$ 正定并且 $d_j\neq0$ 可得 $\alpha_j=0,\forall 1\leq j\leq n$ . 所以 $d_1,\cdots,d_n$ 线性无关.

给定一组共轭方向 $d_1,\cdots,d_n$ ，可以据此进行梯度下降法.

**共轭方向法**：

1. 初始化 $x_1,k\leftarrow 1$ ；
2. 当 $\nabla f(x_k)\neq 0$ 时：精确搜索 $\alpha_k=\arg\min f(x_k+\alpha d_k)$ ， $x_{k+1}\leftarrow x_k+\alpha_kd_k,k\leftarrow k+1$ ；

>[!note]- 若在 $\mathbb{R}^n$ 中有一组共轭方向 $d_1,\cdots,d_n$ ，可以证明共轭方向法至多经过 $n$ 步之后 $\frac{1}{2}x^TGx+b^Tx$ 就会收敛，其中 $G$ 为对称正定矩阵. $\frac{1}{2}x^TGx+b^Tx$ 称为严格二次凸函数.
>不妨假设 $k\leq n$ 时， $\nabla f(x_k)\neq 0$ （迭代了 $n-1$ 步仍然不收敛.）
>
>$$\begin{aligned}
>&f(x)=\frac{1}{2}x^TGx+b^Tx\\
>&\nabla f(x)=Gx+b\\
>&\nabla f(x_{k+1})=\nabla f(x_k+\alpha_k d_k)=\nabla f(x_k)+\alpha_kGd_k\\
>&\alpha_k=\arg\min f(x_k+\alpha d_k)\rightarrow \nabla f(x_{k+1})d_k^T=0
>\end{aligned}$$
>
>下面试图证明 $d_k^T\nabla f(x_{n+1})=0,\forall 1\leq k\leq n$ ，从而可以证明 $\nabla f(x_{n+1})=0$ .
>
>考虑：
>
>$$\nabla f(x_{n+1})=\nabla f(x_n)+\alpha_nGd_n=\nabla f(x_{k+1})+\sum\limits_{l=k+1}^{n}\alpha_kGd_k$$
>
>进而：
>
>$$d_k^T\nabla f(x_{n+1})=0,\forall 1\leq k\leq n-1$$
>
>并且： $d_n^T \nabla f(x_{n+1})=0$ ，所以 $\nabla f(x_{n+1})=0$ .

下面讨论如何获取共轭方向，采取“生成”的方法： $d_{k+1}=-\nabla f(x_{k+1})+\beta_kd_k$ ，现在来反推 $\beta_k$ ，然后通过精确搜索得到的步长 $\alpha_k$ .

取初始点 $x_1$ ， $d_1\leftarrow -\nabla f(x_1)$ .

令：

$$d_k^TGd_{k+1}=d_k^TG(-\nabla f(x_{k+1}+\beta_kd_k))=-d_k^TG\nabla f(x_{k+1})+\beta_k d_k^TGd_k=0$$

得到： $\beta_k=\frac{d_k^TG\nabla f(x_{k+1})}{d_k^TGd_k}$ ，所以 $d_{k+1}=-\nabla f(x_{k+1})+\frac{d_k^TG\nabla f(x_{k+1})}{d_k^TGd_k}d_k$ .

精确搜索 $\alpha_k$ ： 

$$d_k^T\nabla f(x_k+\alpha_kd_k)=d_k^T(Gx_k+\alpha_kGd_k-b)=d_k^T\nabla f(x_k)+\alpha_kd_k^TGd_k=0$$

从而 $\alpha_k=-d_k^T \nabla f(x_k)/d_k^TGd_k$ .

记 $\nabla f(x_k)=\gamma_k$ ，注意到

$$d_k^T\gamma_k=(-\nabla f(x_k)+\beta_{k-1}d_{k-1})^T\gamma_k=-\gamma_k^T\gamma_k,\forall k\geq 2$$

（其中 $d_{k-1}^T\gamma_k=0$ 是精确搜索得到的.）并且 $d_1^T\gamma_1=-\gamma_1^T\gamma_1$ .

因此，可以写作： $\alpha_k=\frac{\gamma_k^T\gamma_k}{d_k^TGd_k}$ ， $\beta_k=d_k^TG\nabla f(x_{k+1})/d_k^TGd_k$ .

上面只说明了 $d_{k+1}$ 和 $d_k$ ， $G$ 共轭.

>[!note] 上述算法生成的 $d_1,\cdots,d_n$ 是共轭的. #imcomplete-lack-proofs 
>用归纳法解决. 只需要证明对于任意的 $2\leq k\leq n$ ，对于任意的 $i\leq k$ 有 $d_i^TGd_k=0$ .

上述算法被称为 **Fletch-Reeves （FR）共轭梯度法**.

1. 初始 $x_1$ ， $\gamma_1\leftarrow Gx_1-b,d_1\leftarrow -\gamma_1,k\leftarrow 1$ ；
2. 当 $\gamma_k\neq 0$ 时进行如下更新：

$$\begin{aligned}
&\alpha_k\leftarrow\gamma_k^T\gamma_k/d_k^TGd_k\\
&x_{k+1}\leftarrow x_k+\alpha_kd_k\\
&\gamma_{k+1}\leftarrow \gamma_k+\alpha_kGd_k\\
&\beta_k\leftarrow d_k^TG\gamma_{k+1}/d_k^TGd_k\\
&d_{k+1}\leftarrow -\gamma_{k+1}+\beta_k d_k
\end{aligned}$$

```sage title="FR 共轭梯度法实现" linenums="1"
G = 
f(x_1, x_2) = 1 / 2 * x.transpose() * G * x - b.transpose() * x

x = [1, 1]
gamma = G * x - b
alpha = gamma * gamma
```

>[!example] 用共轭梯度法求解下面的问题： $\min_{x\in \mathbb{R}^2}\ f(x)=x_1^2+x_2^2-4x_1-5x_2-x_1x_2-5$ .

直接考虑 $f=x_1^2+x_2^2-4x_1-5x_2-x_1x_2$ .

$$\begin{aligned}
&f(x)=\frac{1}{2}x^TGx-b^Tx\\
&G=\begin{bmatrix}2 & -1 \\ -1&2\end{bmatrix}\quad  b=\begin{bmatrix}4  \\ 5\end{bmatrix}
\end{aligned}$$

初始化 $x_1=\begin{bmatrix}1  \\  2\end{bmatrix}$ ，则 $\gamma_1=\begin{bmatrix}-4  \\ -2\end{bmatrix}$ ， $d=\begin{bmatrix}4  \\ 2\end{bmatrix}$ .

$\gamma\neq 0$ ，计算得到 $\alpha_1=\frac{5}{6}$ ， $x_2=x+\alpha d=\begin{bmatrix}\frac{13}{3} \\  \frac{11}{3}\end{bmatrix}$ ， $\gamma_2=\begin{bmatrix}1 \\ -2\end{bmatrix}$ ， $\beta_1=\frac{1}{4}$ ， $d_2=\begin{bmatrix}0  \\ \frac{5}{2}\end{bmatrix}$ .

$\gamma\neq 0$ ，计算得到 $\alpha_2=\frac{2}{5}$ ， $x_3=x_2+\alpha_2d=\begin{bmatrix}\frac{13}{3} \\ \frac{14}{3}\end{bmatrix}$ ， $\gamma_3=\begin{bmatrix}0 \\ 0\end{bmatrix}$ ， $\beta_2=0$ ， $d_3=\begin{bmatrix}0 \\ 0\end{bmatrix}$ .

此时 $\gamma=0$ ，算法终止，最优解为： $\begin{bmatrix}\frac{13}{3} \\ \frac{14}{3}\end{bmatrix}$ . 此时 $\min f=\frac{-76}{3}$ .

```python title="FR 共轭梯度法" linenums="1"
import numpy as np

def FR(G, b, x):
    """FR 共轭梯度法"""
    gamma = np.matmul(G, x) - b
    d = -gamma
    while not (gamma == 0).all():
        alpha = np.vdot(gamma, gamma) / np.vdot(d, np.matmul(G, d))
        x = x + alpha * d
        gamma = gamma + alpha * np.matmul(G, d)
        beta = np.vdot(d, np.matmul(G, gamma)) / np.vdot(d, np.matmul(G, d))
        d = -gamma + beta * d
        print('alpha: ', alpha, 'x: ', x,\
             'gamma: ', gamma, 'beta: ', beta, 'd: ', d)
    return x

G = np.array([[2, -1],
              [-1, 2]])
b = np.array([[4], 
              [5]])
x = np.array([[1],
              [2]])

FR(G, b ,x)
```

程序输出：

```
alpha:  0.8333333333333334 x:  [[4.33333333]
 [3.66666667]] gamma:  [[ 1.]
 [-2.]] beta:  0.25 d:  [[0. ]
 [2.5]]
alpha:  0.4 x:  [[4.33333333]
 [4.66666667]] gamma:  [[0.]
 [0.]] beta:  0.0 d:  [[0.]
 [0.]]
[[𝟺.𝟹𝟹𝟹𝟹𝟹𝟹𝟹𝟹] [𝟺.𝟼𝟼𝟼𝟼𝟼𝟼𝟼𝟽]]
```

取 $G$ 为 Hilbert 矩阵， $b=[1,1,\cdots,1]^T$ ，初始点为 $x_0=0$ 取维数 $n=5,8,12,20$ ，记录每次使得误差小于 $10^{-6}$ 的迭代次数.

终止条件为 $\lVert \gamma\rVert_2\leq 10^{-6}$ .

代码如下：

```python title="FR 共轭梯度法迭代次数" linenums="1"
import numpy as np
from numpy import linalg as LA

ep = 1e-6 # 精确度
n_dim_list = [5, 8, 12, 20]

def hilmat(a, b):
    """生成 Hilbert 矩阵"""
    return [[1 / (i + j + 1) for j in range(b)] for i in range(a)]

def FR(G, b, x):
    """FR 共轭梯度法"""
    count = 0;
    gamma = np.matmul(G, x) - b
    d = -gamma
    # 采取 L-2 范数
    while not (LA.norm(gamma) < ep):
        alpha = np.vdot(gamma, gamma) / np.vdot(d, np.matmul(G, d))
        x = x + alpha * d
        gamma = gamma + alpha * np.matmul(G, d)
        beta = np.vdot(d, np.matmul(G, gamma)) / np.vdot(d, np.matmul(G, d))
        d = -gamma + beta * d
        # print('alpha: ', alpha, 'x: ', x,\
        #     'gamma: ', gamma, 'beta: ', beta, 'd: ', d)
        count += 1
    return count

for n in n_dim_list:
    G = np.array(hilmat(n, n))
    b = np.ones(n).reshape(-1 ,1)
    x = np.zeros(n).reshape(-1, 1)
    count, x = FR(G, b, x)
    print('迭代次数: \n', count, '\n', '结果：\n', x, '\n')
```

返回结果：

/// collapse-code
```shell
迭代次数: 
 6 
 结果：
 [[    5.00000021]
 [ -120.0000001 ]
 [  629.99999985]
 [-1120.00000016]
 [  629.99999985]] 

迭代次数: 
 26 
 结果：
 [[-8.00130020e+00]
 [ 5.04071378e+02]
 [-7.56095143e+03]
 [ 4.62052387e+04]
 [-1.38614311e+05]
 [ 2.16236500e+05]
 [-1.68182744e+05]
 [ 5.14841978e+04]] 

迭代次数: 
 309 
 结果：
 [[ 8.46115026e+00]
 [-9.67277295e+02]
 [ 2.66031031e+04]
 [-3.05707186e+05]
 [ 1.79936600e+06]
 [-5.87836224e+06]
 [ 1.05367413e+07]
 [-8.21501978e+06]
 [-3.37319416e+06]
 [ 1.21633461e+07]
 [-9.14671830e+06]
 [ 2.39402896e+06]] 

迭代次数: 
 196 
 结果：
 [[-1.09112145e+01]
 [ 1.04606664e+03]
 [-2.38661253e+04]
 [ 2.19739467e+05]
 [-9.62832640e+05]
 [ 1.98576169e+06]
 [-1.25054640e+06]
 [-1.34104042e+06]
 [ 8.82105153e+05]
 [ 1.68565661e+06]
 [ 3.87555790e+05]
 [-1.30420795e+06]
 [-1.70882582e+06]
 [-5.27666626e+05]
 [ 1.20779165e+06]
 [ 2.00142866e+06]
 [ 9.43916373e+05]
 [-1.43324323e+06]
 [-2.64951603e+06]
 [ 1.88695398e+06]]
```
///