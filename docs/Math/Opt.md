# 依赖和简介

对于范数和矩阵理论的[介绍](MAlg.md#范数).

最优化方法主要分为两个步骤：**优化建模**和**求解**. 优化建模与特定的专业领域有关，本篇专述求解（算法）.

最优化方法的分类：**离散** & **连续**；**有限维** & **无限维**. 本篇考虑的是 $\mathbb{R}^n$ 上的连续有限维优化.

对于 $\mathbb{R}^n$ 中的优化问题. 通常记**标准内积** $x,y\in \mathbb{R}^n,\langle x,y \rangle=\sum\limits_{i=1}^{n}x_iy_i$ ，给定一个[正定](LAlg.md#正定矩阵)对称矩阵 $P$ ，记 $\langle x,y \rangle_P=x^TPy$ . 并可以定义**矩阵内积** $A,B\in \mathbb{R}^{m\times n}, \langle A,B \rangle=\sum\limits_{i=1}^{m}\sum\limits_{j=1}^{n}a_{ij}b_{ij}=\text{tr}(A^TB)=\text{tr}(B^TA)$ .

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

>[!summary] 自查表
>- 凸集、凸组合、凸包定义；

## 凸集

凸优化中的可行集是**凸集**：对于 $D\subset \mathbb{R}^n$ ，称 $D$ 为凸集，如果 $\forall x,y\in D,\forall \lambda\in(0,1)$ ， $\lambda x+(1-\lambda)y\in D$ . 定义**凸组合**：对于 $x_i\in \mathbb{R}^n$ ， $\alpha_i\in \mathbb{R}^n,\alpha_i>0,\sum\limits_{i=1}^{m}\alpha_i=1$ ， $,i=1,\cdots,m$ ，称 $\sum\limits_{i=1}^{m}\alpha_ix_i$ 为 $x_1,\cdots,x_m$ 的凸组合. 定义**凸包**： $D\subset \mathbb{R}^n$ ，称 $H(D)=\{D\text{ 中有限多个点的凸组合}\}$ 为 $D$ 的凸包，或者记为 $\text{conv}\ D$.

>[!warning] 凸组合中 $\alpha_i>0$ ，而不是 $\geq$ .

注意上述对于凸包 $H(D)$ 的定义并不要求 $D$ 为凸集，但若 $D$ 为凸集则有以下结论：

>[!note]- 设 $D$ 为凸集，则 $D$ 中任意 $m$ 个点的凸组合都在 $D$ 中. 也即有 $H(D)\subset D$ .
>证明：用归纳法证明， $n=2$ 是显然成立，设 $n=k$ 时也成立，对于 $n=k+1$ ： 设 $x_1,\cdots,x_{k+1}$ ，注意到 
>
>$$\begin{aligned}
>\sum\limits_{i=1}^{k+1}\alpha_ix_i &=\alpha_{k+1}x_{k+1}+\sum\limits_{i=1}^{k}\alpha_ix_i\\
>&=\alpha_{k+1}x_{k+1}+(1-\alpha_{k+1})\sum\limits_{i=1}^{k}\frac{\alpha_i}{1-\alpha_{k+1}}x_i
>\end{aligned}$$ 
>
>注意到后者为凸组合包含于 $D$ 中，从而得证.

由定义易得：

>[!note] 一族凸集的交仍然为凸集.

进而可以证明：

>[!note]- 对于 $D\subset \mathbb{R}^n$ ， $H(D)$ 是所有包含 $D$ 的凸集中最小的凸集.
>证明：
>
>$$H(D)=\left\{\sum\limits_{i=1}^{k}\lambda_ix_i:k\in \mathbb{N},\lambda_i>0,\sum\limits_{i=1}^{k}\lambda_i=1,x_i\in D\right\}$$
> 
>对于任意的 $\sum\limits_{i=1}^{k_1}\lambda^1_ix^1_i,\cdots,\sum\limits_{i=1}^{k_m}\lambda^m_ix^m_i$ ，考虑 
>
>$$\sum\limits_{j=1}^{m}\alpha_j\left(\sum\limits_{i=1}^{k_j}\lambda^j_ix_i^j\right)=\sum\limits_{j=1}^{m}\sum\limits_{i=1}^{k_j}\alpha_j\lambda_i^jx_i^j$$ 
>
>注意到 
>
>$$\sum\limits_{j=1}^{m}\sum\limits_{i=1}^{k_j}\alpha_j\lambda_i^j=\sum\limits_{j=1}^{m}\alpha_j\sum\limits_{i=1}^{k_j}\lambda_i^j=\sum\limits_{j=1}^{m}\alpha_j=1$$ 
>
>从而可知 $H(D)$ 为凸集，并且 $H(D)\supset D$ .
>
>下面证明 $H(D)$ 为包含 $D$ 的最小凸集：设 $\{B_i\}_{i\in I},B_i\supset D$ 为包含 $D$ 的凸集全体，全体凸集的并 $\bigcap_{i\in I}B_i$ 仍然为包含 $D$ 的凸集，所以 $H(D)\supset \bigcap_{i\in I}B_i$ 
>
>另一方面注意到 $D\subset \bigcap_{i\in I}B_i$ ，所以由凸包的定义可得：
>
>$$H(D)\subset H(\cap_{i\in I}B_i)\subset \cap_{i\in I}B_i$$ 
>
>所以 $H(D)=\bigcap_{i\in I}B_i$ .

注意：上面这一定理没有限制 $D$ 本身是不是凸集.

>[!note]- 设 $D\subset \mathbb{R}^n$ ， $\forall x\in H(D)$ ，其可以表示为 $D$ 中至多 $n+1$ 个点的凸组合.
>证明：不妨设 $x=\sum\limits_{i=1}^{N}\lambda_ix_i,x_i\in D$ 并且 $\sum\limits_{i=1}^{N}\lambda_i=1,\lambda_i>0$ . 不妨设 $N>n+1$ ，则对于 $x_i,1\leq i\leq N$ ，存在不全为 $0$ 的数 $\mu_i,2\leq i\leq N,\sum\limits_{i=2}^{N}\mu_i(x_i-x_1)=0$ ，令 $\mu_1=-\sum\limits_{i=2}^{N}\mu_i$ ，则有 $\sum\limits_{i=1}^{N}\mu_ix_i=0$ . 断言： $\mu_i,1\leq i\leq N$ 中至少有一个正数，若不然 $\mu_1$ 则为正数，矛盾！下面取 $\alpha\geq0$ ，使得 
>
>$$x=\sum\limits_{i=1}^{N}\lambda_ix_i-\alpha \sum\limits_{i=1}^{N}\mu_ix_i=\sum\limits_{i=1}^{N}(\lambda_i-\alpha \mu_i)x_i$$ 
>
>因为 $\lambda_i>0$ ，所以对于 $\mu_i,1\leq i\leq N$ 中的正项（已经证明至少存在一个） $\{\mu_{i_1},\cdots \mu_{i_k}\}$可以取 $\alpha=\min\{\frac{\lambda_{i_m}}{\mu_{i_m}}:1\leq m\leq k\}=\frac{\lambda_j}{\mu_j}$ ，进而 $x=\sum\limits_{i\neq j}^{}(\lambda_i-\alpha \mu_i)x_i$ ，由归纳法即可得到结论.
>^AtMostnplus1

除了一族凸集的交仍然为凸集外，不难证明以下**保凸运算**：

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

**线性分式函数**则是由透视函数和仿射函数复合定义的：设 $g:\mathbb{R}^n\rightarrow \mathbb{R}^{m+1}$ ： 

$$g(x)=\begin{bmatrix}A \\ c^T\end{bmatrix}x+\begin{bmatrix}b  \\ d\end{bmatrix}$$

其中 $A\in \mathbb{R}^{m\times n},c\in \mathbb{R}^{n},b\in \mathbb{R}^m,d\in \mathbb{R}$ ，定义线性分式函数： $f=P\circ g$ ，即： 

$$f(x)=(Ax+b)/(c^Tx+d)$$

下面定义凸集的**分离**：设 $D_1,D_2\subset \mathbb{R}^n$ 是两个凸集，如果存在 $\alpha\in \mathbb{R}^n,\alpha\neq0,\beta\in \mathbb{R}$ ，使得 

$$\begin{aligned}
&D_1\subset H^+=\{x\in \mathbb{R}^n:\alpha^Tx\geq \beta\}\\
&D_2\subset H^-=\{x\in \mathbb{R}^n:\alpha^Tx\leq \beta\}
\end{aligned}$$

则称**超平面** $H=\{x\in \mathbb{R}^n:\alpha^Tx=\beta\}$ 为 $D_1,D_2$ 的**分离**. 若 $D_1,D_2$ 中取 $>,<$ 则称 $H$ 为 $D_1,D_2$ 的**严格分离**. ^SeperateHyperplane

类似于二维或者三维上的凸集，有下面的存在唯一最近点定理：

>[!note]- 设 $D\subset \mathbb{R}^n$ 是非空<u>闭</u>凸集， $y\notin D$ ，则 1) 存在唯一 $\bar{x}\in D$ 满足 $\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ ；2) $\bar{x}:\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ 当且仅当 $(x-\bar{x})^T(\bar{x}-y)\geq0$ .
>证明：利用连续函数可以在紧集（在 $\mathbb{R}^n$ 中，等价于有界闭集）中可以取得最小值. #imcomplete %%这里最好能更新一下[实数理论](R.md)%% 首先取 $z\in D$ . 取 $R=\lVert y-z\rVert$ ，从而可得 $C=\bar{B}(z,R)\cap D$ 为 $\mathbb{R}^n$ 上的有界闭集，又 $\lVert \cdot\rVert$ 为连续函数（事实上，一致连续），从而可在 $C$ 上取得 $\inf$ ，记 $\lVert \bar{x}-y\rVert=\inf_{x\in C}\lVert x-y\rVert$ ，当 $x\notin C$ 时， $\lVert x-y\rVert\geq R\geq \lVert \bar{x}-y\rVert$ 因此 $\lVert \bar{x}-y\rVert=\inf_{x\in D}\lVert x-y\rVert$ .
>对于唯一性的证明：考虑 
>
>$$\begin{aligned}
>\left\lVert \frac{1}{2}\bar{x}-\frac{1}{2}y-\frac{1}{2}y+\frac{1}{2}\bar{x}'\right\rVert &\leq \frac{1}{2}\left\lVert \bar{x}-y\right\rVert+\frac{1}{2}\lVert \bar{x}'-y\rVert\\
>&=\lVert \bar{x}-y\rVert
>\end{aligned}$$
>
>并且 
>
>$$\left\lVert \frac{\bar{x}+\bar{x}'}{2}-y\right\rVert\geq\lVert \bar{x}-y\rVert$$
>
>则上不等式可取等，满足取等条件： $$\frac{1}{2}(\bar{x}-y)=\frac{\alpha}{2}(\bar{x}'-y)$$ 取模长可得 $\alpha=1$ ，从而可得 $\bar{x}=\bar{x}'$ .
>
>对 2) ， $\rightarrow$ 观察可得 
>
>$$\begin{aligned}
>\lVert x-y\rVert^2 &=\lVert x-\bar{x}+\bar{x}-y\rVert^2\\
>&=\lVert x-\bar{x}\rVert^2+\lVert \bar{x}-y\rVert^2+2(x-\bar{x})^T(\bar{x}-y)\\
>\end{aligned}$$
>
>但这一形式无法解决问题，因此考虑利用凸集的性质，和上面的 
>
>$$\begin{aligned}
>\lVert \lambda x+(1-\lambda)\bar{x}-y\rVert^2&=\lVert \bar{x}-y+\lambda(x-\bar{x})\rVert^2\\
>&=\lVert \bar{x}-y\rVert^2+\lambda^2\lVert x-\bar{x}\rVert^2\\
>&+2\lambda(x-\bar{x})^T(\bar{x}-y)\\
>&\geq \lVert \bar{x}-y\rVert^2
>\end{aligned}$$
>
>从而可以得到
>
>$$\lambda^2\lVert x-\bar{x}\rVert^2+2\lambda(x-\bar{x})^T(\bar{x}-y)\geq0$$
>
>其中 $\lambda\in(0,1)$ ，因此 $(x-\bar{x})^T(\bar{x}-y)\geq0$ . 利用参数的任意性求解，和 [[#^AtMostnplus1]] 相似.
>
>$\Leftarrow$ ：直接由
>
>$$\begin{aligned}\lVert x-y\rVert^2 &=\lVert x-\bar{x}+\bar{x}-y\rVert^2\\ 
>&=\lVert x-\bar{x}\rVert^2+\lVert \bar{x}-y\rVert^2+2(x-\bar{x})^T(\bar{x}-y)\\
>\end{aligned}
>$$ 
>
>得到结论.

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

设 $f:D\subset \mathbb{R}^n\rightarrow \mathbb{R}$ ，其中 $D$ 为凸集，称 $f$ 是 $D$ 上的**凸函数**，如果对于任意的 $x,y\in D,\lambda\in (0,1)$ 有： $f(\lambda x+(1-\lambda)y)\leq \lambda f(x)+(1-\lambda)f(y)$ .

当被优化函数为凸函数时称为凸优化问题，其具有如下的良好性质：

>[!note] 凸函数的局部最优点即为全局最优点.

下面给出如何判断一个函数是凸函数. 从 $C^1,C^2$ 分别考虑.

>[!note] 📍 设 $f(x)$ 是定义在凸集 $D$ 上的连续可微函数，则 1) $f$ 为 $D$ 上凸函数的充分必要条件是 $f(y)\geq f(x)+\nabla f(x)^T(y-x),\forall x,y\in D$ ；2) $f$ 是 $D$ 上的严格凸函数的充要条件是 $f(y)>f(x)+\nabla f(x)^T(y-x),\forall y,x\in D,x\neq y$ .
>证明： $\Rightarrow$ ：对于任意的 $x,y\in D,\lambda\in(0,1)$ 
>
>$$\begin{aligned}
>&f(\lambda x+(1-\lambda)y)\leq \lambda f(x)+(1-\lambda)f(y)\\
>&\frac{f(y+\lambda(x-y))-f(y)}{\lambda}\leq f(x)-f(y)
>\end{aligned}$$
>
>令 $\lambda\rightarrow 0$ 可得： $\nabla f(y)^T(x-y)\leq f(x)-f(y)$ .
>
>$\Leftarrow$ ：对于任意的 $x,y\in D,\lambda\in(0,1)$ ，取 $z=\lambda x+(1-\lambda)y$ ，从而可以得到：
>
>$$\begin{aligned}
>&f(z)+\nabla f(z)^T(y-z)\leq f(y)\quad (1)\\
>&f(z)+\nabla f(z)^T(x-z)\leq f(x)\quad (2)\\
>\end{aligned}$$
>
>$\lambda(1)+(1-\lambda)(2)$ 可以得到：
>
>$$f(z)\leq \lambda f(y)+(1-\lambda)f(y)$$
>
>对于严格凸的情形， $\Leftarrow$ 是类似的，但对于 $\Rightarrow$ 不能确定是严格不等. 为此，不妨假设 $\exists x,y\in D$ 使得 $f(y)=f(x)+\nabla f(x)^T(y-x)$ . 因此可以得到：
>
>$$\begin{aligned}
>\frac{f(y)+f(x)}{2}&=f(x)+\nabla f(x)^T\left(\frac{x+y}{2}-x\right)\\
>&\geq f\left(\frac{x+y}{2}\right)
>\end{aligned}$$
>
>矛盾！因此取严格不等.

因此有推论：

>[!note] $f$ 为定义在凸集 $D$ 上的一阶连续可微函数，则 $x$ 为 $D$ 的全局最优点当且仅当 $\nabla f(x)=0$ .

>[!note] 设 $f(x)$ 是<u>非空开凸集</u> $D\subset \mathbb{R}^n$ 上的<u>二阶连续可微</u>函数，则 1) $f$ 是 $D$ 上的凸函数的充要条件是 $\nabla^2f(x)$ 在 $D$ 中<u>半正定</u>；2) 若 $\nabla^2f(x)$ 在 $D$ 中正定，则 $f(x)$ 是 $D$ 上的严格凸函数.

