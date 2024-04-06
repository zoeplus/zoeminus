# 概率论讨论对象

概率论中的三个要素： $(\Omega,\mathcal{F},P)$ 其中 $\Omega$ 称为**样本空间**（sample space）由（一个随机过程中出现的）所有可能结果构成， $\mathcal{F}$ 为 $\Omega$ 的<u>一些</u>子集组成的一个集合，称为**事件集**（set of events）， $P:\mathcal{F}\rightarrow[0,1]$ 称为**概率函数**或者**概率测度**.

## 样本空间

$\omega\in \Omega$ 称为**样本点**，$A\subset \mathcal{F}$ 称为**事件**，事件是对随机过程结果的一个抽象.

事件具有以下运算：

设 $A,B\subset \Omega$ .

- **积**： $A\cap B$ 或 $AB$ ，表示 $A,B$ 同时发生；
- **和**： $A\cup B$ 或 $A+B$ ，表示 $A,B$ 中至少发生一个；并且有 $A+B=A+\bar{A}B$ ；
- **差**： $A\backslash B$ 或 $A-B$ ，表示 $A$ 发生但 $B$ 不发生；并且有 $A-B=A-AB$ ；
- **补**： $\Omega\backslash A$ 或 $\bar{A}$ （注意合理性用到了 $\mathcal{F}$ 是 sigma-代数）.

>[!example]- $M=A+B-B,N=A-B+B$ 与 $A$ 之间的关系.
>- $M\subset A$ ，当且仅当 $A\cap B=\emptyset$ 时 $A=M$ ；
>- $N\supset A$ ，当且仅当 $B\subset A$ 时 $A=N$ .

以及 **De Morgan 定律**： $\overline{A\cap B}=\bar{A}\cup\bar{B}, \overline{A\cup B}=\bar{A}\cap \bar{B}$ .

$A=B$ 的含义解释为 $A$ 发生则 $B$ 发生，反之也成立.

## $\sigma-$ 事件域

$\mathcal{F}$ 必须是 $\sigma-$ 域（**sigma-field**，或者称 $\sigma-$ 代数，sigma-algebra，或称 $\sigma-$ 事件域）其满足下面三个条件：

1. $\emptyset\in \mathcal{F}$ ；
2. 如果 $E\in \mathcal{F}$ 则 $E^c\in \mathcal{F}$ ；
3. 如果 $E_i\in \mathcal{F},i\in I$ ，其中 $I$ 为至多可数集，则 $\sum\limits_{i\in I}^{}E_i\in \mathcal{F}$ . （直和写法，表示并）

根据 1. 2. 可以得出 $\Omega\in \mathcal{F}$ .

上述要求 $\mathcal{F}$ 是 $\sigma-$ 域是为了对于确保概率定义的合理性. #issue %%不理解%% 可以将 $\mathcal{F}$ 理解为 available events .

根据定义可知，最小的 $\sigma$ 代数为 $\{\emptyset,\Omega\}$ ，最大的 $\sigma$ 代数为 $\mathcal{P}(\Omega)$ ；包含 $A$ 的最小 $\sigma$ 代数为 $\mathcal{F}=\{\emptyset,\Omega,A,\bar{A}\}$ .

## 概率公理

%%这东西就叫概率公理%%

对于概率函数，其需要满足下面三个条件：

1. 非负： $\forall E\in \mathcal{F}(\mathcal{P}(E)\in[0,1])$ ；
2. 规范： $\mathcal{P}(\Omega)=1$ ；
3. 可列可加： $E_i\in \mathcal{F},i\in I$ 其中 $I$ 为至多可数集，如果 $E_i$ 两两**互斥**（ $E_i\cap E_j=\emptyset,\forall i,j\in I$ ，或称**不相容**），则 $\mathcal{P}(\sum\limits_{i\in I}^{}E_i)=\sum\limits_{i\in I}\mathcal{P}(E_i)$ . 

注：可以将上述概率公理减弱.

1. $\forall E\in\mathcal{F}(\mathcal{P}(E)\geq0)$ ；
2. $\mathcal{P}(\Omega)=1$ ；
3. $E_i\in \mathcal{F},i\in I$ ，其中 $I$ 为可数集，若 $E_i\cap E_j=\emptyset,\forall i\neq j\in I$ ，则 $\mathcal{P}(\sum\limits_{i\in I}^{}E_i)=\sum\limits_{i\in I}^{}\mathcal{P}(E_i)$ .

在减弱的概率公理下，可以得：

>[!note]- $\mathcal{P}(\emptyset)=0$ .
>证明：考虑可列集 $\Omega,\emptyset,\emptyset,\cdots$ ，注意到满足 3. 从而可以得到 $\sum\limits_{n=1}^{\infty}\mathcal{P}(\emptyset)=0$ ，因为 $\mathcal{P}(\emptyset)\geq0$ ，所以 $\mathcal{P}(\emptyset)=0$ （用反证法证明之）

从而有：

>[!note]- 若 $I$ 为有限集， $E_i\cap E_j=\emptyset,\forall i\neq j\in I$ ，则 $\mathcal{P}(\sum\limits_{i\in I}^{}E_i)=\sum\limits_{i\in I}^{}\mathcal{P}(E_i)$ .
>证明：任何有限集合都可以表示为可列集合（并上空集），根据 3. 即可以得到条件.

进而，可以得到：

>[!note]- $\mathcal{P}(E)\leq 1,\forall E\in \Omega$ .
>证明： $\mathcal{P}(E\cup E^c)=\mathcal{P}(\Omega)=1=\mathcal{P}(E)+\mathcal{P}(E^c)$ ，从而可得结论.

上述概率公理中，根据可列可以得到有限的情形，但反之能否从有限得到可列的情形？从有限到可列可能会破除概率函数的定义 $\mathcal{P}(E)\leq1$ . 下面引入**下连续性**和**上连续性**的概念：对于单调递增（减）集合列 $\{A_n\}_{n\geq1}:A_{n}\subset(\supset) A_{n+1}$ ，若 $\mathcal{P}(\cup_{n=1}^\infty A_n)=\lim_{n\rightarrow \infty}\mathcal{P}(A_n)$ （ $\mathcal{P}(\cap_{n=1}^\infty A_n)=\lim_{n\rightarrow \infty}\mathcal{P}(A_n)$ ），则称 $\mathcal{P}$ 具有下（上）连续性.

>[!note]- 对于概率函数 $\mathcal{P}$ 上连续性和下连续性等价.
>证明：
>$\Rightarrow$ ：假设概率函数 $\mathcal{P}$ 具有上连续性，对于单调递增集合列 $\{A_n\}_{n\geq1}$ ， $\{A_n^c\}_{n\geq1}$ 单调递减， $$\mathcal{P}(\cup_{n=1}^\infty A_n^c)=\mathcal{P}\left(\bigcap_{n=1}^\infty A_n\right)^c=1-\mathcal{P}\left(\bigcap_{n=1}^\infty A_n\right)$$ 从而有 $\mathcal{P}\left(\bigcap_{n=1}^\infty A_n\right)=1-\lim_{n\rightarrow \infty}\mathcal{P}(A_n^c)=\mathcal{P}(A_n)$ .
>
>$\Leftarrow$ ：略.

