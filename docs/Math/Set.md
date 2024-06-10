# 集合及其运算

集合是基本的概念，不予定义，将集合理解为一个包含多个的整体. 

**属于** $x\in A$ ，**不属于** $x\notin A$ .

**罗素悖论**： $\{x:x\notin x\}$ .

**分离模式**： 设 $X$ 是集合 ， $\{x\in X:P(x)\}$ ；进而可以定义空集： $\emptyset=\{x\in X:x\neq x\}$ .

**包含（于）** $\supset(\subset)$ 或者 $\supseteq(\subseteq)$ ，**真包含（于）** $\supsetneq(\subsetneq)$ . **相等** $(A=B)\Leftrightarrow \forall x(x\in A\Leftrightarrow x\in B)\Leftrightarrow A\subset B\wedge B\subset A$ . 

**幂集** $\mathcal{P}(A)=\{X:X\subset A\}$ . 只含有一个元素的集合称为**单点集**.

运算：**并** $\cup$ ；**交** $\cap$ ；**差** $A\backslash B$ （或者记作 $A-B$ ）；如果 $A\subset X$ ，称 $X\backslash A\overset{def}{=}A^c$ 为 $A$ 关于 $X$ 的**补**集 ；

集合 $A,B$ 的**乘积**（或笛卡尔积 Cartesian Product、卡式积，对积）. 记为： $A\times B=\{(a,b):a\in A,b\in B\}$ . 对于**有序对** $(a,b)$ 或可以记作 $\{a,\{b\}\}$ 或 $\{\{a\},\{a,b\} \}$ （用后者），其具有性质： $(a,b)=(c,d)\Leftrightarrow (a=c)\wedge (b=d)$ ；此外有 $\emptyset \times A=A\times \emptyset=\emptyset$ .

并可以将乘积推广到多个集合，**直积**： 

$$\Pi_{k=1}^n A_k=\{(x_1,x_2,\cdots,x_n):x_i\in A_i,i=1,2,\cdots,n\}$$

**对称差**： $A\Delta B=(A\backslash B)\cup(B\backslash A)$ ，有结论： 

$$\begin{aligned}
&1)\ A\Delta B=(A\cup B)\backslash(A\cap B)\\
&2)\ A\Delta B=B\Delta A
\end{aligned}$$


**分配律**： 

$$\begin{aligned}
&A\cap\left(\bigcup_{i\in I}B_i\right)=\bigcup_{i\in I}\left(A\cap B_i\right)\\
&A\cup\left(\bigcap_{i\in I}B_i\right)=\bigcap_{i\in I}(A\cup B_i)
\end{aligned}$$

**De Morgan律**： 

$$\begin{aligned}
&A\backslash\left(\bigcup_{i\in I}B_i\right)=\bigcap_{i\in I}\left(A\backslash B_i\right)\\
&A\backslash\left(\bigcap_{i\in I}B_i\right)=\bigcup_{i\in I}(A\backslash B_i)
\end{aligned}$$ 

**积的分配律**： 

$$\begin{aligned}
&A\times\left(\bigcup_{i\in I}B_i\right)=\bigcup_{i\in I}(A\times B_i)\\
&A\times\left(\bigcap_{i\in I}B_i\right)=\bigcap_{i\in I}(A\times B_i)
\end{aligned}$$

>[!example]- $f(x),f_n(x)$ 为 $\mathbb{R}$ 上的连续函数，证明： $\{x:\lim_{n\rightarrow \infty}f_n(x)=f(x)\}=$ $\bigcap_{r=1}^\infty\bigcup_{n=1}^\infty\bigcap_{k=n}^\infty\{x:\lvert f_k(x)-f(x)\rvert<\frac{1}{r}\}$ .
>证明：首先证明 $\subset$ ：对于任意 $x\in\{x:\lim_{n\rightarrow \infty}f_n(x)=f(x)\}$ ， $\forall r\geq1,r\in \mathbb{N}$ ，存在 $N\in \mathbb{N}$ ，$\forall k>N$ ，均有 $\lvert f_k(x)-f(x)\rvert<\frac{1}{r}$ ，据次即可得到 $x\in \bigcap_{r=1}^\infty\bigcup_{n=1}^\infty\bigcap_{k=n}^\infty\{x:\lvert f_k(x)-f(x)\rvert<\frac{1}{r}\}$ ；
>
>反之，考虑 $y\in \bigcap_{r=1}^\infty\bigcup_{n=1}^\infty\bigcap_{k=n}^\infty\{x:\lvert f_k(x)-f(x)\rvert<\frac{1}{r}\}$ ，对于任意的 $\epsilon>0$ ，存在 $r\geq1:\frac{1}{r}<\epsilon$ ，由该集合的性质： $\exists N\in \mathbb{N}$ ，当 $k>N$ 时， $\lvert f_k(x)-f(x)\rvert<\frac{1}{r}<\epsilon$ ，从而可得 $\lim_{n\rightarrow \infty}f_n(x)=f(x)$ . 
>
>综上，等式成立.

>[!note]- $A\times B-C\times D=[(A-C)\times B]\cup[A\times (B-D)]$ .
>证明：若 $(x,y)\in A\times B-C\times D$ ，则 $\cancel{x\in A-C,y\in B-D}$ $(x,y)\in A\times B,(x,y)\notin C\times D\rightarrow x\notin C\land y\in D$ 或者 $x\in C\land y\notin D$ 或者 $x\notin C\land y\notin D$ . 并且从而可知 $(x,y)\in[(A-C)\times B]\cup[A\times (B-D)]$ . 若 $(x,y)\in [(A-C)\times B]\cup[A\times (B-D)]$ ，则 $x\in (A-C),y\in B$ 或者 $x\in A,y\in (B-D)$ ，两者都可以得出 $(x,y)\in A\times B-C\times D$ .
>^ProductMinus

# 集族

称集合 $\Lambda$ 为指标集，如果 $\forall \lambda\in \Lambda$ ，都有一个集合 $A_\lambda$ 与之对应，并称 $\mathcal{A}=\{A_\lambda\}_{\lambda\in\Lambda}$ 为集族. 从而可以定义集族 $\mathcal{A}$ 的交 $\bigcap_{\lambda\in\Lambda}A_\lambda$ 和集族的并 $\bigcup_{\lambda\in \Lambda}A_\lambda$ .  

如果指标集是空集，则称对应的集合族为**空族**（空族的并为空集，不考虑空族的交）. 如果集族中的每一个集合都为一个集合 $X$ 的子集，则称该集族为 $X$ 的**子集族**. $\{A_\lambda\}_{\lambda\in \Lambda}$ 即为 $\bigcup_{\lambda\in \Lambda}A_\lambda$ 的子集族.

**De Mogan定理**（集合族）： 

$$\begin{aligned}
&\left(\bigcup_{\lambda\in\Lambda}A_\lambda\right)^c=\bigcap_{\lambda\in \Lambda}A_\lambda^c\\
&\left(\bigcap_{\lambda\in\Lambda}A_\lambda\right)^c=\bigcup_{\lambda\in \Lambda}A^c_\lambda
\end{aligned}$$