下面讨论凸函数的哪些运算仍然是凸函数.

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

设 $\text{rank}(A)=m,b\geq0$ ，并且 $m\leq n$ . 

线性规划的可行域是一个**多面体**，为凸集.

可以通过引入变量的方式以将非标准形式的线性规划转化为标准形式，e.g. 满足约束条件 $x\ge 0$ .

由 $\text{rank}(A)=m$ ，设 $A=[B\ N]$ ， $B$ 为 $m$ 阶非奇异矩阵，相应地令 $x=\begin{bmatrix}x_B & x_N\end{bmatrix}$ 从而可得 $Ax=Bx_B+Nx_N=b$ ，从而 $x_B=B^{-1}b-B^{-1}Nx_N$ ，所以 $Ax=b$ 有一解 $\begin{bmatrix}B^{-1}b\\ 0\end{bmatrix}$ ，称为**基本解**；如果 $B^{-1}b\geq0$ ，则 $\begin{bmatrix}B^{-1}b\\ 0\end{bmatrix}$ 即为该线性规划问题的解，称为**基本可行解**. 

>[!warning] 提醒
>$A$ 中的 $m$ 阶非奇异矩阵可能有多个，所以可能有多个基本可行解，此外注意，将 $A$ 写作 $[B,N]$ 只是方便表示，实际计算时，只需要确定 $A$ 中的 $m$ 个线性无关列对应的列索引（基指标）即可，下面的所有表示都是如此.

