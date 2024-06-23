# 依赖与简介

概率论中对于数字特征的计算、概率收敛的计算需要[[MA#级数]]、[[MA#积分]]中的一些技巧，以及一些实数理论 [[zoeminus/docs/Math/R|R]] . 在求解或证明简单概率模型（古典、几何）时需要一些组合数方面的知识，见[[DSA#附录：组合恒等式]].

首先刻画 [[#概率论讨论对象]]：样本空间、事件、概率函数（[[#概率公理]]），随后就事件和概率函数的角度讨论[[#古典概率模型]]、[[#几何概率模型]]，谈论这些看起来很基础的概率模型的意义是——所谓的事件大多数都可以被抽象为随机变量限制在 $\mathbb{R}$ 的某个子集上对应的原像，于是研究事件发生的概率也就转换为研究随机变量.

不过为什么？讨论随机变量限制在 $\mathbb{R}$ 的某个子集上对应的原像有什么好处？

就实际而言，通常我们不关心单个事件的概率. 比如考虑随机变量 $\eta,\xi$ ，今天的 $22:10$ 的温度是 $19.19^\circ$ 的概率是多少，e.g. $\mathcal{P}(\xi=22:10,\eta=19.19^\circ)$  ？我们相对而言更关心的问题是：今天 $22:00-24:00$ 的温度为 $>30^\circ$ 的概率 $\mathcal{P}(22:00<\xi<24:00,\eta>30^\circ)$ ？，这样可能就该开空调了.

进而定义分布函数、密度函数，并依据实际情况将随机变量分为离散型和连续型；随后讨论随机变量之间的关系：条件概率、独立性；然后就会进入到概括性强的数字特征：期望、方差、母函数、特征函数.

最后，讨论一些与随机变量函数列相关的收敛的结论，因为实际上在上述对于随机变量的讨论中几乎未染指如何计算概率. 在[[#概率收敛]]中，将给出一些定理，说明如何估计随机变量分布函数.

# 概率论讨论对象

概率论中的三个要素： $(\Omega,\mathcal{F},P)$ . 其中 $\Omega$ 称为**样本空间**（sample space）由（一个随机过程中出现的）所有可能结果构成， $\mathcal{F}$ 为 $\Omega$ 的<u>一些</u>子集组成的一个集合，称为**事件集**（set of events）， $P:\mathcal{F}\rightarrow[0,1]$ 称为**概率函数**或者**概率测度**.

## 样本空间

$\omega\in \Omega$ 称为**样本点**，$A\subset \mathcal{F}$ 称为**事件**，事件是对随机过程结果的一个抽象.

事件具有以下运算：

设 $A,B\subset \Omega$ .

- **积**： $A\cap B$ 或 $AB$ ，表示 $A,B$ 同时发生；
- **和**： $A\cup B$ 或 $A+B$ ，表示 $A,B$ 中至少发生一个；并且有 $A+B=A+\bar{A}B$ ；
- **差**： $A\backslash B$ 或 $A-B$ ，表示 $A$ 发生但 $B$ 不发生；并且有 $A-B=A-AB$ ；
- **补**： $\Omega\backslash A$ 或 $\bar{A}$ （注意合理性用到了 $\mathcal{F}$ 是 sigma-代数，下面提及）.

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

根据 1. 2. 可以得出 $\Omega\in \mathcal{F}$ . $\sigma-$ 代数指的是对于集合的任意个交、并、差、补运算都封闭.

上述要求 $\mathcal{F}$ 是 $\sigma-$ 域是为了对于确保概率定义的合理性. 也即事件集是可以进行上述提到的操作的.

根据定义可知，最小的 $\sigma$ 代数为 $\{\emptyset,\Omega\}$ ，最大的 $\sigma$ 代数为 $\mathcal{P}(\Omega)$ ；包含 $A$ 的最小 $\sigma$ 代数为 $\mathcal{F}=\{\emptyset,\Omega,A,\bar{A}\}$ .

## 概率公理

>[!summary] 自查表
>- 什么是概率公理？从概率公理出发能得到哪些结论？

对于概率函数，其需要满足下面三个条件：

1. 非负： $\forall E\in \mathcal{F}(\mathcal{P}(E)\in[0,1])$ ；
2. 规范： $\mathcal{P}(\Omega)=1$ ；
3. 可列可加： $E_i\in \mathcal{F},i\in I$ 其中 $I$ 为至多可数集，如果 $E_i$ 两两**互斥**（ $E_i\cap E_j=\emptyset,\forall i,j\in I$ ，或称**不相容**），则 $\mathcal{P}(\sum\limits_{i\in I}^{}E_i)=\sum\limits_{i\in I}\mathcal{P}(E_i)$ . 

注：可以将上述概率公理减弱为：

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

>[!note] 一般求和公式.
>$$\begin{aligned}
>\mathcal{P}(A_1\cup A_2\cup \cdots\cup A_n)&=\sum\limits_{i=1}^{n}\mathcal{P}(A_i)-\sum\limits_{1\leq i<j\leq n}^{}\mathcal{P}(A_iA_j)\\
>&+\sum\limits_{1\leq i<j<k\leq n}^{}\mathcal{P}(A_iA_jA_k)-\cdots\\
>&+(-1)^{n-1}\mathcal{P}(A_1A_2\cdots A_n)
>\end{aligned}$$
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
>见 [[ProbDraw]] ，用 $a,b,c$ 表示甲、乙、丙在当前对局中失败. 由规则一个人不能连续失败两次，因此 $aa,bb,cc$ 模式均不可能出现，并且对于当前字母 $a/b/c$ 其有 $1/2$ 的概率转换为另外两个字母之一. 最终甲获胜的情况即为出现 $bcb$ 或者 $cbc$ 的同时不出现 $aba,bab,cac,aca$ 中的任何一个情况，以及在最开始时的 $bc$ ，并且注意到起始三个元素将会决定所有后续 $abcabc\cdots,bacbac\cdots$），在这种情况下甲获胜的序列：
>1) 若长度为 $3k+1$ ，则最后几个元素为 
>
>$$\begin{aligned}
>&abcabc\cdots abcb\\
>&bacbac\cdots bac\times\\
>\end{aligned}$$
>
>2) 若长度为 $3k+2$ ，则最后几个元素为： 
>
>$$\begin{aligned}
>&abcabc\cdots abcbc(\text{repeat})\\
>&bacbac\cdots bacbc\\
>\end{aligned}$$
>
>注意当 $k=0$ 时也有一种情况.
>
>3) 若长度为 $3k$ ，情况不存在.
>
>所以甲获胜的概率为：
>
>$$1\times \frac{1}{2^2}+\sum\limits_{k=1}^{\infty}\left[1\times\frac{1}{2^{3k+1}}+1\times \frac{1}{2^{3k+2}}\right]=\frac{1}{4}+\frac{1}{16}/\frac{7}{8}+\frac{1}{32}/\frac{7}{8}=\frac{5}{14}$$
>
>进而可以得到之后的值.
>
>另一方面：考虑的是丙在 $3k+1$ 时获胜的情形： 
>
>$$\begin{aligned}
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

>[!note] 若 $A\supset B$ ，则 $\mathcal{P}(A\backslash B)=\mathcal{P}(A)-\mathcal{P}(B)$ . 若 $A,B$ 没有包含关系，则 $\mathcal{P}(A\backslash B)=\mathcal{P}(A)-\mathcal{P}(A\cap B)$ .

# 简单概率模型

下面提出的概率模型对于概率函数 $\mathcal{P}$ 做出估计.

## 古典概率模型

>[!summary] 自查表
>- 古典概率模型的定义；举出一个不是古典概率模型的例子；

- $\lvert \Omega\rvert$ 有限；
- $\mathcal{F}$ 中的任意两个事件互斥（不相容）；
- 每一个结果对应的概率等可能，均为 $\frac{1}{\lvert \Omega\rvert}$. 

在此情况下，对于一个事件 $A$ ，可以计算其概率： $\mathcal{P}(A)=\frac{\lvert A\rvert}{\lvert \Omega\rvert}$

>[!example] 不是古典概率模型举例. #issue 
>课堂上举的例子 $\{1,2,2,3,3,3\}$ 有问题.

计算古典概率模型需要用到[排列](DSA.md#排列)和[组合](DSA.md#组合)分析. 一般对于古典概型问题中直观上的相同元素（例如，同色小球）按照不同进行处理.

>[!example]+ 有重复组合数：从 $n$ 个小球中抽取 $r(r\leq n)$ 个小球. 考虑有无放回和有无顺序，各有多少种取法？
>- 有放回有顺序： $n^r$ ；
>- **有放回无顺序**： $\frac{n^r}{r!}$ 这一答案并不正确，例如 $1,2,2$ 和 $2,1,2$ 在有放回但无顺序下是一样的（会有相同的元素），因此不能简单地除以 $r!$ ，正确答案应该为 $C_{n+r-1}^r$ （**有重复组合数**），见下面的分析；
>- 无放回有顺序： $A_n^r$ ；
>- 无放回无顺序： $C_n^r$ ；
>
>下面分析有放回但无顺序的情况，该问题实际上在考虑抽取各个小球的次数之和为固定值 $r$ 下所有的情况数量：
>
>或为该方程组的解： 
>
>$$\left\{\begin{aligned}
>&x_i\geq0,1\leq i\leq n\\
>&x_1+x_2+\cdots+x_n=r
>\end{aligned}\right.$$ 
>
>进而可以转化为下面这一问题（令 $y_i=x_i+1,1\leq i\leq n$ ）： 
>
>$$\left\{\begin{aligned}
>&y_i\geq 1,1\leq i\leq n\\
>&y_1+y_2+\cdots+y_n=r+n
>\end{aligned}\right.$$
>
>此即为经典的挡板问题：有 $n+r$ 个小球， $n-1$ 个挡板，总共有 $\binom{n+r-1}{n-1}$ 种划分方法，即为 $C_{n+r-1}^{r}$ .
>^NoRepeatReSample

>[!example]- 占位问题：有 $r$ 个标号的小球，随机地放在 $n$ 个盒子中（ $r\leq n$ ），求下列事件发生的概率：
>1. 指定的标号盒子中只能有一个小球， $\frac{r!}{n^r}$ ；
>2. 恰好有 $r$ 个盒子，其中各有一个球（或者称：每个盒子至多一个球）： $\frac{C_n^r r!}{n^r}$ ；
>3. 某一指定的盒子中恰好有 $k(k\leq r)$ 个球： $\frac{C_r^k(n-1)^{r-k}}{n^r}$ .

>[!example]- 生日问题：$r(r\leq365)$ 个人的生日均不在同一天的概率.
>$C_{365}^r\left(\frac{1}{365}\right)^r$ .

>[!example] 抽签问题： $a$ 个红球和 $b$ 个白球放在一个盒子中，第 $k$ 次抽取到红球的概率？
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

>[!example]- 抽样：考虑 $r$ 个红球和 $b$ 个黑球，从中抽取 $n$ 个球，有 $k$ 个球为红球的概率为？分为有放回和无放回讨论.
>无放回无顺序： $\lvert \Omega\rvert=C_{r+b}^n$ ， $\lvert A\rvert=C_r^kC_b^{n-k}$ ，则 $p=\frac{C_r^kC_b^{n-k}}{C_{r+b}^n}$ . 这称为[[#超几何分布]]，如果考虑无放回有顺序： 
>
>$$p=\frac{C_n^kA_r^kA_b^{n-k}}{A_{r+b}^n}=\frac{C_r^kC_b^{n-k}}{C_{r+b}^n}$$
>
>（ $A_n^k=\frac{1}{k!}C_n^k$ ）
>
>两种情况是一样的，事实上对于第一个式子，可以将其视为 
>
>$$\frac{C_r^kC_b^{n-k}\cdot n!}{C_{r+b}^n n!}$$
>
>也同时考虑了顺序.
>
>有放回： $p=\frac{C_n^kr^kb^{n-k}}{(r+b)^n}=C_n^k\left(\frac{r}{r+b}\right)^k\left(\frac{b}{r+b}\right)^{n-k}$ ，即为**二项分布**. ^Sample

可以用**泊松分布**逼近**二项分布**，用二项分布逼近**超几何分布**. #imcomplete 

>[!example]- 捆绑排列：将 $n$ 个人排成一列，甲、乙之间恰好有 $k(k\leq n)$ 个人的概率为？
>将甲、乙连同两者之间的 $k$ 个人看作一个整体，连同剩下的 $n-k-2$ 共 “ $n-k+1$ ” 个人有 $(n-k-1)!$ 种排列方法，对于该整体，其有 $2\cdot A_{n-2}^k$ 种排列方法. 从而 $p=\frac{2A_{n-2}^k(n-k-1)!}{n!}$ .

## 几何概率模型

>[!summary]+ 自查表
>- 什么是几何概率？
>- 什么是 Bertrand 悖论？能否说明几何概率是缺乏依据的？

几何概率是建立在**可测**（不是拓扑中的度量概念，类似积分）的空间 $G$ 中的，几何概率即为 $\mathcal{P}:\mathcal{P}(G)\rightarrow G$ ，对于 $g\subset G$ ， $\mathcal{P}(g)$ 与 $g$ 的度量成正比. 或者说，在 $G$ 中取一点，其出现在 $g\subset G$ 的概率与 $g$ 的度量成正比. 结合 $\mathcal{P}$ 的定义 [[#三要素]]： 可以得到 $\mathcal{P}(g)=\frac{\sigma(g)}{\sigma(G)}$ 其中 $\sigma(g)$ 表示 $g$ 的测度. 

>[!example]- 约会问题： $A,B$ 约定在 $7:00-8:00$ 之间会面，有一方超过 $20$ 分钟未见到对方则离开， $A,B$ 出现在 $7:00-8:00$ 的任一时刻等可能. 两人能够相见的概率？
>首先确定 $G=\{(x,y):0\leq x,y\leq 60\}$ . 然后 $g=\{(x,y):\lvert x-y\rvert\leq 20\}$ ，通过面积法可求得 $p=\frac{5}{9}$ .

>[!example]- 蒲丰问题（投针估计圆周率）考虑一组间距为 $a$ 的平行线，现在随机地向纸上丢一个针（意思是，针的位置和角度都是均匀分布的），假设纸也是无限大的，针的长度为 $l(l\leq n)$ ，则针触碰到任意一条线的概率为？
>首先 $G=\{(\theta,x):0\leq \theta\leq \pi,0\leq x\leq \frac{a}{2}\}$ ，其中 $x$ 为针的中心距离最近的平行线的距离. 则 $g=\{(\theta,x):0\leq \theta\leq \pi,0\leq x\leq \frac{l}{2}\sin\theta\}$ . 进而可得： 
>
>$$p=\frac{\int_0^\pi\frac{l}{2}\sin\theta d\theta}{\frac{a}{2}\pi}=\frac{2l}{\pi a}$$
>
>据此也可以计算出圆周率.

投针估计圆周率是一种 **Monte-Carlo 方法**：通过随机事件估计数值. #imcomplete %%更多Monte-carlo方法%%

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

>[!example] 一般摸球模型（Polya Urn）：设有 $r$ 个红球和 $b$ 个白球，每次从中抓取一个球，都放入与该球同色的球 $s(s\geq0)$ 个. 证明第 $n(n\leq r+b)$ 摸出红球的概率为 $\frac{r}{r+b}$ . 
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

根据条件概率公式和全概率公式可得**贝叶斯公式**（Bayes）：设 $\{B_i\}_{1\leq i\leq n}$ 为 $\Omega$ 的一个分割，则对于 $A\in\mathcal{F}$ 有： 

$$\mathcal{P}(B_j|A)=\frac{\mathcal{P}(A|B_j)\mathcal{P}(B_j)}{\sum_{k=1}^{n}\mathcal{P}(A|B_k)\mathcal{P}(B_k)}$$

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

>[!summary]+ 自查表
>- 什么是 Bernoulli 随机试验？其事件域 $\mathcal{F}$ 是什么样的？
>- 什么是 $n$ 重 Bernoulli 随机试验？推广的 Bernoulli 随机试验是什么？
>- 从 Bernoulli 随机试验中可以构造哪些随机变量（随机向量）？

**Bernoulli** 随机试验的事件域为 $\mathcal{F}=\{\emptyset,\Omega,A,\bar{A}\}$ . 每一次随机试验仅有两种可能： $A$ 或 $\bar{A}$ . **n 重 Bernoulli 随机试验**需要满足：1. 每次试验都是 Bernoulli 随机试验，进行 $n$ 次；2. 每一次实验 $\mathcal{P}(A)$ 不改变；3. Bernoulli 试验之间相互独立.

记 $\mathcal{P}(A)=p$ ， $\beta$ 表示一次 Bernoulli 随机试验中 $A$ 事件出现的次数（只能取 $0,1$ ） 则 $\mathcal{P}(\beta=k)\overset{def }{=}b_k=p^kq^{1-k},k=0,1$ . 称 $\mathcal{P}(\beta=k)$ 为 **Bernoulli 分布** / **两点分布**.

>[!hint] 称 $\mathcal{P}(\xi=k)$ 为 XX 分布.
>一种习惯说法. 如果随机变量的概率函数满足某种形式（属于某个函数族），则称该随机变量服从某种分布. 反过来也直接称概率函数为 XX 分布.

Bernoulli 随机试验还可以进行推广：每一次随机试验有 $r$ 种可能： $A_1,\cdots,A_r$ ，对应的概率分别为 $p_1,\cdots,p_r$ ；推广的 $n$ 重 Bernoulli 随机试验需要满足：每一次都是 Bernoulli 随机试验，进行 $n$ 次； $p_1,\cdots,p_r$ 恒定； Bernoulli 试验之间相互独立. 不难计算得出，经过 $n$ 重 Bernoulli 随机试验之后 $A_1$ 出现 $k_1$ 次，... $A_r$ 出现 $k_r$ 次的概率为： 

$$p=\binom{n}{k_1k_2\cdots k_r}p_1^{k_1}\cdots p_n^{k_n}$$

### 二项分布

>[!hint] 验证计算得到的是否是概率函数.
>从 Bernoulli 随机试验到 $n$ 重 Bernoulli 随机试验会构造一个新的 $\mathcal{F}$ 事件域，因此需要验证计算得到的函数在 $\mathcal{F}$ 上是否满足[[#概率公理]].

考虑 $n$ 重 Bernoulli 试验中事件 $A$ 发生（注意不要求恰好） $k$ 次（记事件为 $B_k$ ）的概率，已知每一次事件发生的概率为 $p$ . 从而有 

$$\mathcal{P}(B_k)=\mathcal{P}\left(\bigcup_{1\leq i_1<\cdots<i_k\leq n}A_{i_1}\cdots A_{i_k}\bar{A}_{j_1}\cdots\bar{A}_{j_{n-k}}\right)$$

显然事件两两不相容，从而可得：

$$\mathcal{P}(B_k)=\sum\limits_{1\leq i_1<\cdots<i_k\leq n}^{}\mathcal{P}(A_{i_1}\cdots A_{i_k}\bar{A}_{j_1}\cdots\bar{A}_{j_{n-k}})$$ 
由 Bernoulli 试验之间独立的性质，可得 $\mathcal{P}(B_k)=C_n^kp^k(1-p)^{n-k}$ ， $\mathcal{P}(B_k)$ 即为 $(q+ps)^n,q=1-p$ 中 $s^k$ 的系数. 用 $\mu$ 表示事件 $A$ 发生的次数，称 

$$\mathcal{P}(\mu=k)=\mathcal{P}(B_k)\overset{def}{=}b(k;n,p),k=0,1,\cdots,n$$

为**二项分布**（binomial distribution）. 显然有 $\sum\limits_{k=0}^{n}b(k;n,p)=1$ .

已知 $\mathcal{P}$ 在由 $A_1,\cdots,A_n,\emptyset,\Omega$ 组成的事件域 $\mathcal{F}$ 上符合概率函数定义，下面所证明的是 $\mathcal{P}$ 在 $\mathcal{F}$ 的某个限制上仍然符合概率函数定义.

组成的事件域下面来证明 $\mathcal{P}$ 在由 $\{B_k\}_{1\leq k\leq n},\emptyset,\Omega$ 组成的有限 $\sigma$ 事件域上符合概率函数的定义：非负显然；对于规范性， $\mathcal{P}(\Omega)$ 可以转换为更小的 $\mathcal{P}(A_{i_1}\cdots A_{i_k}\bar{A}_{j_1}\cdots\bar{A}_{j_{n-k}})$ 的和，为 $1$ ；对于可列可加性也是类似的思想（由于不相容的限制，所以只能是 $B_k$ 的和，或者是更平凡的情况）.

[[2420Sa083626]]

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

>[!summary] 自查表
>- 几何分布的定义；和几何概率模型有什么关系？

不断进行相互独立的 Bernoulli 试验，每一次 Bernoulli 试验事件 $A$ 发生的概率为 $p$ ，考虑 $A$ <u>首次发生</u>出现在第 $k$ 次（记事件为 $W_k$ ）的概率.

$$\mathcal{P}(W_k)=\mathcal{P}(\bar{A}_1\cdots \bar{A}_{k-1}A_k)=(1-p)^{k-1}p$$

称 $g(k;p)=(1-p)^{k-1}p,k\geq1$ 为**几何分布**. 并且有： 

$$\sum\limits_{k=1}^{\infty}g(k;p)=1$$

$\mathcal{P}$ 是由 $W_1,W_2,\cdots,W_k,\emptyset,\Omega$ 组成的事件域 $\mathcal{F}$ 上的概率函数：非负性显然；规范性， $\Omega$ 可以拆分为不相交的事件；可列可加性；

几何分布是唯一一个具有无记忆性的离散型随机变量，见： [[#几何分布（二）]]

### Pascal 分布

考虑经过 $k$ 次 Bernoulli 试验<u>恰好成功</u> $r$ 次（记事件为 $C_k$ ）的概率 $f(r;k,p)$ ，每一次试验成功的概率为 $p$ ，则 

$$f(k;r,p)=C_{k-1}^{r-1}p^{r}q^{k-r},k\geq r$$

称为 **Pascal 分布**.

显然有：

$$f(k;r,p)=f(k-1;r-1,p)\cdot p$$

下面证明 $\sum\limits_{k=r}^{\infty}f(k;r,p)=1$ ，注意到： 

$$\begin{aligned}
\sum\limits_{k=r}^{\infty}\binom{k-1}{r-1}p^rq^{k-r}&=\sum\limits_{m=0}^{\infty}\binom{r+m-1}{r-1}p^rq^m\\
&=\sum\limits_{m=0}^{\infty}\frac{(r+m-1)!}{(r-1)!m!}p^rq^m\\
&=\sum\limits_{m=0}^{\infty}(-1)^m\binom{-r}{m}p^rq^m\\
&=\sum\limits_{m=0}^{\infty}\binom{-r}{m}p^r(-q)^m\\
&=p^r(1-q)^{-r}
\end{aligned}$$

从而可得结论.

下面讨论**分赌注问题**：

>[!example] 分赌注问题：设一场赌局获胜 $N$ 局的人拿取所有赌注，现在甲乙两人还差 $m,n$ 局才能获胜，甲每一次获胜的概率为 $p$ ，现在终止赌局，如何分配赌注？
>这个问题可以转化为 Pascal 分布，假设比赛继续进行下去，则甲获胜等同于在 $k$ 局中甲恰好获胜 $m$ 局，其概率即为 
>
>$$P_1=\sum\limits_{k=m}^{m+n-1}f(k;m,p)=\sum\limits_{k=m}^{m+n-1}\binom{k-1}{m-1}p^mq^{k-m}=\sum\limits_{k=0}^{n-1}\binom{n+k-1}{k}p^mq^{k}$$
>
>乙获胜的概率类似： 
>
>计算概率比以进行赌注分配.
>
>对于上式 $P_1$ 可以证明：
>
>$$P_1=P_3=\sum\limits_{k=m}^{m+n-1}\binom{n+m-1}{k}p^kq^{n+m-1-k}$$
>
>$P_3$ 是由二项分布得到的， #issue %%找不到简洁的证明，也没得到二项分布能推出 $P_3$ %%
>
>或者：
>
>$$P_1=P_2=1-\sum\limits_{k=0}^{m-1}\binom{n+k-1}{k}p^kq^n=\sum\limits_{k=m}^{\infty}\binom{n+k-1}{k}p^kq^n$$

## 泊松过程

>[!summary]+ 自查表
>- 什么是泊松过程？对其特点做数学刻画；
>- 如何用二项分布逼近泊松分布？
>- 泊松分布具有无记忆性吗？

**泊松过程**（Poisson）：考虑事件 $A_k([t_0,t_0+t))$ ：在时间段 $[t_0,t_0+t)$ 内接收到某信号的次数为 $k$ . 泊松过程的特点和对特点的数学刻画如下：

1. **平稳性**：起始时间 $t_0$ 不影响该事件发生的概率（ $k$ 只与时间段 $t$ 有关），则可以将事件 $A_k([t_0,t_0+t])$ 记为 $A_k(t)$ ，其概率记为： $p_k(t)$ ，并且有： $\sum\limits_{k=0}^{\infty}p_k(t)=1$ .
2. **独立增量性** / **无后效性**： $[t_0,t_0+t)$ 上的所有事件与 $(-\infty,t_0)$ 之前任何一个时间段 $[t_1,t_1+t')$ 上的所有事件是独立的. 有推论： $p_k(t+\Delta t)=\sum\limits_{i=0}^{k}p_i(t)p_{k-i}(\Delta t)$ .
3. **标准性** / **普遍性**：对于 $A_k(t)$ ，当 $t$ 最够小时 $A_k(t)$ 不发生（ $\forall k\geq2$ ），或可以写作： $\psi(t)=1-p_0(t)-p_1(t)\rightarrow0(t\rightarrow 0)$ 即 $\psi(t)=o(t)$ ，或者可以写作： $\lim_{t\rightarrow 0}\frac{\psi(t)}{t}=1$ .

从以上条件中，可以推出 $p_k(t)$ 具有唯一形式：

>[!note]- 对于泊松过程中的 $p_k(t)$ ，在限制 $p_0(t)\in(0,1)$ 且 $p_0(t)$ 关于 $t$ 单调递减的情况下，存在 $\lambda>0$ ，使得 $p_k(t)=\frac{\lambda^k}{k!}e^{-\lambda t}$ .
>证明：注意到 $p_k(t+\Delta t)=\sum\limits_{i=0}^{k}p_i(t)p_{k-i}(\Delta t)\quad (1)$ ，由 $p_0(t+\Delta t)=p_0(t)p_0(\Delta t)$ ，并且 $p_0(t)$ 关于 $t$ 单调递减，进而可以证明存在 $\alpha\geq0$ 使得 $p_0(t)=\alpha^t$ 并且由 $p_0(t)\in(0,1)$ 可得 $\alpha\in(0,1)$ ，因此存在 $\lambda>0$ 使得 $\alpha=e^{-\lambda}$ ，所以 $p_0(t)=e^{-\lambda t}$ . 由 $(1)$  可以得到 #imcomplete 
>
> $$p_k'(t)=\lambda[p_{k-1}(t)-p_{k}(t)],\forall k\geq1$$
>
>进而可得：
>
>$$p_k(t)=\frac{\lambda^k}{k!}e^{-\lambda t}$$

对于泊松过程，只需要正确求解 $\lambda$ 即可. 最简单地，注意到 $p_0(t)=e^{-\lambda t}$ .

### 用二项分布逼近泊松分布

>[!note]- 考虑一列 $n$ 重 Bernoulli 试验，设 $\{b(k;n,p_n\}_{n\geq1}$ ，并且满足 $np_n\rightarrow \lambda(n\rightarrow \infty)$ ，即随着试验次数 $n$ 的增加， Bernoulli 试验出现某一事件的次数趋于固定值. 有结论： $b(k;n,p_n)\rightarrow \frac{\lambda^k}{k!}e^{-\lambda}(n\rightarrow \infty)$ . #imcomplete-lack-proofs 

# 随机变量

[随机变量](https://en.wikipedia.org/wiki/Random_variable)是一个将样本空间 $\Omega$ 映射到可测空间 $E$ 的函数. 称映射 $\xi:(\Omega,\mathcal{F},\mathcal{P})\rightarrow \mathbb{R},w\in \Omega\mapsto \xi(w)$ 为**随机变量**，如果： 

$$\forall x\in \mathbb{R},\{\omega\in \Omega:\xi(\omega)<x\}\overset{def}{=}\{\xi<x\}\in\mathcal{F}$$

换言之 $\{\xi<x\}$ 是一个事件. 

定义 $F(x)=\mathcal{P}(\xi<x)$ 是随机变量 $\xi$ 的**分布函数** / 概率分布.

随机变量有如下等价定义：设 $\xi:(\Omega,\mathcal{F},\mathcal{P})\rightarrow \mathbb{R}$ ，若对于任一 Borel 集（[[RF#Borel $ sigma-$ 代数]]） $B$ ， $\{\omega\in \Omega:\xi(\omega)\in B\}\in \mathcal{F}$ ，则称 $\xi$ 是随机变量.

>[!note]- 两种对于随机变量的定义是等价的.
>分别记为第一定义和第二定义. 
>
>当第一定义成立时，注意到 $\{\omega\in \Omega:\xi(w)<x\}=\{\omega\in \Omega:\xi(w)\in(-\infty,x)\}$ 并且 $\mathcal{F}$ 是 $\sigma-$ 代数，所以 $\{\omega\in \Omega:\xi(\omega)\in (a,b)\}\in \mathcal{F}$ ，进一步可以推得 $\{\omega\in \Omega:\xi(\omega)\in W: W\in \mathcal{W}\}\in \mathcal{F}$ ，其中 $\mathcal{W}$ 为包含所有开区间的一个 $\sigma-$ 代数，从而由 $\mathcal{B}\subset \mathcal{W}$ 可得第二定义；当第二定义成立时，因为 $(-\infty,x)$ 也是 Borel 集，可知有第一定义. [[2424Th144102]]

>[!warning] 本篇均使用随机变量的第一定义.

下面讨论更一般的分布函数：

>[!note]-  $\mathcal{P}(a\leq \xi<b)=\mathcal{P}(\xi<b)-\mathcal{P}(\xi<a)=F(b)-F(a)$ 
> $\mathcal{P}(\xi<b)=\mathcal{P}(\xi<a)+\mathcal{P}(a\leq \xi<b)$ 但需要说明 $\{a\leq \xi<b\}=\{\xi<a\}-\{\xi<b\}\in \mathcal{F}$

可以将分布函数进一步推广，首先分析 $F$ 的性质（也称为特征）：

1. 单调性： $\forall a<b,F(a)\leq F(b)$ ；
2. 标准性： $\lim_{a\rightarrow -\infty}F(a)\overset{def}{=}F(-\infty)=0,\lim_{b\rightarrow +\infty}F(b)\overset{def}{=}F(+\infty)=1$ ；
3. 左连续性： $\lim_{x_n\rightarrow x^-}F(x_n)\overset{def}{=}F(x-0)=F(x)$ . （如果在对 $\xi$ 的定义中改为 $\leq$ 时，这里的性质是右连续性） ^DistributionFunctionProperty

对于标准性的证明：

$$\begin{aligned}
1=\{-\infty<\xi<\infty\}&=\sum\limits_{n=-\infty}^{\infty}\mathcal{P}(n\leq \xi<n+1)\\
&=\sum\limits_{n=-\infty}^{\infty}F(n+1)-F(n)\\
&=\lim_{n\rightarrow \infty}F(n)-\lim_{n\rightarrow \infty}F(-n)\\
&\overset{F\ \text{单调}}{=}F(+\infty)-F(-\infty)
\end{aligned}$$

并且由 $F(+\infty)\leq 1,F(-\infty)\ge 0$ 可得结论.

其中对于左连续性的证明，考虑 $x_0<x_1<\cdots<x_k<\cdots,\forall n\geq1(x_n<x_0)$ ，

$$\begin{aligned}
F(x)-F(x_0)&=\mathcal{P}(x_0\leq \xi<x)\\
&=\mathcal{P}\left(\bigcup_{n\geq1}\{x_{n-1}\leq\xi<x_n\}\right)\\
&=\sum\limits_{n\geq1}^{}\mathcal{P}(\{x_{n-1}\leq \xi<x_n\})\\
&=\sum\limits_{n\geq1}^{}(F(x_n)-F(x_{n-1}))\\
&=\lim_{n\rightarrow \infty}F(x_n)-F(x_0)
\end{aligned}$$

从而有单调性可以得到结论，类似可得如下结论.

>[!note] $\mathcal{P}(\xi\leq a)=F(a+0)$ 
>和上面说明左连续性的思路类似，但要取一个补，首先不妨取单调列 $\{a+1/n\}_{n\geq1}$ ，因为：
>
>$$\mathcal{P}(\xi\leq a)=\mathcal{P}\left(\bigcap_{1\leq n}\{\xi<a+1/n\}\right)$$
> 
>所以：
>
>$$1-\mathcal{P}(\xi\leq a)=\mathcal{P}\left(\bigcup_{1\leq n}\{\xi\geq a+1/n\}\right)$$ 
>
>注意到：
>
>$$\begin{aligned}
>&=\mathcal{P}\left(\xi\ge a+1\right)+\mathcal{P}\left(\bigcup_{n\ge2}\left\{a+1/(n-1)>\xi\ge a+1/n\right\}\right)\\
>&=\mathcal{P}(\xi\ge a+1)+\sum\limits_{n\ge2}^{}\mathcal{P}\left(\left\{a+\frac{1}{n}\leq \xi<a+\frac{1}{n-1}\right\}\right)\\
>&=\mathcal{P}(\xi\ge a+1)+\sum\limits_{n\ge2}^{}\left[F\left(a+\frac{1}{n-1}\right)-F\left(a+\frac{1}{n}\right)\right]\\
>&=\mathcal{P}(\xi\ge a+1)+\lim_{n\rightarrow \infty}[F(a+1)-F(a+1/n)\\
>&=1-\lim_{n\rightarrow \infty}F(a+1/n)=1-F(a+0)
\end{aligned}$$

自然有下面的结论：

>[!note] $\mathcal{P}(\xi>a)=1-F(a+0)$ ； $\mathcal{P}(\xi\geq a)=1-F(a)$ .

进而可以得到：

>[!note] 自然而然的结论.
>- $\mathcal{P}(\mathcal{a\leq \xi\leq b})=F(b+0)-F(a)$ ；
>- $\mathcal{P}(a<\xi\leq b)=F(b+0)-F(a+0)$ ；
>- $\mathcal{P}(a<\xi<b)=F(b)-F(a+0)$ ；
>- $\mathcal{P}(\xi=x_0)=F(x_0+0)-F(x_0)$ ；

>[!example] 如果分布函数定义： $F(x)=\mathcal{P}(\xi\leq x)$ ，则 $F(x)$ 满足 i) 非降；2) $F(-\infty)=0,F(+\infty)=0$ 3) 右连续.

>[!example]- 假设 $\xi$ 只能取值 $-1,0,1$ ，并且 $\mathcal{P}(\xi=-1)=p,\mathcal{P}(\xi=0)=q,\mathcal{P}(\xi=1)=r$ ，$p+q+r=1$ ，则 $F(x)$ ？
>$$F(x)=\left\{\begin{aligned}&p,x\leq -1\\&p+q,-1<x\leq 0\\&1,0<x\end{aligned}\right.$$

习惯上，对于一些分布函数 $F$ 会有一些特定的名称， e.g. 正态分布、伯努利分布，称对应的随机变量服从 XX 分布.

## 离散型随机变量

设 $\{x_n\}_{n\geq1}$ 为 $\xi$ 的所有可能取值，并记 $\mathcal{P}(\xi=x_i)=p(x_i),i\geq1$ ，称 $\{p(x_i):i\geq1\}$ 为随机变量 $\xi$ 的**分布列**，满足 $p(x_i)\geq0,\forall i\geq1,\sum\limits_{n\geq1}^{}p(x_n)=1$ .

分布列也可以表示为：

$$\xi\sim\begin{bmatrix}x_1 & x_2 & \cdots & x_n &\cdots \\ p_1 & p_2 & \cdots & p_n & \cdots\end{bmatrix}$$

分布函数可以和分布列相互表示： $F(x)=\mathcal{P}(\xi<x)=\sum\limits_{x_k<x}^{}p(x_k)$ ， $p(x_k)=\text{lastmin}\{F(x):x>x_k\}-\text{lastmax}\{F(x):x<x_k\}$ .

### 退化分布

**退化分布** / 单点分布，随机变量 $\alpha\equiv c$ ，此时 $F(x)=\left\{\begin{aligned}&0,x\leq c\\&1,x>c\end{aligned}\right.$  . #issue %%这能否推出 $\mathcal{F}=\{\emptyset,\Omega\}$ ?%%

### Bernoulli 分布

[Bernoulli 分布](#伯努利随机试验)：随机变量 $\beta$ 只取两个值 $k=0,1$ ；

### 二项分布（二）

[二项分布 / 两点分布](#二项分布)：随机变量 $\mu$ 可以取多个值 $k=0,1,\cdots,n,n<\infty$ ；一般用 $\mu\sim B(n,q)$ 表示随机变量 $\mu$ 的分布列为二项分布；

### 几何分布（二）

**几何分布**：用 $\eta$ 表示多次 Bernoulli 试验<u>首次成功</u>时进行的试验次数，随机变量 $\eta$ 可以取 $1,\cdots,n,\cdots$（和几何概率模型没有关系）则 $\mathcal{P}(\eta=k)\overset{def}{=}g(k;p)=q^{k-1}p,k\geq1$ ，几何分布具有**无记忆性**，即 $\forall m,k\geq1$ ， $\mathcal{P}(\eta=m+k \,|\,\eta>m)=\mathcal{P}(\eta=k)$ ，有： 

$$\frac{\mathcal{P}(\eta=m+k)}{\mathcal{P}(\eta>m)}=\frac{q^{m+k-1}p}{\sum\limits_{i=m+1}^{\infty}q^{i-1}p}=q^{k-1}p$$

反之，有如下结论：

>[!note]- 如果离散随机变量的取值为自然数，并且其概率分布具有无记忆性，则其一定为几何分布. 
>证明：若 $\mathcal{P}(\xi=m+k \,|\,\xi>m)=\mathcal{P}(\xi=k)=\frac{\mathcal{P}(\xi=m+k)}{\mathcal{P}(\xi>m)}$ . 则：
>
>$$\mathcal{P}(\xi=k)=\mathcal{P}(\xi=k-1)\mathcal{P}(\xi>1)=\mathcal{P}(\xi>1)^{k-1}\mathcal{P}(\xi=1)$$
>
>并且由 $\xi$ 只能取自然数可知 $\mathcal{P}(\xi>1)+\mathcal{P}(\xi=1)=1$ .
>
>另一种证明：记 $p=\mathcal{P}(\xi=k+1 \,|\,\xi>k)$ （由无记忆性） ，记 $q_k=\mathcal{P}(\xi=k)$ ， $p_k=\mathcal{P}(\xi>k)$ ，从而 $q_{k+1}=\mathcal{P}(\xi=k+1)=p_{k}-p_{k+1}$ ，从而有： $\frac{p_k-p_{k+1}}{p_k}=p$ ，所以 $\frac{p_{k+1}}{p_k}=1-p$ ，因此 $p_k=(1-p)^{k}p_0$ . 而 $p_0=1$ ，所以 $q_k=p_{k-1}-p_{k}=(1-p)^{k-1}-(1-p)^{k}=(1-p)^{k-1}p$ ，即为几何分布.

### 超几何分布

**超几何分布** #imcomplete-further-wanted 

设有 $N$ 件产品，其中有 $M$ 件次品，则从中无放回地抽取 $n$ 件产品，抽到 $k$ 件次品的概率为：

$$\mathcal{P}(\xi=k)=\frac{\binom{N-M}{n-k}\binom{M}{k}}{\binom{N}{n}}$$

如果是有放回的，则问题转化为 $n$ 重 Bernoulli 试验.

### Pascal 分布（二）

[[#Pascal 分布]]

### 泊松分布（二）

[check-wiki](https://zh.wikipedia.org/zh-cn/%E5%8D%9C%E7%93%A6%E6%9D%BE%E5%88%86%E5%B8%83)，[[#泊松过程]]

**泊松分布** $P(\xi=k)=\frac{\lambda^k}{k!}e^{-\lambda},\lambda>0$ ；记分布列为泊松分布的随机变量 $\xi\sim \mathcal{P}(\lambda)$ .

## 简单随机变量

**简单随机变量**的形式可以写作 $X(w)=\sum\limits_{i=1}^{n}a_iI_{A_i}(w)$ 其中 $I_{A_i},1\leq i\leq n$ 为指示函数， $A_i,1\leq i\leq n$ 则组成了 $\Omega$ 的一个不相交划分. #issue [Check](https://www.oreilly.com/library/view/probability-random-variables/9781118393956/OEBPS/c05-sec1-0004.htm#:~:text=A%20simple%20random%20variable%20is%20a%20generalization%20of,of%20%CE%A9%20are%20mapped%20to%20N%20values%20in.)

## 连续型随机变量

>[!summary]+ 自查表 
>- 什么是连续型随机变量？
>- 连续型变量的密度函数的定义？
>- 分布函数的定义？具有什么性质？

对于随机变量 $\xi$ ，设 $\xi$ 的**分布函数**为 $F(x)=\mathcal{P}(\xi<x)$ ，如果存在非负可积函数 $f(x)$ 使得： $F(x)=\int_{-\infty}^xf(u)du$ ，则称 $\xi$ 为**连续型随机变量**， $f$ 为 $\xi$ 的（分布）**密度函数**. 

$F$ 除了满足[分布函数的一般性质](#^DistributionFunctionProperty)以外还具有如下性质：

-  $f=F'$ ；
- $F$ 关于 $x$ 连续（而不仅是左连续）；

可以求出其他事件的概率：

- $\mathcal{P}(a\leq \xi<b)=\int_{a}^bf(x)dx,\forall a<b,a,b\in \mathbb{R}\cup\{\pm\infty\}$ ；
- $\mathcal{P}(\xi=x)=0$ ；（这并不代表 $\omega:\xi(w)=x\in \Omega$ 不会发生）
- $\mathcal{P}(\xi\geq a)=\int_a^\infty f(x)dx$ . 

>[!question]- 关于 $\mathcal{P}(\xi=x)=0$ ，其中 $\xi$ 是连续型随机变量. #imcomplete-further-wanted

由离散型随机变量的分布函数只满足左连续性可知离散型随机变量均非连续型随机变量（可以由反证得到此结论，即若存在连续型的离散随机变量，则可得 $\mathcal{P}(\xi=x_n)=0,\forall n\geq1$ ，从而矛盾！）.

并且，连续型随机变量的非负概率的取值一定是 $\mathbb{R}$ 中的一段区间.

### 均匀分布

**均匀分布**： $\xi$ 取值为 $[a,b]$ ，其密度函数为：

$$ f=\left\{\begin{aligned}
&\frac{1}{b-a},x\in[a,b]\\
&0,x\notin [a,b]
\end{aligned}\right.$$

记 $\xi\sim U([a,b])$ ， $\xi$ 服从 $[a,b]$ 上的均匀分布.

$\xi$ 的分布函数为： 

$$F(x)=\left\{\begin{aligned}
&0,x\leq a\\
&\frac{x-a}{b-a},a<x\leq b\\
&1,x>b
\end{aligned}\right.$$

因为 $F$ 是连续的所以取等位置任意，这里仍写作 $\leq$ 是习惯，和离散随机变量的分布函数保持一致. 另外也可以根据 $F$ 是否连续判断是否不是连续型随机变量的分布函数.

>[!example]- 随机变量 $\xi\in[0,1]$ ，并且 $\forall 0\leq x\leq y\leq 1,\mathcal{P}(x\leq \xi<y)$ 只与 $y-x$ 有关，证明 $\xi\sim U([0,1])$ .
>证明：设 $f(y)=\mathcal{P}(0\leq \xi<y)$ ，不难得到 $f(y_1+y_2)=f(y_1)+f(y_2)$ ，进而有 $f$ 连续，由数分可得 $f(y)=Cy,y\in[0,1]$ .
>
>$$f(1)=\mathcal{P}(0\leq \xi<1)=C$$
>
>并且 $\mathcal{P}(\xi=1)=0$ [[2425Su222553]] . 所以 $C=1$ .

### 正态分布

$$\int_{-\infty}^\infty e^{-\frac{x^2}{2}}dx=\sqrt{2 \pi}$$

随机变量 $\xi$ 的密度函数为： $f(x)=\frac{1}{\sqrt{2\pi \sigma}}e^{-\frac{(x-\mu)^2}{2\sigma^2}},x\in \mathbb{R}$ ，称 $\xi$ 服从参数为 $\mu,\sigma$ 的**正态分布**， $\xi\sim \mathcal{N}(\mu,\sigma^2)$ . 或称 $\xi$ 为正态变量. 

正态分布的分布函数：

$$F(x)=\int_{-\infty}^x \frac{1}{\sqrt{2\pi }\sigma}e^{-\frac{(y-\mu)^2}{2\sigma^2}}dy$$

一般记 $\mathcal{N}(0,1)$ 为**标准正态分布**，记 $\varphi(x)=\frac{1}{\sqrt{2\pi}}e^{-\frac{x^2}{2}}$ ， $\Phi(x)=\int_{-\infty}^x\frac{1}{\sqrt{2\pi}}e^{-\frac{y^2}{2}}dy$ . 不难得到  $\Phi(-x)=1-\Phi(x)$ ， $\Phi(0)=\frac{1}{2}$ 

关于 $\int_{-\infty}^\infty e^{-\frac{x^2}{2}}dx=\sqrt{2\pi}$ 等的证明，见 [[MA#无穷积分]] .

在实际应用中需要依据[标准正态分布函数表求解](https://www.math.arizona.edu/~rsims/ma464/standardnormaltable.pdf)以正态分布为假设的命题，一般纵轴对应于小数点后第一位，横轴第二位；对于一般的正态分布还可以将其转化为标准正态分布进行求解. #imcomplete-lack-examples 

>[!summary]+ 标准正态分布的几个数值：
>- $\int_{-0.67}^{0.67}f du=75\%$ ；
>- $\int_{-1.96}^{1.96}f du=95\%$ ；
>- $\int_{-2.58}^{2.58}f du=99\%$ ；

### 指数分布

随机变量 $\xi$ 的密度函数为：

$$f(x)=\left\{\begin{aligned}
&0,x\leq 0\\
&\lambda e^{-\lambda x},x>0
\end{aligned}\right.$$

则称 $\xi$ 服从参数为 $\lambda$ 的**指数分布**（尽管按指数函数的定义 $y=\lambda e^{-\lambda x}$ 不是指数函数），或者记为 $\xi\sim\text{Exp}(\lambda)$ .

$\xi$ 的分布函数为： 

$$F(x)=\left\{\begin{aligned}
&0,x\leq 0\\
&1-e^{-\lambda x},x>0
\end{aligned}\right.$$

**尾分布**： 

$$\mathcal{P}(\xi\geq x)\left\{\begin{aligned}
&1,x\leq 0\\
&e^{-\lambda x},x>0
\end{aligned}\right.$$

指数分布和[泊松分布]()有关系 #imcomplete-further-wanted   ，回顾[[#用二项分布逼近泊松分布]]，泊松分布 $p(k;\lambda)=\frac{\lambda^k}{k!}e^{-\lambda}$ 中的 $\lambda$ 的含义是试验次数足够大时发生某事件的次数（ $np_n(n\rightarrow \infty)$ ，即事件发生次数的期望）而指数分布中 $\lambda$ 的含义则为单位时间发生该事件的次数. [check-wiki](https://zh.wikipedia.org/zh-cn/%E6%8C%87%E6%95%B0%E5%88%86%E5%B8%83) 也可以用 $\beta=\frac{1}{\lambda}$ 表示指数分布，这时的 $\beta$ 也称为<u>发生率</u>.

指数分布和[[#几何分布（二）]]一样具有无记忆性质，前者的无记忆性刻画为 $\forall s>0,t>0$ ：

$$\mathcal{P}(\xi\geq s+t \,|\,\xi\geq t)=\mathcal{P}(\xi\geq s)$$

指数函数也是唯一的无记忆性的连续型随机变量：

>[!note]- 若连续型随机变量 $\xi$ 满足 $\mathcal{P}(\xi\geq s+t \,|\,\xi\geq t)=\mathcal{P}(\xi\geq s)$ ，则 $\xi$ 服从指数分布.
>证明：注意到 $\mathcal{P}(\xi\geq s+t)=\mathcal{P}(\xi\geq s)\mathcal{P}(\xi\geq t)$ ，记 $g(t)=\mathcal{P}(\xi\geq t)$ ，因为 $g$ 单调，所以由 [[MA#^CauchyExp]] 可得存在 $\alpha\geq0,g=\alpha^x$ ，并且 $g\in[0,1]$ 所以 $\alpha\in[0,1]$ ，所以 $F(x)=1-\alpha^{x}$ 令 $\alpha=e^{-\lambda}$ 即可得到结论.

指数分布可以有更一般的形式：

**Erlang 分布**： $\xi$ 的密度函数为：

$$f(x)=\left\{\begin{aligned}
&0,x\leq 0\\
&\frac{\lambda^n}{(n-1)!}x^{n-1}e^{-\lambda x},x>0
\end{aligned}\right.$$

当 $n=1$ 时即为指数分布. #imcomplete-further-wanted 

更一般的形式：

$\Gamma$ 分布： $\xi$ 的密度函数为：

$$f(x)=\left\{\begin{aligned}
&0,x\leq0\\
&\frac{\lambda^r}{\Gamma(r)}x^{r-1}e^{-\lambda x},x>0
\end{aligned}\right.$$

[[MA#Gamma 函数]]

其中 $\lambda,r>0$ ，称 $\xi$ 服从以 $\lambda,r$ 为参数的 $\Gamma$ 分布，记作 $\xi\sim G(\lambda,r)$ .

当 $r$ 为整数时即为 Erlang 分布；

### 随机变量的独立性

## 随机向量（多元随机变量）

>[!summary]+ 自查表 
>- 随机向量的定义；与随机变量定义的相似之处；
>- 联合分布函数的定义，性质；

设 $\xi_1,\cdots,\xi_n$ 均为定义在概率空间 $(\Omega,\mathcal{F},\mathcal{P})$ 上的随机变量，称 $\xi=(\xi_1,\cdots,\xi_n)$ 为**随机向量**.

注意到对于任意的 $x_1,\cdots,x_n\in \mathbb{R}$ ， $\{\xi_i<x_i: 1\leq i\leq n\}=\bigcap_{1\leq i\leq n}\{\xi_i<x_i\}\in \mathcal{F}$ ，因此下面这个函数是可定义的： 

定义随机向量 $\xi$ 的（联合）**分布函数**： $F(x_1,\cdots,x_n)=\mathcal{P}\{\xi_i(w)<x_i,1\leq i\leq n\}$ ，则 $F$ 具有以下性质：

1. 关于每一个变量单调递增；
2. 若存在 $x_i=-\infty$ ，则 $F(\cdots)=0$ ， $F(+\infty,\cdots,+\infty)=1$ ；
3. 关于每个变量左连续；

>[!question]- 满足上面三条性质的函数是否是联合密度函数？ #imcomplete-further-wanted

首先考虑简单情形，讨论二维随机变量： $F(x,y)=\mathcal{P}(\xi<x,\eta<y)=\mathcal{P}(\{\omega\in \Omega:\xi(\omega)<x,\eta(\omega)<y\})$ . 由定义可知 $F(x,y)\leq \min\{F(x),F(y)\}$ . 

由 $F(x,y)$ 的定义可以得到：

- $\mathcal{P}(\xi<x,\eta\geq y)=F(x,+\infty)-F(x,y)$  ；
- $\mathcal{P}(\xi>x,\eta\leq y)=F(+\infty,y+0)-F(x+0,y+0)$ ；
- $\mathcal{P}(\xi=x,\eta<y)=F(x+0,b)-F(x,y)$ ；

可以证明 $F$ 具有和 [[#^DistributionFunctionProperty]] 平行的性质：

1. $F$ 关于每个分量单调不减；
2. $F(-\infty,y)=F(x,-\infty)=F(-\infty,-\infty)=0$ ， $F(+\infty,+\infty)=1$ ；
3. $F$ 关于每个分量左连续；

此外还有第 4 条性质：

$$\begin{aligned}
&\mathcal{P}(\xi\in[a_1,b_1),\eta\in[a_2,b_2))\\
&=F(b_1,b_2)-F(a_1,b_2)-F(b_1,a_2)+F(a_1,a_2)\geq0
\end{aligned}$$

由该性质可以得到 1) . 性质 2,3,4 即可确定一个多元随机变量.

>[!example]- 由 1) 不能得出 4) / 满足 1,2,3 不能决定一个随机变量：设 $F(x,y)=\left\{\begin{aligned}&1,x+y>0\\&0,x+y\leq 0\end{aligned}\right.$ .
>$F$ 满足 1,2,3 显然，取 $F(1,1)-F(0,1)-F(1,0)+F(0,0)$ 即可.

>[!example]- 求 $\mathcal{P}(\xi\in(a_1,b_1),\eta\in [a_2,b_2])$ .
>
>$$\begin{aligned}
>&\mathcal{P}(\xi\in (a_1,b_1),\eta\in [a_2,b_2])=\mathcal{P}(\xi\in (a_1,b_1),\eta\leq b_2)-\mathcal{P}(\xi\in(a_1,b_1),\eta<a_2)\\
>&=\mathcal{P}(\xi<b_1,\eta\leq b_2)-\mathcal{P}(\xi\leq a_1,\eta\leq b_2)\\
>&\quad -\mathcal{P}(\xi<b_1,\eta<a_2)+\mathcal{P}(\xi\leq a_1,\eta<a_2)\\
>&=F(b_1,b_2+0)-\mathcal{P}(a_1+0,b_2+0)\\
>&\quad -F(b_1,a_2)+\mathcal{P}(a_1+0,a_2)
>\end{aligned}$$

- $F(a,+\infty)=F_\xi(a)$ ， $F(+\infty,b)=F_\eta(b)$ .

### 离散型随机向量

>[!summary]+ 自查表
>- 离散型随机向量举例；
>- 离散型随机向量的分布列定义；
>- 离散型随机向量的边际分布的定义；
>- 离散型随机变量的列联表？

由[[#离散型随机变量]]可以推广到离散型随机向量.

以二维离散型随机向量 $(\xi,\eta)$ 为例，令 $p_{ij}=\mathcal{P}(\xi=x_i,\eta=y_i)$ ， $(\xi,\eta)$ 的**分布列**为 $\{p_{ij}\}_{1\leq i\leq m,1\leq j\leq n}$ ，或可记作：

$$(\xi,\eta)\sim \begin{bmatrix}(x_1,y_1)& \cdots & (x_m,y_n) \\ p_{11} & \cdots & p_{mn}\end{bmatrix}$$

称 $\mathcal{P}(\xi=x_i)=\sum\limits_{j}^{}\mathcal{P}(\xi=x_i,\eta=y_j)\overset{def}{=}p_i$ ， $\mathcal{P}(\eta=y_j)=\sum\limits_{i}^{}\mathcal{P}(\xi=x_i,\eta=y_j)\overset{def}{=} q_j$ 为 $(\xi,\eta)$ 的**边际分布**. 

>[!warning] 对于 $n$ 维随机向量，其从 $1$ 到 $n-1$ 维的累加（保持其他维度不变）都称为边际分布.

>[!example]- 离散型随机变量的边际分布不足以刻画联合分布. #imcomplete-lack-examples 

在之前介绍过推广的 Bernoulli 随机试验，或可视为二项分布推广为多项分布：

$$\mathcal{P}(\xi_1=k_1,\cdots,\xi_r=k_r)=\binom{n}{k_1\cdots k_r}p_1^{k_1}\cdots p_r^{k_r}$$

其中 $p_i=\mathcal{P}(A_i)$ .

推广的超几何分布：袋中装有 $1,\cdots,m$ 号球， $i$ 号球有 $N_i$ 个， $\sum\limits_{i=1}^{m}N_i=N$ ，从袋中摸取 $n$ 个球，记 $\xi_i:$ 摸到 $i$ 号球的个数.

$$\mathcal{P}(\xi_1=n_1,\cdots,\xi_m=n_m)=\frac{\binom{N_1}{n_1}\cdots \binom{N_m}{n_m}}{\binom{N}{n}}$$

（古典概型）

### 连续型随机向量

>[!summary]+ 自查表
>- 连续型随机向量的定义；
>- 连续型随机向量的边际分布函数、边际（分布）密度函数的定义；

称随机向量 $(\xi_1,\cdots,\xi_n)$ 是连续型随机向量，如果存在非负可积函数 $p(\mu_1,\cdots,\mu_n)$ ，使得其**联合分布函数**（分布密度函数）：

$$F(x_1,\cdots,x_n)=\int_{-\infty}^{x_1}\cdots\int_{-\infty}^{x_n}p(\mu_1,\cdots,\mu_n)d \mu_1\cdots d\mu_n$$

并且： $p=\frac{\partial^n{F}}{\partial{x_1}\cdots\partial{x_n}}$ .

显然，若 $(\xi,\eta)$ 是二维连续随机向量， $\xi,\eta$ 也是连续随机变量. #issue %%反过来是否一定成立？%%

仍然考虑二维连续随机向量 $(\xi,\eta)$ ，称：

$$\begin{aligned}
&\mathcal{P}\{\xi<x\}=\int_{-\infty}^x\int_{-\infty}^\infty p(u,v)dv du\overset{def}{=}\int_{-\infty}^xp_\xi(u)du\\
&\mathcal{P}\{\eta<y\}=\int_{-\infty}^y\int_{-\infty}^\infty p(u,v)du dv\overset{def}{=}\int_{-\infty}^yp_\eta(v)dv\\
\end{aligned}$$

称 $\mathcal{P}\{\xi<x\}\overset{def}{=}F_1(x),\mathcal{P}\{\eta<y\}\overset{def}{=}F_2(y)$ 为 $(\xi,\eta)$ 的**边际分布函数**， $p_\xi,p_\eta$ 称为 $(\xi,\eta)$ 的**边际分布密度函数**.

在[[#连续型随机变量]]中定义的随机变量可以推广：

**二元均匀分布**：

$$p(x,y)=\left\{\begin{aligned}
&\frac{1}{(b_1-a_1)(b_2-a_2)},(x,y)\in[a_1,b_1]\times[a_2,b_2]\\
&0
\end{aligned}\right.$$

>[!example]- 联合分布密度函数是均匀的其边际分布函数不一定均匀.
>考虑单位圆上的均匀分布：
>
>$$p(x,y)=\left\{\begin{aligned}
>&\frac{1}{\pi},x^2+y^2\leq 1\\
>&0,\text{otherwise}
>\end{aligned}\right.$$

>[!example]- 设 $(\xi,\eta)$ 的联合分布为 $p(x,y)=\frac{1}{\Gamma(k_1)\Gamma(k_2)}x^{k_1-1}(y-x)^{k_2-1}e^{-y}$ ，求 $p_\xi,p_\eta$ .
>解：（注意定义域）本题用到一些数分中的定义和结论：
>
>$$\begin{aligned}
>\Gamma(s)&=\int_{0}^{\infty}t^{s-1}e^{-t}dt\\
>B(p,q)&=\int_0^1t^{p-1}(1-t)^{q-1}e^{-t}dt\\
>B(p,q)&=\frac{\Gamma(p)\Gamma(q)}{\Gamma(p+q)}
>\end{aligned}$$
>
>$$\begin{aligned}
>p_\xi(x)&=\int_x^{\infty}\frac{1}{\Gamma(k_1)\Gamma(k_2)}x^{k_1-1}(y-x)^{k_2-1}e^{-(y-x)}e^{-x}dy\\
>&=\int_0^{\infty}\frac{1}{\Gamma(k_1)\Gamma(k_2)}x^{k_1-1}t^{k_2-1}e^{-t}e^{-x}dy\\
>&=\frac{1}{\Gamma(k_1)}x^{k_1-1}e^{-x}\\\\
>p_\eta(x)&=\int_0^1\frac{1}{\Gamma(k_1)\Gamma(k_2)}t^{k_1-1}(1-t)^{k_2-1}e^{-y}y^{k_1+k_2-1}dt\\
>&=\frac{B(k_1,k_2)}{\Gamma(k_1)\Gamma(k_2)}y^{k_1+k_2-1}e^{-y}
>\end{aligned}$$

#### 多元正态分布

>[!summary] 查表
>- 二元正态分布的联合分布密度函数，分解式；
>- 多元正态分布的联合分布密度函数；

**二元正态分布**：

$$p(x,y)=\frac{1}{2\pi \sigma_1\sigma_2\sqrt{1-r^2}}\exp\left\{-\frac{1}{2(1-r^2)}\left[\frac{(x-\mu_1)^2}{\sigma_1^2}-2r\frac{(x-\mu_1)(y-\mu_2)}{\sigma_1\sigma_2}+\frac{(y-\mu_2)^2}{\sigma_2^2}\right]\right\}$$

记作 $(\xi,\eta)\sim \mathcal{N}(\mu_1,\mu_2,\sigma_1^2,\sigma_2^2,r)$ .

由上可以得到正态分布密度函数的分解式：

$$\begin{aligned}
&p(x,y)=\frac{1}{\sqrt{2\pi}\sigma_1}e^{-\frac{(x-\mu_1)^2}{2\sigma_1^2}}\cdot \frac{1}{\sqrt{2\pi}\sigma_2\sqrt{1-r^2}}\exp \left\{-\frac{(y-\mu_2-\frac{\sigma_2}{\sigma_1}r(x-\mu_1))^2}{2\sigma_2^2(1-r^2)}\right\}\\
&p(x,y)=\frac{1}{\sqrt{2\pi}\sigma_2}e^{-\frac{(y-\mu_2)^2}{2\sigma_2^2}}\cdot \frac{1}{\sqrt{2\pi}\sigma_1\sqrt{1-r^2}}\exp \left\{-\frac{(x-\mu_1-\frac{\sigma_1}{\sigma_2}r(y-\mu_2))^2}{2\sigma_1^2(1-r^2)}\right\}\\
\end{aligned}$$

>[!note]- 二维正态分布的边际分布函数是正态分布的分布函数： $F_1(x)=\int_{-\infty}^x\frac{1}{\sqrt{2\pi}\sigma_1}e^{-\frac{(u-\mu_1)^2}{\sigma_1^2}}du$ ， $F_2(y)=\int_{-\infty}^y\frac{1}{\sqrt{2\pi}\sigma_2}e^{-\frac{(v-\mu_2)^2}{\sigma_2}^2}dv$
>证明：利用上面的分解式证明第二个乘积项在 $(-\infty,\infty)$ 上积分为 $1$ 即可，对指数中项进行换元即可（同时还利用 $\int_{-\infty}^\infty e^{-\frac{x^2}{2}}dx=1$） .

>[!warning]- 两个正态分布的随机变量作为一个二维随机变量，不一定是二维正态分布. 一般地，对随机变量都是这种情况：从局部（单个变量的分布函数）不能推出整体（组成随机向量的联合函数），但整体可以得到局部.
>假设 $\xi,\eta$ ， $F_\xi(x)=\int_{-\infty}^x\frac{1}{\sqrt{2\pi}\sigma_1}e^{-\frac{(u-\mu_1)^2}{\sigma_1^2}}du$ ， $F_\eta(y)=\int_{-\infty}^y\frac{1}{\sqrt{2\pi}\sigma_2}e^{-\frac{(v-\mu_2)^2}{\sigma_2}^2}dv$ ，则由求和公式：
>
>$$\begin{aligned}
>F(x,y)&=\mathcal{P}\{\xi<x,\eta<y\}\\
>&=\mathcal{P}(\{\xi<x\}\cap \{\eta<y\}) \\
>&=\mathcal{P}(-\{\xi<x\}\cup \{\eta<y\}+\{\xi<x\}+\{\eta<y\})\\
>&=- \mathcal{P}(\{\xi<x\}\cup \{\eta<y\})+\mathcal{P}(\xi<x)+\mathcal{P}(\eta<y)
>\end{aligned}$$
>
>无法处理 $\mathcal{P}(\{\xi<x\}\cup \{\eta<y\})$ . 如果用乘法公式：
>
>$$\begin{aligned}
>F(x,y)&=\mathcal{P}(\xi<x \,|\,\eta<y)\mathcal{P}(\eta<y)
>\end{aligned}$$
> 
>$\xi$ 和 $\eta$ 若相关，同样无法得到 $F$ .
>
>多个随机变量对应的分布函数族是什么样的？ #imcomplete-further-wanted 

二元正态分布的[[#协方差]]矩阵为：

$$\begin{bmatrix}\sigma_1^2 & \rho\sigma_1\sigma_2 \\ \rho\sigma_1\sigma_2 & \sigma_2^2\end{bmatrix}$$

对于一对随机变量而言，不相关 $\not\Rightarrow$ 不独立，然而二元正态分布有该性质：

>[!note] 对于 $(\xi_1,\xi_2)\sim \mathcal{N}(\mu_1,\mu_2,\sigma_1^2,\sigma_2^2,\rho)$ ， $\xi_1,\xi_2$ 不相关（ $\rho=0$ ） $\Leftrightarrow$ $\xi_1,\xi_2$ 独立.

**多元正态分布**：设 $\Sigma=(\sigma_{ij})_{n\times n}$ 为正定对称矩阵， $\mu=(\mu_1,\cdots,\mu_n)$ . 若随机向量 $\xi=(\xi_1,\cdots,\xi_n)$ 的联合分布密度函数：

$$p(x_1,\cdots,x_n)=\frac{1}{(2\pi)^{\frac{n}{2}}(\det \Sigma)^{\frac{1}{2}}}\exp \left\{-\frac{1}{2}(x-\mu)^T \Sigma^{-1}(x-\mu)\right\}$$

>[!warning] $\Sigma^{-1}$

>[!note] $n$ 元正态分布 $\mathcal{N}(\mu,\Sigma)$ 的特征函数为 $f(t)=\exp\left\{i\mu^Tt-\frac{1}{n}t^T\Sigma t\right\}$ .

证明：

$$\begin{aligned}
f(t)&=\int_{\mathbb{R}^n}e^{it^Tx}p(x)dx\\
&=\frac{1}{(2\pi)^{n/2}(\det\Sigma)^{1/2}}\int_{\mathbb{R}^n} e^{it^Tx}\exp\left\{-\frac{1}{2}(x-\mu)^T\Sigma^{-1}(x-\mu)\right\}
\end{aligned}$$

[[2425Su215531]]

借助特征函数可以证明正态分布的线性组合具有如下非常强的性质：

>[!note] $\xi=(\xi_1,\cdots,\xi_n)$ 服从 $\mathcal{N}(\mu,\Sigma)$ 的充要条件为任意 $\zeta=\sum\limits_{j=1}^{n}l_j\xi_j$ 服从 $\mathcal{N}(\sum\limits_{j=1}^{n}l_j\mu_j,\sum\limits_{j,k=1}^{n}l_jl_k\sigma_{jk})$ (或简写为 $l^T\mu,l^T\Sigma l$ ) .

以上说的是线性组合，最后得到的一个随机变量仍然服从正态分布，下面这一定理说明了多元正态分布的线性变换仍然为多元正态分布.

>[!note] 设 $\xi=(\xi_1,\cdots,\xi_n)\sim \mathcal{N}(\mu,\Sigma)$ ，设 $C\in \mathbb{R}^{m\rightarrow n}$ ，则 $\eta=C\xi$ 服从 $\mathcal{N}(C\mu,C\Sigma C^T)$ .

>[!example]- 设 $(\xi,\eta)\sim \mathcal{N}(\mu_1,\mu_2,\sigma_1^2,\sigma_2^2,\rho)$ ，取 $U=a\xi+b\eta,V=c\xi+d\eta$ . 则 $(U,V)$ 的分布为？在何种情况下 $(U,V)$ 退化为一维分布；什么情况下 $(U,V)$ 独立.
>计算：
>
>$$\begin{aligned}
>&EU=a\mu_1+b\mu_2\\
>&EV=c\mu_1+d\mu_2\\
>&DU=\begin{bmatrix}a &b\end{bmatrix}\begin{bmatrix}\sigma_1^2 & \rho\sigma_1\sigma_2 \\ \rho\sigma_1\sigma_2 & \sigma_2^2\end{bmatrix} \begin{bmatrix}a \\ b\end{bmatrix}\\
>&\qquad = a^2\sigma_1^2+b^2\sigma^2_2+2\rho ab\sigma_1\sigma_2\\
>&DV = c^2\sigma_1^2+d^2\sigma_2^2+2\rho cd\sigma_1\sigma_2\\
>&\text{Cov}(U,V)=EUV-EUEV\\
>&\qquad\qquad\ \ = ac\sigma_1^2+bd\sigma_2^2+\rho(ad+bc)\sigma_1\sigma_2
>\end{aligned}$$
>
>因为线性变换保持正态分布，所以 $(U,V)$ 的分布即为：
>
>$$\mathcal{N}(EU,EV,DU,DV,\frac{\text{Cov}(U,V)}{DUDV})$$
>
>当协方差矩阵奇异时 $(U,V)$ 退化为一维正态分布. 即为：
>
>$$\left |  \begin{matrix}DU & \text{Cov}(U,V) \\ \text{Cov}(U,V) & DV\end{matrix}\right |=(ad-bc)\sigma_1^2\sigma_2^2(1-\rho^2)$$
>
>则 $\rho=\pm 1$ 或者 $ad=bc$ .
>
>正态分布独立等同于不相关，因此 $\text{Cov}=0$ （注意区分原先的 $\rho$ ）时独立.

## 随机向量的函数

>[!note]- 函数作用在离散型随机变量上得到的都是离散型随机变量. #issue 
> $f(\xi)$ 的值域是离散的，这并没有问题，但是是否符合随机变量的定义. 

>[!warning]+ （连续）函数作用在连续型随机变量上不一定仍然为连续型随机变量.
>考虑 $f(x)\equiv 1$ . 对于 $\eta=f\circ \xi$ ， $\mathcal{P}(\eta<x)=0(x<=1),\mathcal{P}(\eta<x)=1(x>1)$ ，显然 $F(x)=\mathcal{P}(\eta<x)$ 不连续，由分布函数的性质可知 $\eta$ 不是连续型随机变量.

>[!example]- 设随机变量 $\xi$ 的密度函数为 $p(x)$ ，对 $\eta=a \xi+b(a\neq 0)$ ，求其密度函数.
>$$\begin{aligned}
>F_\eta(y)&=\mathcal{P}(\eta=a \xi+b<y)\\
>&=\mathcal{P}\left(\xi<\frac{y-b}{a}\right)\\
>&=\left\{\begin{aligned}
>&F_\xi\left(\frac{y-b}{a}\right)=\int_{-\infty}^{\frac{y-b}{a}}p(u)du,a>0\\
>&1-F_\xi\left(\frac{y-b}{a}\right)=1-\int_{-\infty}^{\frac{y-b}{a}}p(u)du,a<0
>\end{aligned}\right.\\
>&=\int_{au+b<y}p(u)du
>\end{aligned}$$
>
>根据 [[MA#含参变量积分求导]] $\varphi'(t)=\int_{\alpha(t)}^{\beta(t)}f_t'(x,t)dx+f(\beta(t),t)\beta'(t)-f(\alpha(t),t)\alpha'(t)$ ，可得：
>
>$$F_\eta'(y)=\left\lvert \frac{1}{a}\right\rvert p \left(\frac{y-b}{a}\right)$$
>
>即为 $\eta$ 的密度函数.

>[!example]- 设 $\xi,p(x)$ ，对 $\eta=\sin \xi$ ，求其分布函数.
>当 $y>1$ 时 $F_\eta(y)=\mathcal{P}(\sin \xi<y)=1$ ，当 $y<=-1$ 时 $F_\eta(y)=0$ ，下面讨论 $y\in(-1,1]$ ：
>
>$$\begin{aligned}
>F_\eta(y)&=\mathcal{P}(\sin \xi<y)\\
>&=\mathcal{P}\left(\{\sin \xi<y\}\cap \bigcup_{n\in \mathbb{Z}}\left[2n \pi-\frac{3\pi}{2},2n \pi+\frac{\pi}{2}\right)\right)\\
>&=\sum\limits_{n\in \mathbb{Z}}^{}\mathcal{P}(\{\sin \xi<y\}\cap [2n \pi-3\pi/2,2n \pi+\pi/2))\\
>&=\sum\limits_{n\in \mathbb{Z}}^{}\mathcal{P}(\{2n\pi-(\pi+\arcsin y)<\xi<2n\pi\arcsin y\})\\
>&=\sum\limits_{n\in \mathbb{Z}}^{}\int_{2n \pi-(\pi+\arcsin y)}^{2n \pi\arcsin y}p(u)du\\
>&=\int_{\sin u<y}p(u)du
>\end{aligned}$$

>[!example]- 设 $\theta\sim U \left([-\frac{\pi}{2},\frac{\pi}{2}]\right)$ ，求 $\eta=\tan \theta$ 的密度函数.
>$$\begin{aligned}
>F_\eta(y)&=\mathcal{P}(\tan \theta<y)\\
>&=\mathcal{P}\{\theta<\arctan y\}\\
>&=\int_{-\frac{\pi}{2}}^{\arctan y}p(u)du\\
>&=\int_{-\frac{\pi}{2}}^{\arctan y}\frac{1}{\pi}du\\
>&=\frac{1}{2}+\frac{\arctan y}{\pi}
>\end{aligned}$$
>
>从而可得： $f(y)=F_\eta(y)'=\frac{1}{\pi(1+y^2)}$ ，此即 Cauchy 分布. #imcomplete-further-wanted 

一般的，有以下结论：

>[!note]- 设连续型随机变量 $\xi$ ，其密度函数为 $p(x)$ ，对随机变量 $\eta=f\circ \xi$ ，其分布函数 $F_\eta(y)=\int_{f(u)<y}p(u)du$ .

>[!example]- 设 $X\sim U([1,2])$ ， $Y=e^X$ ，求 $F_Y,p_Y$ .
>解：对于 $F_Y(y)=\mathcal{P}(e^X<y)$ ， $F_Y(y)=0,y\leq e$ ， $F_Y(y)=1,y>e^2$ ，下面考虑 $y\in(e,e^2]$ ：
>
>$$\begin{aligned}
>F_Y(y)&=\mathcal{P}(e^X<y)=\mathcal{P}(X<\ln y)\\
>&=\int_{1}^{\ln y}du=\ln y-1
>\end{aligned}$$
>
>所以 
>
>$$\begin{aligned}
>p_Y=\left\{\begin{aligned}
>&\frac{1}{y},e<y\leq e^2,\\
>&=0,\text{else}
>\end{aligned}\right.
>\end{aligned}$$
>
>或由上定理： $F_Y(y)=\int_{e^u<y}p(u)du$ .

>[!note]- 设连续型随机变量 $\xi$ ， $f$ 为严格单调函数，其反函数 $f^{-1}(y)$ 一阶连续可导，则 $\eta=f(\xi)$ 是连续型随机变量，其密度函数为 $p(f^{-1}(y))\cdot\lvert f^{-1}(y)'\rvert$
>证明： $F_\eta(y)=\int_{f(u)<y}p(u)du=\int_{u<f^{-1}(y)}p(u)du$ ，进而由 [[MA#含参变量积分求导]]可得结论.

>[!note]- 设连续型随机变量 $\xi$ ，若 $f$ 在不相交的区间 $I_1,\cdots$ 上逐个严格单调，并且 $f^{-1}$ 在 $I_1,\cdots$ 上逐段一阶连续可导，则 $\eta=f(\xi)$ 为连续型随机变量，其密度函数为： $p(f^{-1}|_{I_1}(y))f^{-1}_{I_1}(y)'+p(f^{-1}|_{I_2}(y))f^{-1}_{I_2}(y)'+\cdots$ #imcomplete-lack-proofs 

>[!example]- 设 $\xi\sim \mathcal{N}(0,1)$ ， $\eta=\xi^2$ ，求 $\eta$ 的密度函数.
>证明：
>
>$$\begin{aligned}
>F_\eta(y)&=\mathcal{P}(\xi^2<y)=\mathcal{P}(-\sqrt{y}<\xi<\sqrt{y})\\
>&=\int_{-\sqrt{y}}^{\sqrt{y}}\frac{1}{\sqrt{2\pi}}\exp\left(-\frac{x^2}{2}\right)dx\\
>&=\frac{\sqrt{2}}{\sqrt{\pi}}\int_0^{\sqrt{y}}\exp(-x^2/2)dx\\
>\end{aligned}$$
>
>含参变量积分求导得到： $p(y)=\frac{\sqrt{2}}{\sqrt{\pi}}\frac{1}{2}y^{-\frac{1}{2}}\exp(-y/2)=\frac{1}{\sqrt{2\pi}}y^{-\frac{1}{2}}e^{-\frac{y}{2}}$ .

自由度为 $n$ 的 $\chi^2$ 分布（卡方分布）的密度函数为 $p(x)=\frac{1}{2^{n/2}\Gamma(n/2)}x^{\frac{n}{2}-1}e^{-\frac{x}{2}},x>0$ 

### 随机向量的变换

设 $(\xi_1,\cdots,\xi_n)$ 的密度函数为 $p(x_1,\cdots,x_n)$ ，求 $\eta_i=g_i(\xi_1,\cdots,\xi_n),1\leq i\leq n$ 的联合分布.

设对于 $y_i=g_i(x_1,\cdots,x_n),1\leq i\leq n$ ，其有唯一的反函数： $x_i=x_i(y_1,\cdots,y_n),1\leq i\leq n$ ；

有：

$$q(y_1,\cdots,y_n)=\left\{\begin{aligned}
&p(x_1(y_1,\cdots,y_n),\cdots,x_n(y_1,\cdots,y_n))\lvert J\rvert\\
&0;
\end{aligned}\right.$$


>[!example] 如果 $\xi,\eta$ 独立，并且服从 $\mathcal{N}(0,1)$ ，求 $U=\xi^2+\eta^2$ 和 $V=\frac{\xi}{\eta}$ 的密度函数，并说明两个随机变量是独立的.

$$J^{-1}=\frac{\partial{(u,v)}}{\partial{(x,y)}}=\left |  \begin{matrix}2 x & 2 y \\ \frac{1}{y} & -\frac{x}{y^2}\end{matrix}\right |=-\frac{2x^2}{y^2}-2$$

从而： $\lvert J\rvert=\frac{1}{2(1+v^2)}$ .

所以：

$$p_{u,v}=p(x,y)\lvert J\rvert=\frac{1}{2 \pi}e^{-\frac{x^2+y^2}{2}}\frac{1}{2(1+v^2)}+\frac{1}{2 \pi}e^{-\frac{x^2+y^2}{2}}\frac{1}{2(1+v^2)}=\frac{1}{2}e^{-\frac{u}{2}}\frac{1}{\pi(1+v^2)}$$

>[!note] 设 $\xi,\eta$ 是相互独立且同分布的随机变量，其密度函数不为 $0$ 并且有二阶导数，证明如果 $\xi+\eta$ 和 $\xi-\eta$ 相互独立，则随机变量 $\xi,\eta,\xi+\eta,\xi-\eta$ 均服从正态分布.

令 $U=\xi+\eta,V=\xi-\eta$ ，从而 $\xi=\frac{U+V}{2},\eta=\frac{U-V}{2}$ ，则 $\lvert J\rvert=\left \Vert  \begin{matrix}\frac{1}{2} & \frac{1}{2} \\ \frac{1}{2} & -\frac{1}{2}\end{matrix}\right \Vert=\frac{1}{2}$ .

$p(\xi+\eta,\xi-\eta)=p(\xi+\eta)p(\xi-\eta)=p(\xi)p(\eta)\frac{1}{2}$ .

$p_U(u)p_V(u)=p\left(\frac{u+v}{2}\right)p\left(\frac{u-v}{2}\right)\frac{1}{2}$

取对数，关于 $u$ 求偏导：

取对数得到：

>[!example] 设随机变量 $\xi,\eta$ 相互独立， $\xi\sim B(n,p),\eta\sim U([0,1])$ ，求 $\xi+\eta$ 的分布函数和密度函数.


## 随机变量存在性

在 [[#随机变量]]中提到随机变量对应的分布函数的三个性质（单调不减，标准，左连续），下面证明满足这三个性质 / 特征的函数（称为分布函数）可以定义一个随机变量.

设随机变量 $\xi$ 的分布函数为 $F$ ， $F$ 单调不减，对于任意的 $y\in[0,1]$ ，定义：

$$F^{-1}(y)=\inf\{x:F(x)>y\}$$

为 $F(x)$ 的反函数.

对于任一随机变量 $\xi$ ，考虑 $\theta=F(\xi)$ . 如果 $F$ 是连续函数，则有：

$$\begin{aligned}
\mathcal{P}(\theta<x)&=\mathcal{P}(F(\xi)<x)\\
&\overset{(1)}{=}\mathcal{P}(\xi<F^{-1}(x))\\
&=F(F^{-1}(x))\\
&\overset{(2)}{=}x
\end{aligned}$$

以上， $(1)$ 式成立的原因：对于任意的 $y\in\{\xi<F^{-1}(x)\}$ ， $y<\inf\{x:F(x)>y\}$ ，如果 $F(y)>=x$ ，则 #imcomplete 

对于 $(2)$ 式，可以证明只满足左连续的函数 $F$ 不满足条件. 例如考虑下图： #imcomlete-lack-figure

$F(F^{-1}(y_3))=F(x_3)=y_2\neq y_3$ .

而当函数连续时可以保证该式成立. #imcomplete 

>[!note]- 设 $\theta\sim U([0,1])$ ，则对于任意的分布函数 $F(x)$ ，令 $\xi=F^{-1}(\theta)$ ，则 $\xi$ 是服从 $F(x)$ 的随机变量.

证明：

$$\begin{aligned}
\mathcal{P}(\xi<x)&=\mathcal{P}(F^{-1}(\theta)<x)\\
&\overset{(1)}{=}\mathcal{P}(\theta<F(x))\\
&=F(x)
\end{aligned}$$

其中 $(1)$ 式， $\{F^{-1}(\theta)<x\}$ 不一定等于 $\{\theta<F(x)\}$ ，注意 $F$ 只满足左连续性，

>[!note]- 设 $F(x)$ 为左连续的单调不减函数， $F(-\infty)=0,F(\infty)=1$ ，则存在概率空间 $(\Omega,\mathcal{F},\mathcal{P})$ ，以及随机变量 $\xi$ ， $\xi$ 的分布函数为 $F(x)$ .

证明：取 $\Omega=[0,1]$ ， $\mathcal{F}$ 为 $\text{Borel}-\sigma$ 集， $\mathcal{P}$ 为 Lebeague 测度. 令 $\theta(w)=w$ ，则 $\theta(w)$ 服从 $[0,1]$ 上的均匀分布.

进而定义 $\xi=F^{-1}(\theta)$ ， $F^{-1}$ 单调因而是 Borel 函数，从而 $\xi$ 是随机变量，并且同上证明可知 $\xi$ 的分布函数为 $F(x)$ .

# 特征函数与数学期望

本章的几乎所有问题，都是求数学期望. 这方面需要用到数学分析中的级数和广义积分计算.

## 数学期望

对于离散型随机变量 $\xi$ ，如果 $\sum\limits_{n=-\infty}^{\infty}\mathcal{P}(\xi=n)n$ 收敛，则定义随机变量 $\xi$ 的期望为 $E\xi$ .

>[!example] 随机变量 $\mu$ 取非负整数值 $n\geq0$ 的概率为 $p_n=A\frac{B^n}{n!!}$ ，已知 $E\mu =a$ 求 $A,B$ .

$$E\mu =\sum\limits_{n\geq0}^{}np_n=\sum\limits_{n\geq1}^{}A\frac{B^n}{(n-1)!}=AB\sum\limits_{n\geq0}^{}\frac{B^n}{n!}=ABe^B=a$$

并且由规范化：

$$\sum\limits_{n\geq0}^{}p_n=Ae^B=1$$

从而可得 $B=a,A=e^{-a}$ .

>[!example]- 一袋中含有 $a$ 只白球， $b$ 只黑球，从中取出 $c$ 只（ $c\leq a+b$ ），求摸出白球 $\mu$ 的期望.
>$\mu$ 可取 $1,\cdots,a$ ； $\mathcal{P}(\mu=n)=\frac{C_a^{n}C_b^{c-a}}{C_{a+b}^c}$ ，从而：
>
>$$\begin{aligned}
>E \mu &=\sum\limits_{1\leq n\leq a}^{}\mathcal{P}_\mu(\mu=n)n\\
>&=\sum\limits_{1\leq n\leq a}^{}\frac{\binom{a}{n}\binom{b}{c-n}}{\binom{a+b}{c}}n\\
>&=\ ?
>\end{aligned}$$
>
>| #issue %%上述这个组合恒等式不会求；%%
>
>记 $\xi_i$ 为第 $i$ 次摸到白球的期望，则：
>
>$$E \xi_i=\mathcal{P}(\xi_i=1)=\frac{a}{a+b}$$
>
>[抽签问题](#^PolyaUrn)（首步分析法）
>
>从而由随机变量的可加性的：
>
>$$E\xi=\sum\limits_{1\leq i\leq c}^{}E \xi_i=\frac{ac}{a+b}$$

>[!example]- 证明：若取非负整数值的随机变量 $\xi$ 的数学期望存在，则 $E \xi=\sum\limits_{k=1}^{\infty}\mathcal{P}(\xi\geq k)$ .
>$$\begin{aligned}
>E\xi &=\sum\limits_{k=1}^{\infty}\mathcal{P}(\xi=k)k\\
>&=\mathcal{P}(\xi\geq1)+\sum\limits_{k=2}^{\infty}\mathcal{P}(\xi\geq 2)(k-1)\\
>&=\mathcal{P}(\xi\geq1)+\mathcal{P}(\xi\geq2)+\sum\limits_{k=3}^{\infty}\mathcal{P}(\xi\geq3)(k-2)\\
>&=\cdots\\
>&=\sum\limits_{k=1}^{\infty}\mathcal{P}(\xi\geq k)
>\end{aligned}$$
>
>以上，或写作：
>
>$$E \xi=\sum\limits_{k=1}^{\infty}\mathcal{P}(\xi=k)k=\sum\limits_{k=1}^{\infty}\sum\limits_{j=k}^{\infty}\mathcal{P}(\xi=j)$$
>
>注：实际上就是按列求和：
>
>$$\begin{aligned}
>&\mathcal{P}(\xi=1)\\
>&\mathcal{P}(\xi=2)+\mathcal{P}(\xi=2)\\
>&\mathcal{P}(\xi=3)+\mathcal{P}(\xi=3)+\mathcal{P}(\xi=3)\\
>&\cdots
>\end{aligned}$$

>[!example]- 设取非负整数值的随机变量 $\xi$ ，有 $\mathcal{P}(\xi=k)=\frac{a^k}{(1+a)^{k+1}},a>0$ ，计算 $E\xi,D\xi$ .
>这个例子主要是利用到了求导和求和在一致收敛条件下可以换序.
>
>$$\begin{aligned}
>E\xi &=\sum\limits_{k=0}^{\infty}k\frac{a^k}{(1+a)^{k+1}}\\
>&=\frac{a}{(1+a)^2}\sum\limits_{k=0}^{\infty}f_k\left(\frac{a}{1+a}\right)
>\end{aligned}$$
>
>其中 $f_k(x)=k\cdot x^{k-1}$ 则：
>
>$$\sum\limits_{k=0}^{\infty}f_k(x)=\left(\sum\limits_{k=0}^{\infty}x^{k}\right)'=\frac{1}{(1-x)^2}$$
>
>
>从而可得 $E\xi=a$ （此处 $\left\lvert \frac{a}{1+a}\right\rvert<1$ 因此一致收敛）.
>
>对于 $D\xi$ ，计算：
>
>$$\begin{aligned}
>E\xi^2&=\frac{a}{(1+a)^2}\sum\limits_{k=0}^{\infty}k(k+1)\left(\frac{a}{1+a}\right)^{k-1}-\sum\limits_{k=0}^{\infty}k\frac{a^k}{(1+a)^{k+1}}
>\end{aligned}$$
>
>同上方法，从略，最后得到 $D\xi=a^2+a$ .

>[!example]- 证明 $E\xi=\int_0^\infty[1-F(x)]dx-\int_{-\infty}^0F(x)dx$ .
>证明：事实上注意到：
>
>$$\begin{aligned}
>E\xi &=\int_0^\infty -xd[1-F(x)]+\int_{-\infty}^0xdF(x)\\
>&=-x[1-F(x)]\bigg|_{0}^{\infty}+\int_0^\infty[1-F(x)]dx\\
>&+xF(x)\bigg|_{-\infty}^0-\int_{-\infty}^0F(x)dx
>\end{aligned}$$
>
>因此接下来关心的问题是：
>
>$$\lim_{A\rightarrow \infty}A[1-F(A)],\quad \lim_{A\rightarrow \infty}AF(A)$$
>
>分别利用：
>
>$$0\leftarrow \int_{A}^\infty \lvert x\rvert dF(x)\ge A[1-F(A)]$$
>
>和：
>
>$$AF(A)\leq\int_{-\infty}^{-A}\lvert x\rvert dF(x)\rightarrow0(A\rightarrow \infty)$$
>
>得到结论.

## 方差

设 $\xi$ 为随机变量，如果 $E(\xi-E \xi)^2$ 存在，则定义 $\xi$ 的**方差**为 $D\xi=E(\xi-E \xi)^2$ . 称 $\sqrt{D \xi}$ 为 $\xi$ 的根方差 / 均方差 / **标准差**.

>[!note] $E(\xi-E \xi)^2=E(\xi^2)-(E \xi)^2$ .
> $$E(\xi^2-2 \xi E\xi +(E \xi)^2)=E(\xi^2)-(E \xi)^2$$

>[!note] $D(\xi+c)=D \xi$ .

>[!note] $D(c \xi)=c^2D\xi$ .

>[!note]- $D\xi\geq0$ 并且 $D\xi=0\Leftrightarrow \exists c,\mathcal{P}(\xi=c)=1$ .
>证明：由定义 $D\xi\geq0$ .
>
>$\Rightarrow$ ：取 $c=E\xi$ ，则：
>
>$$\begin{aligned}
>D\xi &=\int_{-\infty}^c(x-E\xi)^2dF(x)+\int_{c}^\infty(x-E\xi)^2dF(x)+\int_{\{c\}}(x-E\xi)^2dF(x)\\
>&=0
>\end{aligned}$$
>
>从而可得
>
>$$\int_{-\infty}^c(x-E\xi)^2dF(x)=\int_c^{\infty}(x-E\xi)^2dF(x)=0$$
>
>所以： $dF(x)=0,x\neq c$ ，所以 $F(c)=F(-\infty)=0,F(c+0)=F(+\infty)=1$ ，则 $F(c)=F(c+0)-F(c)=1$ . 

有如下推论：

>[!note] $E\xi^2=0\Rightarrow \mathcal{P}(\xi=0)=1$ .
>证明： $E\xi^2=0\Rightarrow D\xi=0,E\xi=0\Rightarrow \mathcal{P}(\xi=0)=1$ .

>[!note]- $E(\xi-E\xi)^2\leq E(\xi-c)^2$ 或 $D\xi=\min_{c\in \mathbb{R}}(\xi-c)^2$ .
>证明：
>
>$$\begin{aligned}
>E(\xi-E\xi)^2&=E(\xi-c+c-E\xi)^2\\
>&=E(\xi-c)^2+2(c-E\xi)E(\xi-c)+E(c-E\xi)^2\\
>&=E(\xi-c)^2-(E\xi -c)^2\leq E(\xi-c)^2
>\end{aligned}$$
>
>当且仅当 $C=E\xi$ 时取等.

>[!example]- 如果 $\xi\in[a,b]$ ，证明： $D\xi\leq \frac{(b-a)^2}{4}$ ，取等条件？
>证明：
>
>$$D\xi\leq E\left(\xi-\frac{a+b}{2}\right)^2\leq E\left(\frac{(b-a)^2}{4}\right)=\frac{(b-a)^2}{4}$$
>
>从而得证. 当且仅当 $E\xi=\frac{a+b}{2}$ 时取等.

有如下推论：

>[!note] 服从正态分布 $N(\mu,\sigma^2)$ 的随机变量 $\xi$ 方差.
> $$\begin{aligned}
>D(\xi)&=\int_{-\infty}^\infty (x-\mu)^2\frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)dx\\
>&\overset{z=\frac{x-\mu}{\sigma}}{=}\frac{1}{\sqrt{2\pi}\sigma}\sigma\int_{-\infty}^{\infty}(\sigma z)^2\exp\left(-\frac{z^2}{2}\right)dz\\
>&=\frac{1}{\sqrt{2\pi}}\sigma^2\int_{-\infty}^\infty z^2\exp(-z^2/2)dz\\
>&=-\frac{1}{\sqrt{2\pi}}\sigma^2\int_{\infty}^\infty z\ d(\exp (-z^2/2))\\
>&=-\frac{1}{\sqrt{2\pi}}\sigma^2\left(z\exp(-z^2/2)|_{\infty}^\infty-\int_{-\infty}^\infty\exp(-z^2/2)dz\right)\\
>&=\sigma^2
>\end{aligned}$$

[[2420Fr180734]]

>[!example]- $\xi\sim U([a,b])$ ，则 $D\xi=\frac{(a-b)^2}{12}$ .
>$$\begin{aligned}
>E\xi^2&=\int_{a}^bx^2\frac{1}{b-a}dx\\
>&=\frac{b^3-a^3}{3(b-a)}=\frac{b^2+a^2+ab}{3}\\
>\end{aligned}$$
>
>从而 $D\xi=E\xi^2-(E\xi)^2=\frac{(b-a)^2}{12}$ .

>[!example]- $\xi$ 服从参数为 $p$ 的 Bernoulli 分布，则 $D\xi=pq$
>$E\xi^2=1^2\cdot p=p$ . 从而 $D\xi=pq$ .

>[!example]- $\xi$ 服从二项分布 $b(n,k,p)$ ，则 $D \xi=np(1-p)$ .
>$$\begin{aligned}
>E \xi^2&=\sum\limits_{k=0}^{n}k^2\binom{n}{k}p^k(1-p)^{n-k}\\
>&=\sum\limits_{k=1}^{n}kn\binom{n-1}{k-1}p^k(1-p)^{n-k}\\
>&=n\sum\limits_{k=1}^{n}\left[(k-1)\binom{n-1}{k-1}+\binom{n-1}{k-1}\right]p^k(1-p)^{n-k}\\
>&=n\sum\limits_{k=2}^{n}\left[(n-1)\binom{n-2}{k-2}\right]p^k(1-p)^{n-k}+\sum\limits_{k=1}^{n}\binom{n-1}{k-1}p^k(1-p)^{n-k}\\
>&=n(n-1)p^2+np=n^2p^2+npq
>\end{aligned}$$
>
>从而可得：
>
>$$D\xi =n^2p^2+npq-(np)^2=npq$$
>
>其中用到的组合等式：
>
>$$\begin{aligned}
>k\binom{n-1}{k-1}&=(k-1)\binom{n-1}{k-1}+\binom{n-1}{k-1}\\
>&=(n-1)\binom{n-2}{k-2}+\binom{n-1}{k-1}
>\end{aligned}$$

>[!example]- $\xi$ 服从几何分布 $g(p,k)$ ，则 $D\xi=$

$p_k=(1-p)^{k-1}p$ .

$$\begin{aligned}
E\xi^2&=\sum\limits_{k\geq1}^{}q^{k-1}pk^2\\
&=\sum\limits_{k\geq1}^{}q^{k-1}p \cdot k(k+1)-\sum\limits_{k\geq1}^{}q^{k-1}p\cdot k\\
&=p\left(\sum\limits_{k\geq1}^{}k(k+1)x^{k-1}\right)\bigg|_{x=q}-p\left(\sum\limits_{k\ge1}^{}kx^{k-1}\right)\bigg|_{x=q}\\
&=p\left(\sum\limits_{k\geq1}^{}x^{k+1}\right)^{(2)}\bigg|_{x=q}-p\left(\sum\limits_{k\geq1}^{}x^k\right)'\bigg|_{x=q}\\
&=p\left(\frac{x^2}{1-x}\right)^{(2)}\bigg|_{x=q}-p\left(\frac{x}{1-x}\right)'\bigg|_{x=q}\\
&
\end{aligned}$$

>[!example]- $\xi$ 服从参数为 $\lambda$ 的泊松分布，其方差为 $\lambda$ . （泊松分布的期望、方差相同）
>$$\begin{aligned}
>E\xi^2 &=\sum\limits_{k\geq0}^{}k^2\frac{\lambda^k}{k!}e^{-\lambda}\\
>&=e^{-\lambda}\lambda\left[\sum\limits_{k\geq1}^{}\left(\frac{\lambda^{k-1}}{(k-1)!}k\right)\right]\\
>&=e^{-\lambda}\lambda\sum\limits_{k\geq0}^{}\frac{\lambda^k}{k!}(k+1)\\
>&=e^{-\lambda}\lambda^2\sum\limits_{k\geq1}^{}\frac{\lambda^{k-1}}{(k-1)!}+e^{-\lambda}\lambda e^{-\lambda}\\
>&=\lambda^2+\lambda
>\end{aligned}$$
>
>从而可得 $D\xi=\lambda$ .

>[!example] $\xi$ 服从 Laplace 分布（密度函数为 $p(x)=\frac{1}{2\lambda}e^{-\lvert x-\mu\rvert/\lambda},-\infty<x<\infty,\lambda>0$ ）， $D\xi=2\lambda^2$ . 
>

## 切比雪夫不等式

>[!note] 切比雪夫不等式：对于任意方差有限的随机变量 $\xi$ 有： $\mathcal{P}(\lvert \xi-E \xi\rvert\geq \epsilon)\leq \frac{D\xi}{\epsilon^2}$

证明：

$$D\xi \geq\int_{\lvert \xi-E\xi\rvert\geq \epsilon}(x-E\xi)^2dF(x)\geq \epsilon^2\mathcal{P}(\lvert \xi-E\xi\rvert\geq \epsilon)$$

注意，当 $\epsilon$ 接近于 $0$ 时，该式是平凡的，因为 $\mathcal{P}(\lvert \xi-E \xi\rvert\ge 0)\leq 1\leq \frac{D\xi}{\epsilon^2}$ ，当 $\epsilon$ 充分大时.

>[!note] 变式： $\mathcal{P}\{\lvert \xi-E\xi\rvert<\epsilon\}>1-\frac{D\xi}{\epsilon^2}$ .

>[!note] 变式： $\mathcal{P}\left(\left\lvert\left\{\frac{\xi-E\xi}{\sqrt{D\xi}}\right\} \right\rvert\ge \delta\right)\leq \frac{1}{\delta^2}$ .

>[!note] 推广： $\mathcal{P}\{\lvert \xi-E\xi\rvert\ge \epsilon\}\le\frac{E\lvert \xi-E\xi\rvert^r}{\epsilon^r},r\ge0$ .

特别地，有 **Morkov 不等式**（[check-wiki](https://en.wikipedia.org/wiki/Markov%27s_inequality)）

>[!note] $\mathcal{P}(\{\lvert \xi\rvert\geq \epsilon\})\leq \frac{E\lvert \xi\rvert^r}{\epsilon^r},r\ge0$ .

此外，切比雪夫不等式几乎是求概率收敛的唯一方法，其用期望和方差控制概率. 即 $\xi$ 落在 $(-\delta+E\xi,\delta+E\xi)$ 的概率低于 $1-\frac{1}{\delta^2}$ .

>[!note] 推论：方差为 $0$ 的随机变量（几乎处处）为常数.

证明：设 $\xi,D\xi=0$ .

$$\begin{aligned}
\mathcal{P}(\xi\neq E\xi)&=\mathcal{P}\left(\bigcup_{n\geq1}\{\lvert \xi-E\xi\rvert\ge 1/n\}\right)\\
&\le\sum\limits_{n\geq1}^{}\mathcal{P}(\lvert \xi-E\xi \rvert\ge 1/n)\\
&\leq \sum\limits_{n\geq1}^{}\frac{D\xi }{1/n^2}=0
\end{aligned}$$

也即 $\mathcal{P}(\xi=E\xi)=1$ （概率测度为 $1$ ） [[2420Sa082320]]

## 协方差

在之前已经提到过两个随机变量之间的一种特殊关系：独立 $F_{\xi,\eta}(x,y)=F_{\xi}(x)F_\eta(y)$ ，这个条件实际上不容易达到.

下面引入相关这一概念，其是独立的必要条件.

对随机变量 $\xi,\eta$ ，如果两者的均值、方差都存在，则定义 $\xi,\eta$ 的**协方差**（covariance）为 $\text{cov}(\xi,\eta)=E((\xi-E\xi)(\eta-E\eta))$ . 有以下结论：

>[!note] $\text{cov}(\xi,\eta)=E(\xi \eta)-E \xi E \eta$ .

>[!note] 如果 $E\xi,E\eta$ 存在，则 $E\xi \eta$ 也存在.

证明：考虑证明 $(E(\xi\eta))^2\leq (E\xi^2)(E\eta^2)$ ，采取判别式法，欲 $\Delta=(2E(\xi,\eta))^2-4(E\xi)^2(E\eta)^2$ ，因此构造函数：

$$f(t)=\xi^2t^2+2\xi\eta\ t+\eta^2=(\xi t+\eta)^2\geq0$$

取期望得到：

$$E(f(t))=E(\xi^2)t^2+2E(\xi \eta)t+E(\eta^2)$$

1. $E(\xi^2)=0$ ，则 $\mathcal{P}(\xi=0)=1$ ，从而 $\mathcal{P}(\eta \xi=0)$ （因为 $\{\eta \xi=0\}=\{\eta=0\}\cup \{\eta=0\}\supset \{\xi=0\}$ ），从而 $E(\xi \eta)=E(\xi)=0$ ，此时 $(E(\xi\eta))^2=(E\xi^2)E(\eta^2)$ .
2. $E(\xi^2)\neq0$ ，由 $f(t)\ge0,\forall t\in \mathbb{R}$ ， $\Delta\leq 0$ ，从而可得 $(E(\xi \eta))^2\leq (E \xi^2)E(\eta^2)$ ，当且仅当存在 $t_0$ 使得 $f(t_0)=0$ 即 $\xi t_0+\eta=0$ 时上式取等.

>[!note] $\text{cov}(\xi,\eta)\leq \sqrt{D\xi D\eta}$ .

在协方差的基础上，如果 $D\xi,D\eta\neq0$ ，则定义**相关系数**： $\gamma=\frac{\text{cov}(\xi,\eta)}{D\xi D\eta}$ .

如果 $\gamma=\pm1$ ，则称 $\eta,\xi$ 具有线性关系或**相关**，如果 $\gamma=0$ ，则称 $\eta,\xi$ 不相关.

>[!note] 如果 $\xi,\eta$ 独立，则 $\xi,\eta$ 不相关.

>[!example] $\xi,\eta$ 不相关，但 $\xi,\eta$ 不独立.

之前提到方差的概念，对于一列随机变量 $\{\xi_i\}_{1\leq i\leq n}$ ：

$$\begin{aligned}
D\left(\sum\limits_{i=1}^{n}\xi_i\right)&=E\left(\sum\limits_{i=1}^{n}\xi_i-\sum\limits_{i=1}^{n}E\xi_i\right)^2\\
&=\sum\limits_{i=1}^{n}D(\xi_i)+2\sum\limits_{1\leq i<j\leq n}^{}\text{cov}(\xi_i,\xi_j)
\end{aligned}$$

特别地，当随机变量不相关时 $D$ 可加.

>[!example]- 将 $n$ 封信随机放入到 $n$ 个信封中，放对信封数 $\mu$ 的数学期望和方差为？
>设随机变量 $\xi_i$ ， $\xi_i=1$ 表示第 $i$ 封信放对信封， $\xi_i=0$ 表示第 $i$ 封信放错信封，则有 $\mu=\sum\limits_{i=1}^{n}\xi_i$ .
>
>利用<u>古典概率模型</u>计算： $\mathcal{P}(\xi_i=1)=\frac{(n-1)!}{n!}=\frac{1}{n}$ ，从而可得 $E\xi_i=\frac{1}{n}$ ，所以 $E\mu=\sum\limits_{i=1}^{n}E\xi_i=1$ . 
>
>$$\begin{aligned}
>\text{cov}(\xi_i,\xi_j)&=E(\xi_i\xi_j)-E\xi_iE\xi_j\\
>&=\mathcal{P}(\xi_i=\xi_j=1)-\frac{1}{n^2}\\
>&=\frac{(n-2)!}{n!}-\frac{1}{n^2}=\frac{1}{n^2(n-1)}\\
>\end{aligned}$$
>
>$D\xi_i=E\xi_i^2-(E\xi_i)^2=\frac{1}{n}\left(1-\frac{1}{n}\right)$ .
>
>所以 $D\mu=1-\frac{1}{n}+\binom{n}{2}2\frac{1}{n^2(n-1)}=1$ .

## 母函数（生成函数）

类似于 [[DSA]] 中的计数问题中的生成函数，概率论中采取母函数辅助获取随机变量的数字特征.

对于非负整数值离散型随机变量 $\xi$ ，定义其**母函数**（generating function）为：

$$P(s)=Es^\xi=\sum\limits_{k\ge0}^{}\mathcal{P}(\xi=k)s^k,s\in[0,1]$$

其中 $s\in[0,1]$ ，从而 $P(s)$ 在 $[0,1]$ 上一致收敛并且绝对收敛.

>[!warning] 母函数是对于离散型非负整数值的随机变量定义的，其他随机变量，e.g. 连续型随机变量，没有母函数定义，其类似的定义是特征函数.

>[!example] $\xi$ 服从二项分布 $b(k;n,p)$ ，求其母函数.
>$$\begin{aligned}
>P(s)&=\sum\limits_{k=0}^{n}s^k\binom{n}{k}p^{k}q^{n-k}\\
>&=\sum\limits_{k=0}^{n}\binom{n}{k}(sp)^kq^{n-k}\\
>&=(sp+q)^n=((s-1)p+1)^n
>\end{aligned}$$

>[!example] $\xi$ 服从参数为 $\lambda$ 的泊松分布，求其母函数.
>$$\begin{aligned}
>P(s)&=\sum\limits_{k=0}^{\infty}s^k\frac{\lambda^k}{k!}e^{-\lambda}\\
>&=e^{(s-1)\lambda}
>\end{aligned}$$

>[!example] $\xi$ 服从超几何分布，求其母函数.
>$$\begin{aligned}
>P(s)&=\sum\limits_{k=0}^{n}\frac{\binom{M}{k}\binom{N-M}{n-k}}{\binom{N}{n}}s^k\\
>\end{aligned}$$
>
>[[2421Mo104515]]

>[!example] $\xi$ 服从参数为 $p$ 的几何分布，求其母函数.
>$$\begin{aligned}
>P(s)&=\sum\limits_{k=1}^{\infty}q^{k-1}ps^k=ps\frac{1}{1-qs}=\frac{ps}{1-(1-p)s}
>\end{aligned}$$

>[!note] 随机变量的母函数与其分布列互相确定.
>由定义，分布列确定母函数；反之，可以证明： $\mathcal{P}(\xi=k)=\frac{P^{(k)}(0)}{k!}$ .

可以用母函数求解随机变量的数字特征：

$$\begin{aligned}
&E\xi=P'(1)\\
&D\xi=P''(1)+P'(1)-[P'(1)]^2
\end{aligned}$$

证明略，注意用到了一致收敛，所以可以换序.

## 特征函数

之前所提到的数字特征： $E\xi,D\xi$ 、矩等都不能够确定一个随机变量. 母函数可以确定一个整型随机变量.

特征函数可以视为对于母函数的推广.

为了定义特征函数，首先需要定义**复随机变量**： $\zeta=\xi+i\eta$ ，其中 $\xi,\eta$ 是随机变量，定义 $\zeta$ 的期望为 $E\zeta=E\xi+i E\eta$ ，进而可以定义其他数字特征. 称复随机变量 $\zeta_1=\xi_1+i\eta_1,\zeta_2=\xi_2+i\eta_2$ 是独立的，如果 $(\xi_1,\eta_1)$ 和 $(\xi_2,\eta_2)$ 独立. 

对于随机变量 $\xi$ ，定义其**特征函数** $f(t)=E e^{it \xi}=\int_{-\infty}^\infty e^{it x}dF(x)$ .

>[!example] 非负整型随机变量 $\xi$ 的特征函数与母函数.
>$$f_\xi(t)=\sum\limits_{k=0}^{\infty}p(\xi=k)e^{itk}=P(e^{it})$$

特征函数具有如下性质：

>[!note]- $\overline{f(t)}=f(-t)$ .
>$$\begin{aligned}
>f(-t)&=\int_{-\infty}^\infty e^{-it x}dF(x)\\
>&=\int_{-\infty}^\infty \cos txdF(x)-\int_{\infty}^\infty\sin txdF(x)\\
>&=\overline{f(t)}
>\end{aligned}$$

>[!note] 一致有界： $\lvert f(t)\rvert\leq f(0)=1$ .
>$$\lvert f(t)\rvert\leq \int_{-\infty}^\infty \lvert e^{-itx}\rvert dF(x)\leq \int_{-\infty}^\infty dF(x)=f(0)=1$$

>[!note]- $f(t)$ 关于 $t\in \mathbb{R}$ 一致连续.
>证明：
>
>$$\begin{aligned}
>\left\lvert f(t+\delta)-f(t)\right\rvert&=\left\lvert \int_{-\infty}^\infty e^{i(t+\delta)x}-e^{itx}dF(x)\right\rvert\\
>&=\left\lvert \int_{-\infty}^\infty e^{itx}(e^{i\delta x}-1)dF(x)\right\rvert\\
>&\leq \int_{-\infty}^\infty \lvert e^{itx}\rvert\cdot\lvert e^{i\delta x}-1\rvert dF(x)\\
>&\leq \int_{-\infty}^\infty \lvert e^{i\delta x}-1\rvert dF(x)\\
>&\overset{(1)}{\leq} \int_{-\infty}^\infty \delta xdF(x)=\delta E(\xi)
>\end{aligned}$$
>
>[[2421Th212702]]
>
>或者：
>
>$$\begin{aligned}
>\int_{-\infty}^\infty\lvert e^{i\delta x}-1\rvert dF(x)&=\int_{-\infty}^B\cdot\ dF(x)+\int_{B}^A\cdot\ dF(x)+\int_A^\infty\cdot \ dF(x)\\
>\end{aligned}$$
>
>其中 $\int_{-\infty}^B\cdot\ dF(x)\leq 2\int_{-\infty}^BdF(x)=2F(B)$ ，并且 $\lim_{B\rightarrow -\infty}2F(B)=0$ ；并且 $\int_{B}^A\cdot\ dF(x)=2\int_{B}^A\left\lvert \sin\frac{\delta x}{2}\right\rvert dF(x)\rightarrow 0(\delta\rightarrow0)$ . 

>[!note]- 特征函数是半正定的：对于任意的 $t_i,t_j\in \mathbb{R},\lambda_i,\lambda_j\in \mathbb{C}$ 有： $\sum\limits_{i,j}^{}f(t_i-t_j)\lambda_i\overline{\lambda_j}\geq0$ 
>证明：
>
>$$\begin{aligned}
>\text{原式}&=\sum\limits_{i,j}^{}\int_{-\infty}^\infty e^{i(t_i-t_j)x}\lambda_i\overline{\lambda_j}dF(x)\\
>&=\int_{-\infty}^\infty \sum\limits_{i,j}^{}e^{i(t_i-t_j)x}\lambda_i\overline{\lambda_j}dF(x)\\
>&=\int_{-\infty}^\infty \sum\limits_{i}^{}e^{it_ix}\lambda_i\sum\limits_{j}^{}e^{-it_jx}\overline{\lambda_j}dF(x)\\
>&=\int_{\infty}^\infty \left|\sum\limits_{i}^{}e^{it_ix}\right|^2dF(x)\ge0
>\end{aligned}$$

>[!note]- 两个独立随机变量的和的特征函数为随机变量特征函数的积.

证明：设 $\xi,\eta$ ：

$$\int_{\xi+\eta}$$

[[2421Th215544]]

然而反过来并不成立，考虑 Cauchy 分布 $p(x)=\frac{1}{\pi}\frac{\lambda}{\lambda^2+(x-\mu)^2}$ .

[[2425Fr214546]]

>[!example] $\xi$ 服从 $\mu=0,\lambda=1$ 的 Cauchy 分布， $\eta=\xi$ ，则有 $f_{\xi+\eta}(t)=f_\xi(t)f_\eta(t)$ ，但 $\xi,\eta$ 不独立.

类似母函数，可以根据特征函数获取随机变量的数字特征：

>[!note] 如果随机变量 $\xi$ 的 $1$ 到 $n$ 阶矩都存在，则 $E\xi^k=\frac{f^{(k)}(0)}{i^k}$ ，进而有：

$f(t)=$

### 逆转公式

可以证明满足以上三条性质： $\overline{f(t)}=f(-t)$ ， $\lvert f(t)\rvert\leq f(0)=1$ ， $f$ 关于 $t$ 一致连续的函数 $f$ 唯一确定一个随机变量.

### 多元随机变量的特征函数

下面对于多元正态分布进一步讨论，之前在 [[#多元正态分布]] 中已经提到这一分布；

>[!note] 如果 $\xi\sim \mathcal{N}(\vec{\mu},\Sigma)$ ，则 $\xi$ 的特征函数为 $f(t)=\exp\left\{i\vec{\mu}t-\frac{1}{2}t^T\Sigma t\right\}$ .

借助特征函数可以证明多元正态分布的一个很强的性质：

>[!note] $\xi=(\xi_1,\cdots,\xi_n)$ 服从正态分布当且仅当 $\sum\limits_{i=1}^{n}k_i\xi_i$ 服从正态分布， $\forall i_i\in \mathbb{R}$ .

# 概率收敛

设随机变量列 $\{\xi_n\}_{n\ge1}$ ，随机变量 $\xi$ ，分布函数分别为 $F_n(x),F(x)$ .

定义 $\{\xi_n\}_{n\ge1}$ **依分布收敛** 到 $\xi$ ：对于 $F$ 的任意一个连续点都有 $F_n(x)\rightarrow F(x)$ (弱收敛). 记为 $\xi_n\overset{L}{\rightarrow} \xi$ . 

>[!example]- 分布函数列收敛得到的不一定是分布函数.
>$$F_n=\left\{\begin{aligned}
>&0,x\leq n\\
>&1,x>n
>\end{aligned}\right.$$
>
>则 $F=\lim_{n\rightarrow \infty}F_n=0$ .

定义 $\{\xi_n\}_{n\ge1}$ **依概率收敛**到 $\xi$ ： $\forall \epsilon>0$ 有 $\lim_{n\rightarrow \infty}\mathcal{P}(\lvert \xi_n-\xi\rvert \ge \epsilon)=0$ . 记为 $\xi_n\overset{P}{\rightarrow}\xi$ .

>[!warning] 注意是 $\lvert \xi_n-\xi\rvert\ge \epsilon$ .

>[!hint] 依概率收敛相当于实变函数中的依测度收敛 $\overset{m}{\rightarrow}$ .

>[!example]- 斯卢茨基：设随机变量函数列 $\{\xi_n\}_{n\ge1}$ ，其对应的分布函数列为 $\{F_n\}_{n\ge1}$ ，随机变量函数列 $\{\eta_n\}_{n\ge1}$ 依概率收敛到常数 $C>0$ . 证明：1) $\zeta_n=\xi_n+\eta_n$ 的分布函数收敛到 $F(x-C)$ ；2) $\zeta=\frac{\xi_n}{\eta_n}$ 的分布函数收敛到 $F(Cx)$ .
>证明： 
>
>$$\begin{aligned}
>F_{\zeta_n}(x)&=\mathcal{P}(\xi_n+\eta_n<x)\\
>&=\mathcal{P}\{\xi_n+\eta_n<x,\lvert \eta_n-C\rvert\ge \epsilon\}\\
>&+\mathcal{P}\{\xi_n+\eta_n<x,\lvert \eta_n-C\rvert<\epsilon\}\\
>&\leq \mathcal{P}(\cdots)+\mathcal{P}(\xi_n<x-C+\zeta)
>\end{aligned}$$
>
>从而由 $\{\eta_n\}_{n\ge1}$ 概率收敛可得：
>
>$$\varlimsup_{n\rightarrow \infty}F_{\zeta_n}(x)\leq \varlimsup_{n\rightarrow \infty}F_{\xi_n}(x-C+\epsilon)$$
>
>同理可以证明有：
>
>$$\varliminf_{n\rightarrow \infty}F_{\zeta_n}(x)\ge \varliminf_{n\rightarrow \infty}F_{\xi_n}(x-C-\epsilon)$$
>
>进而取 $n\rightarrow \infty$ ，以及 $\epsilon\rightarrow 0^+$ 可以得到结论，注意这里要求 $x-C,x-C\pm \epsilon$ 都是连续点. 2) 同理 

定义 $\{\xi_n\}_{n\ge1}$ **r 收敛**到 $\xi$ ： $r>0,E \lvert \xi_n\rvert^r<\infty,E\lvert \xi\rvert^r<\infty$ ，并且 $E\lvert \xi_n-\xi\rvert^r\rightarrow0(n\rightarrow \infty)$ . 记为 $\xi_n\overset{r}{\rightarrow}\xi$ .

>[!example] 均方收敛： $r=2$ 情形.

定义 $\{\xi_n\}_{n\ge1}$ **以概率 1 收敛**到 $\xi$ （几乎处处收敛）： $\mathcal{P}(\lim_{n\rightarrow \infty}\xi_n=\xi)=1$ . 记为 $\xi_n\overset{a.s.}{\rightarrow}\xi$ .

>[!note]- $\xi_n\overset{r}{\rightarrow}\xi \Rightarrow \xi_n\overset{P}{\rightarrow}\xi\Rightarrow \xi_n\overset{L}{\rightarrow}\xi$ .
>证明：
>
>$$\begin{aligned}
>E\lvert \xi_n-\xi\rvert^r &\overset{x=\xi_n-\xi}{=}E\lvert x\rvert^r\\
>&=\int_{\mathbb{R}}\lvert x\rvert^rdF(x)\\
>&\ge \int_{\lvert x\rvert\ge \epsilon}\lvert x\rvert^rdF(x)\\
>&\ge\int_{\lvert x\rvert\ge \epsilon}\epsilon^r dF(x)\\
>&=\epsilon^r\mathcal{P}(\lvert x\rvert\ge \epsilon)
>\end{aligned}$$
>
>从而可得 **Markov 不等式**：
>
>$$\mathcal{P}(\lvert \xi_n-\xi\rvert\ge \epsilon)\leq \frac{E\lvert \xi_n-\xi\rvert^r}{\epsilon^r},\forall r>0$$
>
>由 $\{\xi_n\}_{n\ge1}$ $r$ 收敛到 $\xi$ 可得 $\lim_{n\rightarrow \infty}\mathcal{P}(\lvert \xi_n-\xi\rvert\ge \epsilon)=0$ .
>
>下面从依概率收敛证明依分布收敛.
>
>证明思路是说明 $\varlimsup_{n\rightarrow \infty}F_n(x)=\varliminf_{n\rightarrow \infty}F_n(x)$ ，为此尝试利用 $F(x)$ 的任意性（注意，依分布收敛是对于 $F$ 的连续点而言）
>
>任取 $x_1<x<x_2$ ，试图证明： $F(x_1)\leq \varlimsup_{n\rightarrow \infty}F_n(x)\leq \varlimsup_{n\rightarrow \infty}F_n(x)\leq F(x_2)$ ，然后令 $x_1\uparrow x,x_2\downarrow x$ ，从而由 $F$ 在 $x$ 连续可以得到结论.
>
>$$\begin{aligned}
>\{\xi<x_1\}&=\{\xi<x_1,\xi_n<x\}\cup\{\xi<x_1,\xi_n\ge x\}\\
>&\subset\{\xi_n<x\}\cup\{\lvert \xi_n-\xi\rvert>x-x_1\}
>\end{aligned}$$
>
>从而可以得到：
>
>$$F(x_1)\leq F_n(x)+\mathcal{P}(\lvert \xi_n-\xi\rvert>x-x_1)$$
>
>取 $n\rightarrow \infty$ ，由 $\{\xi_n\}_{n\ge1}$ 依概率收敛可得：
>
>$$F(x)\leq \varliminf_{n\rightarrow \infty}F_n(x_1)$$
>
>注意：还未确定 $F_n$ 是否有极限，因此取下极限.
>
>同理可以得到： $\varlimsup_{n\rightarrow \infty}F_n(x)\leq F(x_2)$ ，从而得证.
>
>此处的同理并不显然，但为了证明反方向应该作此放缩：
>
>$$\begin{aligned}
>\mathcal{P}(\xi\ge x_2)&=\mathcal{P}(\xi\ge x_2,\xi_n\ge x)+\mathcal{P}(\xi\ge x_2,\xi_n<x)\\
>&\leq \mathcal{P}(\xi_n\ge x)+\mathcal{P}(\lvert \xi-\xi_n\rvert\ge x_2-x)\\
>\end{aligned}$$
>
>取 $x_2\rightarrow x$ ，然后再取上极限可得：
>
>$$1-F(x)\leq 1-\varlimsup_{n\rightarrow \infty}F_n(x)$$
>
>从而可得结论.

>[!note] $\xi_n\overset{a.s.}{\rightarrow}\xi\Rightarrow \xi_n\overset{P}{\rightarrow}\xi\Rightarrow\xi_n\overset{L}{\rightarrow}\xi$ .
>由 Rieze 定理可得. $a.s.\Rightarrow P$ 的情况.

>[!note]- 当 $\xi_n\overset{l}{\rightarrow}C$ ，其中 $C$ 为常数时， $\xi_n\overset{P}{\rightarrow}C$ .
>证明：
>
>$$\begin{aligned}
>\mathcal{P}(|\xi_n-\xi|\ge \epsilon)&=\mathcal{P}(\xi_n\ge C+\epsilon)+\mathcal{P}(\xi_n\leq C-\epsilon)\\
>&=1-F_n(C+\epsilon)+F_n(C-\epsilon+0)
>\end{aligned}$$
>
>注意是 $\ge$ . 并由 $F(x)=\left\{\begin{aligned}&1,x>C\\&0,x\leq C\end{aligned}\right.$ 可得上式 $=1-1+0=0(n\rightarrow \infty)$ .

## 大数定律

称随机变量列 $\{\xi_n\}_{n\ge1}$ 服从**大数定律**，如果存在常数列 $\{a_n\}_{n\ge1}$ 使得 $\forall \epsilon>0,\mathcal{P}\left(\left\{\left\lvert \frac{1}{n}\sum\limits_{i=1}^{n}\xi_i-\frac{1}{n}a_n\right\rvert\ge \epsilon\right\}\right)\rightarrow0(n\rightarrow \infty)$ . 或者等价定义为存在常数列 $\{b_n\}_{n\ge1}$ 使得 $\forall \epsilon>0,\mathcal{P}\left(\left\{\left\lvert \frac{1}{n}\sum\limits_{i=1}^{n}\xi_n-b_n\right\rvert\ge \epsilon\right\}\right)\rightarrow0$ .

大数定律刻画的是<u>均值收敛</u>.

>[!note] 切比雪夫大数定律：设 $\{\xi_n\}_{n\ge1}$ 两两不相关， $D\xi_i\leq C,\forall i\ge1$ ，则 $\{\xi_i\}_{i\ge1}$ 服从大数定律.
>证明：令 $\zeta_n=\frac{1}{n}\sum\limits_{i=1}^{n}\xi_i$ ，则由切比雪夫不等式可得：
>
>$$\mathcal{P}\left(\left\lvert \zeta_n-E\zeta_n\right\rvert>\epsilon\right)\leq \frac{D(\zeta_n)}{\epsilon^2}$$
>
>由 $\{\xi_n\}_{n\ge1}$ 两两不相关可得 $D(\zeta_n)=\frac{1}{n}\sum\limits_{i=1}^{n}D(\xi_i)\leq \frac{C}{n}$ .
>
>因此取 $a_n=E\xi_n$ 即可得到结论.

## Helly 定理

>[!note] 对于非降函数列 $\{F_n\}_{n\ge1}$ ，若存在 $\mathbb{R}$ 上的稠密子集 $D$ 使得 $F_n\rightarrow F(n\rightarrow \infty),\forall x\in D$ ，那么 $F_n\overset{w}{\rightarrow}F,\forall x\in \mathbb{R}$ .

证明：对于任意的 $x\in \mathbb{R}\backslash D,x_1,x_2\in D,x_1<x<x_2)$ 由 $F_n$ 非递降可得： $F_n(x_1)\leq F_n(x)\leq F_n(x_2)$ ，从而可得：

$$F(x_1)\leq \varliminf_{n\rightarrow \infty} F_n(x)\leq \varlimsup_{n\rightarrow \infty}F_n(x)\leq F(x_2)$$

于是：

$$F(x-0)\leq \varliminf_{n\rightarrow \infty}F_n(x)\leq \varlimsup_{n\rightarrow \infty}F_n(x)\leq F(x+0)$$

当 $x$ 为 $\mathbb{R}\backslash D$ 上的连续点时，有 $\varliminf_{n\rightarrow \infty}F_n(x)=\lim_{n\rightarrow \infty}F_n(x)=F(x)$ . 所以 $F_n\overset{w}{\rightarrow}F,\forall x\in \mathbb{R}$ .

>[!note] 📍 Helly 第一定理：任意一致有界的非降函数列 $\{F_n\}_{n\ge1}$ 中必然有子序列 $\{F_{n_k}\}_{k\ge1}$ 弱收敛于某一有界非降函数.

证明：取 $D=\{r_n\}_{n\ge1}$ ，只需要证明存在子序列 $\{F_{n_k}\}_{k\ge1}$ 在 $D$ 上收敛于（不是弱收敛）某一有界函数 $F$ 即可.

考虑 $\mathbb{R}$ 上的有界数列 $\{F_n(r_1)\}_{n\ge1}$ ，由 [[zoeminus/docs/Math/R#^BolzanoWeierstrass|Bolzano-Weirstrass]] 定理可知存在收敛子列 $\{F_{n}^{(1)}\}$ ，则取 $F(r_1)=\lim_{n\rightarrow \infty}F_n^{(1)}(r_1)$ . 一般情形 $k\ge2$ ，对于 $\{F_n^{(k-1)}(r_k)\}$ ，其仍然为有界数列，则存在 $\{F_n^{(k)}\}\subset \{F_n^{(k-1)}\}$ 收敛，令 $F(r_k)=\lim_{n\rightarrow \infty}F_n^{(k)}(r_k)$ .

对于 $x\in \mathbb{R}\backslash D$ ，取：

$$F(x)=\sup_{r_n<x}F(r_n)$$

从而可以得到 $F$ ， 注意到对于任意的 $r_1<x<r_2$ 有 $F(r_1)\leq F(x)\leq F(r_2)$ ，再由 $D$ 的稠密性可以得到对于任意的 $x_1<x_2$ 有 $F(x_1)\leq F(x_2)$ ， $F$ 有界显然.

>[!note] 📍 Helly 第二定理： $f$ 为 $[a,b]$ 上的连续函数， $\{F_n\}_{n\ge1}$ 在 $[a,b]$ 上一致有界非降并且弱收敛于 $F$ ，其中 $a,b$ 为 $F$ 的连续点. 则 $\lim_{n\rightarrow \infty}\int_a^bf(x)dF_n(x)=\int_a^bf(x)dF(x)$ .

证明思路还是一样的三角不等式：

$$\begin{aligned}
\left\lvert \int_a^bfdF-\int_a^bfdF_n\right\rvert &=\left\lvert \int_a^b(f-f_\epsilon)dF\right\vert+\left\vert\int_a^bf_\epsilon dF-\int_a^bf_\epsilon dF_n\right\rvert\\
&+\left\lvert \int_a^bf_\epsilon dF_n-\right\rvert
\end{aligned}$$

由 Cantor 定理可知 $f$ 在 $[a,b]$ 上一致连续，因此对于任意的 $\epsilon>0$ ，存在 $\delta>0$ ，当 $\lvert x_1-x_2\rvert<\delta$ 时 $\lvert f(x_1)-f(x_2)\rvert<\epsilon$ .

>[!note] 推广 Helly 第二定理：设 $f$ 是 $(-\infty,\infty)$ 上的<u>有界</u>连续函数， $\{F_n\}_{n\ge1}$ 是 $(-\infty,\infty)$ 上弱收敛于函数 $F$ 的一致有界非降函数列，<u>并且</u> $\lim_{n\rightarrow \infty}F_n(-\infty)=F(-\infty),\lim_{n\rightarrow \infty}F_n(+\infty)=F(+\infty)$ ，则：$\lim_{n\rightarrow \infty}\int_{-\infty}^\infty fdF_n=\int_{-\infty}^\infty fdF$ .

注意到 $F$ 在 $(-\infty,\infty)$ 上有界非降，所以其有有限个不连续点，取 $a,b$ 为 $F$ 上的连续点.

做如下分段：

$$\begin{aligned}
&J_1=\left\lvert \int_{-\infty}^a fdF_n-\int_{-\infty}^afdF\right\rvert\\
&J_2=\left\lvert \int_{a}^bfdF_n-\int_a^bfdF\right\rvert\\
&J_3=\left\lvert \int_b^\infty fdF_n-\int_b^\infty fdF\right\rvert
\end{aligned}$$

$J_2$ 的情形已经讨论过，考虑 $J_1,J_2$ . 设 $\lvert f\rvert<M$

$$\begin{aligned}
J_1&\leq M(F_n(a)-F_n(-\infty))+M(F(a)-F(-\infty))\\
&=M(F_n(a)-F(a)+F(a)-F(-\infty)+F(-\infty)-F_n(-\infty))\\
&+M(F(a)-F(-\infty))\\
\end{aligned}$$

以上，因为 $a$ 是 $F$ 的连续点，所以 $\lim_{n\rightarrow \infty}F_n(a)=F(a)$ ，并且有 $\lim_{n\rightarrow \infty}F_n(-\infty)=F(-\infty)$ ，以及因为 $a$ 是 $F$ 的连续点，所以 $\lim_{a\rightarrow -\infty}F_n(a)=F(-\infty)$ .

所以首先取 $a$ 充分小，然后取 $n$ 充分大即可得到结论.

对于 $J_3$ ：

$$\begin{aligned}
J_3&\leq M(F_n(+\infty)-F_n(b))+M(F(+\infty)-F(b))\\
&=M(F_n(+\infty)-F(+\infty)+F(+\infty)-F(b)+F(b)-F_n(b))\\
&+M(F(+\infty)-F(b))
\end{aligned}$$

同理可证.

## 连续性定理

>[!note] 正极限定理：分布函数列 $\{F_n\}_{n\ge1}$ 弱收敛于某一分布函数 $F(x)$ ，则其相应的特征函数列 $\{f_n(t)\}_{n\ge1}$ 收敛于特征函数 $f(t)$ ，并且在 $t$ 的任一有限区间内一致收敛.

分布函数列在 $\mathbb{R}$ 上一致有界非降，且 $e^{itx}$ 在 $\mathbb{R}$ 上有界连续，且由分布函数的性质 $\lim_{n\rightarrow \infty}F_n(\pm\infty)=F_n(\pm\infty)$. 所以由推广的 Helly 第二定理： $\lim_{n\rightarrow \infty}\int_\mathbb{R}e^{itx}dF_n(x)=\int_\mathbb{R}e^{itx}dF(x)$ . 对于 $t$ 的任一有限区间，有界连续函数 $e^{itx}$ 在其上一致收敛.

>[!note] 逆极限定理：特征函数列 $\{f_n(t)\}_{n\ge1}$ 收敛于函数 $f(t)$ ，并且 $f(t)$ 在 $t=0$ 处连续，则对应分布函数列 $\{F_n(x)\}_{n\ge1}$ <u>弱收敛</u>于某一分布函数 $F(x)$ ，其对应的特征函数为 $f(t)$ .

$\{F_n\}_{n\ge1}$  一致有界并且非降，所以由 Helly 第一定理可知存在 $\{F_{n_k}\}_{k\ge1}$ 弱收敛于某一有界非降函数 $F(x)$ ，从而 $F(-\infty)\ge0,F(+\infty)\leq1$ .

首先证明 $F(x)$ 是分布函数，只需证明 $F(-\infty)=0,F(+\infty)=1$ ，反证：设 $F(+\infty)-F(-\infty)\overset{def}{=}\delta<1$ . 取 $\epsilon<1-\delta$ .

因为 $f(0)=\lim_{n\rightarrow \infty}f_n(0)=0$ ，所以存在 $\tau>0$ 使得：

$$\frac{1}{2\tau}\left\lvert \int_{-\tau}^{\tau}f(t)dt\right\rvert\ge 1-\frac{\epsilon}{2}>\delta+\frac{\epsilon}{2}$$

接下来试图证明：

$$\frac{1}{2\tau}\left\lvert \int_{-\tau}^{\tau}f(t)dt\right\rvert\le\delta+\frac{\epsilon}{2}$$

为此，试图找到一个函数列 $\{f_{n_k}\}_{k\ge1}$ 满足：

$$\frac{1}{2\tau}\left\lvert \int_{-\tau}^\tau f_{n_k}(t)dt\right\rvert\leq \delta+\frac{\epsilon}{2}$$

因为：

$$\frac{1}{2\tau}\left\lvert \int_{-\tau}^\tau f_{n_k}(t)dt\right\rvert\leq 1$$

所以由控制收敛定理即可得到结论.

注意到：

$$\begin{aligned}
\left\lvert \int_{-\tau}^\tau f_{n_k}dt\right\rvert &\leq \left\lvert \int_{\lvert x\rvert\leq X} \int_{-\tau}^\tau e^{itx}dtdF_{n_k}\right\rvert+\left\lvert \int_{\lvert x\rvert>X}\int_{-\tau}^\tau e^{itx}dtdF_{n_k}\right\rvert\\
&\leq 2\tau [F_{n_k}(X)-F_{n_k}(-X)]+\int_{\lvert x\rvert>X}\left\lvert \frac{2}{x}\sin\tau x\right\rvert dF_{n_k}(x)\\
&< 2\tau[F_{n_k}(X)-F_{n_k}(X)]+\int_{\mathbb{R}}\frac{2}{X} dF_{n_k}\\
&=2\tau[F_{n_k}(X)-F_{n_k}(X)]+\frac{2}{X}\\
\end{aligned}$$

记 $\delta_{n_k}=F_{n_k}(X)-F_{n_k}(-X)$ ，因为 $F_{n_k}$ 弱收敛于 $F$ ，所以存在 $X,k$ 使得：

$\delta_k\leq \delta+\frac{\epsilon}{4}$ .

接下来由正极限定理：可知 $f(t)$ 是 $F(x)$ 的特征函数，下面利用特征函数的唯一性来说明序列 $\{F_n\}_{n\ge1}$ 弱收敛于 $F$ .

假设存在 $F$ 的连续点 $x_0:F_n(x_0)\not\rightarrow F(x_0)$ ，因为 $\{F_n(x_0)\}_{n\ge1}$ 为有界序列，所以存在收敛子列 $\{F_{n_k'}(x_0)\}\rightarrow y_0$ ，由 Helly 第一定理，存在子序列 $\{F_{n'_{k_l}}\}^{l\ge1}$ 收敛于 $F^*:F^*(x_0)=y_0$ ，且由之前论证可知 $F^*$ 也为分布函数，对应的特征函数为 $f(t)$ ，与特征函数的唯一性矛盾！

## 中心极限定理

设 $\{\xi_i\}_{1\leq i\leq n}$ ，令 $S_n=\sum\limits_{i=1}^{n}\xi_i,\overline{X_n}=\frac{1}{n}\sum\limits_{i=1}^{n}\xi_i$ ，如果 $ES_n,DS_n$ 均存在，则 $\frac{S_n-ES_n}{\sqrt{DS_n}}\overset{d}{\rightarrow}\mathcal{N}(0,1)$ ，或者写作 $\frac{\overline{X_n}-E\overline{X_n}}{\sqrt{D\overline{X_n}}}\overset{d}{\rightarrow}\mathcal{N}(0,1)$ ，则称 $\{\xi_i\}_{1\leq i\leq n}$ 满足**中心极限定理**.

>[!note] De Movie - Laplace 定理：设 $\mu_n$ 为 $n$ 次 Bernoulli 试验中事件 $A$ 出现的次数，每一次试验 $A$ 出现的概率为 $p\in(0,1)$ ，对于任意的有限区间 $[a,b]$ ，有 1) 当 $x_k=\frac{k-np}{\sqrt{npq}}\in[a,b]$ 时 $\mathcal{P}\left\{a\leq \frac{\mu_n-np}{\sqrt{npq}}<b\right\}\rightarrow \int_a^b \varphi(x)dx$ ；2) $\frac{\mathcal{P}(\mu_n=k)}{\frac{1}{\sqrt{npq}}\frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}x_k^2}}\rightarrow1$

# 附录 I 常见变量的数字特征