>[!note]- $\mathcal{P}$ 满足可列可加的充分必要条件为 $\mathcal{P}$ 满足有限可加且下连续.
>证明：
>$\Rightarrow$ ：可列可加 $\rightarrow$ 有限可加在之前已经证明过，下面证明满足下连续： 对于单调递增集合列 $\{A_n\}_{n\geq1}$ ，注意到 $A_1,A_2-A_1,A_3-A_2-A_2,\cdots$ 为两两不交的集合，进而根据可列可加可以得到 $$\mathcal{P}(\bigcup_{n=1}^\infty A_n)=\sum\limits_{n=1}^{\infty}\mathcal{P}(A_n-A_{n-1}-\cdots-A_1)$$ 右式也可写为 $\lim_{n\rightarrow \infty}\mathcal{P}(A_n)$ ，从而得证.
>
>$\Leftarrow$ ：考虑可列集合 $\{A_n\}_{n\geq1}$ ， $$\bigcup_{n=1}^\infty A_n=\bigcup_{n=1}^\infty (A_1\cup \cdots\cup A_n)$$ 即为单调递增集合，从而有： $$\mathcal{P}(\bigcup_{n=1}^\infty A_n)=\lim_{n\rightarrow \infty}\mathcal{P}(A_1\cup \cdots\cup A_n)$$ 再根据有限可加即可得到结论.

在概率公理下还可以得到下述结论：

>[!note]- 求和公式： $\mathcal{P}(A\cup B)=\mathcal{P}(A)+\mathcal{P}(B)-\mathcal{P}(A\cap B)$ . 从而有 $\mathcal{P}(A\cap B)\geq \mathcal{P}(A)+\mathcal{P}(B)-1$ .

>[!note]- 一般求和公式.
>$$\begin{aligned}
\mathcal{P}(A_1\cup A_2\cup \cdots\cup A_n)&=\sum\limits_{i=1}^{n}\mathcal{P}(A_i)-\sum\limits_{1\leq i<j\leq n}^{}\mathcal{P}(A_iA_j)\\
&+\sum\limits_{1\leq i<j<k\leq n}^{}\mathcal{P}(A_iA_jA_k)-\cdots\\
&+(-1)^{n-1}\mathcal{P}(A_1A_2\cdots A_n)
\end{aligned}$$
>
>证明：归纳.

可以用一般求和公式解决一些分类繁琐的问题：

>[!example]- 匹配问题： $n$ 个信随机地放入到 $n$ 个信封中，至少有 $1$ 封信匹配正确的概率为？恰好有 $k$ 封信匹配正确的概率？
>解：设 $A_i$ ：第 $i$ 封信放入到正确的信封中. 则至少有一封信匹配正确的事件可以表示为 $A_1\cup A_2\cup \cdots \cup A_n$ . 按照一般求和公式只需要求解 $\mathcal{P}(A_i),\mathcal{P}(A_iA_j),\cdots,\mathcal{P}(A_1A_2\cdots A_n)$ .
>
>$$\sum\limits_{1\leq i_1<i_2<\cdots <i_k\leq n}^{}\mathcal{P}(A_{i_1}A_{i_2}\cdots A_{i_k})=\binom{n}{k}\frac{(n-k)!}{n!}$$ 然后按照公式求和即可.
>
>对于恰好 $k$ 封信匹配的概率：可以将事件拆分为 $k$ 封信匹配和 $N-k$ 封信均不匹配（可以转化为上述问题）最终事件的概率等于上述两个概率的乘积. #issue %%为什么可以直接相乘了？两个事件是独立的吗？%%
>假设已经指定了 $k$ 封信，这 $k$ 封信匹配的概率为 $\mathcal{P}=\frac{1}{N(N-1)\cdots(N-k+1)}$ ，有 $N-k$ 封信不匹配的概率为 $\mathcal{P}(\bar{A}_{i_1}\bar{A}_{i_2}\cdots\bar{A}_{i_{N-k}})=1-\mathcal{P}(\sum\limits_{m=1}^{k}A_{i_m})$ ，由上可知 $\mathcal{P}(\cdots)=1-\sum\limits_{i=1}^{N-k}\frac{(-1)^i}{i!}=\sum\limits_{i=0}^{N-k}\frac{(-1)^i}{i!}$ . 从而 $\mathcal{P}=\binom{N}{k}\frac{1}{N(N-1)\cdots(N-k+1)}\sum\limits_{i=0}^{N-k}\frac{(-1)^i}{i!}$ .

>[!example]- 共有 $N$ 张签， $n(n\geq N)$ 个人抽签，被抽到的签立刻放回，在所有人都抽完之后，至少有一张签没有被抽到的概率为？
>设第 $i$ 个签没有被抽到这一事件为 $A_i$ ，则 $\mathcal{P}(A_i)=\left(\frac{N-1}{N}\right)^n$ ， $\mathcal{P}(A_iA_j)=\binom{N}{2}\left(\frac{N-2}{N}\right)^n\cdots$ ， $\mathcal{P}(A_1\cdots A_{N-1})=\binom{N}{N-1}\left(\frac{1}{N}\right)^n,\cdots \mathcal{P}(A_1\cap A_N)=0$ .
>
>从而 $\mathcal{P}(A_1\cup A_2\cup \cdots\cup A_n)=\sum\limits_{i=1}^{N}(-1)^{i-1}\binom{N}{i}\left(\frac{N-i}{N}\right)^n$ .

>[!example]- 第一局由甲乙参加，丙轮空；第一局的优胜者和丙进行第二局比赛，失败者轮空；比赛一直进行直到某人连续获胜两次. 甲乙丙每局获胜概率各为 $\frac{1}{2}$ ，三者获胜的概率各为多少？
>见[[ProbDraw]]，用 $a,b,c$ 表示甲、乙、丙在当前对局中失败. 由规则一个人不能连续失败两次，因此 $aa,bb,cc$ 模式均不可能出现，并且对于当前字母 $a/b/c$ 其有 $1/2$ 的概率转换为另外两个字母之一. 最终甲获胜的情况即为出现 $bcb$ 或者 $cbc$ 的同时不出现 $aba,bab,cac,aca$ 中的任何一个情况，以及在最开始时的 $bc$ ，并且注意到起始三个元素将会决定所有后续 $abcabc\cdots,bacbac\cdots$），在这种情况下甲获胜的序列：
>1) 若长度为 $3k+1$ ，则最后几个元素为 $$\begin{aligned}
>&abcabc\cdots abcb\\
>&bacbac\cdots bac\times\\
>\end{aligned}$$
>2) 若长度为 $3k+2$ ，则最后几个元素为： $$\begin{aligned}
>&abcabc\cdots abcbc(\text{repeat})\\
>&bacbac\cdots bacbc\\
>\end{aligned}$$ 注意当 $k=0$ 时也有一种情况.
>3) 若长度为 $3k$ ，情况不存在.
>
所以甲获胜的概率为 $$1\times \frac{1}{2^2}+\sum\limits_{k=1}^{\infty}\left[1\times\frac{1}{2^{3k+1}}+1\times \frac{1}{2^{3k+2}}\right]=\frac{1}{4}+\frac{1}{16}/\frac{7}{8}+\frac{1}{32}/\frac{7}{8}=\frac{5}{14}$$
>
>进而可以得到之后的值.
>
>另一方面：考虑的是丙在 $3k+1$ 时获胜的情形： $$\begin{aligned}
>&abcabc\cdots abc\times\\
>&bacbac\cdots bac\times\\
>\end{aligned}$$ $3k+2:$ $$\begin{aligned}
>&abcabc\cdots abc\times \\
>&bacbac\cdots bac\times\\
>\end{aligned}$$ $3k:$ $$\begin{aligned}
>&abcabc\cdots abcaba\\
>&bacbac\cdots bacbab\\
>\end{aligned}$$
>
>则丙有 $2$ 种获胜可能. 所以丙的获胜概率（注意这里已经不是古典概率模型了，而只是出现这样的结果的概率）为 $$2\times \frac{1}{2^3}+2\times \frac{1}{2^6}+\cdots$$