在处理简单的二维线性规划问题时，极值一般都在多边形（多面体）的顶点处取得，在线性规划中也有这一结论，但首先需要明确顶点的定义.

定义**顶点**（极点）：设 $S\subset \mathbb{R}^n$ 是凸集，如果<u>存在</u> $\lambda\in(0,1),y,z\in S$ ， $x=\lambda y+(1-\lambda)z\Rightarrow x=y=z$ .

>[!example]- 闭球体 $S:\{x:x^Tx=1\}$ 的顶点全体为 $\partial{S}$ .

>[!example]- $\{x:x_1+x_2+x_3\leq1,x_i\geq0,i=1,2,3\}$ 的顶点为 $(1,0,0)^T,(0,1,0)^T,(0,0,1)^T$ .

>[!note] $x$ 是可行域 $F=\{x:Ax=b,x\geq0\}$ 的一个顶点的充要条件是 $x$ 是 LP 标准形式的一个基本可行解 $\begin{bmatrix}B^{-1}b\\ 0\end{bmatrix}$ .

由上结论，依据 $B^{-1}$ 为从 $A$ 的线性无关列中选取而组成的可知，线性规划的可行域 $F$ 的顶点有限. 因此可以通过穷举的方法找到基本可行解，但是否是最优解？需要进一步讨论.

>[!warning] 此处，<u>基本可行解</u>等同于顶点.
>可行解不一定是顶点，在可行域 $F$ 中.

设 $D$ 是一个凸集， $d$ 是一个向量，如果 $\forall x\in D,\alpha\geq0$ ，都有 $x+\alpha d\in D$ 则称 $d$ 为 $D$ 的一个**方向**.

下面则是两个多面题理论的定理，从直观上对于可行域和顶点有一个感知.

>[!note] 若 $F$ 有界，则 $F=\{F\text{ 的顶点的凸组合}\}$ .

>[!note] 若 $F$ 无界，则任一可行域中的点 $x$ 都可以表示为 $x=\sum\limits_{i=1}^{k}\alpha_iv_i+\alpha d$ ，其中 $\sum\limits_{i=1}^{k}\alpha_i=1,\alpha_i\geq0$ ， $v_i$ 为 $F$ 的顶点， $\alpha\geq0$ ， $d$ 为 $F$ 的一个方向.

最后，可以证明最优解为顶点，即为基本可行解.

>[!note] 若线性规划标准形式有解，则其必然在可行域 $F$ 的某个<u>顶点</u>处达到最优值.

自然想要知道，是否存在一种算法能够求解顶点.

## 单纯形算法

$$\begin{aligned}
&\min\ c^Tx\\
&s.t.\ Ax=b\\
&\quad\quad x\geq0
\end{aligned}$$

设 $A\in \mathbb{R}^{m\times n},b\ge0,\text{rank}(A)=m\leq n$ ，

设 $A=[B\ N]$ ，其中 $\text{rank}(B)=m$ ，称 $B$ 为**基矩阵**， $N$ 为**非基阵**. 并记 $B$ 和 $N$ 的列标号为**基指标**和**非基指标**. 按照基、非基指标，可以将 $x$ 划分为 $\begin{bmatrix}x_B \\ x_N\end{bmatrix}$ ，其中 $x_B,x_N$ 分别称为**基变量**和**非基变量**. 

单纯形算法提供了一种从基本可行解转换到另一个基本可行解的方法，直到达到最优解.

为理解单纯形算法，需要分析两点：1) 如何判定达到最优解；2) 如何变换基本可行解.

首先有如下的最优解辨别条件：

>[!note] 设 $x=\begin{bmatrix}B^{-1}b \\ 0\end{bmatrix}$ 为线性规划问题的一个基本可行解，当 $\Delta=c_N-c_BB^{-1}N\ge0$ 时 $x$ 为最优解.
>证明：设 $x'=\begin{bmatrix}x_B \\ x_N\end{bmatrix}$ 为线性规划问题的一个可行解，其中 $x_B,x_N$ 是按照 $x$ 的 $B,N$ 划分的，并且注意到 $Bx_B+Nx_N=b\Rightarrow x_B=B^{-1}(b-Nx_N)$
>
>则有：
>
>$$\begin{aligned}
>c_B^Tx_B+c_N^Tx_N&=c_B^TB^{-1}b+(c_N^T-c_B^TB^{-1}N)x_N\\
>&\ge c_B^TB^{-1}b
>\end{aligned}$$
>
>注意这里用到了 $x\ge0$ ，即标准线性规划问题.

单纯形算法步骤如下：

1. 初始化<u>基本可行解</u> $x_0$ ，确定 $A$ 中的基阵 $B$ 和非基阵 $N$ ；基指标 $I_B=\{i_1,\cdots,i_m\}$ ，非基指标 $I_N=[n]\backslash I_B$ .
2. 当 $\Delta=c_N^T-c_B^TB^{-1}N\not\ge0$ 时：
    1. 求非基指标 $k:c_k-c_B^TB^{-1}a_k=\min\{c_i-c_B^TB^{-1}a_i:i\in I_N\}$ ；
    2. 求基指标 $i_r:\frac{(B^{-1}b)_{i_r}}{(B^{-1}a_k)_{i_r}}=\min\left\{\frac{(B^{-1}b)_{i_j}}{(B^{-1}a_k)_{i_j}}:1\leq j\leq m\right\}$ ；
    3. 交换 $k$ 和 $i_r$ ，得到新的基阵 $B$ 和非基阵 $N$ ；
3. 输出 $B^{-1}b$ .

原始单纯形算法的缺点在于 $B^{-1}$ 需要从头计算. 而实际上每一次只修改了 $B$ 的一列.

### 修正单纯形算法：

单纯形表如下：

|       | $x_B^T$ | $x_N^T$              |           |
| ----- | ------- | -------------------- | --------- |
|       | $0$     | $c_N^T-c_B^TB^{-1}N$ |           |
| $I_B$ | $I$     | $B^{-1}N$            | $B^{-1}b$ |

1. 初始化<u>基本可行解</u> $x_0$ ，确定 $A$ 中的基阵 $B$ 和非基阵 $N$ ；基指标 $I_B=\{i_1,\cdots,i_m\}$ ，非基指标 $I_N=[n]\backslash I_B$ .
2. 当 $\Delta=c_N^T-c_B^TB^{-1}N\not\geq0$ 时：
    1. 求非基指标 $k:c_k-c_B^TB^{-1}a_k=\min\{c_i-c_B^TB^{-1}a_i:i\in I_N\}$ ；
    2. 求基指标 $i_r:\frac{(B^{-1}b)_{i_r}}{(B^{-1}a_k)_{i_r}}=\min\left\{\frac{(B^{-1}b)_{i_j}}{(B^{-1}a_k)_{i_j}}:1\leq j\leq m\right\}$ ；
    3. 以 $(B^{-1}a_{k})_{i_r}$ 为主元素对于单纯形表进行 Gauss - Jordan 消元，并将 $k$ 替换 $i_r$ 作为基指标.
3. 输出 $B^{-1}b$ .

使用 Python 中的 `scipy` 实现单纯形算法如下，注意 `scipy 1.11.0` 之后 `simplex` 就被放弃，因为 `highs` 更高效.

格式为：

$$\begin{aligned}
&\min\quad c^Tx\\
&s.t.\quad\ A_{ub}x\leq b_{ub}\\
&\qquad \quad A_{eq}x=b_{eq}\\
&\qquad \quad l\leq x\leq u
\end{aligned}$$

下面的实现，习惯上把转化为限制条件是等式的情况.

```python linenums="1" title="单纯形算法"
 import numpy as np
 from scipy.optimize import linprog
 
 c = np.array([2, -3, 0, 0])
 A_eq = np.array([[-1, 1, 1, 0],
               [1, 1, 0, 1]])
 b_eq = np.array([6, 4])
 
 solu = linprog(c, A_eq=A_eq, b_eq=b_eq)
 print(solu) 
```