证明从定义即可.

**集合序列**：如果 $\Lambda=\mathbb{N}$ ，则称 $\mathcal{A}$ 为集合序列，一般记为 $\{A_n\}_{n\geq1}$ .

# 集合极限

考虑集合序列 $\{A_n\}_{n\geq1}$ . 称 $A_1\subset A_2\subset \cdots\subset A_n\subset \cdots$ 为单调递增， $A_1\supset A_2\supset \cdots\supset A_n\supset \cdots$ 为单调递减.

>[!example]- 假设 $\{A_n\}_{n\geq1}$ 单调递减，则 $A_1=\left(\bigcap_{n=1}^\infty A_n\right)\bigcup\left(\bigcup_{n=1}^\infty(A_n-A_{n+1})\right)$ .
>证明：对于任意的 $x\in A_1$ ，注意到 $\bigcup_{n=1}^\infty(A_n-A_{n+1})=A_1-A_{n+1}$ ，假设 $\forall n\geq1,x\notin (A_1-A_{n+1})$ ，则 $x\in A_{n+1}$ ，从而可以得到 $x\in \bigcap_{n=1}^\infty A_n$ ，从而可以得到 $A_1\subset \left(\bigcap_{n=1}^\infty A_n\right)\bigcup\left(\bigcup_{n=1}^\infty(A_n-A_{n+1})\right)$ ；
>
>另一方面的包含是显然的，从而等式成立.

对于一个集合序列 $\{A_n\}_{n\geq1}$ 构造递减序列 $\{B_n\}_{n\geq1},B_k=\cup_{n\geq k}A_n$ 构造递增序列 $C_k=\cap_{n\geq k}A_n$ . 记： 

$$\begin{aligned}
&\varlimsup_{n\rightarrow \infty}A_n=\bigcap_{k=1}^{\infty}B_k\\
&\varliminf_{n\rightarrow \infty}A_n=\bigcup_{k=1}^{\infty}C_k
\end{aligned}$$

如果 $\varlimsup_{n\rightarrow\infty}A_n=\varliminf_{n\rightarrow\infty}A_n$ ，则称 $\{A_n\}_{n\geq1}$ 存在极限.

>[!hint] 直观上理解集合的上下极限：
>$x\in\varlimsup_{n\rightarrow \infty}A_n \Leftrightarrow$ 有任意大的 $n$ 使得 $A_n$ 中含有 $x$ ；
>
>$x\in\varliminf_{n\rightarrow \infty}A_n \Leftrightarrow$ 当 $n$ 充分大时有 $x\in A_n$ .

>[!tip] 助记：上交.

>[!note] 上下极限互补： 
>$$\begin{aligned}
>&\left(\varlimsup_{n\rightarrow \infty}A_n\right)^c=\varliminf_{n\rightarrow \infty}A_n^c\\
>&\left(\varliminf_{n\rightarrow \infty}A_n\right)^c=\varlimsup_{n\rightarrow \infty}A_n^c
>\end{aligned}$$

>[!example]- 集合序列的极限： $\{A_n\}_{n\geq1},A_n=\{\frac{m}{n}:m\in \mathbb{Z}\}$ ，证明 $\varlimsup_{n\rightarrow \infty}A_n=\mathbb{Q}$ ， $\varliminf_{n\rightarrow \infty}A_n=\mathbb{Z}$ .
>注意到： 
>
>$$\mathbb{Z}\subset \varliminf_{n\rightarrow \infty}A_n,\varlimsup_{n\rightarrow \infty}A_n\subset \mathbb{Q}$$ 
>
>- 对于 $x\in \bigcup_{n\geq1}\bigcap_{k\geq n}A_k$ ，存在 $n_1$ 使得 $x\in \bigcap_{k\geq n_1}A_k$ ，进而一定存在 $n_1$ 使得 $x\in A_{n_2}\cap A_{n_2+1}$ . 从而可以得到 $x=\frac{m_1}{n_2}=\frac{m_2}{n_2+1}$ ，进而 $x=m_2-m_1\in \mathbb{N}$ . 从而取等.
>- 由于 $\frac{p}{q}=\frac{np}{nq},\forall n\in \mathbb{Z}$ ，所以 $\frac{p}{q}\in \bigcup_{k\geq n}A_k,\forall n\geq1$ ，从而可得 $\frac{p}{q}\in \bigcap_{n\geq1}\bigcup_{k\geq n}A_k$ ，最后由 $\frac{p}{q}$ 的任意性等式成立 .

根据定义有以下结论：

>[!note] $x\in\varlimsup_{n\rightarrow \infty}A_n\Leftrightarrow \forall n\geq1(\exists N\geq n,x\in A_N)$ 即有无穷多个包含 $x$ 的 $A_N$

>[!note] $x\in\varliminf_{n\rightarrow \infty}A_n\Leftrightarrow \exists N\geq1(\forall n\geq N,x\in A_n)$ 或者不包含 $x$ 的集合只有有限多个.

>[!note] $\varliminf_{n\rightarrow \infty}A_n\subset \varlimsup_{n\rightarrow \infty}A_n$ .

进而有取等时的充分条件：