>[!note]- 若 $A\supset B$ ，则 $\mathcal{P}(A\backslash B)=\mathcal{P}(A)-\mathcal{P}(B)$ . 若 $A,B$ 没有包含关系，则 $\mathcal{P}(A\backslash B)=\mathcal{P}(A)-\mathcal{P}(A\cap B)$ .

# 简单概率模型

## 古典概率模型

- $\lvert \Omega\rvert$ 有限；
- $\mathcal{F}$ 中的任意两个事件互斥（不相容）；
- 每一个结果对应的概率等可能，均为 $\frac{1}{\lvert \Omega\rvert}$. 

在此情况下，对于一个事件 $A$ ，可以计算其概率： $$\mathcal{P}(A)=\frac{\lvert A\rvert}{\lvert \Omega\rvert}$$

>[!example]- 不是古典概率模型举例. #issue 
>课堂上举的例子 $\{1,2,2,3,3,3\}$ 有问题.

计算古典概率模型需要用到[排列](DSA.md#排列)和[组合](DSA.md#组合)分析. 一般对于古典概型问题中直观上的相同元素（例如，同色小球）按照不同进行处理.

>[!note]- 从 $n$ 个小球中抽取 $r(r\leq n)$ 个小球. 考虑有无放回和有无顺序.
>- 有放回有顺序： $n^r$ ；
>- **有放回无顺序**： $\frac{n^r}{r!}$ 这一答案并不正确，原因是这种做法主观上“有顺序”，例如 $1,2,2$ 和 $2,1,2$ 在有放回但无顺序下是一样的，因此不能简单地除以 $r!$ ，正确答案应该为 $C_{n+r-1}^r$ ，见下面的分析；
>- 无放回有顺序： $A_n^r$ ；
>- 无放回无顺序： $C_n^r$ ；
>
>下面分析有放回但无顺序的情况，该问题实际上在考虑抽取各个小球的次数之和为固定值 $r$ 下所有的情况数量：
>
>或为该方程组的解： $$\left\{\begin{aligned}
&x_i\geq0,1\leq i\leq n\\
&x_1+x_2+\cdots+x_n=r
\end{aligned}\right.$$ 进而可以转化为下面这一问题（令 $y_i=x_i+1,1\leq i\leq n$ ）： $$\left\{\begin{aligned}
&y_i\geq 1,1\leq i\leq n\\
&y_1+y_2+\cdots+y_n=r+n
\end{aligned}\right.$$
>
>此即为经典的挡板问题：有 $n+r$ 个小球， $n-1$ 个挡板，总共有 $\binom{n+r-1}{n-1}$ 种划分方法，即为 $C_{n+r-1}^{r}$ .

>[!note]- 占位问题：有 $r$ 个标号的小球，随机地放在 $n$ 个盒子中（ $r\leq n$ ），求下列事件发生的概率：
>1. 指定的标号盒子中只能有一个小球， $\frac{r!}{n^r}$ ；
>2. 恰好有 $r$ 个盒子，其中各有一个球（或者称：每个盒子至多一个球）： $\frac{C_n^r r!}{n^r}$ ；
>3. 某一指定的盒子中恰好有 $k(k\leq r)$ 个球： $\frac{C_r^k(n-1)^{r-k}}{n^r}$ .

>[!note]- 生日问题：$r(r\leq365)$ 个人的生日均不在同一天的概率.
>$C_{365}^r\left(\frac{1}{365}\right)^r$ .

>[!note]- 抽签问题： $a$ 个红球和 $b$ 个白球放在一个盒子中，第 $k$ 次抽取到红球的概率？
>无放回：
>记第 $k$ 次抽取到红球为事件 $A$ ；
>1) 同色球不一样： $\lvert \Omega\rvert=(a+b)!$ ， $\lvert A\rvert=a\cdot (a+b-1)!$ ，则 $p=\frac{a}{a+b}$ ；
>2) 同色球相同（只关注结果）： $\lvert \Omega\rvert=C_{a+b}^a$ ， $\lvert A\rvert=C_{a+b-1}^{a-1}$ ，则 $p=\frac{a}{a+b}$ ；
>
>在有放回和无放回下都有 $p=\frac{a}{a+b}$ 为什么？ 见下面的[一般摸球模型](#^PolyaUrn).
> 
>有放回：
> 1) $\lvert \Omega\rvert=(a+b)^{a+b}$ ； $\lvert A\rvert=a\cdot (a+b)^{a+b-1}$ ； $p=\frac{a}{a+b}$ ；
> 2) 同色球相同，但红球可以出现 $1,\cdots,(a+b)$ 次，因此 $\Omega=2^n$ ，而 $A=2^{n-1}$ ，所以 $p=\frac{1}{2}$ ？ #issue %%并不是古典概型，古典概型要求各个结果具有相同的概率，这里明显违背了，同一位置的红色和蓝色不是等概率的，类似的同一排列也不一定是等可能的%%
>^Drawing

>[!note]- 抽样：考虑 $r$ 个红球和 $b$ 个黑球，从中抽取 $n$ 个球，有 $k$ 个球为红球的概率为？分为有放回和无放回讨论.
>1) 无放回（相当于一次直接抽取喽?）： $\lvert \Omega\rvert=C_{r+b}^n$ ， $\lvert A\rvert=C_r^kC_b^{n-k}$ ，则 $p=\frac{C_r^kC_b^{n-k}}{C_{r+b}^n}$ . 这称为**超几何分布**，如果考虑顺序： $$p=\frac{C_n^kA_r^kA_b^{n-k}}{A_{r+b}^n}=\frac{C_r^kC_b^{n-k}}{C_{r+b}^n}$$ 两种情况是一样的，事实上对于第一个式子，可以将其视为 $$\frac{C_r^kC_b^{n-k}\cdot n!}{C_{r+b}^n n!}$$ 也同时考虑了顺序.
>2) 有放回： $p=\frac{C_n^kr^kb^{n-k}}{(r+b)^n}=C_n^k\left(\frac{r}{r+b}\right)^k\left(\frac{b}{r+b}\right)^{n-k}$ ，即为**二项分布**. ^Sample

可以用**泊松分布**逼近**二项分布**，用二项分布逼近**超几何分布**. #imcomplete 

>[!note]- 捆绑排列：将 $n$ 个人排成一列，甲、乙之间恰好有 $k(k\leq n)$ 个人的概率为？
>将甲、乙连同两者之间的 $k$ 个人看作一个整体，连同剩下的 $n-k-2$ 共 “ $n-k+1$ ” 个人有 $(n-k-1)!$ 种排列方法，对于该整体，其有 $2\cdot A_{n-2}^k$ 种排列方法. 从而 $p=\frac{2A_{n-2}^k(n-k-1)!}{n!}$ .

## 几何概率模型