/// collapse-code
```shell linenums="1" title="输出"
# 我没搞懂为什么 scipy 版本一样， Linux 的 Python3 (3.11.5) 和 Conda 的 Python (3.11.5) 跑出来的结果不同

# scipy==1.12.0
$ python3 simplex_method.py 
     con: array([3.97332833e-10, 7.94608823e-11])
     fun: -11.999999999208926
 message: 'Optimization terminated successfully.'
     nit: 4
   slack: array([], dtype=float64)
  status: 0
 success: True
       x: array([4.29208920e-11, 4.00000000e+00, 2.00000000e+00, 1.12695494e-10])

# scipy==1.12.0
(base) $ python simplex_method.py
       message: Optimization terminated successfully. (HiGHS Status 7: Optimal)
        success: True
         status: 0
            fun: -12.0
              x: [ 0.000e+00  4.000e+00  2.000e+00  0.000e+00]
            nit: 3
          lower:  residual: [ 0.000e+00  4.000e+00  2.000e+00  0.000e+00]
                 marginals: [ 5.000e+00  0.000e+00  0.000e+00  3.000e+00]
          upper:  residual: [       inf        inf        inf        inf]
                 marginals: [ 0.000e+00  0.000e+00  0.000e+00  0.000e+00]
          eqlin:  residual: [ 0.000e+00  0.000e+00]
                 marginals: [-0.000e+00 -3.000e+00]
        ineqlin:  residual: []
                 marginals: []
 mip_node_count: 0
 mip_dual_bound: 0.0
        mip_gap: 0.0
```
///

下面用 Python 编程单纯形算法.

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

### 两阶段法



### M 法

### 对偶单纯性法

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

>[!example]- 使用 Goldstein 准则求 $\varphi(t)=-2t^3+21t^2-60t+50$ 在 $t_0=0.5$ 的一个步长， $\rho=0.1$ .
>解：优化函数为 $\varphi(t)$ ，并设置超参树 $\rho=0.1$ . $\varphi'(t)=-6t^2+42t-60$ ， $\varphi'(0.5)<0$ ，因此下降方向为 $d=+1$ .  [[2422We121404]]
>
>因此有如下的 Goldstein 准则：
>
>$$\begin{aligned}
>&\varphi(t_0+\alpha)\leq \varphi(t_0)+\rho \alpha \varphi'(t_0)\\
>&\varphi(t_0+\alpha)\geq \varphi(t_0)+(1-\rho)\alpha \varphi'(t_0)\\
>\end{aligned}$$

### 黄金分割法

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

程序运行输出（注：输出时限制了小数点后的位数（计算时没有，按照默认位数），并打印了每一次迭代的情况）：

**结果**：在限制 $\epsilon=1\times 10^{-6}$ ，最终的近似极小值为 $1.27\times 10^{-7}$ ，接近 $0$ .

另一个使用该函数的例子：

/// collapse-code
```python
import matplotlib.pyplot as plt
import numpy as np
import golden_search

f = lambda x: - (np.sin(x)) ** 6 * np.tan(1-x) * np.exp(30 * x)

x = np.linspace(0, 1, 100)

# 这里打印了函数，确认其是单峰的
# plt.plot(x, f(x))
# plt.xlabel('x')
# plt.ylabel('f(x)')
# plt.grid(True)
# plt.show()

a = 0.0
b = 1
x_min, min_value = golden_search.golden_section_search(f, a, b)
print("极大值点: ", x_min)
print("极大值: ", - min_value)
```
///

结果：在限制 $\epsilon=1\times 10^{-6}$ ，极大值约为为 $4.11\times10^{10}$ .

## Wolfe

$$f(x_k+\alpha d_k)=f(x_k)+\alpha\nabla^Tf(x_k)d_k+\frac{\mathcal{o}(\alpha)}{\alpha}$$

注意到右式的线性部分： $f(x_k)+\alpha\nabla^Tf(x_k)d_k$ ，考虑： 

**Wolfe 条件**：包含 Armijo 条件和曲率条件：

Armijo: $f(x_k+\alpha d_k)\leq f(x_k)+c_1\alpha d_k^T\nabla f(x_k),c_1\in(0,1)$ 该条件保证 $f(x_k+\alpha d_k)$ 取得的值比 $f(x_k)$ 要小；

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

下面来说明共轭方向法求解严格二次凸函数时的良好性质：最多进行 $n$ 次迭代（使用 $n$ 次共轭方向）之后收敛. 为证明这点，根据凸函数的性质以及 $\mathbb{R}^n$ 为凸集，只需要说明经过 $n$ 次迭代之后一定有 $\nabla f=0$ ，为此不妨设 $\nabla f(x_k)\neq 0,\forall 1\leq k\leq n$ ，进而证明 $d_{i}^T\nabla f(x_{n+1}),\forall 1\leq k\leq n$ ，利用 $d_i,1\leq i\leq n$ 线性无关得到结论.

>[!note] 📍 若在 $\mathbb{R}^n$ 中有一组共轭方向 $d_1,\cdots,d_n$ ，可以证明共轭方向法至多经过 $n$ 步之后 $\frac{1}{2}x^TGx+b^Tx$ 就会收敛，其中 $G$ 为对称正定矩阵. $\frac{1}{2}x^TGx+b^Tx$ 称为严格二次凸函数.
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
>$$\nabla f(x_{n+1})=\nabla f(x_n)+\alpha_nGd_n=\nabla f(x_{k+1})+\sum\limits_{l=k+1}^{n}\alpha_lGd_l$$
>
>进而：
>
>$$d_k^T\nabla f(x_{n+1})=0,\forall 1\leq k\leq n-1$$
>
>并且： $d_n^T \nabla f(x_{n+1})=0$ ，所以 $\nabla f(x_{n+1})=0$ ，因为 $d_i,i=1,\cdots,n$ 线性无关.  

下面讨论如何获取共轭方向，对于严格凸二次函数 $f(x)=\frac{1}{2}x^TGx-b^Tx$ .

采取“生成”的方法：令 $d_{k+1}=-\nabla f(x_{k+1})+\beta_kd_k$ ，现在来反推 $\beta_k$ ，然后通过精确搜索得到的步长 $\alpha_k$ .

取初始点 $x_1$ ， $d_1\leftarrow -\nabla f(x_1)=-G_1x_1+b$ .

一般地有：

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

因此由之前的讨论可以得到下面的结论：

>[!note] 用 FR 共轭梯度法求解无约束严格凸二次规划 $\min\frac{1}{2}x^TGx-b^Tx$ ，至多 $n$ 步一定得到最优解. 其中 $G\sim s^{++}(n)$ .

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
    return x, count

G = np.array([[2, -1],
              [-1, 2]])
b = np.array([[4], 
              [5]])
x = np.array([[1],
              [2]])

FR(G, b ,x)
```

[[2422We120801]]

程序输出：

/// collapse-code
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
///

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

$n=5,8,12,20$ 每一次的迭代次数为 $6,26,309,196$ ，对应达到精确度的最优解如上.

### 拟 Newton 法

Newton 法：

$$x_{k+1}=x_k-(\nabla^2f(x_k))^{-1}\nabla f(x_k)$$

终点在于如何求解 $\nabla^2f(x_k)^{-1}$ .

拟 Newton 法用一个更容易求得的 $n$ 阶方阵 $H_k$ 代替 $\nabla^2f(x_k)^{-1}$ .

#### DFR 算法

$$\begin{aligned}
&\nabla f(x)\approx \nabla f(x_k)+\nabla^2f(x_k)(x-x_k)\\
&\nabla f(x_{k-1})\approx \nabla f(x_k)+\nabla^2f(x_k)(x_{k-1}-x_k)\\
&x_{k-1}-x_k\approx \nabla^2f(x_k)^{-1}(\nabla f(x_{k-1})-\nabla f(x_k))
\end{aligned}$$

现在用一个 $n$ 阶矩阵 $H_k$ 替代上式，得到一个等式：

$$\begin{aligned}
&x_{k-1}-x_k=H_k(\nabla f(x_{k-1})-\nabla f(x_k))\\
&s_{k-1}=H_ky_{k-1}
\end{aligned}$$

称为**拟 Newton 方程**，下面讨论 $H_k$ 的具体形式.

设 $H_k=H_{k-1}+E_k$ ，从而：

$$\begin{aligned}
&s_{k-1}=H_{k-1}y_{k-1}+E_ky_{k-1}\\
&E_ky_{k-1}=s_{k-1}-H_{k-1}y_{k-1}
\end{aligned}$$

设 $E_k$ 为一个秩为 $2$ 的矩阵，其可以被表示为：

$$\begin{aligned}
&E_k=\alpha_kuu^T+\beta_kvv^T\\
&\alpha_kuu^Ty_{k-1}+\beta_kvv^Ty_{k-1}\overset{结合律}{=}\alpha_k(u^Ty_{k-1})u+\beta_k(v^Ty_{k-1})v\\
&=s_{k-1}-H_{k-1}y_{k-1}
\end{aligned}$$

然后令：

$$\left\{\begin{aligned}
&\alpha_k(u^Ty_{k-1})=1\\
&u=s_{k-1}
\end{aligned}\right.\quad\left\{\begin{aligned}
&\beta_k(v^Ty_{k-1})=-1\\
&v=H_{k-1}y_{k-1}
\end{aligned}\right.$$

进而得到：

$$E_k=\frac{s_{k-1}s^T_{k-1}}{s_{k-1}^Ty_{k-1}}-\frac{H_{k-1}y_{k-1}y^T_{k-1}H_{k-1}}{y^T_{k-1}H_{k-1}y_{k-1}}$$

DFR 算法如下：

对于 $\min_{x\in \mathbb{R}}\ f(x),\quad f\in C^2(\mathbb{R})$ .

1. 初始化 $x_0$ 和对称正定阵 $H_0$ （通常取 $E$ ）， $d_0\leftarrow -H_0\nabla f(x_0),k\leftarrow 0$ ；
2. 当 $\nabla f(x_0)\neq 0$ 时：由一维精确搜索确定 $\alpha_k$ ，更新 $x_{k+1}\leftarrow x_k+\alpha_kd_k$ ， $s_k\leftarrow x_{k+1}-x_k$ ， $y_k\leftarrow \nabla f(x_{k+1})-\nabla f(x_k)$ ， $H_{k+1}\leftarrow H_k+\frac{s_ks_k^T}{s_k^Ty_{k}}-\frac{H_{k}y_{k}y_{k}^TH_{k}}{y_{k}^TH_{k}y_{k}}$ ， $d_{k+1}\leftarrow -H_{k+1}\nabla f(x_{k+1})$ ， $k\leftarrow k+1$ ；

称 $H_k$ 为 DFP 校正矩阵.

其中 $\alpha_k$ 通常由求解方程： $d_k^T\nabla f(x_k+\alpha d_k)=0$ 得到，或者写作（以二元为例）：

>[!note] 由精确搜索步长的 DFP 算法产生的矩阵序列 $\{H_k\}_k$ 对称正定.

算法实现（以二元函数为例）：

```python linenums="1"
import numpy as np
_ = var('x_1, x_2, alpha')