>[!note] 如果 $\{A_n\}_{n\geq1}$ 单调，则 $\varliminf_{n\rightarrow \infty}A_n=\varlimsup_{n\rightarrow \infty}A_n$ 
>$$=\left\{\begin{aligned}
>&\bigcup_{n=1}^\infty A_n,A_n\text{ 单调递增}\\
>&\bigcap_{n=1}^\infty A_n,A_n\text{ 单调递减}
>\end{aligned}\right.$$

# 集合刻画

设 $\{f_n\}_{n\geq1}$ 为 $\mathbb{R}$ 上的实值函数列，有： #issue %%为什么错误%%

$$\begin{aligned}
\{x:\varliminf_{n\rightarrow \infty}f_n(x)>0\}&=\{x\in \mathbb{R}:\sup_{n\geq1}\inf_{k\geq n}f_k(x)>0\}\\
&=\bigcup_{n\geq1}\{x\in \mathbb{R}:\inf_{k\geq n}f_k(x)>0\}\\
&=\bigcup_{n\geq1}\bigcap_{k\geq n}\{x:\in \mathbb{R}:f_k(x)>0\}
\end{aligned}$$

>[!example]- $\{f_n\}_{n\geq1}$ 为 $\mathbb{R}$ 上的实值函数列，则有 $\{x:\varliminf_{n\rightarrow \infty}f_n(x)>0\}\subset \varliminf_{n\rightarrow \infty}\{x\in \mathbb{R}:f_n(x)\}$ .

>[!note] 用特征函数刻画集合运算：
>$$\begin{aligned}
>&A=B\Leftrightarrow \chi_A=\chi_B\\
>&A\subset B\Leftrightarrow \chi_A\leq \chi_B\\
>&\chi_{A\Delta B}=\lvert \chi_A-\chi_B\rvert\\
>&\chi_{A\cap B}=\chi_A\chi_B\\
>&\chi_{A\cup B}=
>\end{aligned}$$

# 关系

可以用集合定义两个元素之间的**关系**. 设集合 $S\subset A\times B$ . 如果 $(a,b)\in S$ 则称 $a,b$ 之间关于存在由 $S$ 定义的关系，记为 $a\sim b$ 或者 $aRb$ .

**对偶关系**

设 $a,b$ 之间存在关系 $R$ ，其由集合 $S=\{(a,b):a\in A,b\in B\}$ 定义. 考虑集合 $S^{op}=\{(b,a):a\in A',b\in B'\}$ ，如果 $(b,a)\in S^{op}$ ，则记由 $S^{op}$ 定义的关系为 $R^{op}$ ，记为 $aR^{op}b$ .

**复合关系**

考虑关系 $R,S$ ，记 $S\circ R=\{(a,c):\exists b(aSb\wedge bRc)\}$

# 势（基数）

## 映射

映射描述的是从集合 $X$ 到集合 $Y$ 的一个对应关系，**单射**、**满射**和**双射**是特殊的映射.

此外还有一些特殊的映射： $1_X:X\rightarrow X,x\mapsto x$ 称为 $X$ 上的**恒等映射**；设 $A\subset X,i:A\rightarrow X:x\mapsto x$ 称为 $A$ 在 $X$ 中的**含入映射**. **特征函数**或指示函数： 

$$A\subset X,\chi_A=\left\{\begin{aligned}
&1,x\in A\\
&0,x\notin X-A
\end{aligned}\right.$$

例如，对于 $\mathbb{Q}\subset \mathbb{R},\chi_\mathbb{Q}$ 为一特征函数，也即为**Dirichlet函数**.

>[!example]- 设 $\{A_n\}_{n\geq1}$ 是一集列，证明： i) $\chi_{\varlimsup_{n\rightarrow \infty}A_n}(x)=\varlimsup_{n\rightarrow \infty}\chi_{A_n}(x)$ . ii) $\chi_{\varliminf_{n\rightarrow \infty}A_n}(x)=\varliminf_{n\rightarrow \infty}\chi_{A_n}(x)$ .
>证明：
>i) ：如果 $x\in\varlimsup_{n\rightarrow \infty}A_n$ ，则 $\forall n\geq1,x\in \bigcup_{k=n}^\infty A_n$ ， 则存在 $k_1\geq n,x\in A_{k_1}$ ，依次类推可以得到 $k_1<k_2<\cdots$ ，有 $x\in A_{k_i},i=1,2,\cdots$ ，从而 $\varlimsup_{n\rightarrow \infty}\chi_{A_n}(x)=1$ . 
>
>反之，如果 $x\notin \varlimsup_{n\rightarrow \infty}A_n$ ，则 $\forall n\geq1,x\notin \bigcup_{k=n}^\infty A_k$ ，从而 $x\notin A_n,\forall n\geq1$ ，因此 $\varliminf_{n\rightarrow \infty}\chi_{A_n}(x)=0$ .
>
>ii) ：如果 $x\in\varliminf_{n\rightarrow \infty}A_n$ ，则显然有 $\varliminf_{n\rightarrow \infty}\chi_{A_n}(x)=1$ ，反之若 $x\notin \varliminf_{n\rightarrow \infty}A_n$ ，则对于任意的 $n\geq1$ ，有 $x\notin \bigcap_{k=n}^\infty A_k$ ，从而 $x\notin A_k,k\geq 1$ ，进而有 $\varliminf_{n\rightarrow \infty}\chi_{A_n}(x)=0$ .

