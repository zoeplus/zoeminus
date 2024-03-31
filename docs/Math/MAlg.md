矩阵代数

# 范数

记 $\mathbb{R}^{n}=\mathbb{R}^{1\times n}$ .

范数 $\lVert\cdot \rVert:\mathcal{X}\subset\mathbb{R}^{m\times n}\rightarrow \mathbb{R}$ （其中 $m$ 可取 $1$ ）需要满足下面三个条件：

- 正定性： $\forall x\in \mathcal{X},\lVert x\rVert\geq0\wedge\lVert x\rVert=0\Leftrightarrow x=0$ ；
- 齐次性： $\forall \lambda\in \mathbb{R},x\in \mathcal{X},\lVert \lambda x\rVert=\lambda \lvert x\rvert$ ；
- 三角不等式： $\forall x,y\in \mathcal{X}(\lVert x+y\rVert\leq\lVert x\rVert+\lVert y\rVert)$

此外对于范数还存在**相容性**这一定义，例如，对于向量范数 $\lVert \cdot\rVert$ ，如果$\forall x,y\in \mathbb{R}^{n},\lVert xy\rVert\leq\lVert x\rVert\cdot\lVert y\rVert$ ，则称该向量范数**自相容**，矩阵范数的自相容同理；对于向量范数 $\lVert \cdot\rVert_v$ 和矩阵范数 $\lVert \cdot\rVert_m$ ，如果 $\forall A\in \mathbb{R}^{n\times n},x\in \mathbb{R}^{1\times n},\lVert Ax^T\rVert_v\leq\lVert A\rVert_m\lVert x\rVert_v$ ，则称该矩阵范数关于该向量范数相容.

>[!note]- 若矩阵范数 $\lVert \cdot\rVert_m$ 与向量范数 $\lVert \cdot\rVert$ 相容，则对于特征值为 $\lambda$ 的向量 $x$ 有 $\lvert \lambda\rvert\leq \lVert A_m\rVert$ #imcomplete-whatever 

>[!note]- $\lVert \cdot\rVert_{m_1}$ 与 $\lVert \cdot\rVert_1$ 相容， $\lVert \cdot\rVert_{m_2}$ 与 $\lVert \cdot\rVert_2$ 相容. #imcomplete-whatever 

设 $X$ 中的两个范数 $\lVert \cdot\rVert_\alpha,\lVert \cdot\rVert_\beta$ ，如果存在正实数 $a,b$ 使得 $a \lVert \cdot\rVert_\alpha\leq \lVert \cdot\rVert_\beta\leq b\lVert \cdot\rVert_\alpha$ ，则称两个范数**等价**.

并且有下面这个命题：