f_tar = 
varphi_tar = 

f(x_1, x_2) = f_tar
nabla_f(x_1, x_2) = f.diff()
varphi(x_1, x_2, d_1, d_2, alpha) = varphi_tar

# 用符号运算求解精确搜索得到的 alpha 的表达式
S = solve(varphi_tar.diff(alpha) == 0, alpha, solution_dict = True)
alpha_search(d_1, d_2, x_1, x_2) = S[0][alpha]

# 初始化
x_1, x_2 = 2, -4
H = matrix.identity(2)
d = - H * matrix(nabla_f(x_1, x_2)).transpose()
d_1, d_2 = d[0][0], d[1][0]

def DFR(x_1, x_2, d_1, d_2, H):
    while (np.array(nabla_f(x_1, x_2)) != [0., 0.]):
        alpha = alpha_search(d_1, d_2, x_1, x_2)
        s = alpha * d
        y = matrix(nabla_f(x_1 + alpha * d_1, x_2 + alpha * d_2) - nabla_f(x_1, x_2)).transpose()
        x_1, x_2 = x_1 + alpha * d_1, x_2 + alpha * d_2
        H = H + s * s.transpose() / (s.transpose() * y)[0][0] - (H * y * y.transpose() * H) / (y.transpose() * H * y)[0][0]
        d = - H * matrix(nabla_f(x_1, x_2)).transpose()
        d_1, d_2 = d_1, d_2 = d[0][0], d[1][0]
        print(alpha, x_1, x_2, H, d, '\n')
    return x_1, x_2
```

>[!example] 用 DFP 方法求解 $\min\quad \frac{3}{2}x_1^2+\frac{1}{2}x_2^2-x_1x_2-2x_1$ . 取 $x_0=[-2,4]^T,H_0=E_2$ .

解：

$$\begin{aligned}
&f(x)=\frac{1}{2}x^TGx-bx\\
&\nabla f(x)=Gx-b
\end{aligned}$$

精确搜索步长：

$$d_k^T\nabla f(x_k+\alpha d_k)=d_k^T(Gx_k+)$$


DFR 法不要求一定精确搜索，所以可以采用下面的方法：

```python linenums="1"
import numpy as np
from numpy import linalg as LA

_ = var('x_1, x_2, alpha, d_1, d_2')
f_tar = (x_1 - 2)^4 + (x_1 - 2)^2 * x_2^2 + (x_2 + 1)^2
nabla_f = f.diff()

x_1, x_2 = 3, 1
H = matrix.identity(2)
d = - H * matrix(nabla_f(x_1, x_2)).transpose()
d_1, d_2 = d[0][0], d[1][0]
ep = 1e-6 # 精确度

def DFR(x_1, x_2, d_1, d_2, H, d = d):
    # while not (np.array(nabla_f(x_1, x_2)) == 0).all():
    while not LA.norm(np.array(nabla_f(x_1, x_2))) < ep:
        alpha = 1e-2
        s = alpha * d
        y = matrix(nabla_f(x_1 + alpha * d_1, x_2 + alpha * d_2) - nabla_f(x_1, x_2)).transpose()
        x_1, x_2 = x_1 + alpha * d_1, x_2 + alpha * d_2
        H = H + s * s.transpose() / (s.transpose() * y)[0][0] - (H * y * y.transpose() * H) / (y.transpose() * H * y)[0][0]
        d = - H * matrix(nabla_f(x_1, x_2)).transpose()
        d_1, d_2 = d_1, d_2 = d[0][0], d[1][0]
    return x_1, x_2

DFR(x_1, x_2, d_1, d_2, H)
```

程序返回结果：

```shell
(2.00000033869402,−0.999999638356904)
```

约为 $[2,-1]$ .

>[!example] 分别用共轭梯度法和拟 Newton 法极小化 Powell 奇异函数： $f(x)=(x_1+10x_2)^2+5(x_3-x_4)^2+(x_2-2x_3)^4+10(x_1-x_4)^4$ ，取 $x_0=[3,-1,0,1]^T$ ，已知该函数的极小值点为 $x^*=[0,0,0,0]^T$ .

>[!example] 在 DFP 校正公式中, 令 $A_k=\frac{s_ks_k^T}{s_k^Ty_k},B_k=-\frac{H_ky_ky_k^TH_k}{_k^TH_ky_k}$ ，设初始矩阵 $H_0$ 对称正定， $\nabla f(x_k)\neq 0,k=0,1,\cdots,n-1$ ，证明算法用于求解 $\min\quad \frac{1}{2}x^TAx+b^Tx+c$ 时有： $\sum\limits_{k=0}^{n-1}A_k=A^{-1},\sum\limits_{k=0}^{n-1}B_k=-H_0$ .

## 信赖域方法

对于：

$$\begin{aligned}
&\min_{x\in \mathbb{R}}\quad f(x)\\
\end{aligned}$$

之前的无约束优化算法都采取两个步骤： 1) 确定下降方向 $d_k$ ；2) 确定步长 $\alpha_k$ ；

信赖域方法直接求解 $m_k=d_k\alpha_k$ . 类似于牛顿法，信赖域方法首先对于优化函数 $f$ 在 $x_k$ 的局部用一个函数 $q(s)=f(x_k+s)$ 进行近似，然后直接求解 $q_k(s)$ 在局部的优化步 $m_k$ ，作为 $f$ 的优化步，这一过程需要解决两个问题：

1. 如何确定有效的局部以近似函数 $f$ （更新信赖域）；
2. 如何求解 $q(s)$ 在信赖域内的优化步（求解子问题）.

通常，用二元函数近似 $f$ ，得到该优化问题的**子问题**：

$$\begin{aligned}
&\min\quad q_k(s)=f(x_k)+\nabla f(x_k)^Ts+\frac{1}{2}s^TB_ks\\
&s.t.\quad \ \lVert s\rVert\leq \Delta_k
\end{aligned}$$

$\lVert \cdot\rVert$ 为某范数， $\Omega_k=\{x_k+s:\lVert s\rVert\leq \Delta_k\}$ 称为 $x_k$ 的**信赖域**， $\Delta_k$ 则称为信赖域的半径； $B_k$ 为 Hesse 矩阵或者对 Hesse 矩阵的近似.

为了确定有效的信赖域，需要确定在该信赖域中作出的优化是否有效，假设 $x_{k+1}=x_k+s_k$ ，定义下降比值：

$$r_k=\frac{f(x_k)-f(x_{k+1})}{q_k(0)-q(s_k)}$$

如果 $r_k\leq 0$ ，说明 $f(x_k)\leq f(x_{k+1})$ ，无效优化，因此应当拒绝 $s_k$ 并缩小信赖域半径以更近似 $f$ ；如果 $r_k$ 足够大，则应当适当增加信赖域的半径，加快优化.

信赖域算法如下：

1. 初始化 $x_0$ ，信赖域的上界 $\Delta_{\max}$ ，初始化 $\Delta_0\in(0,\Delta_{\max}),k\leftarrow0$ ，此外设置如下超参数：精确率 $\epsilon$ ，下降比值的两个接受度 $\eta_1,\eta_ 2:0<\eta_1\leq \eta_2<1$ ，信赖域半径改动的两个缩放系数： $0<\gamma_1<1<\gamma_k$ ；
2. 当 $\lVert \Delta f(x_k)\rVert>\epsilon$ 时：

求解子问题：

$$\begin{aligned}
&\min\quad q_k(s)=f(x_k)+\nabla f(x_k)^Ts+\frac{1}{2}s^TB_ks\\
&s.t.\quad \ \lVert s\rVert\leq \Delta_k
\end{aligned}$$

得到 $s_k$ ；

计算 $r_k=\frac{f(x_k)-f(x_k+s_k)}{q(0)-q(s_k)}$ .

$$x_{k+1}\leftarrow \left\{\begin{aligned}
&x_k+s_k\quad r_k\ge \eta_1\\
&x_k,\quad r_k<\eta_1
\end{aligned}\right.$$

随后改进信赖域半径：

$$\Delta_{k+1}\leftarrow \left\{\begin{aligned}
&\gamma_1\Delta_k,\quad r_k<\eta_1\\
&\Delta_k,\quad r_k\in[\eta_1,\eta_2)\\
&\min\{\gamma_2\Delta_k,\Delta_{\max}\}
\end{aligned}\right.$$

注：这里可以灵活取更改方案；

更新 $q_{k+1}(s)$ ， $k\leftarrow k+1$ .

```python linenums="1"
epsilon = 1e-5
x = 
delta_max = 
delta = 
eta_1, eta_2 = 
gamma_1, gamma_2 = 