特征函数还具有以下性质 [zhihu](https://zhuanlan.zhihu.com/p/616321641) #imcomplete 

定义映射的**复合**： $f:X\rightarrow Y,g:Y\rightarrow Z$ ，进而记 $g\circ f(x)=g(f(x)),g\circ f:X\rightarrow Z$ .

对于双射，其具有以下的充分必要条件：

>[!note]- 设 $f:X\rightarrow Y$ ，如果存在 $g:Y\rightarrow X$ 使得 $f\circ g=1_Y,g\circ f=1_X$ ，则 $f$ 为双射，并且这样的 $g$ 唯一. #imcomplete-whatever
>证明： 略.  

称满足上述条件的 $g$ 为 $f$ 的**逆映射**，记为 $f^{-1}$ .

>[!example]- 只满足 $f\circ g=1_Y$ 或者 $g\circ f=1_X$ 的映射 $g$ 不一定是 $f$ 的逆映射.
>以 $f\circ g=1_Y$ 为例，设 $g\circ f(x)=x'$ ，将 $f$ 作用在等式左右边得到 $f(x)=f(x')$ ，由此可见如果 $f$ 不是单射则 $g\neq f^{-1}$ 不成立.
>
>设 $f=(x-1)^2:[0,+\infty)\rightarrow [0,+\infty)$ ， 
>
>$$g=\left\{\begin{aligned}
>&\sqrt{x}+1,x>1\\
>&1-\sqrt{x},0\leq x\leq1
>\end{aligned}\right.$$
>
>则 $g:[0,+\infty)\rightarrow [0,+\infty)$ ，则 $f\circ g=1_Y$  ，而 $g\circ f\left(\frac{3}{2}\right)=\frac{1}{2}$ .

此外对于 $f:X\rightarrow Y$ ，还可以定义 $Y$ 的**原像**： $f^{-1}(Y)=\{x\in X:f(x)\in Y\}$

>[!note] $A\subset f^{-1}(f(A)),B\supset f(f^{-1}(B))$ . 

>[!note] $f^{-1}\left(\bigcup_{\lambda \in \Lambda}A_\lambda\right)=\bigcup_{\lambda\in \Lambda}f^{-1}(A_\lambda)f^{-1}\left(\bigcap_{\lambda \in \Lambda}A_\lambda\right)=\bigcap_{\lambda\in \Lambda}f^{-1}(A_\lambda),$

>[!note] $\left(f^{-1}(A)\right)^c=f^{-1}(A^c)$

$$\begin{aligned}
&f\left(\bigcup_{\lambda\in \Lambda}A_\lambda\right)=\bigcup_{\lambda\in \Lambda}f(A_\lambda)\\
&f\left(\bigcap_{\lambda\in \Lambda}A_\lambda\right)\overset{\textcolor{red}{?}}=\bigcap_{\lambda\in \Lambda}f(A_\lambda)
\end{aligned}$$

注意： $f\left(\bigcap_{\lambda\in \Lambda}A_\lambda\right)\subset \bigcap_{\lambda\in \Lambda}f(A_\lambda)$

>[!note] 反例以及对于 $f$ 是单射为上式取等的充分条件
>包含关系是显然的. 对于反例，可以取一非单射的 $f$ ： 
>
>$$\begin{aligned}
>&A=\{1,2\},B=\{2,3\}\\
>&f(1)=f(3)=4,f(2)=2\\
>&f(A\cap B)=2,f(A)\cap f(B)=\{4,2\}
>\end{aligned}$$
>
>下面证明取等的充分条件为 $f$ 为单射.
>- $\Leftarrow$ ：注意到对任意 $x\in\bigcap_{\lambda\in \Lambda}f(A_\lambda)$ ，则每一个集合 $A_\lambda$ 中都至少存在一个元素 $a_\lambda$ 满足 $x=f(a_\lambda)$ ，设 $A_\lambda,\lambda\in \Lambda$ 中满足 $x=f(a_\lambda)$ 的元素组成的集合为 $\Lambda'$. 并且由 $f$ 为单射，可知 $\Lambda'=\{x\}$ . 从而每一个集合中都有一个 $x$ ，进而可知 $f(x)\in f\left(\bigcap_{\lambda\in \Lambda}A_\lambda\right)$ . 由集合相互包含可得取等.
>- $\Rightarrow$ ：并不是必要条件，可以取 $f$ 为一个恒等映射.

## 势

用**势**（cardinality）衡量两个集合的大小，考虑集合 $A,B$ ，如果 $A$ 与 $B$ 等价（存在双射），则记 $\lvert A\rvert=\lvert B\rvert$ ；如果 $A$ 与 $B$ 的一个子集等价，则记 $\lvert A\rvert\leq \lvert B\rvert$ .  在此基础上，如果 $B$ 不与 $A$ 中的任何一个子集等价，则记 $\lvert A\rvert<\lvert B\rvert$ .

可以证明： $\leq$ 具有自反性（ $\lvert A\rvert\leq \lvert A\rvert$ ）和传递性（ $\lvert A\rvert\leq \lvert B\rvert,\lvert B\rvert\leq \lvert C\rvert\rightarrow \lvert A\rvert\leq \lvert C\rvert$ ）.

>[!note]- $\lvert A\rvert\leq \lvert B\rvert$ 并且 $\lvert B\rvert \leq \lvert A\rvert$ 的充分必要条件为 $\lvert A\rvert=\lvert B\rvert$ . 
>证明：由题可知 $A$ 与 $B$ 的一个子集 $B_1$ 等价， $B$ 则与 $A$ 的一个子集 $A_1$ 等价，则 $B_1$ 与 $A_1$ 的一个子集 $A_2$ 等价；从而 $A_2$ 与 $A$ 等价，而 $A_2\subset A$ ，所以 $\lvert A\rvert=\lvert A_2\rvert$ ，由 $A\subset A_1\subset A_2$ 从而 $\lvert A\rvert=\lvert A_1\rvert=\lvert B\rvert$ . （见下面定理）
>
>反之显然.

>[!note]- $\lvert A\rvert\leq\lvert B\rvert$ ，取等号当且仅当 $B$ 到 $A$ 存在满射.
>$\Rightarrow$ ：因为 $\lvert A\rvert\leq\lvert B\rvert$ ，所以存在单射 $f:A\rightarrow B$ . 考虑从 $B$ 到 $A$ 的映射：取 $a_0\in A$ 
>
>$$g(b)=\left\{\begin{aligned}
>&a\quad f(a)=b\\
>&a_0
>\end{aligned}\right.$$ 即为满射.
>
>$\Leftarrow$ ：构造 $A$ 到 $B$ 的单射：考虑逆像 $g^{-1}(a),a\in A$ ，由 $g:B\rightarrow A$ 为满射可知 $g^{-1}(a)\neq\emptyset,\forall a\in A$ . 进而可以得到一个集合族： $\{g^{-1}(a):a\in A\}$ ，根据选择公理，可以定义 $f(a)\in g^{-1}(a)$ ，并且容易验证 $f$ 是单射.

对于势为 $n$ 的集合 $A$ ， $\mathcal{P}(A)$ 的势为 $2^n$ . 对于势为 $\mu$ 的集合 $A$，定义 $\mathcal{P}(A)=2^\mu$ . 考虑 $\mu$ 是无限基数时的情况. 有下定理： 

>[!note]- **Cantor定理**： 对于任一集合 $X$ ， $\lvert X\rvert<\lvert \mathcal{P}(X)\rvert$ ，从而有 $\mathcal{P}(\mathbb{N})$ 不可数. 推论：不存在最大的势.
>首先证明： $\lvert A\rvert\leq \lvert \mathcal{A}\rvert$ ，考虑映射 $f:A\rightarrow \mathcal{P}(A),x\rightarrow \{x\}$ 即可.
>
>证法一：不存在 $\mathcal{P}(X)$ 到 $X$ 的单射；
>
>证法二：不存在 $X$ 到 $\mathcal{P}(X)$ 的满射；任给一映射 $f:X\rightarrow \mathcal{P}(X)$ ，考虑集合 $A=\{x\in X:x\notin f(x)\}$ ，假设存在 $a\in A$ 使得 $f(a)=A$ ，则有 $a\notin f(a)=A$ ，矛盾！如果 $a\notin A$ ，由 $f(a)=A$ ，则因为 $a$ 满足 $a\notin f(a)$ 所以 $a\in A$ ，矛盾！
>^Cantor

>[!note]- $\mathbb{R}$ 中的所有开区间等价.
>证明：
>1. 对于有限开区间 $(a,b)$ ，设函数 $f:a+(b-a)x$ ，可得所有有限开区间等价；
>2. 对于 $\mathbb{R}$ ，设函数 $\tan\left(x\right)$ ，则 $\mathbb{R}$ 和 $(-\frac{\pi}{2},\frac{\pi}{2})$ 等价，进而与所有有限开区间等价；
>3. 其他情况与之类似，利用 $\tan$ 映射即可.
>^OpenSim

>[!note]- 设 $\{A_\lambda\}_{\lambda\in \Lambda},\{B_\lambda\}_{\lambda\in \Lambda}$ 中的集合两两不交. 如果 $A_\lambda\sim B_\lambda,\forall \lambda\in \Lambda$ ，则 $\bigcup_{\lambda\in \Lambda}A_\lambda\sim \bigcup_{\lambda\in \Lambda}B_\lambda$ .
>证明：记： $f_\lambda:A_\lambda\rightarrow B_\lambda$ 为双射，进而设 $f(x)=f_\lambda(x),x\in A_\lambda$ . 证明 $f$ 为双射即可. #imcomplete-whatever 

>[!note]- 设 $A_0\supset A_1\supset A_2$ ， $A_0\sim A_2$ ，证明： $A_0\sim A_1$ .
>证明：尝试将 $A_0$ 和 $A_1$ 转换为两两不交集合的并，利用相应集合等势证明之.
>
>由 $A_0\sim A_2$ ，设双射 $f:A_0\rightarrow A_2$ ，设 $A_3=f(A_1)$ ， $A_4=f(A_2)$ ， $A_{n+2}=f(A_n)$ ，由 $A_0\supset A_1\supset A_2$ ，进而有 $A_2=f(A_0)\supset f(A_1)=A_3$ ，依次类推可以得到 $A_{2n}\supset A_{2n+1},n\geq1$ ，同理有 $A_3=f(A_1)\supset f(A_2)=A_4$ ，依次类推可得到 $A_{2n+1}\supset A_{2n+2},n\geq0$ . 从而可以得到一个单调递减集列 $\{A_n\}_{n\geq1}$ . 设 $A_{-1}=\bigcap_{n=0}^\infty A_n$ . <u>由包含关系可得</u>： $A_{-1}=\bigcap_{n=1}^\infty A_{2n}=\bigcap_{n=1}^\infty A_{2n+1}$ .
>
>由[引理]()可得 $A_0=A_{-1}\bigcup\left(\bigcup_{n=0}^\infty (A_{2n}-A_{2n+2})\right)$ ，而 $A_1=A_{-1}\bigcup\left(\bigcup_{n=0}^\infty (A_{2n+1}-A_{2n+3})\right)$ .
>
>下面证明： $(A_{2n+1}-A_{2n+3})\sim (A_{2n}-A_{2n+2})$ ，注意到 $(A_{2n+1}-A_{2n})\sim(A_{2n+3}-A_{2n+2})$ ，并且 $(A_{2n}-A_{2n+3})\sim(A_{2n}-A_{2n+3})$ ，注意到对应位置（左、右）的集合都是不交的，从而有 $(A_{2n+1}-A_{2n+3})\sim (A_{2n}-A_{2n+2})$ .
>
>再由 $A_0$ ， $A_1$ 的集合并中的集合两两不交，可以得到 $A_0\sim A_1$ .

>[!example]- 构造 $(0,1)\rightarrow [0,1]$ 的双射.
>Hint: $\frac{1}{n}\rightarrow \frac{1}{n-2}$ . 或者更一般地取可数集 $\{r_n\}_{n\geq1}\subset \mathbb{Q}$ ，然后将 $r_1\rightarrow 0,r_2\rightarrow 1,r_{n}\rightarrow r_{n-2}(n\geq3)$ .

### 可数集

>[!summary]+ 自查表
>- 可数集的任意并不是可数集的反例？

$\exists n\in \mathbb{N},A\sim \{1,2,\cdots,n\}$ ，则称 $A$ 为**有限集**. 否则称 $A$ 为**无限集**. $A\sim \mathbb{N}$ 则称 $A$ 为**可数集**. 有限集和可数集统称为**至多可数集**.

>[!note]- 任何一个无限集都包含一个可数集.
>证明：设 $E$ 为一个无限集，依次取： $a_1\in E,a_2\in E\backslash \{a_1\},\cdots$ 得到一个可数集 $\{a_n\}_{n\geq1}$

>[!note]- 可数集的任何一个无限子集都是可数集.
>证明：考虑 $A\subset E$ ，设 $E=\{a_n\}_{n\geq1}$ ， $A$ 为无限集合，则取 $n_1=\arg\min\{a_n\in A\}$ ，$n_2=\arg\min\{a_n\in A\backslash a_{n_1}\},\cdots$ 进而可以将 $A$ 与 $\mathbb{N}$ 建立一一对应.

>[!note] 至多可数集的并仍然为至多可数集.
>证明：直接按照对角线法则即可：
>
>$$\begin{aligned}
>&E_1:a_1^1,a_2^1,\cdots\\
>&E_2:a_1^2,a_2^2,\cdots\\
>&\cdots
>\end{aligned}$$ 

>[!example]- 任意个可数集的并不一定是可数集.
>$$\mathbb{R}=\bigcup_{x\in[0,1]}A_x,A_x=\{x+n:n\in \mathbb{Z}\}$$

>[!note] 有限个可数集的直积是可数集.
>Hint：对于有限个可数集 $X_1=\{x^1_n\}_{n\geq1},\cdots,X_k=\{x^k_n\}_{n\geq1}$ ，考虑用数学归纳法解决. 对于两个可数集的积，可以用对角线法则说明其可数. #imcomplete-whatever 

>[!example]- 设 $f$ 是 $\mathbb{R}$ 上的实函数，若 $M>0$ ，使得对于任何有限个 $x_1,x_2,\cdots,x_n$ 有 $\lvert \sum\limits_{i=1}^{n}x_i\rvert\leq M$ ，证明 $\{x:f(x)\neq0\}$ 为至多可数集.
>Hint: $\{x:f(x)\neq0\}=\bigcup_{n=1}^\infty \{x:\lvert f(x)\rvert>\frac{1}{n}\}$ #imcomplete-whatever 

$\mathbb{N},\mathbb{Z},\mathbb{Q},\mathbb{N}\times \mathbb{N},\mathbb{Z}\times \mathbb{Z}$ 等都是可数集. 例如： $\mathbb{Q}$ ，考虑 $A_n=\{\frac{m}{n}\:m\geq1\},A_n\sim \mathbb{N}$ . 从而 $\mathbb{Q}^+=\bigcup_{n\geq1}A_n\sim \mathbb{N}$ 同理 $\mathbb{Q}^-\sim \mathbb{N}$ 从而 $\mathbb{Q}\sim \mathbb{N}$（因为 $\mathbb{Q}$ 不是有限集）.

>[!note]- 假设 $A$ 为无限集， $B$ 为至多可数集，则 $A\sim A\cup B$ .
>考虑到 $A\cup B=A\cup (B\backslash A)$ . 设 $C=B\backslash A$ ， $A\cap C=0$ ， $C\subset B$ 为至多可数集，因为 $A$ 是无限集，所以存在 $A_1\subset A$ 为可数集，从而 $A_1\cup C$ 为可数集，因此 $(A_1\cup C)\sim A_1$ ，又显然 $(A-A_1)\sim (A-A_1)$ ，且 $(A_1\cup C)\cap (A-A_1)=\emptyset,(A_1)\cap (A-A_1)=\emptyset$ ，从而不难构造双射，进而有 $A\cup C=(A-A_1)\cup (A_1\cup C)=(A\cup C)\sim A=(A-A_1)\cup A_1$ .

进而有下推论：

>[!note]- $\mathbb{R}$ 中的所有区间等价.
>之前已经证明了 $\mathbb{R}$ 中的[所有开区间等价](#^OpenSim). 从而对于 $[a,b]=(a,b)\cup \{a,b\}$ 由 $\{a,b\}$ 为至多可数集即可推出其与 $(a,b)$ 等价，同理等价于 $[a,b),(a,b]$ .
>^RAllEqual

**阿列夫数**

$\lvert \mathbb{N}\rvert=\aleph_0$ 

$\lvert\mathcal{P}(\mathbb{N})\rvert=2^{\aleph_0}$

其中 $2^{\aleph_0}=\{0,1\}^{\mathbb{N}}$ 表示所有 $\mathbb{N}\rightarrow\{0,1\}$ 的函数的集合.

$\lvert \mathcal{P}(\mathcal{P}(\mathbb{N}))\rvert=2^{2^{\aleph_0}}$ .

>[!example]- 设 $E\subset \mathbb{R}^3$ ， $E$ 中任何两点的距离都是有理数，求证 $E$ 至多可数.
>证明：任取 $x_1,x_2$ ，设映射 
>
>$$\begin{aligned}
>&f:E\rightarrow \mathbb{Q}\times \mathbb{Q}\\
>&x\mapsto(d_1,d_2)
>\end{aligned}$$ 
>
>其中 $d_1,d_2$ 分别为 $d(x,x_1),d(x,x_2)$ ， $d$ 为欧式距离度量. 如果若 $f(x)=f(x'),x\neq x'$ 即 $d_1=d_1',d_2=d_2'$ ，则 $x,x'$ 为以 $x_1$ 为圆心的圆与以 $x_2$ 为圆心的圆的交上. 又因为空间中的两个圆或者重合，或者至多相交两个点. 由圆心 $x_1\neq x_2$ 可知这两个圆不可能重合，从而至多相交两个点，如果如果只相交于一个点，则 $x=x'$ ，矛盾，因此只可能是相交于两个点. 定义映射 $g:E\rightarrow \{0,1\}$ ，并且满足若 $\exists x,x':f(x)=f(x'),g(x)+g(x')=1$ ，若不存在 $x,x':f(x)=f(x'),g(x)=0$ ，从而建立了 $E$ 到 $F=\{(d_1,d_2,g(x):x\in E\}\subset\mathbb{Q}\times \mathbb{Q}\times \mathbb{Q}$ 的一个双射. 对于任意的 $y=(h_1,h_2,h_3)\in F$ ，首先由 $(h_1,h_2)$ 对应于 $E$ 中至多两个点，至少一个点，并且由 $h_3$ 可以确定 $E$ 中的唯一点，所以该映射为满射；其次由构造规则可知该映射为单射. 综上 $E$ 至多可数.

>[!example]- 有理系数多项式全体是可数集.
>证明：在下面已经证明了有限 $n$ 元数列（只有有限个数非 $0$ ）是可数集. 对于任意有理系数多项式，可将其对应于一有限的 $\mathbb{Q}$ 上的数列，并进一步映射为有限 $n$ 元数列：
>
>$$a_0+a_1x+a_2x^2+\cdots+a_nx^n+0x^{n+1}+\cdots$$ 将其映射为 $m_0,n_0,m_1,n_1,\cdots,m_n,n_n,0,\cdots$ ，记该映射为 $\mathcal{L}$ ，其中 $(m_i,n_i)=1,a_i=\frac{m_i}{n_i}$ 或者 $m_i=n_i=0$ 若 $a_i=0$ ，因此对于多项式 $f(x),g(x)$ ，如果 $f(x)=g(x)$ ，则 $a_i=b_i,\cdots$ ，显然 $\mathcal{L}$ 是双射.
>
>记全体有理系数多项式 $\mathcal{F}$ ，则 $\mathcal{L}(\mathcal{F})=\bigcup_{k\geq1}\{m_0,n_0,\cdots,m_k,n_k,\cdots:m_k,n_k\neq 0\}$ ，显然 ${m_0,n_0,\cdots,m_k,n_k,\cdots:m_k,n_k\neq 0\}$ 为有限个正整数集的积从而可数，而可数个可数集的并仍然为可数集，所以 $\mathcal{L}(\mathcal{F})$ 可数，从而 $\mathcal{F}$ 可数.
>
>（或者，直接将 $\mathcal{F}$ 对应于可数个 $\mathbb{Q}$ 的乘积.）

### 连续统势

>[!summary]+ 自查表
>- 连续统势的定义；
>- 为什么可数个可数集的乘积具有连续统势；

前面讨论的可数集具有的势是一种特殊的势，一般称 $A\sim \mathbb{N}$ ，则 $\lvert A\rvert=a$ . 对于与 $\{1,2,\cdots,n\}$ 等价的集合 $A$ ，记 $\lvert A\rvert=n$ ，下面考虑的是 $\mathbb{R}$ 的势. 

>[!note]- $[0,1]$ 是不可数集. 推论： $\mathbb{R}$ 为不可数集.
>证明：反证：假设 $[0,1]=\{a_n\}_{n\geq1}$ ，取不包含 $a_1$ 的闭区间 $A_1$ ，满足 $l(A_1)\leq \frac{1}{2}$ ，在 $A_1$ 中取不包含 $a_2$ 的闭区间 $A_2:l(A_2)\leq \frac{1}{2^2}$ ，依次类推，从而得到闭区间套： $$A_1\supset A_2\supset \cdots \supset A_n\supset \cdots$$ ，从而有 $a=\bigcap_{n\geq1}A_n$ ， $a\notin \{a_n\}_{n\geq1}=[0,1]$ 矛盾.

称与 $[0,1]$ 等价的集合具有**连续统势**. 或记作 $\lvert A\rvert=c$ . 由上[结论](#^RAllEqual)，可以得到 $\mathbb{R}$ 中的所有区间均具有连续统势.

下面进一步讨论具有连续统势的集合. 首先引入**n元数列**：由 $0,1,\cdots,n-1$ 组成的数列. **有限n元数列**则包含有限个不为 $0$ 的项，**无限n元数列**则有无限个不为 $0$ 的项. 

特别的， $2$ 元数列可以视为对于某一集合进行指示函数的结果，例如 $\mathbb{Q}\times \mathbb{Q}$ 的一个子集 $A$ 可以被表示为二元数列 $\chi_A(\mathbb{Q})$ ，相当于 $\chi_A(\mathbb{N})$ ，从而可以建立 $\mathcal{P}(\mathbb{Q},\mathbb{Q})$ 到二元数列全体的一个双射. 下面讨论一般的 $n$ 元数列.

>[!note]- $n$ 元数列全体具有连续统势.
>首先考虑有限 $n$ 元数列全体 $B$ ，该集合显然是至多可数集（可数个至多可数集）. 下面考虑无限 $n$ 元数列全体 $C$ .
>
>考虑集合 $(0,1]$ ，对于任意 $x\in(0,1]$ ，首先将 $(0,1]$ 分成 $\{(\frac{k-1}{n},\frac{k}{n}]\}_{1\leq k\leq n}$ ，随后取 $k_1-1:x\in (\frac{k_1-1}{n},\frac{k_1}{n}]$ ，下面对于 $(\frac{k_1-1}{n},\frac{k_1}{n}]$ 进行相同的划分，然后取 $k_2,\cdots,k_n,\cdots$ ，从而建立了从 $(0,1]$ 到 $C$ 的映射，并且有 $x=\sum\limits_{i=1}^{\infty}\frac{k_i-1}{n^i}$ 
>
>首先证明 $f$ 为单射：若 $x\neq x'$ ，则存在 $M$ ，当 $m>M$ 时有 $\frac{1}{n^m}<\lvert x-x'\rvert$ ，因此 $f(x)\neq f(x')$ . 
>
>$f$ 是满射亦显然，任何 $C$ 中 $n$ 元数列对应的 $\sum\limits_{i=1}^{\infty}\frac{k_i-1}{n^i}$ 都是收敛的，并且在 $(0,1]$ 区间内. 
>
>所以 $C$ 与 $(0,1]$ 等价，为无限集，又 $B$ 为至多可数集，所以 $C\cup B\sim (0,1]$ ，从而 $n$ 元数列全体与 $(0,1]$ 等价，具有连续统势.

在[之前](#^Cantor)已经证明了集合的子集全体的势要大于原先集合的势，下面证明：

>[!note]- 可数集的子集全体具有连续统势.
>不妨考虑 $\mathbb{N}$ ，对于任意 $A\subset \mathbb{N}$ ，考虑映射 $f(A)=\{a_n\}_{n\geq1}$ ，其中 
>
>$$a_n=\left\{\begin{aligned}
>&1,n\in A\\
>&0,n\notin A
>\end{aligned}\right.$$ 
>
>进而建立了 $\mathcal{P}(\mathbb{N})$ 与二元数列全体之间的一个映射，显然该映射为双射. 因此两者等价. 再由上结论可知 $\mathcal{P}(\mathbb{N})$ 具有连续统势.
>
>从而，可数集的子集的全体具有连续统势. （对于一般的可数集，仍然可以效仿上述构造方法，只需要提前设可数集 $B=\{b_n\}_{n\geq1}$ 即可.

之前提到，至多可数个至多可数集的并仍然是至多可数集. 下面考虑集合的积. 在证明集合的积时经常需要用到之前提到的 $n/2$ 元数列.

>[!note] 可数个具有连续统势的集合的积具有连续统势.
>证明：考虑可数个二元数列的积 $X=\prod_{i=1}^{\infty}X_i$ ，下面证明 $X$ 与二元数列全体等价：对于任意的 $x=(x_1,x_2,\cdots,x_n,\cdots)\in \prod_{i=1}^{\infty}X_i$ ，按照对角线法则可以将其转换为一个新的二元数列，进而建立从 $X$ 到二元数列全体的一个新的映射，该映射显然为双射. 从而 $X$ 具有连续统势. 

自然有如下结论：

>[!note]- $\lvert \mathbb{R}\times \mathbb{R}\rvert=\lvert \mathbb{R}\rvert=\lvert \mathcal{P}(\mathbb{N})\rvert$

之前已经证明有限个可数集的直积为可数集，下面考虑可数个可数集的直积：

>[!note] 可数个可数集的直积具有连续统势.
>考虑 $Y_n=\{0,1\}$ ，考虑 $X=\prod_{n=1}^{\infty}X_n$ ，其中 $X_n$ 为可数集，则 $\lvert Y_n\rvert\leq \lvert X_n\rvert$ ，从而可以构造 $\prod_{n=1}^{\infty}Y_n$ 到 $\prod_{n=1}^{\infty}X_n$ 的子集的双射，从而 $\lvert \mathbb{R}\rvert=\lvert \prod_{n=1}^{\infty}Y_n\rvert\leq \lvert \prod_{n=1}^{\infty}X_n\rvert$ ，又 $\lvert X_n\rvert\leq \lvert \mathbb{R}\rvert$ 所以可得 $\lvert \prod_{n=1}^{\infty}X_n\rvert\leq \lvert \prod_{n=1}^{\infty}\mathbb{R}\rvert$ ，综上 $\lvert \prod_{n=1}^{\infty}X_n\rvert=\lvert \mathbb{R}\rvert$ .

按照上述方法，同样可以证明：

>[!note]- 至多可数个具有连续统势的集合的积仍然具有连续统势.

>[!example]- $[0,1]$ 上的连续实值函数全体 $\mathcal{F}$ 具有连续统势.
>证明：将 $\mathcal{F}$ 映射到与 $\mathbb{R}$ 等势的集合的子集，将 $\mathbb{R}$ 映射到与 $\mathcal{F}$ 等势的子集：
>
>对于任意的 $\lambda\in \mathbb{R}$ 取常值函数 $f(x)=\lambda,\forall x\in[0,1]$ ，该映射显然为双射，从而有 $\lvert R\rvert\leq \lvert \mathcal{F}\rvert$ ；反之，对于任意的 $f\in \mathcal{F}$ ，考虑 $\mathbb{Q}=\{q_n:n\geq1\}$ ，将 $f$ 作用到 $\{q_n:n\geq1\}$ ，从而建立了 $f$ 到 $\prod_{n=1}^{\infty}\mathbb{R}$ 的子集的一个映射，且可数个具有连续统势的集合的积仍然具有连续统势；下面只需证明该映射为双射即可注意到若 $f,g\in \mathcal{F}$ 的像相同，则对于任意的 $x\in[0,1]\backslash \mathbb{Q}$ ，可取 $\{x_n\}_{n\geq1}\rightarrow x$ ，由 $f,g\in C([0,1])$ 可得 $f(x)=g(x)$ ，从而 $f=g$ ，则该映射为单射；反之，对于任给的序列都存在对应的函数，因此 $\lvert \mathcal{F}\rvert\leq \lvert \prod_{i=1}^{\infty}\mathbb{R}\rvert=\lvert \mathbb{R}\rvert$ ，综上 $\lvert \mathcal{F}\rvert=\lvert \mathbb{R}\rvert$ .

>[!example]- $\mathbb{R}$ 上的单调函数的全体具有连续统势.
>证明：记 $\mathbb{R}$ 上单调函数全体为 $\mathcal{F}$ ，同上，不难验证有 $c\leq \mathcal{F}$ ；设 $\mathbb{Q}=\{r_n\}_{n\geq1}$ 定义映射 $\varphi: \mathcal{F}\rightarrow \mathbb{R}^{\mathbb{N}},f\mapsto \{f(r_n)\}_{n\geq1}$ ，对于任意的 $f\in \mathcal{F},x\in \mathbb{R}\backslash \mathbb{Q}$ ，令 $f^{+}(x)=\inf_{r> x}f(r),f^{-}(x)=\sup_{r<x}f(r)$ ，因为 $f$ 是单调函数，所以 $\{(f^-(x),f^{+}(x))\}_{x\in \mathbb{R}\backslash \mathbb{Q}}$ 为不相交的区间，并且 $f^{-1}(x)\leq f(x)\leq f^{+}(x)$ ，如果 $(f^{-}(x),f^{+}(x))=\emptyset$ ，则 $f(x)=f^{-1}(x)=f^{+}(x)$ ，如果 $(f^{-}(x),f^{+}(x))\neq \emptyset$ ，注意到这样的区间只有至多可数多个，记 $D_f=\{x\in \mathbb{R}\backslash \mathbb{Q}:(f^{-1}(x),f^{+}(x))\neq \emptyset\}$ ，下面定义映射  $\varphi: \mathcal{F}\rightarrow \mathbb{R}^\mathbb{N}\times \mathbb{R}^\mathbb{N}$ 
>
>$$\begin{aligned}
>&\varphi(f)=\{f(x_n):x_n\in D_f\}\times \{f(r_n)\}_{n\geq1}\quad \text{if }\lvert D_f\rvert=\mathbb{N}\\
>&\varphi(f)=\{f(x_1),\cdots,f(x_{\lvert D_f\rvert},0,\cdots,0,\cdots)\}\times \{f(r_n)\}_{n\geq1}\quad \text{if }\lvert D_f\rvert<\mathbb{N}
>\end{aligned}$$ 
>
>注意到 $\varphi(\mathcal{F})\subset\mathbb{R}^\mathbb{N}\times \mathbb{R}^\mathbb{N}$ ，所以 $\lvert \mathcal{F}\rvert\leq c$ ，从而可得 $\lvert \mathcal{F}\rvert=c$

>[!example]- 设实数集 $E$ 不可数，求证：有 $x$ ，使得对于任意 $\delta>0$ ， $E\cap(x-\delta,x+\delta)$ 不可数. 进而证明 $E$ 中满足 $\forall \delta>0,E\cap(x-\delta,x+\delta)$ 不可数的 $x$ 的全体是不可数集.
>证明：
>两个命题的证明很类似：
>
>对于第一个命题，用反证法即可，最终矛盾在于 $E=\bigcup_{x\in E}[E\cap (r_x,R_x)]$ 是至多可数集.
>
>对于第二个命题，假设满足条件的 $x$ 的全体 $X$ 为至多可数集. 设 $I\subset \mathbb{N},X=\{x_i\}_{i\in I}$ ，则考虑 $E-X$ ，从而对于任意的 $x'\in E-X$ ，存在 $\delta_{x'}>0$ ， $E\cap(x'-\delta_{x'},x'+\delta_{x'})$ 为可数集. 并且可知 $\forall x\in X,x\notin(x'-\delta_{x'},x'+\delta_{x'})$ ，而 $E\backslash X=\bigcup_{x'\in E\backslash X}E\cap(x'-\delta_{x'},x'+\delta_{x'})$ 一定是不可数集合，又显然对于任意的 $(x'-\delta_{x'},x'+\delta_{x'})$ ，一定存在有理数 $r_{x'}<R_{x'}$ 使得 $x'\in(r_{x'},R_{x'})\subset(x'-\delta_{x'},x'+\delta_{x'})$ ，显然有 $E\backslash X=\bigcup_{x'\in E}E\cap(r_{x'},R_{x'})$ ，并且后者可以与 $\mathbb{Q}\times \mathbb{Q}$ 的一个子集建立双射，从而 $E\backslash X$ 为至多可数集， $E=(E\backslash X)\cup X$ 则为至多可数集，矛盾！

>[!example]- 若 $\mathbb{R}$ 中的集 $A$ 不可数，求证：必有 $x\in A$ ，使得对于任何的 $\delta>0$ ， $(x-\delta,x)$ 和 $(x,x+\delta)$ 中都有 $A$ 中的点，并且这种 $x$ 全体也是不可数的.
>反证： $\forall x\in A,\exists \delta>0,(x-\delta,x)\cap A=\emptyset,(x,x+\delta)\cap A=\emptyset$ . 于是存在 $x\in (r_x',R_x')\subset (x-\delta,x+\delta)$ ， $E=\cup_{x\in E}E\cap(r_x,R_x)$ 为至多可数集，矛盾！若这种 $x$ 的全体 $A$ 是可数的，则 $E\backslash A$ 为不可数集，并且 $E\backslash A=\cup_{x\in E\backslash A}E\cap(x-\delta_x,x+\delta_x)$ 为可数集（还是有理数集套进去，没什么意思）矛盾！

### $2^c$

下面考虑的是与 $\mathcal{P}(\mathcal{P}(\mathbb{N}))$ 等价的集合. [check](https://math.stackexchange.com/questions/17914/cardinality-of-the-set-of-all-real-functions-of-real-variable)

>[!note]- 求证： $\mathbb{R}$ 上实函数全体具有基数 $2^c$ .
>证明：设映射 
>
>$$\begin{aligned}
>&\mathcal{F}:R[\mathbb{R}]\rightarrow \mathbb{R}\times \mathbb{R}\\
>&f\rightarrow \{(r,f(r)):r\times R\}
>\end{aligned}$$ 
>
>    从而 $\lvert R[\mathbb{R}]\rvert\leq \lvert \mathcal{P}(\mathbb{R}\times \mathbb{R})\rvert=\lvert \mathcal{P}(R)\rvert$ .  （注意这里 $\mathcal{F}$ 并不是双射）
>
>或者，注意到 $\mathcal{P}(\mathbb{R})$ 对应于 $2^\mathbb{R}=\{0,1\}^\mathbb{R}$ ，也即对应于 $\mathbb{R}$ 中的一个函数（唯一），该映射也为双射，从而 $\lvert \mathcal{P}\rvert=\lvert R[\mathbb{R}]\rvert$ .

# 选择公理

对于集合族 $\{S_i\}_{i\in I},S_i\neq0$ ，存在集合 $\{x_i:x_i\in S_i,i\in I\}$ .

[知乎](https://www.zhihu.com/question/40197216)

# Zorn 引理

对于集合 $P$ ，称其上的一个二元关系 $\leq$ 为**偏序**，如果其满足： 1) 自反性， $\forall x\in P(x\leq x)$ ；2) 传递性， $(x\leq y,y\leq z)\Rightarrow x\leq z$ ，并称 $(P,\leq)$ 为**偏序集**.

对于 $A\subset P$ ，定义 $A$ 的**上界** $a\in P$ ： $\forall x\in A(x\leq a)$ ；称 $A$ 是一条**链**，如果 $A$ 满足全序，即 $\forall x,y\in A((x\leq y)\vee y\leq x)$ .

定义 $(P,\leq)$ 的**极大元** $m$ ： $x\in P,m\leq x\Rightarrow m=x$ .

>[!note] Zorn 引理，如果偏序集 $(P,\leq)$ 的每一条链都有上界，则 $(P,\leq)$ 有极大元.

# 拓扑

对于集合 $S$ ，**闭集合**： $S$ 中任何收敛序列的极限都包含在 $S$ 中. 全空间和空集都是闭集. 闭集的任意多个交仍然为闭集；闭集的有限多个并仍然为闭集. 

>[!example] 闭集的无限多个并是开集的例子
>- $[\frac{1}{n},1-\frac{1}{n}]_{n\geq1}$ 的并为开集 $(0,1)$ $0,1$ 无法取到，因为该集合族中没有集合包含之.

**开集合**： 闭集的补集为开集；全空间和空集均为开集合；开集的任意多个并为开集；开集的有限多个交为开集；

>[!note]- 每一个开集都为开球之并. #imcomplete-whatever 

>[!example] 开集的无限多个交为闭集的例子
>- $(0,\frac{1}{n})$ 