>[!note]- 在有限维空间中两个范数都等价. #imcomplete-whatever 
>见[[#范数等价性]]

定义范数之后可以定义距离的概念： $\forall x,y\in X$ ， $x,y$ 间的距离记为 $d(x,y)=\lVert x-y\rVert$ . 以及单位球.

## 对于向量定义的范数

$x\in \mathbb{R}^{n}$ .

- $L_1$ 范数： $\lVert x\rVert_1=\sum\limits_{i=1}^{n}\lvert x_i\rvert$ ；
- $L_2$ 范数： $\lVert x\rVert_2=\sqrt{\sum\limits_{i=1}^{n}x_i^2}$ （也称是内积诱导的范数）；
- $L_p$ 范数： $\lVert x\rVert_p=\left(\sum\limits_{i=1}^{n}\lvert x \rvert_i^p\right)^\frac{1}{p}$ ；
- $L_\infty$ 范数： $\lVert x\rVert_\infty=\max\{\lvert x_i\rvert\}_{1\leq i\leq n}$ .

## 对于矩阵定义的范数

$A=(a_{ij})_{m\times n}\in \mathbb{R}^{m\times n}$ .

### Frobenius 范数

将 $A$ 展开为向量之后计算得到的 $L_2$ 范数 ： $\lVert A\rVert_F=\sum\limits_{i=1}^{m}\sum\limits_{j=1}^{n}a_{ij}^2$ ，且显然 $\lVert A\rVert_F=\text{tr}(A^TA)=\text{tr}(AA^T)$ .

此外还可以证明 $\lVert A\rVert_F=\sqrt{\sum\limits_{i=1}^{\min\{m,n\}}\sigma_i^2}$ . #imcomplete-whatever 

### 算子范数

算子范数是由向量范数诱导得到的，定义 $$\lVert A\rVert_{p,q}=\sup\{\lVert Ax\rVert_p:\lVert x\rVert_q=1\}=\sup_{x\neq0}\left\{\frac{\lVert Ax\rVert_p}{\lVert x\rVert_q}\right\}$$

算子范数的定义是否成立还需要验证是否满足正定、齐次和三角不等式，略.

>[!note]- 谱范数： $\lVert A\rVert_{2,2}=\sigma_\max A\overset{def}{=}\sqrt{\lambda_\max(A^HA)}\overset{def}{=}\lVert A\rVert_2$ ，其中 $\lambda_\max(A^HA)$ 被称为谱半径，$A$ 的所有特征值组成的集合称为谱，谱半径即为能够包含所有特征值的最小圆的半径.
>证明：利用[Hermite矩阵](LAlg.md#Hermite矩阵)的性质，注意到 $$\lVert A\rVert_2^2=\max_{x\neq0}\langle Ax,Ax \rangle=(Ax)^T(Ax)=x^TA^TAx=\langle x,A^TAx \rangle$$
>并且 $A^TA=A^HA$ #issue ，$A^HA$ 则为Hermite矩阵，不妨设 $A^HA$ 的特征值为 $\lambda_1\geq\lambda_2\geq\cdots\leq\lambda_n\geq0$ ，设对应的单位特征向量为 $x_1,\cdots,x_n$ ，对于任意 $x\in \mathbb{R}^n$ ， $$x=a_1x_1+a_2x_2+\cdots+a_nx_n$$ 从而可以得到： $$\begin{aligned}
\langle Ax,Ax \rangle &=\langle x,A^TAx \rangle\\
&=\langle x,a_1\lambda_1 x_1+a_2\lambda_2x_2+\cdots+a_n\lambda_nx_n \rangle\\
&=a_1^2\lambda_1\lvert x_1\rvert^2+a_2^2\lambda_2\lvert x_2\rvert^2+\cdots+a_n^2\lambda_n\lvert x_n\rvert^2\\
&=a_1^2\lambda_1+a_2^2\lambda_2+\cdots+a_n^2\lambda_n\\
&\leq\lambda_1(a_1^2+a_2^2+\cdots+a_n^2)\\
&=\lambda_1
\end{aligned}$$ 下面证明另一边：考虑特殊情况： $$\lVert Ax_1,Ax_1\rVert=\langle x_1,\lambda_1x_1 \rangle=\lambda_1$$ 从而可知该算子范数的最大值大于等于 $\lambda_1$ 从而完成证明.

>[!note]- 最大列和范数： $\lVert A\rVert_{1,1}=\max_{j}\{\sum\limits_{i=1}^{n}a_{ij}\}$
>按照定义 $$\begin{aligned}
\lVert A\rVert_{1,1} &=\sup_{x\neq0}\frac{\lVert Ax\rVert}{\lVert x\rVert}\\
&=\frac{\sum\limits_{i=1}^{n}\lvert \sum\limits_{j=1}^{n}a_{ij}x_j\rvert}{\sum\limits_{k=1}^{n}\lvert x_k\rvert}\\
&\leq\frac{\sum\limits_{i=1}^{n}\sum\limits_{j=1}^{n}\lvert a_{ij}\rvert \lvert x_j\rvert}{\sum\limits_{k=1}^{n}\lvert x_k\rvert}\\
&=\frac{\sum\limits_{j=1}^{n}\left(\sum\limits_{i=1}^{n}\lvert a_{ij}\rvert \lvert x_j\rvert\right)}{\sum\limits_{k=1}^{n}\lvert x_j\rvert}\\
&\leq\frac{\sum\limits_{j=1}^{n}\lvert x_j\rvert\cdot \max\{\sum\limits_{m=1}^{n}|a_{ml}|:1\leq l\leq n\}}{\sum\limits_{k=1}^{n}\lvert x_k\rvert}
\end{aligned}$$
>从而得到其中一个不等式，下面证明另一个方向的不等式. 实际上只需要换一种思路，说明存在 $x_0$ 使得 $\lVert Ax_0\rVert$ 能够取到等式右边的值即可. 从而根据等式左边的形式可以推出大于等于.
>
>因此，不妨试 $\arg\max_j\{\sum\limits_{i=1}^{n}a_{ij}\}=j_0$ ，然后取 $x_0=[0,\cdots,1,\cdots,0]^T$ 其中 $1$ 位于第 $j_0$ 个位置，进而可以得到结论.

>[!note]- 最大行和范数： $\lVert A\rVert_{\infty,\infty}=\max_{i}\{\sum\limits_{j=1}^{n}a_{ij}\}$
>证明：首先根据定义 $$\begin{aligned}
>\lVert A\rVert_{\infty,\infty}&=\sup_{x\neq0}\frac{\lVert Ax\rVert_\infty}{\lVert x\rVert_\infty}\\
>&=\sup_{x\neq0}\frac{\max_i\left\{\left\vert\sum\limits_{j=1}^{n}a_{ij}x_j\right\vert:1\leq i\leq n\right\}}{\max_i\{\lvert x_i\rvert:1\leq i\leq n\}}\\
>&\leq \sup_{x\neq0}\frac{\left\lvert \sum\limits_{j=1}^{n}a_{i_0j}x_0\right\rvert}{\left\lvert x_{j_0}\right\rvert}\\
>&\leq \sum\limits_{j=1}^{n}\lvert a_{i_0j}\rvert
>\end{aligned}$$
>对于另一边的证明，考虑证明存在取等的情况，假设 $i=i_0$ 时可以取得最大行和值，进而可以取 $x=[\sigma(x_{i_01}),\sigma(x_{i_02}),\cdots,\sigma(x_{i_0n})]$ ，其中指示函数 $\sigma$ 取 $1$ 如果所给元素为非负数，否则为 $-1$ ，从而可以得到结论.

可以证明算子范数具有以下性质：

>[!note]- 自相容性： $\lVert AB\rVert_{p,q}\leq\lVert A\rVert_{p,q}\lVert B\rVert_{p,q}$ .
>证明：依照定义，并利用算子范数相对于向量范数的相容性？ #issue

>[!note]- 由 $\lVert \cdot\rVert$ 诱导的算子范数是所有与该向量范数相容的矩阵范数中最小的. #imcomplete-whatever 
>证明：直接按照定义即可.

## 对偶范数

[为什么引入对偶范数？](https://www.zhihu.com/question/43490445) #imcomplete 

对偶范数有向量和矩阵两种形式：

设 $\lVert \cdot\rVert$ 为 $\mathbb{R}^n$ 上的一个范数， $\forall z\in \mathbb{R}^n$ ， $$\lVert z\rVert_*=\sup\{\langle z,x \rangle:\lVert x\rVert\leq1\}$$

>[!note]- 对偶范数是范数.
>证明：正定性：取 $x_i=\frac{1}{n}\frac{\lvert z_i\rvert}{z_i}$ 即可.
>齐次性：假设 $\lVert z\rVert_*=z^Tx_0$ ，考虑 $\lVert \lambda z\rVert_*=\sup\{\lambda\langle z,x \rangle:\lVert x\rVert\leq1\}$ ，当 $\lambda\geq0$ 时，有 $\lambda\langle z,x \rangle\leq \lambda\langle z,x_0 \rangle$ 且可以取等；当 $\lambda<0$ 时，可取 $x=-x_0$ ，从而 $\lambda\langle z,x \rangle=-\lambda\langle z,-x \rangle\leq -\lambda\langle z,x_0 \rangle$ 
>三角不等式：$\forall z,w$ ，设 $$\lVert z+w\rVert_*=(z+w)^Tx_0=z^Tx+w^Tx\leq \lVert z\rVert_*+\lVert w\rVert_*$$ 

对偶范数还有以下性质：

>[!note]- 对于 $\lVert \cdot\rVert_q$ ， $q=1$ 时其对偶范数为 $\lVert \cdot\rVert_\infty$ ， $q\neq1$ 时其对偶范数 $\lVert \cdot\rVert_p$ 满足 $\frac{1}{q}+\frac{1}{p}=1$ #imcomplete-whatever 

>[!note]- 对偶范数的对偶范数是原范数 #imcomplete-whatever 

## 范数等价性

>[!note]- $\mathbb{R}^n$ 中任何范数 $\lVert \cdot\rVert_*$ 都与欧式范数 $\lVert \cdot\rVert$ 等价.
>设 $\epsilon_1,\epsilon_2,\cdots,\epsilon_n$ 为 $\mathbb{R}^n$ 中的一组基，则对于任意 $x\in \mathbb{R}^n$ 存在 $x_i,1\leq i\leq n:x=\sum\limits_{i=1}^{n}x_i\epsilon_i$ . 对于 $\lVert x\rVert_*=\lVert \sum\limits_{i=1}^{n}x_i\epsilon_i\rVert_*$ ，可以将其看作关于 $(x_1,x_2,\cdots,x_n)$ 的连续函数： $\lvert \lVert x\rVert_*-\lVert y\rVert_*\rvert\leq \lVert x-y\rVert_*$ ，由 $\lVert x-y\rVert_*=\lVert \sum\limits_{i=1}^{n}(x_i-y_i)\epsilon_i\rVert_*\leq \sum\limits_{i=1}^{n}\lvert x_i-y_i\rvert\cdot \lVert \epsilon_i\rVert_*$ ，且 $\lVert x_i-y_i\rVert\leq \lVert x-y\rVert$ ，令 $d=\sum\limits_{i=1}^{n}\lVert \epsilon_i\rVert$ ，因此 $\lvert \lVert x\rVert_*-\lVert y\rVert_*\rvert\leq d \lvert x-y\rvert$ .从而可知定义的函数 $\lVert x\rVert_*$ 关于 $(x_1,x_2,\cdots,x_n)$ 连续.
>
>目的是证明存在 $M>m>0$ ： $m \lVert x\rVert\leq \lVert x\rVert_*\leq  M\lVert x\rVert$ . 因此不妨考虑证明： $m\leq \lVert \frac{x}{\lVert x\rVert}\rVert_*\leq M$ ，注意到 $\lVert \frac{x}{\lVert x\rVert}\rVert_*=\lVert \sum\limits_{i=1}^{n}\frac{x_i}{\lVert x\rVert}\epsilon_i\rVert$ . 因此不妨考虑有界闭集 $\{x:\lVert x\rVert=1\}$ ，由 $\lVert x\rVert_a$ 关于 $(x_1,\cdots,x_n)$ 连续可知存在上、下界 $M,m\geq0$ ，并且 $m>0$ 由 $x\neq0$ ，从而得证.

以上的讨论局限在有限维空间中，对于无限维线性空间结论不成立：

>[!example]- 无限维空间中向量范数等价不成立. #imcomplete-whatever 

# 矩阵微积分

## 极限

对于向量序列 $\{x_n\}_{n\geq1}$ 和向量 $x$ ，可以定义**按范数收敛**： $\lim_{n\rightarrow \infty}\lVert x_n-x\rVert=0$ .

由[向量范数的等价性]() #imcomplete 可知在某一个向量范数下收敛，在其他向量范数下也收敛.

>[!note]- 赋范线性空间中柯西收敛定理只是向量序列收敛的必要条件. #imcomplete-whatever 
>
>因为收敛到的极限不一定在该赋范线性空间中，举例： $$x_n=\sum\limits_{k=1}^{m}\frac{t^m}{m!},t\in[0,1]$$

>[!note]- 向量序列收敛的充分必要条件是每一个分量都收敛，并且向量序列收敛到的极限的每个分量即为序列每一个分量收敛到的极限. #imcomplete-whatever 

对一矩阵范数 #issue %%针对有限维的情况？从而所有的矩阵范数等价，无所谓哪个矩阵范数？%% $\lVert \cdot\rVert$ ，矩阵序列 $\{M_n\}_{n\geq1}$ ，称 $\{M_n\}_{n\geq1}$ **按范数收敛**到矩阵 $M$ ，如果 $\lim_{n\rightarrow\infty}\lVert M_n-M\rVert=0$ .

>[!note]- 矩阵序列按范数收敛和按分量收敛等价. #imcomplete-whatever 
>考虑取最大列和范数.

收敛的矩阵序列具有如下性质：

>[!note]- 如果 $\lim_{n\rightarrow \infty}M_n,\lim_{n\rightarrow \infty}X_n=X$ ，则有 $\lim_{n\rightarrow \infty}M_nX_n=MX$ 
>证明：利用范数的三角不等式和相容性： $\forall m\geq1$ ： $$\begin{aligned}
>\lVert M_mX_m-MX\rVert &=\lVert M_m(X_m-X)+(M_m-M)X\rVert\\
>\leq \lVert M_m(X_m-X)\rVert+\lVert (M_m-M)X\rVert\\
>\leq \lVert M_m\rVert \lVert X_m-X\rVert+ \lVert M_m-M\rVert \lVert X\rVert
>\end{aligned}$$
>根据有界性分别取极限即可得到等式，注意这里要求

>[!note]- 对于矩阵序列 $\{M_n\}_{n\geq1},\{N_n\}_{n\geq1}$ ，如果 $M_n\rightarrow M,N_n\rightarrow N(n\rightarrow \infty)$ ，则 $M_nN_n\rightarrow MN(n\rightarrow \infty)$ .
>证明类似于上.

>[!example]- 设 $M$ 是方阵并且 $\lVert M\rVert<1$ ，则 $(I-M)^{-1}=\sum\limits_{i=1}^{\infty}M^i$ . 
>首先证明 $\sum\limits_{i=1}^{\infty}M^i$ 收敛，考虑用柯西收敛定理说明：不妨设 $m<n$ ， $$\lVert \sum\limits_{i=1}^{m}M^i-\sum\limits_{i=1}^{n}M^i\rVert\leq \sum\limits_{i=m+1}^{n}|M|^i$$ 根据 $\lvert M\rvert<1$ 可以得到结论，设收敛到 $S$. 
>下面记 $S_m=\sum\limits_{i=0}^{m}M^i$ ，根据上面的性质： $$\lim_{m\rightarrow \infty}S_m(I-M)=I-M^{m+1}$$ 取 $m\rightarrow \infty$ 即可得到 $S=(I-M)^{-1}$ 

>[!note]- 如果方阵序列 $M_m\rightarrow M(m\rightarrow \infty)$ 并且 $M$ 可逆，则对于充分大的 $m$ ， $M_m$ 可逆且 $\lim_{m\rightarrow \infty}M_m^{-1}=M^{-1}$ .
>证明：首先证明当 $m$ 充分大时 $M_m$ 可逆： 注意到 $$M_m=M-(M-M_m)=M(I-M^{-1}(M-M_m))$$ 根据范数的相容性可以证明： $$\lVert M^{-1}(M-M_m)\rVert\leq \lVert M^{-1}\rVert \lVert (M-M_m)\rVert\rightarrow 0(m\rightarrow \infty)$$ 因此当 $m$ 充分大时 $\lVert M^{-1}(M-M_m)\rVert<1$ ，从而根据上例可以得到： $M_m^{-1}=\sum\limits_{i=1}^{\infty}[M^{-1}(M-M_m)]^i\cdot M^{-1}$ （收敛性在上例已经证明过）. 下面考虑： $$\begin{aligned}
\lVert M_m^{-1}-M^{-1}\rVert &=\lVert \sum\limits_{i=0}^{\infty}[M^{-1}(M-M_m)]^i M^{-1}-M^{-1}\rVert\\
&=\lVert \sum\limits_{i=1}^{\infty}[M^{-1}(M-M_m)]M^{-1}\rVert\\
&\leq \sum\limits_{i=1}^{\infty}\lVert M^{-1}\rVert^{i+1} \lVert M-M_m\rVert^i\\
&=\lim_{m\rightarrow \infty}\frac{\lVert M^{-1}\rVert^2 \lVert M-M_m\rVert}{1-\lVert M^{-1}\rVert^m \lVert M-M_m\rVert^m}\\
&=0
\end{aligned}$$ 从而得到结论.

## 连续

考虑向量值连续函数 $f,g$ ，矩阵值连续函数 $M,N$ . $M,N$ 可乘 ， $M,f$ 可乘. 则有： #imcomplete-whatever 

- $\lVert f\rVert$ 连续；
- $\langle f,g \rangle$ 连续；
- $\forall \alpha,\beta\in \mathbb{R},\alpha f+\beta g$ 连续；
- $Mf$ 连续；
- 若 $M$ 为方阵且 $M^{-1}$ 存在，则 $M^{-1}$ 连续；
- $MN$ 连续；
- $f\circ g$ 连续.

与点集拓扑中的度量概念保持一致， 距离函数 $d(x,S)$ 满足一致连续条件： $$\lvert d(x,S)-d(y,S)\rvert\leq \lVert y-x\rVert$$ 

## 矩阵级数

考虑矩阵序列 $\{A_n\}_{n\geq1}$ ，称 $\sum\limits_{n=1}^{\infty}A_n$ 为**无穷级数**， $A_n$ 则称为**一般项**. 若 $\lim_{n\rightarrow \infty}A_n=A$ ，则称该无穷级数收敛. 且可以证明该无穷级数收敛到 $A$ 与 $n^2$ 个分量（数项级数）收敛到 $A$ 的每一个对应分量是等价的. 

对于矩阵级数也可以定义**绝对收敛**的概念： 各个数项级数都绝对收敛，并且可以证明 $\sum\limits_{n=1}^{\infty}A_n$ 绝对收敛的充分必要条件为 $\sum\limits_{n=1}^{\infty}\lVert A_n\rVert$ 收敛. #imcomplete-whatever .

>[!example]- 设 $A\in \mathbb{C}^{n\times n}$ ，证明矩阵幂级数 $I+A+\frac{A}{2!}+\cdots+\frac{A^k}{k!}+\cdots$ 绝对收敛，从而也收敛.
>证明：注意到 $$\begin{aligned}
\lVert \cdots\rVert &\leq \lVert I\rVert+\lVert A\rVert+\frac{\lVert A\rVert^2}{2!}+\cdots+\frac{\lVert A\rVert^k}{k!}+\cdots\\
&=\lVert I\rVert+e^{\lVert A\rVert}-1
\end{aligned}$$