while ( < epsilon):
    # 求解优化步， q 为优化函数
    q, s = solve_sub(f, x, delta_max)
    r = (f(x) - f(x+s)) / (q(0) - q(s_k))
    if (r >= eta_1):
        x = x + s
    # 更新信赖域半径
    if (r < eta_1):
        delta = gamma_1 * delta
    else if (r > eta_2):
        delta = max(gamma_2 * delta, delta_max)

print(delta)
```

下面解决如何求解信赖域子问题：

定义 **Cauchy 点** $s_k^c=-\tau_k\frac{\Delta_k}{\lVert \nabla(f(x_k))\rVert}\nabla f(x_k)$ .

其中：

$$\tau_k=\left\{\begin{aligned}
&1,\quad \nabla f(x_k)^TB\nabla f(x_k)\le0\\
&\min\left\{\frac{\lVert \nabla f(x_k)\rVert^3}{\Delta_k\nabla f(x_k)B_kg_k},1\right\},\quad \text{otherwise}
\end{aligned}\right.$$

也称据此得到的 $x_k^c$ 为 Cauchy 点.

定义 **Newton 点** $s_k^N$ ，由 Newton 方法的求解得到的点，也称据此得到的 $x_k^N$ 为 Newton 点.

**折线法**利用一条折线近似 $s$ ：连接 Cauchy 点和 Newton 点，设其连线与信赖域的边界 $\partial{\Omega}$ 的交点为 $x_{k+1}$ .

经过分析得到 [[2422Tu092507]] ：

$$x_{k+1}=\left\{\begin{aligned}
&x_k-\frac{\Delta_k}{\lVert g_k\rVert_2}g_k,\quad \lVert s_k^c\rVert\ge \Delta_k\\
&x_k+s_k^c+\lambda(s_k^N-s_k^c),\quad \lVert s_k^c\rVert<\Delta_k,\lVert s_k^N\rVert>\Delta_k\\
&x_k-B_k^{-1}g_k,\quad \lVert s_k^c\rVert<\Delta_k,\lVert s_k^N\rVert\leq \Delta_k
\end{aligned}\right.$$

其中 Cauchy 步： 

$$s_k^c=-\frac{g_k^Tg_k}{g_k^TB_kg_k}g_k$$

Newton 步：

$$s_k^N=-B_k^{-1}g_k$$

$\lambda$ 由：

$$\lVert s_k^c+\lambda(s_k^N-s_k^c)\rVert=\Delta_k$$

求解得到.

将信赖域迭代中产生的点

>[!example] 函数 $f(x)=10(x_1-x_1^2)^2+(1-x_1)^2$ ，画出二次模型 $q^{(k)}(s)=f(x)+\nabla f(x)^T+\frac{1}{2}s^TBs$ 在 $x=(0,-1)$ 的轮廓线，其中 $B$ 为 $f$ 的 Hesse 阵，绘制子问题的轮廓，其中信赖域半径从 $\Delta=0$ 到 $\Delta=2$ ，对 $x=(0,0.5)$ 重复上述过程.

```python linenums="1"
_ = var("x_1, x_2")
f_expr = 10 * (x_1 - x_2^2)^2 + (1 - x_1)^2
f_nabla_expr = f_expr.gradient()
```

对于 $x=(0,0.5)$ ，得到子问题中的优化函数：

$${\left(11 \, s_{1} - 10\, s_{2}\right)} s_{1} + 20 \, {\left(-0.5\, s_{1} + 0.75\, s_{2}\right)} s_{2} - 7\, s_{1} + 5\, s_{2} + 1.625$$

采取折线法求解最有界并绘制解集，所选取的信赖域从 $\Delta=0$ 到 $\Delta=2$ ，绘制 $100$ 个点.

信赖域为：

$$s_1^2+(s_2-0.5)^2\leq \Delta,\Delta\in(0,2]$$

```python linenums="1"
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt

q_expr = 
x_1 = 0; x_2 = 0.5
x = matrix([[0, 0.5]]).transpose()
q(s_1, s_2) = 
delta_max_list = np.linspace(0, 2, 100).tolist()

def solve_sub(f_grad, B, delta_max):
    s_c = - (f_grad * f_grad) / (f_grad.transpose() * B * f_grad) * g
    s_n = - B^-1 * g
    if (LA.norm(s_c) >= delta_max):
        s = - delta_max / LA.norm(s_c) * f_grad
    if (LA.norm(s_c) < delta_max & LA.norm(s_n) > delta_max):
        lam = (delta_max^2 - s_c) / (s_n - s_c)
        s = s_c + lam * (s_n - s_c)
    if (LA.norm(s_c) < delta_max & LA.norm(s_n) <= delta_max):
        lam = - G^-1 * f_grad
    return s

x_list = []
for delta_max in delta_max_list:
    x_list.append([x + solve_sub()[0][0], x + solve_sub()[1][0]])

plt.scatter(x_list)
```

### 信赖域算法收敛性分析

[[2422Mo194928]]

# 无约束问题测试函数

## Rosenbrock

$$f(x)=100(x_2-x_1^2)^2+(1-x_1)^2$$

## 立方体函数

$$f(x)=100(x_2-x_1^3)^2+(1-x_1)^2$$

## 三角函数

$$f(x)=\sum\limits_{i=1}^{n}\left[n+i(1-\cos x_i)-\sin x_i-\sum\limits_{j=1}^{n}\cos x_j\right]$$

### 求解 Rosenbrock, 立方体函数, 三角函数（ $n=2$ 情形）

选择了 P 121 的 1, 5, 6 三个函数进行计算.

采用了信赖域算法和拟 Newton 算法，实践中发现前者收敛很快，后者跑的时间较长（全部输出结果可见 HTML）

```python linenums="1"
_ = var("x_1, x_2, s_1, s_2")

rb_expr = 100 * (x_2 - x_1^2)^2 + (1 - x_1)^2
cube_expr = 100 * (x_2 - x_1^3)^2 + (1 - x_1)^2
tri_expr = (2 + (1 - cos(x_1)) - sin(x_1) - (cos(x_1) + cos(x_2)))^2 + (2 + 2 * (1 - cos(x_2)) - sin(x_2) - (cos(x_1) + cos(x_2)))^2

def get_g_h(expr):
    """计算梯度、Hessian 矩阵"""
    return expr.gradient(), expr.hessian()
```

## 信赖域算法求解

重构了之前的函数以适用于一般的二元情形.

/// collapse-code
```python linenums="1"
# 信赖域方法
x_1_val, x_2_val = 1.2, 1.5 # 初始值
# x = matrix([[x_1, x_2]]).transpose()
epsilon = 1e-5 # 精确度
delta_max = 2
delta = 1
eta_1, eta_2 = 0.25, 0.75
gamma_1, gamma_2 = 0.5, 1.5