几何概率是建立在**可测**（不是拓扑中的度量概念，类似积分）的空间 $G$ 中的，几何概率即为 $\mathcal{P}:\mathcal{P}(G)\rightarrow G$ ，对于 $g\subset G$ ， $\mathcal{P}(g)$ 与 $g$ 的度量成正比. 或者说，在 $G$ 中取一点，其出现在 $g\subset G$ 的概率与 $g$ 的度量成正比. 结合 $\mathcal{P}$ 的定义 [[#三要素]]： 可以得到 $$\mathcal{P}(g)=\frac{\sigma(g)}{\sigma(G)}$$ 其中 $\sigma(g)$ 表示 $g$ 的测度. 

>[!example]- 约会问题： $A,B$ 约定在 $7:00-8:00$ 之间会面，有一方超过 $20$ 分钟未见到对方则离开， $A,B$ 出现在 $7:00-8:00$ 的任一时刻等可能. 两人能够相见的概率？
>首先确定 $G=\{(x,y):0\leq x,y\leq 60\}$ . 然后 $g=\{(x,y):\lvert x-y\rvert\leq 20\}$ ，通过面积法可求得 $p=\frac{5}{9}$ .

>[!note]- 蒲丰问题（投针估计圆周率）考虑一组间距为 $a$ 的平行线，现在随机地向纸上丢一个针（意思是，针的位置和角度都是均匀分布的），假设纸也是无限大的，针的长度为 $l(l\leq n)$ ，则针触碰到任意一条线的概率为？
>首先 $G=\{(\theta,x):0\leq \theta\leq \pi,0\leq x\leq \frac{a}{2}\}$ ，其中 $x$ 为针的中心距离最近的平行线的距离. 则 $g=\{(\theta,x):0\leq \theta\leq \pi,0\leq x\leq \frac{l}{2}\sin\theta\}$ . 进而可得： $$p=\frac{\int_0^\pi\frac{l}{2}\sin\theta d\theta}{\frac{a}{2}\pi}=\frac{2l}{\pi a}$$ . 据此也可以计算出圆周率.

投针估计圆周率是一种Monte-Carlo方法：通过随机事件估计数值. #imcomplete %%更多Monte-carlo方法%%

下面这个问题说明了等可能假设的重要性.

>[!note]- 贝特朗悖论：在变长为 $1$ 的圆中任取一条弦，则该弦长大于 $\sqrt{3}$ 的概率为？
>对于该问题可以从不同的角度考虑，以下都是以几何概率模型进行分析：
>
>1. 固定弦的一个端点，假设另一个端点出现在圆周上是等可能的，则 $\mathcal{P}(l>\sqrt{3})=\frac{1}{3}$ ；
>2. 若弦的中点距离圆心的距离是等可能的，则 $\mathcal{P}(l>\sqrt{3})=\frac{1}{2}$ ；
>3. 若弦的中点在圆内的位置是等可能的，则 $\mathcal{P}(l>\sqrt{3})=\frac{1}{4}$ . （此时弦的中点出现的位置限制在半径为 $1/2$ 的圆中）

类似的还可以举出下面这个例子，同样的可以从角度分布均匀和长度分布均匀上进行分析：

>[!example]- 考虑一等腰直角三角形 $ABC$ ，腰长为 $1$ ， 其中 $B$ 为直角顶点，在 $BC$ 上任取一点 $P$ ， $AP>\sqrt{5}/2$ 的概率为？

# 条件概率和统计独立性

实际应用中一个常见的问题即为：在 $B$ 已经发生的情况下， $A$ 发生的可能性？对此引入**条件概率**：

考虑 $(\Omega,\mathcal{F},\mathcal{P})$ ， $\forall A,B\subset \mathcal{F}$ ，定义 $\mathcal{P}(A|B)=\frac{\mathcal{P}(A\cap B)}{\mathcal{P}(B)}$ 为 $B$ 发生的情况下 $A$ 发生的条件概率.

>[!note]- 给定 $B\subset \mathcal{F}$ ，记 $\mathcal{P}_B(A)=\mathcal{P}(A|B)$ ， $\mathcal{P}_B$ 为概率函数.

>[!warning]- 不能根据上述条件得出 $\mathcal{P}(A|B)\geq \mathcal{P}(A)$ ，显然当 $A,B$ 不相容（ $\mathcal{P}(AB)=0$ ）且 $\mathcal{P}(A)>0$ 时上式不成立.

自然有下列结论：

>[!note]- $\mathcal{P}(A|B)+\mathcal{P}(\bar{A}|B)=1$ ， $\mathcal{P}(A|\bar{B})+\mathcal{P}(\bar{A}|\bar{B})=1$ .

但 $\mathcal{P}(A|B)+\mathcal{P}(\bar{A}|\bar{B})$ 则没有一般结论，两者关系不大.

根据条件概率公式可以得到如下乘法公式：

>[!note]- 对于 $\{A_i\}_{1\leq i\leq n}$ ，如果 $\mathcal{P}(A_1\cap A_2\cap \cdots\cap A_{n-1})\neq0$ ，则有： $\mathcal{P}(A_1\cdots A_{n-1}A_n)=\mathcal{P}(A_{n}|A_{n-1}\cdots A_1)\cdots \mathcal{P}(A_2|A_1)\mathcal{P}(A_1)$

注意必须保证每一次条件概率公式都能成立. 事实上对于 $\mathcal{P}(A_1\cdots A_n)$ 如果每一次条件概率分解都满足，则有 $n!$ 种乘法公式. 如果这 $n!$ 种都成立. 则应该有 $\mathcal{P}(A_1A_2\cdots A_n)\neq0$ （充要条件）.

定义全空间 $\Omega$ 的**分割** $\{B_i\}_{1\leq i\leq n}$ ， $B_i\cap B_j=\emptyset,i\neq j$ 并且 $\cup_{1\leq i\leq n}B_i=\Omega$ . 进而可以证明**全概率公式**： $$\mathcal{P}(A)=\sum\limits_{1\leq i\leq n}^{}\mathcal{P}(A|B_i)\mathcal{P}(B_i)$$ 显然对于 $\{B_i\}_{i\geq1}$ 上式也成立.

之前已经接触了几种摸球模型：其中一种是[抽签问题](#^Drawing)，其有放回和无放回问题可以视为下面的一般摸球模型中 $s=1$ 和 $s=0$ .

>[!example]- 一般摸球模型（Polya Urn）：设有 $r$ 个红球和 $b$ 个白球，每次从中抓取一个球，都放入与该球同色的球 $s(s\geq0)$ 个. 证明第 $n(n\leq r+b)$ 摸出红球的概率为 $\frac{r}{r+b}$ . 
>证明：
>设事件 $R_k$ ：第 $k$ 次摸出红球，对于该问题可以使用**首步分析法**进行论证，首先不妨假设当 $k\leq m-1$ 时结果都成立. 则 $\mathcal{P}(r_m|r_1)=\frac{r+s-1}{r+b+s-1}$ 同时 $\mathcal{P}(r_m|\bar{r_1})=\frac{r}{r+b+s-1}$ 然后利用全概率公式得到.
>
>对于该问题是否只需要证明 $\mathcal{P}(r_2)=\mathcal{P}(r_1)$ 即可，之后的一切都可以等同为初始情况？ #issue 
>^PolyaUrn

上述用到的**首步分析法**非常适合于归纳，其将 $\Omega$ 划分为 $r_1$ 和 $r_1^c$ 然后用全概率公式求解.

更一般地，如果第 $k$ 次抽出某球后，放入同色球 $s_k$ 个，则结果是否发生改变？仍然用首步分析法可知不改变.

[check polya urn](https://en.wikipedia.org/wiki/P%C3%B3lya_urn_model) #imcomplete 

>[!example]- 甲袋中有 $a$ 白， $b$ 黑，乙袋中有 $\alpha$ 白， $\beta$ 黑，从甲中任取两球放入乙中，在乙中任取两球，最后取出的球全为白球的概率？
>$$\begin{aligned}
\mathcal{P}(A)&=\mathcal{P}(A|1w1b)\mathcal{P}(1w1b)+\mathcal{P}(A|2w)\mathcal{P}(2w)+\mathcal{P}(A|2b)\mathcal{P}(2b)\\
&=\frac{\binom{\alpha+1}{2}}{\binom{\alpha+\beta+2}{2}}\frac{\binom{a}{1}\binom{b}{1}}{\binom{a+b}{2}}+\frac{\binom{\alpha+2}{2}}{\binom{\alpha+\beta+2}{2}}\frac{\binom{a}{2}}{\binom{a+b}{2}}+\frac{\binom{\alpha}{2}}{\binom{\alpha+\beta+2}{2}}\frac{\binom{b}{2}}{\binom{a+b}{2}}\\
\end{aligned}$$ 

>[!example]- 设一个家庭中有 $n$ 个小孩的概率为 $p_n$ ，若生一个小孩为男孩或者女孩等可能，求证一个家庭中有 $k(k\geq1)$ 个男孩的概率.
>设 $A_n=\{\text{有 } n\text{ 个小孩}\}$ . 则 $$\begin{aligned}
\mathcal{P}(B_k)=&\sum\limits_{n\geq k}^{}\mathcal{P}(B_k|A_n)\mathcal{P}(A_n)\\
&\sum\limits_{n\geq k}^{}\binom{n}{k}\frac{1}{2^n}\cdot p_n
\end{aligned}$$ 如果 $$p_n=\left\{\begin{aligned}
&\alpha p^n,n\geq1\\
&1-\frac{\alpha p}{1-p},n=0
\end{aligned}\right.$$ 可得上式等于 $$\alpha\left(\frac{p}{2}\right)^k\sum\limits_{i=0}^{\infty}\binom{k+i}{i}\left(\frac{p}{2}\right)^i=\alpha\left(\frac{p}{2}\right)^k\left(1-\frac{p}{2}\right)^{-k-1}$$ #issue 

## 贝叶斯公式

根据条件概率公式和全概率公式可得**贝叶斯公式**（Bayes）：设 $\{B_i\}_{1\leq i\leq n}$ 为 $\Omega$ 的一个分割，则对于 $A\in\mathcal{F}$ 有： $$\mathcal{P}(B_j|A)=\frac{\mathcal{P}(A|B_j)\mathcal{P}(B_j)}{\sum_{k=1}^{n}\mathcal{P}(A|B_k)\mathcal{P}(B_k)}$$

>[!example]- 记患某种疾病的事件为 $A$ ，诊断患有该疾病的事件为 $B$ . 假设某种疾病在人群中的患病率为 $\mathcal{P}(A)=0.5\%$ ，某种检测方法的客观误诊率为 $\mathcal{P}(B|\bar{A})=\mathcal{P}(\bar{B}|A)=5\%$ . 现有一人被诊断患有该疾病，则其患有该疾病的概率为？
>证明：根据贝叶斯公式： $$\mathcal{P}(A|B)=\frac{\mathcal{P}(B|A)\mathcal{P}(A)}{\mathcal{P}(B|A)\mathcal{P}(A)+\mathcal{P}(B|\bar{A})\mathcal{P}(\bar{A})}\approx 0.087$$ 

贝叶斯公式涉及到贝叶斯学派对概率的理解，即通过已有的知识进行更新，下面这个例子说明了这点：

>[!example]- 袋子中有一个球，要么红色要么白色，现在向袋中放入一个白球，从袋子中摸出一个白球，则袋子中原先的一个球是白球的概率为？
>解：记事件从袋子中摸出一个白球： $A$ ，记事件原先是白球： $w$ ，假定 $\mathcal{P}(w)=\mathcal{P}(\bar{w})=\frac{1}{2}$ ，则 $$\mathcal{P}(w|A)=\frac{\mathcal{P}(A|w)\mathcal{P}(w)}{\mathcal{P}(A|w)\mathcal{P}(w)+\mathcal{P}(A|\bar{w})\mathcal{P}(\bar{w})}=\frac{1\cdot1/2}{1\cdot1/2+1/2\cdot1/2}=2/3$$

## 统计独立

称事件 $A$ 和 $B$ 统计独立，如果 $\mathcal{P}(AB)=\mathcal{P}(A)\mathcal{P}(B)$ .

>[!warning]- $A$ 与 $B$ 是否独立与 $A$ 与 $B$ 是否相容（即 $\mathcal{P}(AB)=0$ ）没有关系.

>[!note]- 若 $\mathcal{P}(A)=0$ ，则 $A,B$ 独立.
>证明：事实上，注意到 $A=AB\cup AB^c$ 并且 $AB\cap AB^c=\emptyset$ ，所以 $\mathcal{P}(AB)\leq \mathcal{P}(A)=0$ . 特别注意由 $\mathcal{P}(A)=0$ 并不能得出 $A=\emptyset$ ；同样由 $\mathcal{P}(A)=1$ 也不能得出 $A=\Omega$ . 

>[!note]- 若 $\mathcal{P}(A)=1$ 则 $A,B$ 独立. 
>证明： $\mathcal{P}(A^c)=0$ ，则 $A^c,B$ 独立从而 $\mathcal{P}(A^cB)=\mathcal{P}(A^c)\mathcal{P}(B)=\mathcal{P}(B)-\mathcal{P}(AB)=\mathcal{P}(B)-\mathcal{P}(A)\mathcal{P}(B)$ . 从而可得 $\mathcal{P}(AB)=\mathcal{P}(A)\mathcal{P}(B)$ .

下面直观反映了<u>独立</u>：

>[!note]- 若 $A,B$ 独立并且 $\mathcal{P}(B)\neq0$ ，则 $\mathcal{P}(A|B)=\mathcal{P}(A)$ .

>[!note]- 若 $A,B$ 独立，则 $\{\bar{A},B\},\{A,\bar{B}\},\{\bar{A},\bar{B}\}$ 独立.

定义多个事件**相互独立**：称 $A_1,A_2,\cdots,A_n$ 相互独立，如果对于任意的 $1\leq i_1<i_2<\cdots<i_k\leq n(2\leq k\leq n)$ ，都有 $$\mathcal{P}(A_{i_1}A_{i_2}\cdots A_{i_n})=\prod_{m=1}^{k}\mathcal{P}(A_{i_m})$$ 总共需要满足 $2^n-n-1$ 个条件.

>[!example]- 两两独立但不相互独立的例子：从 $2,3,5,30$ 中抽取 $1$ 个数字 $x$ ，设 $A:x\mod2\equiv0,B:x\mod3\equiv0,C:x\mod5\equiv0$ .
>则 $\mathcal{P}(A)=\frac{1}{2},\mathcal{P}(B)=\frac{1}{2},\mathcal{P}(C)=\frac{1}{2}$ ，但是 $\mathcal{P}(ABC)=\frac{1}{4}$ .

## 递推、概率模型建立

>[!note]- 若 $p_n=ap_{n-1}+b$ ，则 $p_n=a^n\left(p_0-\frac{b}{1-a}\right)$ .

一些概率模型可以推导出意想不到的结论.

>[!note]- 巴拿赫火柴盒：左右口袋各放有一个装有 $N$ 个火柴的火柴盒，每次任取一根，在发现一盒用光时，另一盒中有 $r$ 根的概率为？并证明恒等式 $\sum\limits_{k=0}^{N}\binom{N+k}{k}\frac{1}{2^k}=2^N$ .

## 伯努利随机试验

**Bernoulli** 随机试验的事件域为 $\mathcal{F}=\{\emptyset,\Omega,A,\bar{A}\}$ . 每一次随机试验仅有两种可能： $A$ 或 $\bar{A}$ . **n 重 Bernoulli 随机试验**需要满足：1. 每次试验都是 Bernoulli 随机试验，进行 $n$ 次；2. 每一次实验 $\mathcal{P}(A)$ 不改变；3. Bernoulli 试验之间相互独立.

记 $\mathcal{P}(A)=p$ ， $\beta$ 表示一次 Bernoulli 随机试验中 $A$ 事件出现的次数（只能取 $0,1$ ） 则 $\mathcal{P}(\beta=k)\overset{def }{=}b_k=p^kq^{1-k},k=0,1$ . 称 $\mathcal{P}(\beta=k)$ 为 **Bernoulli 分布** / **两点分布**.

Bernoulli 随机试验还可以进行推广：每一次随机试验有 $r$ 种可能： $A_1,\cdots,A_r$ ，对应的概率分别为 $p_1,\cdots,p_r$ ；推广的 $n$ 重 Bernoulli 随机试验需要满足：每一次都是 Bernoulli 随机试验，进行 $n$ 次； $p_1,\cdots,p_r$ 恒定； Bernoulli 试验之间相互独立. 不难计算得出，经过 $n$ 重 Bernoulli 随机试验之后 $A_1$ 出现 $k_1$ 次，... $A_r$ 出现 $k_r$ 次的概率为： 

$$p=\binom{n}{k_1k_2\cdots k_r}p_1^{k_1}\cdots p_n^{k_n}$$

### 二项分布

考虑 $n$ 重 Bernoulli 试验中事件 $A$ 发生（注意不要求恰好） $k$ 次（记事件为 $B_k$ ）的概率，已知每一次事件发生的概率为 $p$ . 从而有 

$$\mathcal{P}(B_k)=\mathcal{P}\left(\bigcup_{1\leq i_1<\cdots<i_k\leq n}A_{i_1}\cdots A_{i_k}\bar{A}_{j_1}\cdots\bar{A}_{j_{n-k}}\right)$$

显然事件两两不相容，从而可得：

$$\mathcal{P}(B_k)=\sum\limits_{1\leq i_1<\cdots<i_k\leq n}^{}\mathcal{P}(A_{i_1}\cdots A_{i_k}\bar{A}_{j_1}\cdots\bar{A}_{j_{n-k}})$$ 
然后再由 Bernoulli 试验之间独立的性质，可得 $\mathcal{P}(B_k)=C_n^kp^k(1-p)^{n-k}$ ， $\mathcal{P}(B_k)$ 即为 $(q+ps)^n,q=1-p$ 中 $s^k$ 的系数. 用 $\mu$ 表示事件 $A$ 发生的次数，称 

$$\mathcal{P}(\mu=k)=\mathcal{P}(B_k)\overset{def}{=}b(k;n,p),k=0,1,\cdots,n$$

为**二项分布**（binomial distribution）. 显然有 $\sum\limits_{k=0}^{n}b(k;n,p)=1$ .

已知 $\mathcal{P}$ 在由 $A_1,\cdots,A_n,\emptyset,\Omega$ 组成的事件域 $\mathcal{F}$ 上符合概率函数定义，下面所证明的是 $\mathcal{P}$ 在 $\mathcal{F}$ 的某个限制上仍然符合概率函数定义.

组成的事件域下面来证明 $\mathcal{P}$ 在由 $\{B_k\}_{1\leq k\leq n},\emptyset,\Omega$ 组成的有限 $\sigma$ 事件域上符合概率函数的定义：非负显然；对于规范性， $\mathcal{P}(\Omega)$ 可以转换为更小的 $\mathcal{P}(A_{i_1}\cdots A_{i_k}\bar{A}_{j_1}\cdots\bar{A}_{j_{n-k}})$ 的和，为 $1$ ；对于可列可加性也是类似的思想（由于不相容的限制，所以只能是 $B_k$ 的和，或者是更平凡的情况）.

>[!example]- **随机游走**（random work）：考虑一维坐标轴，从 $a\in \mathbb{Z}$ 出发，只能进行 $+1$ （前进） 或者 $-1$ （后退），分别考虑：1) 无约束情况：求在 $n$ 步之后到达 $a+k(k\in \mathbb{Z})$ 的概率；2) 有约束情况：游走到 $0$ 或者 $a+b$ 就会被吸附，无法继续游走，求则被吸附的概率.
>无约束情况：最简单的二项分布，设前进 $x$ 步后退 $y$ 步，计算 $x+y=n,x-y=k$ 进而可得 $x=\frac{n+k}{2}$ ， $y=\frac{n-k}{2}$ ，再计算 $\binom{n}{k}p^x(1-p)^y$ 即可.
>
>有约束情况：必须转换思路（按照无约束的思想需要加很多约束条件），不妨设在坐标轴 $n(0\leq n\leq a+b)$ 位置被吸附在 $a+b$ 的概率为 $p_n$ ，进一步由全概率公式（这里，全空间指的是起始点为 $n$ 之后的所有情况）可得： $p_n=pp_{n+1}+(1-p)p_{n-1}$ . 从而可以得到： $$p(p_n-p_{n+1})=(1-p)(p_{n-1}-p_n),p_{a+b}=1,p_{0}=0$$ 限制其中的 $1<n<a+b$ ，递推可以得到： $$p_{n+1}=\frac{1-\left(\frac{1}{p}-1\right)^{n+1}}{2-\frac{1}{p}}p_1$$ 从而 $$1=p_{a+b}=\frac{1-\left(\frac{1}{p}-1\right)^{a+b}}{2-\frac{1}{p}}p_1$$ 最后得到 $$p_{n}=\frac{1-\left(\frac{1}{p}-1\right)^n}{1-\left(\frac{1}{p}-1\right)^{a+b}}$$  可见，当 $p\rightarrow \frac{1}{2}$ 时， $p_n=\frac{n}{a+b}$ ，和直观上的理解一致. 另一方面，设坐标在 $n(0\leq n\leq a+b)$ 的点被吸附在 $0$ 的概率为 $q_n$ ，不难得到 $$q_n=\frac{\left(\frac{1}{p}-1\right)^n-\left(\frac{1}{p}-1\right)^{a+b}}{1-\left(\frac{1}{p}-1\right)^{a+b}}$$ 并且可以发现 $p_n+q_n=1$ ，也就可以得到 $a$ 点经过无限次数的随机游走之后被吸附的概率为 $1$ .

此外还可以证明，二维上的点经过随机游走之后最终也会返回原点，这种性质被称为**常反性**.

随机游走问题和下面这个问题是等价的：

>[!example]- 赌注输光：设甲乙两人各有赌资 $a,b$ ，每一次赌输的人都将失去 $1$ 点赌注，而另一个人获得 $1$ 点赌注，（经过无限次的赌局之后）甲乙二人最终有一个人失去全部赌资的概率为？
>同上，可以将 $p_n$ 定义甲具有 $n$ 点赌资时失去全部赌资的概率，然后分别计算在此情况下甲失去全部赌资和乙失去全部赌资的概率. 两者相加，答案同样为 $1$ .

随机游走问题还有一些变种：

>[!example]- 射线随机游走：在一维坐标轴上，起始点为 $a\in \mathbb{N}$ ，进行 $+1$ （概率为 $p$ ）和 $-1$ 的随机游走，如果游走到 $0$ 点则被吸附，最终被吸附的概率为？

设 $p_n$ ：最终被 $0$ 吸附的概率，则有 $$p_n=pp_{n+1}+(1-p)p_{n-1},n>0,p_0=1$$ 从而可以得到： $$p_{n+1}-p_n=\left(\frac{1}{p}-1\right)^n(p_1-1),n>0$$ 递推可得： $$p_{n+1}+1=\frac{1-\left(\frac{1}{p}-1\right)^{n+1}}{2-\frac{1}{p}}(p_1-1)$$ 然后怎么求解？ #issue 

### 几何分布

不断进行相互独立的 Bernoulli 试验，每一次 Bernoulli 试验事件 $A$ 发生的概率为 $p$ ，考虑 $A$ 首次发生出现在第 $k$ 次（记事件为 $W_k$ ）的概率.

显然 $$\mathcal{P}(W_k)=\mathcal{P}(\bar{A}_1\cdots \bar{A}_{k-1}A_k)=(1-p)^{k-1}p$$

称 $g(k;p)=(1-p)^{k-1}p,k\geq1$ 为**几何分布**. 并且有： $$\sum\limits_{k=1}^{\infty}g(k;p)=1$$

$\mathcal{P}$ 是由 $W_1,W_2,\cdots,W_k,\emptyset,\Omega$ 组成的事件域 $\mathcal{F}$ 上的概率函数：非负性显然；规范性， $\Omega$ 可以拆分为不相交的事件；可列可加性；

### Pascal 分布

考虑经过 $k$ 次 Bernoulli 试验恰好成功 $r$ 次（记事件为 $C_k$ ）的概率 $f(r;k,p)$ ，每一次试验成功的概率为 $p$ ，则 $$f(r;k,p)=C_{k-1}^{r-1}p^{r-1}q^{k-r}p,k\geq r$$ 称为 **Pascal 分布**.

下面证明 $\sum\limits_{k=r}^{\infty}f(k;r,p)=1$ ，注意到： $$\begin{aligned}
\sum\limits_{k=r}^{\infty}\binom{k-1}{r-1}p^rq^{k-r}&=\sum\limits_{m=0}^{\infty}\binom{r+m-1}{r-1}p^rq^m\\
&=\sum\limits_{m=0}^{\infty}\frac{(r+m-1)!}{(r-1)!m!}p^rq^m\\
&=\sum\limits_{m=0}^{\infty}(-1)^m\binom{-r}{m}p^rq^m\\
&=\sum\limits_{m=0}^{\infty}\binom{-r}{m}p^r(-q)^m\\
&=p^r(1-q)^{-r}
\end{aligned}$$ 从而可得结论. #imcomplete %%关于负系数组合公式，需要一些整理%%

下面讨论分赌注问题：

>[!example]- 设一场赌局获胜 $N$ 局的人拿取所有赌注，现在甲乙两人分别获胜 $m,n<N$ 局，甲每一次获胜的概率为 $p$ ，现在终止赌局，如何分配赌注？

这个问题可以转化为 Pascal 分布，假设比赛继续进行下去，则甲获胜的概率即为 $$\sum\limits_{k=N-m}^{2N-m-n-1}f(N-m;k,p)$$ 乙获胜的概率即为： $$\sum\limits_{k=N-n}^{2N-m-n-1}f(N-n;k,p)$$ 计算概率比以进行赌注分配.

#imcomplete %%具体计算两个概率并验证两个概率加起来为 $1$ .%%

## 泊松过程

**泊松过程**（Poisson）：考虑事件 $A_k([t_0,t_0+t))$ ：在时间段 $[t_0,t_0+t)$ 内接收到某信号的次数为 $k$ . 泊松过程的特点和数学刻画如下：

1. **平稳性**：起始时间 $t_0$ 不影响该事件发生的概率（ $k$ 只与 $t$ 有关），则可以将该事件记为 $A_k(t)$ ，其概率记为： $p_k([t_0,t_0+t))=p_k(t)$ ，并且有： $\sum\limits_{k=0}^{\infty}p_k(t)=1$ .
2. **独立增量性** / **无后效性**： $[t_0,t_0+t)$ 上的所有事件与 $(-\infty,t_0)$ 之前任何一个时间段 $[t_1,t_1+t')$ 上的所有事件是独立的. 并且有推论： $p_k(t+\Delta t)=\sum\limits_{i=0}^{k}p_i(t)p_{k-i}(\Delta t)$ .
3. **标准性** / **普遍性**：对于 $A_k(t)$ ，当 $t$ 最够小时 $A_k(t)$ 不发生（ $\forall k\geq2$ ），或可以写作： $$\psi(t)=1-p_0(t)-p_1(t)\rightarrow0(t\rightarrow 0)$$ 即 $\psi(t)=o(t)$ ，或者可以写作： $$\lim_{t\rightarrow 0}\frac{\psi(t)}{t}=1$$

从以上条件中，可以推出 $p_k(t)$ 具有唯一形式：

>[!note]- 对于泊松过程中的 $p_k(t)$ ，在限制 $p_0(t)\in(0,1)$ 且 $p_0(t)$ 关于 $p(t)$ 单调递减的情况下，存在 $\lambda>0$ ，使得 $p_k(t)=\frac{\lambda^k}{k!}e^{-\lambda t}$ .
>证明：注意到 $p_k(t+\Delta t)=\sum\limits_{i=0}^{k}p_i(t)p_{k-i}(\Delta t)\quad (1)$ ，由 $p_0(t+\Delta t)=p_0(t)p_0(\Delta t)$ ，并且 $p_0(t)$ 关于 $t$ 单调递减，进而可以证明存在 $\alpha\geq0$ 使得 $p_0(t)=\alpha^t$ 并且由 $p_0(t)\in(0,1)$ 可得 $\alpha\in(0,1)$ ，因此存在 $\lambda>0$ 使得 $\alpha=e^{-\lambda}$ ，所以 $p_0(t)=e^{-\lambda t}$ . 由 $(1)$ 式归纳可得 $$p_k(t)=\frac{\lambda^k}{k!}e^{-\lambda t}$$

对于泊松过程，只需要正确求解 $\lambda$ 即可. 最简单地，注意到 $p_0(t)=e^{-\lambda t}$ .

### 用二项分布逼近泊松分布

>[!note]- 考虑一列 $n$ 重 Bernoulli 试验，设 $\{b(k;n,p_n\}_{n\geq1}$ ，并且满足 $np_n\rightarrow \lambda(n\rightarrow \infty)$ ，即随着试验次数 $n$ 的增加， Bernoulli 试验出现某一事件的次数趋于固定值. 有结论： $b(k;n,p_n)\rightarrow \frac{\lambda^k}{k!}e^{-\lambda}(n\rightarrow \infty)$ .

# 随机变量

[随机变量](https://en.wikipedia.org/wiki/Random_variable)是一个将样本空间 $\Omega$ 映射到可测空间 $E$ 的函数. 称映射 $\xi:(\Omega,\mathcal{F},\mathcal{P})\rightarrow \mathbb{R}$ 为**随机变量**，如果 $\forall x\in \mathbb{R},\{\omega\in \Omega:\xi(\omega)<x\}\overset{def}{=}\{\xi<x\}\in\mathcal{F}$ ，换言之 $\{\xi<x\}$ 是一个事件，并记 $F(x)=\mathcal{P}(\xi<x)$ 是随机变量 $\xi$ 的**分布函数** / 概率分布.

随机变量还有如下的等价定义：设 $\xi:(\Omega,\mathcal{F},\mathcal{P})\rightarrow \mathbb{R}$ ，若对于任一 Borel 集（[[RF#Borel $ sigma-$ 代数]]） $B$ ， $\{\omega\in \Omega:\xi(\omega)\in B\}\in \mathcal{F}$ ，则称 $\xi$ 是随机变量.

>[!note]- 两种对于随机变量的定义是等价的.
>分别记为第一定义和第二定义. 
>
>当第一定义成立时，注意到 $\{\omega\in \Omega:\xi(w)<x\}=\{\omega\in \Omega:\xi(w)\in(-\infty,x)\}$ 并且 $\mathcal{F}$ 是 $\sigma-$ 代数，所以 $\{\omega\in \Omega:\xi(\omega)\in (a,b)\}\in \mathcal{F}$ ，进一步可以推得 $\{\omega\in \Omega:\xi(\omega)\in W: W\in \mathcal{W}\}\in \mathcal{F}$ ，其中 $\mathcal{W}$ 为包含所有开区间的一个 $\sigma-$ 代数，从而由 $\mathcal{B}\subset \mathcal{W}$ 可得第二定义；当第二定义成立时，因为 $(-\infty,x)$ 也是 Borel 集，可知有第一定义. #imcomplete-whatever %%感觉写得不透彻，从 $\mathcal{F}$ 到 $\mathcal{W}$ 这块%%

下面均使用随机变量的第一定义.

下面讨论更一般的分布函数：

-  $\mathcal{P}(a\leq \xi<b)=\mathcal{P}(\xi<b)-\mathcal{P}(\xi<a)=F(b)-F(a)$ （ $\mathcal{P}(\xi<b)=\mathcal{P}(\xi<a)+\mathcal{P}(a\leq \xi<b)$ 其中 $\{a\leq \xi<b\}=\{\xi<a\}-\{\xi<b\}\in \mathcal{F}$）；

可以将分布函数进一步推广，首先分析 $F$ 的性质：

1. 单调性： $\forall a<b,F(a)\leq F(b)$ ；
2. 标准型： $\lim_{a\rightarrow -\infty}F(a)=0,\lim_{b\rightarrow +\infty}=1$ ；
3. 左连续性： $\lim_{x_n\rightarrow x^-}F(x_n)\overset{def}{=}F(x-0)=F(x)$ . （如果在对 $\xi$ 的定义中改为 $\leq$ 时，这里的性质是右连续性）

其中对于左连续性，考虑 $x_0<x_1<\cdots<x_k<\cdots,\forall n\geq1(x_n<x_0)$ ，

$$\begin{aligned}
F(x)-F(x_0)&=\mathcal{P}(x_0\leq \xi<x)\\
&=\mathcal{P}\left(\bigcup_{n\geq1}\{x_{n-1}\leq\xi<x_n\}\right)\\
&=\sum\limits_{n\geq1}^{}\mathcal{P}(\{x_{n-1}\leq \xi<x_n\})\\
&=\sum\limits_{n\geq1}^{}(F(x_n)-F(x_{n-1}))\\
&=\lim_{n\rightarrow \infty}F(x_n)-F(x_0)
\end{aligned}$$ 
从而可得结论.

- $\mathcal{P}(\xi\leq a)=F(a+0)$ （和上面说明左连续性的思路类似，但要取一个补，首先不妨取单调列 $\{a+1/n\}_{n\geq1}$ ，因为 $\mathcal{P}(\xi\leq a)=\mathcal{P}\left(\bigcap_{1\leq n}\{\xi<a+1/n\}\right)$ ，所以 $1-\mathcal{P}(\xi\leq a)=\mathcal{P}\left(\bigcup_{1\leq n}\{\xi\geq a+1/n\}\right)$ 右式进一步可以写为： $\mathcal{P}(\xi>a+1)+F(a+1)-\lim_{n\rightarrow \infty}F(a+1/(n+1))$ ，从而可以得到结论. ）；
- $\mathcal{P}(\xi>a)=1-F(a+0)$ ；
- $\mathcal{P}(\xi\geq a)=1-F(a)$ .

进而可以得到：

- $\mathcal{P}(\mathcal{a\leq \xi\leq b})=F(b+0)-F(a)$ ；
- $\mathcal{P}(a<\xi\leq b)=F(b+0)-F(a+0)$ ；
- $\mathcal{P}(a<\xi<b)=F(b)-F(a+0)$ ；
- $\mathcal{P}(\xi=x_0)=F(x_0+0)-F(x_0)$ ；

>[!example]- 假设 $\xi$ 只能取值 $-1,0,1$ ，并且 $\mathcal{P}(\xi=-1)=p,\mathcal{P}(\xi=0)=q,\mathcal{P}(\xi=1)=r$ ，$p+q+r=1$ ，则 $F(x)$ ？
>$$F(x)=\left\{\begin{aligned}&p,x\leq -1\\&p+q,-1<x\leq 0\\&1,0<x\end{aligned}\right.$$

## 离散型随机变量

设 $\{x_n\}_{n\geq1}$ 为 $\xi$ 的所有可能取值，并记 $\mathcal{P}(\xi=x_i)=p(x_i),i\geq1$ ，称 $\{p(x_i):i\geq1\}$ 为随机变量 $\xi$ 的**分布列**，满足 $p(x_i)\geq0,\forall i\geq1,\sum\limits_{n\geq1}^{}p(x_n)=1$ .

分布列也可以表示为：

$$\xi\sim\begin{bmatrix}x_1 & x_2 & \cdots & x_n &\cdots \\ p_1 & p_2 & \cdots & p_n & \cdots\end{bmatrix}$$

分布函数可以和分布列相互表示： $F(x)=\mathcal{P}(\xi<x)=\sum\limits_{x_k<x}^{}p(x_k)$ ， $p(x_k)=\text{lastmin}\{F(x):x>x_k\}-\text{lastmax}\{F(x):x<x_k\}$ .

更一般的，有**退化分布** / 单点分布，随机变量 $\alpha\equiv c$ ，此时 $F(x)=\left\{\begin{aligned}&0,x\leq c\\&1,x>c\end{aligned}\right.$  . #issue %%这能否推出 $\mathcal{F}=\{\emptyset,\Omega\}$ ?%%

### 离散型概率分布

之前已经接触了很多离散随机分布. 

[Bernoulli 分布](#伯努利随机试验)：随机变量 $\beta$ 只取两个值 $k=0,1$ ；

[二项分布](#二项分布)：随机变量 $\mu$ 可以取多个值 $k=0,1,\cdots,n,n<\infty$ ；一般用 $\mu\sim B(n,q)$ 表示随机变量 $\mu$ 的分布列为二项分布；

几何分布：用 $\eta$ 表示多次 Bernoulli 试验首次成功时进行的试验次数，随机变量 $\eta$ 可以取 $1,\cdots,n,\cdots$（和几何概率模型没有关系）则 $\mathcal{P}(\eta=k)\overset{def}{=}g(k;p)=q^{k-1}p,k\geq1$ ，几何分布是具有**无记忆性**，即 $\forall m,k\geq1$ ， $\mathcal{P}(\xi=m+k \,|\,\xi>m)=\mathcal{P}(\xi=k)$ ，由： 

$$\frac{\mathcal{P}(\xi=m+k)}{\mathcal{P}(\xi>m)}=\frac{q^{m+k-1}p}{\sum\limits_{i=m+1}^{\infty}q^{i-1}p}=q^{k-1}p$$

反之，有如下结论：

>[!note]- 如果离散随机变量的取值为自然数，并且其概率分布具有无记忆性，则其一定为几何分布. 

证明：


**简单随机变量**的形式可以写作 $X(w)=\sum\limits_{i=1}^{n}a_iI_{A_i}(w)$ 其中 $I_{A_i},1\leq i\leq n$ 为指示函数， $A_i,1\leq i\leq n$ 则组成了 $\Omega$ 的一个不相交划分. #issue [Check](https://www.oreilly.com/library/view/probability-random-variables/9781118393956/OEBPS/c05-sec1-0004.htm#:~:text=A%20simple%20random%20variable%20is%20a%20generalization%20of,of%20%CE%A9%20are%20mapped%20to%20N%20values%20in.)

随机并且为变量，注意不是事件，而是根据该事件抽象出来的概念.