s = matrix([[s_1, s_2]]).transpose()

def trust_region(f_expr, x_1_val, x_2_val, delta = delta):
    # 首先用符号运算处理后续进行计算得到后续运算用到的函数
    f(x_1, x_2) = f_expr
    f_grad_expr, f_hess_expr = get_g_h(f_expr)
    f_grad(x_1, x_2) = matrix(f_grad_expr).transpose()
    f_hess(x_1, x_2) = matrix(f_hess_expr)
    q(x_1, x_2, s_1, s_2) = (f_expr + matrix(f_grad_expr) * s + 1 / 2 * s.transpose() * f_hess_expr * s)[0][0]
    f_grad_val = f_grad(x_1_val, x_2_val)
    while not (LA.norm(np.array(f_grad_val)) < epsilon):
        # 求解优化步， 以 Hess 近似二阶正定矩阵
        f_grad_val = f_grad(x_1_val, x_2_val)
        f_hess_val = f_hess(x_1_val, x_2_val)
        s_val = solve_sub(f_grad_val, f_hess_val, delta)
        s_1_val, s_2_val = s_val[0][0], s_val[1][0]
        
        q_(s_1, s_2) = q(x_1_val, x_2_val)
        r = (f(x_1_val, x_2_val) - f(x_1_val + s_1_val, x_2_val + s_2_val)) / (q_(0, 0) - q_(s_1_val, s_2_val))
        
        # 更新
        if (r >= eta_1):
            x_1_val, x_2_val = x_1_val + s_1_val, x_2_val + s_2_val
        
        # 更新信赖域半径
        if (r < eta_1):
            delta = gamma_1 * delta
        elif (r >= eta_2):
            delta = min(gamma_2 * delta, delta_max)
        print(x_1_val, x_2_val)
    return x_1_val, x_2_val
```
///

求解立方体函数：

```python linenums="1"
trust_region(cube_expr, x_1_val, x_2_val)
```

输出结果：

/// collapse-code
```shell linenums="1"
1.19878905303948 1.72276870913054
1.19878905303948 1.72276870913054
1.19670177491777 1.71423108688279
1.19272909707311 1.69546645673245
1.19272909707311 1.69546645673245
1.19272909707311 1.69546645673245
1.19134655353694 1.69130702831896
1.18603467779554 1.67068470892689
1.18932427837573 1.68265894493626
1.18932427837573 1.68265894493626
1.18667867642933 1.67166460735022
1.18355463719180 1.65824324420497
1.18355463719180 1.65824324420497
1.18112896398946 1.64824114633273
1.18112896398946 1.64824114633273
1.17838948816512 1.63657307882991
1.17615022738497 1.62745039783577
1.17615022738497 1.62745039783577
1.17360408408766 1.61663314751242
1.17360408408766 1.61663314751242
1.17156015867982 1.60844763915149
1.16913630400298 1.59808376831097
1.16913630400298 1.59808376831097
1.16733052251298 1.59107284921400
1.16482434962377 1.58003667772557
1.16482434962377 1.58003667772557
1.16482434962377 1.58003667772557
1.16335631556876 1.57486489184944
1.14449939936811 1.49311960809928
1.11641347078141 1.38878809222429
1.07482806611855 1.23598081749151
1.05886937969121 1.18639182239257
1.02011787148179 1.05686388835862
1.01493834053357 1.04540585439760
1.00071016139468 1.00151848225152
1.00019117815795 1.00057283566326
1.00000009270925 1.00000016857288
1.00000000000607 1.00000000001820
0.999999999999971 0.999999999999912
```
///

求解 Rosenbrock

```python linenums="1"
trust_region(rb_expr, x_1_val, x_2_val)
```

输出结果

/// collapse-code
```shell linenums="1"
1.21818181818182 1.48363636363636
1.21818181818182 1.48363636363636
1.21818181818182 1.48363636363636
1.21567461592991 1.47870460476965
1.21282275176820 1.47049407430432
1.21282275176820 1.47049407430432
1.21037707446354 1.46582621830012
1.20748546676836 1.45744064359908
1.20748546676836 1.45744064359908
1.20509662061744 1.45304543540833
1.20509662061744 1.45304543540833
1.20210933468898 1.44431995858498
1.20210933468898 1.44431995858498
1.19977148285194 1.44021318219269
1.19659226216299 1.43087206869446
1.19659226216299 1.43087206869446
1.19429719901227 1.42708087529518
1.19073847933811 1.41660239928940
1.19073847933811 1.41660239928940
1.18847264633898 1.41317443076037
1.18409393062922 1.40037076045782
1.18409393062922 1.40037076045782
1.18409393062922 1.40037076045782
1.18182950808018 1.39739694051050
1.17518815376367 1.37851090352549
1.05926613443445 1.10860682899435
1.04319432375751 1.08799609402145
1.00212183045605 1.00256121337059
1.00053528460979 1.00106833862146
1.00000026934035 1.00000025243944
1.00000000001540 1.00000000003073
1.00000000000002 1.00000000000004
```
///

求解三角函数：

```python linenums="1"
trust_region(tri_expr, x_1_val, x_2_val)
```

/// collapse-code
```shell linenums="1"
0.909589142706614 0.931687575399694
0.723607097773950 0.716337920878024
0.608061216547561 0.606867765385909
0.469062197828027 0.598366329892657
0.469062197828027 0.598366329892657
0.469062197828027 0.598366329892657
0.469062197828027 0.598366329892657
0.469062197828027 0.598366329892657
0.469062197828027 0.598366329892657
0.469062197828027 0.598366329892657
0.424160293919865 0.564582166106411
0.404314121560402 0.601738932337862
0.374983917520241 0.596461269394729
0.358849805639434 0.603279514766732
0.337294124512735 0.607617188107350
0.337294124512735 0.607617188107350
0.312388100605839 0.610898471050756
0.211444389299614 0.619269152413002
0.238571864341964 0.613221877602338
0.242967505973105 0.612689269129207
0.243064155219690 0.612676123576699
0.243064202201551 0.612676117137335
```
///

## 拟 Newton 法

重构了之前的函数以适用于一般情形：

/// collapse-code
```python linenums="1"
# 拟 Newton 法
def DFR(f_expr, x_1_val, x_2_val, alpha=1e-2):
    f(x_1, x_2) = f_expr
    f_grad_expr, f_hess_expr = get_g_h(f_expr)
    f_grad(x_1, x_2) = matrix(f_grad_expr).transpose()
    f_hess(x_1, x_2) = matrix(f_hess_expr)
    H = matrix.identity(2)
    d = - H * f_grad(x_1_val, x_2_val)
    d_1, d_2 = d_1, d_2 = d[0][0], d[1][0]
    
    while not LA.norm(np.array(f_grad(x_1_val, x_2_val))) < epsilon:
        s = alpha * d
        y = matrix(f_grad(x_1_val + alpha * d_1, x_2_val + alpha * d_2) - f_grad(x_1_val, x_2_val))
        x_1_val, x_2_val = x_1_val + alpha * d_1, x_2_val + alpha * d_2
        H = H + s * s.transpose() / (s.transpose() * y)[0][0] - (H * y * y.transpose() * H) / (y.transpose() * H * y)[0][0]
        d = - H * f_grad(x_1_val, x_2_val)
        d_1, d_2 = d_1, d_2 = d[0][0], d[1][0]
        print(x_1_val, x_2_val)
    return x_1_val, x_2_val
```
///

三种函数计算如下，结果和信赖域算法基本一样，输出结果很长故略去，具体计算迭代步的输出见 HTML 文件.

```python linenums="1"
DFR(rb_expr, 1.2, 1.5)
# 1.00000103180926,1.00000204568565
DFR(cube_expr, 1.2, 1.5, alpha=1e-3)
# 0.999999973390000,0.999999935896561
DFR(tri_expr, 1.2, 1.5)
# 0.243072302873212,0.612680452675273
```

# 约束优化方法

讨论无约束优化问题：

$$\begin{aligned}
&\min\quad f(x)\\
&s.t.\quad \ c_i(x)=0,i=1,\cdots,m\\
&\qquad\quad c_j(x)\ge0,j=m+1,\cdots,p
\end{aligned}$$

记可行域为 $F$ .

称 $s\in \mathbb{R}^m$ 为 $x\in \mathbb{R}^m$ 处**下降方向**，如果存在 $\delta>0$ ，使得对于任意的 $\alpha\in(0,\delta)$ 都有 $f(x+\alpha s)<f(x)$ .

>[!note]- 设 $f$ 在 $x$ 处连续可微. 若 $s$ 满足 $\nabla f^Ts<0$ ，则 $s$ 是 $f$ 在 $x$ 处的一个下降方向.
>证明：
>
>$$f(x+\alpha s)=f(x)+\nabla f(x)^T\alpha s+\mathcal{o}(\alpha)$$
>
>则当 $\alpha>0$ 充分小时 $f(x+\alpha s)<f(x)$ .

设 $x\in F$ ， $s\neq0\in \mathbb{R}^m$ ，如果存在 $\delta>0$ 使得对于任意的 $\alpha\in(0,\delta],x+\alpha s\in F$ ，则称 $s$ 为 $x$ 处的一个**可行方向**，记 $x$ 处可行方向全体为 $FD(x)$ .

定义减弱的可行方向：称 $s\neq 0\in \mathbb{R}^m$ 是**序列化可行方向**，如果存在 $\mathbb{R}^m$ 上的序列 $\{s_k\}_{k\ge1}$ 和 $\{\delta_k\}_{k\ge1},\delta_k>0$ 满足 $\{x+\delta_ks_k\}_{k\ge1}\subset F$ 并且 $f(x+\delta_ks_k)<f(x)$ ，以及 $s_k\rightarrow s(k\rightarrow \infty),\delta_k\rightarrow0$ . 并记序列可行化方向全体为 $SFD(x)$ .

设 $x\in F,s\neq 0\in \mathbb{R}^n$ ，如果 $s$ 还满足以下条件：

$$\begin{aligned}
&s^T\nabla c_i(x)=0,i=1,\cdots,m\\
&s^T\nabla c_i(x)\ge0,i=m+1,\cdots,p
\end{aligned}$$

则称 $s$ 为可行域 $F$ 在 $x$ 处的**约束线性化后的可行方向**，记 $x$ 处约束线性化后的可行方向为 $LFD(x)$ . 约束线性化即为：

$$\begin{aligned}
&c_i(x+\alpha s)=c_i(x)+\alpha s^T\nabla c_i(x)+\mathcal{o}(\alpha)=\mathcal{o}(\alpha)\rightarrow0\\
&c_i(x+\alpha s)=c_i(x)+\alpha s^T\nabla c_i(x)+\mathcal{o}(\alpha)\ge0(\alpha\rightarrow0)\\
\end{aligned}$$

>[!note]- 对于 $x\in F$ ，在其上定义的方向全体 $D,FD,SFD,LFD$ 均为锥.
>证明： $s\in D$ ，设对应的为 $\delta>0$ ，对于 $t>0$ ，取 $\delta'=\frac{\delta}{t}$ 即可. $s\in FD$ 同理. 对于 $s\in SFD,t>0$ ，取 $\{ts_k\}_{k\ge1}$ 和 $\{\delta_k/t\}_{k\ge1}$ . 对于 $LFD$ 显然.

对于上面定义的各种方向集，其关系如下：

>[!note] 若约束函数在 $x\in F$ 处连续可微，则 $FD(x)\subset SFD(x)\subset LFD(x)$ .

>[!note] 若 $x$ 为约束优化问题的局部最优解，并且 $f,c_i,i=1,\cdots,p$ 连续可微，那么 $SFD(x)\cap LFD(x)=\emptyset$ ，于是 $FD(x)\cap LFD(x)=\emptyset$ .

>[!note] 约束函数 $c_i$ 在 $x\in F$ 处连续可微，且 $c_i$ 为线性函数 ( $i=1,\cdots,p$ ) 或者 $\nabla c_i(x),i=1,\cdots,m$ 线性无关，则 $FD(x)=LFD(x)$ ，从而 $FD(x)=SFD(x)=LFD(x)$ .

定义 **Lagrange 乘子** $\lambda_i,i=1,\cdots,p$ ，如果其满足下面的约束条件：

$$\begin{aligned}
&\nabla f(x)-\sum\limits_{i=1}^{p}\lambda_i\nabla c_i(x)=0\\
&\lambda_i\ge0,i=m+1,\cdots,p\\
&\lambda_ic_i(x)=0,i=m+1,\cdots,p
\end{aligned}$$

称上述约束条件为 **KT 条件**（KKT 条件）.

>[!hint] Lagrange 乘子由原约束优化问题中的不等式约束确定.

关于 Lagrange 乘子的存在性有如下定理：

>[!note] 设 $x\in F$ 为约束无优化问题的一个局部最优解，如果 $f,c_i,i=1,\cdots,p$ 在 $x$ 的某邻域内连续可微，并且 $SFD(x)=LFD(x)$ ，则存在该约束无优化问题的 Lagrange 乘子.

同时， $KT$ 条件是 $x\in F$ 是约束优化问题的<u>局部</u>最优解的必要条件. 

>[!example]- 考虑问题 $\min\ (x_2+100)^2+0.01x_1^2,s.t.x_2-\cos x_1\ge 0$ ，其局部解是有限的还是无限的？用 KT 条件证明结论.
>Hint：KT 条件，若 $\lambda=0$ ，则 $[x_1,x_2]=[0,1]$ ，若 $\lambda>0$ ，则最后需要求解： $0.02x_1=\sin 2x_1+200\sin x_1$ ，这个等式只有有限个解.

特别地，满足以下情形时 $x$ 为全局最优解. 

>[!note] 如果 $f,-c_i,i=m+1,m+2,\cdots,p$ 为连续可微的凸函数. $c_j,j=1,\cdots,m$ 为线性函数. 如果 $x$ 满足 $KT$ 条件，则 $x$ 为约束优化问题的全局最优解.

>[!note] 若 $f,-c_i,i=m+1,m+2,\cdots,p$ 是连续可微的凸函数， $c_j,i=1,\cdots,m$ 是线性函数. 若 $x^*$ 满足 KT 条件，则 $x^*$ 是优化问题的整体最优解.

解该二次规划问题，并作图解释其集合意义.

$$\begin{aligned}
&\max\quad f(x)=2x_1+3x_2+4x_1^2+2x_1x_2+x_2^2\\
&s.t.\quad \ x_1-x_2\ge0,x_1+x_2\le4,x_1\le3
\end{aligned}$$

## 罚函数法

**罚函数法**将约束优化问题转化为无约束优化问题.

对于等式优化问题：

$$\begin{aligned}
&\min\quad f(x)\\
&s.t.\quad\ c_i(x)=0,i=1,\cdots,m
\end{aligned}$$

可以定义**二次罚函数**：

$$Q(x,\mu)=f(x)+\frac{1}{2\mu}\sum\limits_{i=1}^{m}c_i^2(x)$$

其中 $\frac{1}{2\mu}\sum\limits_{i=1}^{m}c_i^2(x)$ 被称为**惩罚项**， $\mu>0$ .

如果 $c_i(x)\neq 0$ ，当 $\mu\rightarrow \infty$ 时，惩罚项 $\rightarrow \infty$ .

而对于含有不等式约束条件的约束优化问题，对 $c_j(x)\ge 0$ ，令 $c_j'(x)=\min\{c_i(x),0\}$ ，转化为求解 $c_j'(x)=0$ .



## 障碍罚函数法

考虑不等式约束优化问题： 

$$\begin{aligned} &\min\quad f(x)\\ &s.t.\quad\ c_i(x)\leq0,i=1,\cdots,p \end{aligned}$$

常用的障碍罚函数为： 
 
 $$\begin{aligned}
&P(x;\mu)=f(x)-\mu\sum\limits_{i=1}^{p}\ln(-c_i(x))\\
&P(x;\mu)=f(x)-\mu\sum\limits_{i=1}^{p}\frac{1}{c_i(x)}\\
&\mu>0
\end{aligned}$$

从而可以得到局部近似解.

令 $\mu\rightarrow 0$ 可以得到解.

>[!question] 关于罚函数方法
>如果最优值在接近边界的地方取到怎么办？

## 二次规划

### 等式约束二次规划问题

定义等式约束的 $QP$ 问题：

$$\begin{aligned}
&\min\quad \frac{1}{2}x^TGx+g^Tx\\
&s.t.\quad\ A^Tx=b
\end{aligned}$$

下面介绍 Lagrange 法，其是求解该问题的 KT 条件的一种方法：

$$\left\{\begin{aligned}
&Gx+g-A\lambda=0\\
&A^Tx=b
\end{aligned}\right.\Leftrightarrow \begin{bmatrix}G & -A \\ -A^T & 0\end{bmatrix}\begin{bmatrix}x \\ \lambda\end{bmatrix}=-\begin{bmatrix}g \\ b\end{bmatrix}$$

>[!note] 设 $A$ 为列满秩的， $Z$ 为 $A^T$ 的零空间 $\{p:A^Tp=0\}$ 的一组基，如果 $Z^TGZ$ 正定，则上述 KT 条件的解 $x,\lambda$ 唯一，并且 $x$ 是原问题的解.