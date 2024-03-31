数据结构主要分为**线性**和**非线性**两种，其中线性数据结构包含：数组、链表、栈、堆等，非线性数据结构分为树状和非树状两种.

以上考虑的是数据结构的**逻辑结构**，其实现依赖于物理上的**存储结构**：使用连续（如数组）或者离散的存储空间（如链表）.

算法依托于数据结构进行，一般用时间复杂度和空间复杂度计算算法复杂度. 对于时间复杂度，由于硬件和广义上的操作系统（ e.g. 编译器）的不同，通常只考虑最基础操作的数量. 并且只考虑最高阶. 常见的时间复杂度有 $\mathcal{O}(1),\mathcal{O}(n),\mathcal{O}(n\log n),\mathcal{O}(n^2)$ .

# 面向对象编程

**OOP**（object-oriented-programming）并不首先关注内部实现，而是将问题转换为多个对象之间传递信息，设计每一个对象用于接收信息的接口和响应（在 C++ 对应于类设计中的声明）. 这个过程中会将数据（**成员变量**）和函数（**成员函数 / 方法**）**封装**为对象. 不同的对象可能具有相同的特征，可以抽象为**类**. 类可以视为一个**抽象数据类型**（abstract data type, ADT），可以表示为一个三元组 $(D,R,P)$ ，对应数据、关系和处理（processing）.

每个对象具有可以接收消息的接口，根据接口调用相应的方法. 从而限制用户对于对象内部的的访问，保护内部实现.

类与类之间可以存在**继承**关系，分别称为**基类** / 父类和**派生类** / 子类. 子类可以继承父类的特征，**重写**或者添加新的特征.

```python
class ParentClass():
	def __init__(self):
		self.attr1 = "";
		self.attr2 = "";

	def method1(self):
		print(attr1)

class ChildClass(ParentClass):
	def __init__(self):
		super().__init__() # 调用父类的初始化方法
		self.attr3 = ""
	
	def method1(self):
		super().method1()
		print("rewrite parent's method1")
	
	def method2(self):
		print("add a new method")
```

从同一个基类继承得到的子类具有**多态**：对于同一消息有不同的响应（方法）.

# 时间复杂度

对于同输入输出的算法，需要比较其时间复杂度，一般计算**平均时间复杂度**（实际计算）和**最差时间复杂度**（理论上）.

由于操作平台和硬件不同，因此通常通过计算基本语句的数量估计算法消耗的时间.

# Notation

- $n!=n(n-1)\cdots1$
- 组合数的表示，一般不用 $C_n^k$ ，用 $$\binom{n}{k}=\frac{n!}{k!(n-k)!}=\frac{n(n-1)\cdots(n-k+1)}{k!}$$ 或称为**二项式系数**（binomial coefficient），二项式展开： $$(x+y)^n=\sum\limits_{k=0}^{n}\binom{n}{k}x^ky^{n-k}$$

# 线性表

线性表的特征如下：

1. 第 1 个元素没有前驱；
2. 最后的一个元素没有后继；
3. 中间的元素各有一个前驱和一个后继.

可以将线性表表示为： $(e_1,e_2,\cdots,e_N)$ . 或称 $e_1$ 为**首结点**， $e_N$ 为**尾结点**.

以上已经定义了 $(D,R)$ . 线性表的操作 $P$ 可以分为如下几类：

- 创建（长度、内存空间、最大长度）；
- 删除整个线性表；
- 查询；
- 更新：插入、删除某个元素；
- 输出：获取某个元素；

以上介绍的 $(D,R,P)$ 是线性表的逻辑结构. 在具体实现时可以从两个方面入手，分别对应连续和离散的物理存储结构.

## 顺序表

顺序表采取连续的存储空间实现线性表，如下：

```cpp
#include <iostream> 
using namespace std; 

template<class T>
class LinearList {
    private:
        int length;
        int MaxSize;
        T* element;
    public:
        LinearList(int LLMaxSize); // 初始化
        ~LinearList(); // 析构函数，删除表
        LinearList<T>& insert(int k, const T& x);
        bool isEmpty() const;
        int getLength();
        bool get(int k, T& x); // 查询
        bool modify(int k, const T& x);
        T* getAddress();
};

template<class T>
LinearList<T>::LinearList(int LLMaxSize)
{
    MaxSize = LLMaxSize;
    element = new T [LLMaxSize];
    length = 0;
}

template<class T>
LinearList<T>::~LinearList()
{
    delete [] element;
}

template<class T>
int LinearList<T>::getLength()
{
    return length;
}

template<class T>
LinearList<T>& LinearList<T>::insert(int k, const T& x)
{
    if (k < 0 || k > length)
        cout << "invalid position";
    else if (length == MaxSize)
        cout << "no place to insert";
    else
    {
        for (int i = length; i > k; i--) element[i] = element[i-1];
        element[k] = x;
        length++;
    }
    return *this;
}

template<class T>
T* LinearList<T>::getAddress()
{
    return element;
}

int main()
{
    LinearList<int> ll(10);
    ll.insert(0,1);
    ll.insert(0,2);
    ll.insert(1,3);
    int len = ll.getLength();
    cout << "Length: " << len << endl;
    int* pl = ll.getAddress();
    for (int i = 0; i < len; i++) { cout << *pl; pl++; }
    return 0;
}
```

## 链表

链表采用的是离散的存储空间，通过指针找到前驱和后继.

需要说明的是，虽然顺序表插入元素的时间复杂度为 $\mathcal{O}(n)$ ，链表插入元素的复杂度为 $\mathcal{O}(1)$ ，但是链表需要先查找（通过索引）到插入位置原先的元素，这一过程的复杂度为 $\mathcal{O}(n)$ ，而顺序表通过索引获取元素的复杂度为 $\mathcal{O}(1)$ #issue %%不太清楚，如果数组长度非常大时时间复杂度还低吗？%%

# 排列

## 排列的表示方式

用 $S$ 表示一个 $n$ 元集合，通常记为 $S=\{1,2,\ldots,n\}$ . $S$ 的一个**排列**是将 $1,2,\cdots,n$ 排成一列，记为 $\pi=\pi_1\pi_2\cdots\pi_n$ . 用 $S_n$ 表示 $S$ 的排列的集合，此为一**对称群**（symmetric group），并且 $\lvert S_n\rvert\overset{def}{=}\#S_n=n!$ .

>[!note]- 用程序生成 $S_n$ . #imcomplete-whatever 
>思路可以考虑抽象代数中生成 $S_n$ 的方法. [stack](https://math.stackexchange.com/questions/903225/generators-of-the-symmetric-group-s-3)

对于排列 $\pi$ 可以从下面几个角度理解：

1) 行表示（one-line notation），即 $\pi=\pi_1\pi_2\cdots\pi_n$ 的写法；
2) 二行表示， $\pi$ 可以看作是一个双射： $$\begin{aligned}
\pi:&S\rightarrow S_n\\
&i\mapsto \pi(i)\overset{def}{=}\pi_i
\end{aligned}$$ 或可写作： $$\pi=\begin{bmatrix}1&2&\cdots&n\\ \pi_1&\pi_2&\cdots&\pi_n\end{bmatrix}$$
3) 矩阵表示，可以采用类似于独热编码的方式. 例如对于 $\pi=1324$ 可以写作： $$\pi=\begin{bmatrix}1&0&0&0\\0&0&1&0\\0&1&0&0\\0&0&0&1\end{bmatrix}$$ 并且可以验证在此标记下对于两个排列的复合（称之为**乘积**） $\pi\circ \sigma$ 等同于对应的矩阵乘法. （注意运算是 $\pi(\sigma(i))$ ）.

上面的矩阵表示是一个**双随机矩阵**，其满足： $$\begin{aligned}
&M=(a_{ij})_{n\times n}\\
&1.a_{ij}\geq0,\forall i,j\\
&2.\Sigma_{k=1}^na_{ik}=1,\forall i\\
&3.\Sigma_{k=1}^na_{kj}=1,\forall j
\end{aligned}$$ 如果将双随机矩阵 $M=(a_{ij})_{n\times n}$ 看作 $\mathbb{R}^{n\times n}$ 中的一个点，可以证明 $\mathbb{R}^{n\times n}$ 上的所有双随机矩阵组成的集合是一个以所有 $M_{\pi}$ 为顶点的**凸包** #issue ，其中 $M_\pi$ 即为排列 $\pi\in S_n$ 的矩阵表示.

4) 排列的圈表示（cycle decomposition / representation），可以将排列分解为排列的乘积，例如： $$\pi=(42135)=(143)(2)(5)$$

除此之外还有**重集**（multiset）上的排列，重集如： $\{1^{m_1},2^{m_2},\cdots,n^{m_n}\}$ ，表示 $m_1$ 个 $1$ ， $m_2$ 个 $2$ ，... ， $m_n$ 个 $n$ 组成的集合. 其排列个数为： $$\frac{(m_1+m_2+\cdots+m_n)}{m_1!m_2!\cdots m_n!}$$

>[!example]- 计算 $\{0^2,1^2,2^2\}$ 能够生成的所有 $6$ 位数个数.
>$\frac{6!}{2!2+2!2+2!2}-\frac{5!}{1!2!2!}=60$ .

定义**第一类Stirling数**： $S_n$ 中圈表示的圈数为 $k$ 的排列的个数.（圈中只有单个数字的也算一个圈）记作 $c(n,k)$ . 可以证明**生成函数**（generative function）：$$\sum\limits_{k=1}^{n}c(n,k)x^k=x(x+1)\cdots(x+n-1)$$ 

>[!note]+ 生成函数的证明
>首先证明引理：
>>[!note]+ $c(n,k)=c(n-1,k-1)+(n-1)c(n-1,k)$
>>证明：在 $S_{n-1}$ 的基础上，1) 对于圈数为 $k-1$ 的排列 $\pi\in S_{n-1}$ 添加一个新的元素 $n$ 则 $n$ 作为一个单独的圈，可以获得一个圈数为 $k$ 的排列； 2) 对于圈数为 $k$ 的排列 $\pi\in S_{n-1}$ 添加一个新的元素（插入到已有的圈中），共有 $n-1$ 种插入方法.
>
>下面利用归纳法进行证明：
>>[!note]- 不妨设 $x(x+1)\cdots(x+n-1)=\sum\limits_{k=1}^{n}c(n,k)x^k$ .
>>原式： $$\begin{aligned} &=x(x+1)\cdots(x+n-2)(n-1)+x(x+1)\cdots(x+n-2)x \\\\ &=\sum\limits_{k=1}^{n-1}c(n-1,k)x^k+\sum\limits_{k=1}^{n-1}c(n-1,k)x^{k+1} \end{aligned}$$
>>进而根据系数比可以得出 $a(n,k)=(n-1)c(n-1,k)+c(n-1,k-1)$ 与引理进行对比，即可得到 $a(n,k)=c(n,k)$ . 证毕.

## 逆序数和主指标

对于排列 $\pi=\pi_1\pi_2\cdots\pi_n$ ，首先定义**逆序**： $1\leq i<j\leq n,\pi_i>\pi_j$ ，则称 $\pi_i,\pi_j$ 成逆序. 不存在逆序的排列 $\pi=12\cdots n$ 称为**单位排列**.

定义逆序数： $\text{inv}(\pi)=\#\{(i,j):1\leq i<j\leq n,\pi_i>\pi_j\}$ .

有下面关于逆序数的生成函数的定理：

>[!note]- $1(1+x)(1+x+x^2)\cdots(1+x+\cdots+x^{n-1})=\sum\limits_{\pi\in S_n}^{}x^{\text{inv}(\pi)}$ ，记 $[k]=1+x+\cdots+x^{k-1}$ ，则上式可以写作 $\sum\limits_{\pi\in S_n}^{}x^{\text{inv}(\pi)}=[n][n-1]\cdots[1]\overset{def}{=}[n]!$ .
>证明：从 $\text{inv}(\pi)$ 的具体形式入手，引入 **lehmer code**： $c_i=\#\{j>i:\pi_j<\pi_i\},1\leq i\leq n$ ，从而有 $\text{inv}(\pi)=c_1+c_2+\cdots+c_{n-1}$ ，进而有 $$\sum\limits_{\pi\in S_n}^{}x^{\text{inv}(\pi)}=\sum\limits_{c_1,c_2,\cdots,c_{n-1},c_n}^{0\leq c_n\leq n-i}x^{c_1+c_2+\cdots+c_n}$$ （注意其中的 $n-i$ ）从而可以写作： $$=\left(\sum\limits_{0\leq c_1\leq n-1}^{}x^{c_1}\right)\left(\sum\limits_{0\leq c_2\leq n-2}^{}x^{c_2}\right)\cdots\left(\sum\limits_{0\leq c_n\leq 0}^{}x^{c_n}\right)=[n]!$$ 证毕.

下面引入另一种与排列相关的量：排列的逆序所在的索引的累加**主指标**（major index）： $$\text{maj}(\pi)=\sum\limits_{1\leq i<j\leq n,\pi_i>\pi_j}^{}i$$ 例如： $\text{maj}(3142)=1+3=4$ .

并且可以证明：

>[!note]- $\sum\limits_{\pi\in S_n}^{}x^{\text{maj}(\pi)}=\sum\limits_{\pi\in S_n}^{}x^{\text{inv}(\pi)}$ . #imcomplete-whatever 

# 组合

**乘法原理**，**加法原理**

**多重组合数**： $$\begin{aligned}
\binom{n}{k_1k_2}&=\binom{n}{k_1}\binom{n-k_1}{k_2}\\
&=\frac{n!}{k_1!(n-k_1)!}\frac{(n-k_1)!}{k_2!(n-k_1-k_2)}\\
&=\frac{n!}{k_1!k_2!(n-k_1-k_2)!}
\end{aligned}$$

$$\binom{n}{r}=\binom{n-1}{r-1}+\binom{n-1}{r}$$ （证明：包含和不包含 $n-1$ ）

$$\begin{aligned}
&2^n=\binom{n}{0}+\binom{n}{1}+\cdots+\binom{n}{n}\\
&n2^{n-1}=\binom{n}{1}+2\binom{n}{2}+\cdots+n\binom{n}{n}
\end{aligned}$$

>[!note]- $\binom{m+n}{k}=\sum\limits_{i=0}^{k}\binom{m}{i}\binom{n}{k-i}$ . #imcomplete-whatever 
>证明：考虑 $$(1+x)^{m+n}=(1+x)^m(1+x)^n$$

# 排序算法

## 堆栈排序（stack sorting）

>[!example]- 汉诺塔（Tower of Hanoi）：有三根杆子 $A,B,C$ ，其中 $A$ 杆上的圆盘大小自上而下呈递增趋势，下面要将所有的圆盘转移到 $C$ 上，在此过程中需要满足以下两个条件：1) 每一次只能移动一个圆盘；2) 大圆盘不能放置在小圆盘上. 问：对于 $n$ 个圆盘，需要移动多少次才能全部转移到 $C$ 杆上.
>假设对于 $n$ 个圆盘需要移动 $a_n$ 次，可以证明： $$a_n=a_{n-1}+1+a_{n-1}$$ （即，首先将 $n-1$ 个圆盘移动到 $B$ 杆上，将最大圆盘移动到 $C$ 杆上，再将 $n-1$ 个圆盘移动到 $C$ 杆上. 又 $a_1=1$ ，可得 $a_n=2^n-1$ .

```algorithm
堆栈排序算法

输入: 排列 pi=pi_1pi_2...pi_n ；
输出: 排列 S(pi)=sigma_1sigma_2...sigma_n

for i = 1; i<n; i++:
	1. 将 pi_i 放入栈中；
	2. 将 pi_{i+1} 放入栈中，与 pi_i 比较， if:
		pi_{i+1} > pi_i : 将 pi_i 取出放在堆的第一位，返回步骤 1.
		pi_{i+1} < pi_i : 返回步骤 1. 
```

堆栈排序的时间复杂度为 $\mathcal{O}(n)$ ，但是并不能输出的排列 $S(\pi)$ 为 $\text{id}=12\cdots n$ . 下面考虑当排列满足什么性质时输出的排列为 $\text{id}$ . 为此首先要引入**模式**（pattern）这一概念：

对于 $\pi\in S_n,\sigma\in S_m$ 称 $\pi$ 包含 $\sigma-$ pattern，如果存在 $\pi$ 的**子字**（subword） $\pi_{i_1}\pi_{i_2}\cdots \pi_{i_m}=\sigma$ .

如果一个排列经过堆栈算法之后得到的排列为 $\text{id}$ ，则称该排列**可堆栈排序**（stack-sortable）.

>[!note]- $\pi\in S_n$ 可堆栈排序当且仅当 $\pi$ 包含 $231-$ pattern.
>证明：首先易证对于排列： $\pi=\pi_Ln\pi_R$ ，经过堆栈排序之后得到 $S(\pi)=S(\pi_L)S(\pi_R)n$ .
>$\Rightarrow$ ： 如果 $\pi$ 包含 $231-$ pattern，不妨设 $\pi=(\pi_1\cdots \pi_{i-1})n(\pi_{i+1}\cdots \pi_{n})=\pi_Ln\pi_R$ ，允许 $\pi_L$ 或者 $\pi_R$ 中不包含任何元素. 可知 $\pi_L$ 或者 $\pi_R$ 中至少有一个包含 $231-$ pattern ，不妨设 $\pi_L$ 中含有 $231-\text{pattern}$ 
>
>可以分为如下两种情况讨论：
>
>1. $\pi_L$ 中的任何一个元素小于 $\pi_R$ 中的元素. 由上可知存在 $\pi_i\pi_k\pi_l(1\leq i<k<l\leq i-1):\pi_l<\pi_i<\pi_k$ ，按照堆栈排序算法，经过排序之后 $\pi_i$ 一定排在 $\pi_k$ 之前，而 $\pi_l$ 将排在 $\pi_k$ 之后，从而不会得到 $\text{id}$ .
>2. $\pi_L$ 中存在元素大于 $\pi_R$ 中的元素，由上引理 $S(\pi)=S(\pi_L)S(\pi_R)n$ 可知不会得到 $\text{id}$ .

堆栈排序实现：

```cpp
class StackSorting
```

### 计数问题

#imcomplete-whatever 

考虑经过堆栈排序之后得到 $\text{id}$ 的排列（即为不包含 231-pattern 的排列）的数量： $\#\{\pi\in S_n:S(pi)=\text{id}\}$ . 称为**Cataland数** $C_n$ ，可以证明： $C_n=\frac{1}{n+1}\binom{2n}{n},C_0=1$ . $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ . ^Cataland

并且可以证明： $\#\{\pi\in S_n:\pi\text{ 不包含 }\sigma-\text{pattern}\}=C_n$ .

## 耐心排序（patience sorting）

以一个纸牌游戏为场景：假设一组纸牌的排列为 $\pi$ ，现在依次抽取 $\pi_i,i=1,\cdots,n$ . 如果 $\pi_{i}>\pi_{i-1}$ ，则形成一新的牌堆，以 $\pi_i$ 为该牌堆的首牌，如果 $\pi_i<\pi_{i-1}$ ，则或可选择让该牌作为首牌形成一新的牌堆，或可选择让该牌加入到 $\pi_{i-1}$ 所在的牌堆上（ $\cdots\pi_{i-1}\pi_i$ ）.

现在的问题是：如何进行选择能够使得最终形成的牌堆数目最小？

### 贪心算法

**贪心算法**指的是每次行动都按照最大化当前利益的原则进行选择.

在大多数情况下使用贪心算法得到的结果不会是最差的，但不一定是最好的. 然而可以证明在上述情况下：每次将牌 $\pi_i$ 放置在最左侧（默认从左向右生成牌堆）最终可以取得最小的牌堆数.

事实上有下列结论：定义排列 $\pi$ 的递增子列 $\pi_{i_1}\pi_{i_2}\cdots \pi_{i_k}(i_{m}<i_{m+1},m=1,\cdots,k-1),\pi_{i_m}<\pi_{i_{m+1}}$ .

>[!note]- 贪心算法形成的堆的个数等于最长递增子列的长度.
>证明：
>1. 堆的个数 $\geq$ $\pi$ 的最长递增子列的长度 $\text{in}(\pi)$ . 由贪心算法，对于任意 $\pi_i<\pi_j(i<j)$ ，两者映定不出现在同一个堆中，所以最终形成的堆数大于等于 $\text{in}(\pi)$ .
>2. 堆的个数 $\leq$ $\pi$ 的最长递增子列的长度 $\text{in}(\pi)$ . 由贪心算法过程，一定能从堆中获取一个递增子列. 从而堆数小于等于 $\text{in}(\pi)$ .

又由一般的排列规则，任何遵从排序规则的排法一定会包含有一个最长递增子列长度的子列，因此贪心算法形成的牌堆数量最少.

事实上可以用贪心算法快速得到一个排列中的最长递增子列. 例如对于 `7 2 8 1 3 4 10 6 9 5` ，经过贪心算法后得到： `721 83 4 10&65 8` ，其中有递增序列： `13468` （并不一定是最顶层）

#imcomplete 经过耐心排序之后再经过一次插入排序就可以得到顺序排列.

## R.S. 算法

下面介绍的 R.S. 算法是另一种同时确定最长递增和最长递减子列长度的方法.

首先定义**整数分拆**（integer partition）：设 $n\in \mathbb{N}$ ，称 $\lambda=(\lambda_1,\lambda_2,\cdots,\lambda_k)$ 为 $n$ 的分拆，如果 1. $\lambda_1+\lambda_2+\cdots+\lambda_k=n$ ； 2. $\lambda_1\geq \lambda_2\geq \cdots\geq \lambda_k$ （弱递降）. 记为 $\lambda\vdash n$ . 称 $k$ 为分拆 $\lambda$ 的长度，记为 $l(\lambda)$ ， $\lambda_i(1\leq i\leq k)$ 称为 $\lambda$ 的部分（part）.

>[!example]+ $3$ 的所有分拆
>$(1,1,1),(2,1),(3)$ .

求解分拆的过程就是求解一**丢番图方程**（未知数为整数的多项式， [check](https://zh.wikipedia.org/zh-cn/%E4%B8%9F%E7%95%AA%E5%9C%96%E6%96%B9%E7%A8%8B)）

可以用**杨图**（young diagram）表示分拆 $\lambda=(\lambda_1,\cdots,\lambda_k)$ ，其第 $i$ 行有 $\lambda_i$ 个方块. 例如 $3$ 的杨图： 

![[YoungDiagram.png]]

定义**杨表**（young tablean）：将 $n$ 个不同的正整数填入到 $\lambda$ 对应的杨图中，要求：每行从左至右<u>严格</u>递增，每列从上至下<u>严格</u>递增，称 $\lambda$ 为杨表的**形状**. 如果限制填入杨表的数字为 $\{1,2,\cdots,n\}$ 中的元素，则称对应的杨表为**标准杨表**，并记这种标准杨表的个数为 $f^\lambda$ . 定义**勾长**（hook length）：对 $u\in \lambda$ ， $h_u$ 表示 $u$ 所在同行右侧和同列下册的方块数目，包括 $u$ 本身.

>[!example]- $3$ 的各个分拆 $\lambda$ 对应的标准杨表的个数 $f^\lambda$ .
> $f^{(3)}=1,f^{(2,1)}=2,f^{(1,1,1)}=1$ ，具体见[[DSDraw]].

>[!note]- 若 $\lambda\vdash n$ ，则 $f^\lambda=\frac{n!}{\prod_{u\in \lambda}^{}h_u}$ 

下面介绍 R.S. 算法，其构造 $S_n$ 到 $\{(P,Q):P,Q\ \text{为形状相同的标准杨表}\}$ 之间的一个映射.

首先介绍下面这个算法：

```
杨表添加元素

输入：杨表 T ，正整数 i （与杨表中已经填入的数字没有重复）
输出：杨表 T'

r = 0;
while (r<=n):
	if i > 第 r+1 行中所有元素:
		将 i 插入到该行末尾， return T';
	else if i < 该行中的某个元素，设为 j:
		用 i 替换 j 所在块;
		i = j;
		r++;
```

$T'$ 的形状由 $T$ 在某一行加上一个元素得到.

>[!note]- 上述算法是**可逆**的：给定 $T'$ 和一标记方块（corner）可以得到初始杨表 $T$ 以及一整数 $i$ .
>只需要用下面这个算法即可：
>```
>输入：杨表 T' ，标记 T' 中一方块;
>输出：杨表 T 和一整数 i.
>
>r = 标记方块所在行;
>i' = 标记方块中放置的数字;
>while (r>1):
>	设第 r-1 行中小于 i' 的最大的数字为 j ;
>	用 i' 替换 j 所在区块;
>	i' = j
>	r--;
>```

下面给出 R.S. 算法：

```
R.S. 算法

输入: 排列 pi=pi_1pi_2...pi_n;
输出: (P,Q): P,Q 是具有相同形状的标准杨表.

记上面定义的杨表添加元素算法为 T' add(T, i);
count = 0;

# 初始化两个杨表:
P = add(NULL, 1);
Q = add(NULL, 2);
count++;

# P 按照排列 pi 中的顺序依次放入元素; Q_1 按照排列 I=12...n 依次放入元素
while (count < n):
	P = add(P, pi[count+1]);
	Q = add(Q, I[count+1]);
	count++;
```

由杨表添加元素算法可逆可知 $\pi$ 与 $(P,Q)$ 之间建立了双射. 从而建立了 $S_n$ 到 $\{(P_1,Q_1),\cdots,(P_{n!},Q_{n!})\}$ （其中 $P_i,Q_i(1\leq i\leq n!)$ 是形状相同的标准杨表）之间的双射. 有以下结论：

>[!note]- $n!=\sum\limits_{\lambda\vdash n}^{}(f^\lambda)^2$ .
>证明：对于形状为 $\lambda$ 对应的所有标准杨表，其组成二元组之后共有 $(f^\lambda)^2$ . 所以所有的标准杨表可以对应于 $\sum\limits_{\lambda\vdash n}^{}(f^\lambda)^2$ 种情况（注意二元组中两个标准杨表的形状要求是一致的），再有双射可得结论.

此外还有以下结论：

>[!note]- 若 $\pi\in S_n$ 对应于 $(P,Q)$ ，则 $\pi^{-1}$ 对应于 $(Q,P)$ .

R.S. 算法可以同时得到最长递增、最长递减子列的长度：

>[!note]- 设 $\pi\leftrightarrow(P,Q)$ ，则 $\text{in}(\pi)$ 等于 $P$ 第 $1$ 行的方块数， $\text{de}(\pi)$ 对应于 $P$ 第 $1$ 列方块数.

R.S 算法与耐心排序相比可以同时计算最长递增和递减子列的<u>长度</u>，但并不能找到一个符合要求的子列. 此外 R.S 算法比较耗时.

>[!example]- $101$ 个身高不同的人随机地排成一列，至少有 $11$ 个人严格递增或者严格递减.
>证明：也就是对于任意 $\pi\in S_{101}$ ，其递增子列和递减子列的长度至少有一个大于 $11$ ，反证两者都 $<=10$ ，则 $\pi$ 对应的杨表中的元素 $\leq10^2=100$ 矛盾！

### Gauss 系数

定义 $\begin{bmatrix}2n  \\ n\end{bmatrix}=\frac{[2n]!}{[n]![n]!}$ ，有结论： $\begin{bmatrix}2n \\ n\end{bmatrix}=\sum\limits_{\lambda\in \text{YoungDia}^{n\times n}}^{}q^{\lvert \lambda\rvert}$ . 其中 $\text{YoungDia}^{n\times n}$ 表示的是能够放入 $n\times n$ 个小方格排列成的正方形中的全体杨图. $\lvert \lambda\rvert$ 则表示杨图中的小方块的个数.

例如：考虑 $\begin{bmatrix}4  \\ 2\end{bmatrix}$ ，注意到能够放入 $2\times2$ 个小方格排列称的正方形中的杨图有 $\emptyset$ （空图）， $(1),(2),(1,1),(2,1),(2,2)$ ，从而 $$\begin{bmatrix}4 \\ 2\end{bmatrix}=1+q+2q^2+q^3+q^4$$ 并且观察到系数呈先递增后递降顺序，该结论可以推广到所有 $n\geq1$ 的情形.

# 格路

**格路**（lattie path）指的是由邻接的格子（也可能是多边形）拼起来后，相邻的格子重叠的部分形成的路径. 例如 $\mathbb{Z}^2$ 形成的格路，在格路上可以定义移动，例如 $U,R,D,L$ .

## Dyck 路

首先介绍**自由 Dyck 路**（free dyck path）： $\mathbb{Z}^2$ 上由 $(0,0)$ 到 $(n,n)$ 的格路，只允许进行 $U,R$ 移动，称为 **n 长 Dyck 路**，则不难证明这样的 Dyck 路有 $\binom{2n}{n}$ 条.

**n 长 Dyck 路**首先是自由 Dyck 路，并且满足始终位于 $y=x$ 的上方（允许触碰到 $y=x$ ）. 可以用符号抽象 Dyck 路，例如当 $n=2$ 时有 Dyck 路 $UURR,URUR$ . 一般地，对于 $n$ 长 Dyck 路，其有 $C_n=\frac{1}{n+1}\binom{2n}{n}$ 条 Dyck 路， $C_n$ 即为 [Cataland数](#^Cataland). 并且有这个公式可以看出 $n$ 长 Dyck 路占自由 Dyck 路的 $1/(n+1)$ .

对于 Cataland 数，可以先证明其递归公式： $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ .

>[!note]- 设 $C_n$ 为 $n$ 长 Dyck 路的个数，定义 $C_0=1$ ，证明 $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ .
>证明：用 $L$ 表示一个 $n$ 长 Dyck 路，按照如下规则将其划分为 $L_1,L_2$ 两条路：以除零点外第一个接触 $y=x$ 轴的点为分点划分 $L$ ，如果该点为 $(n,n)$ 则记 $L_2=\emptyset$ ，并设 $L_1$ 的落点位置为 $(i,i)$ ，则 $L_2$ 有 $C_{n-i}$ 种. 进一步，将 $L_1$ 的起始向上和终止向右曲调，则 $L_1$ 可以由一条 $i-1$ 长 Dyck 路决定，有 $C_i$ 种，从而 $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ .

除此之外， $n$ 长 Dyck 路、不含 231-pattern 的排列全体还有如下的等价结构：

- 由 $n$ 个 $1$ 和 $n$ 个 $-1$ 构成的排列全体，并且满足 $\forall k\geq1,\sum\limits_{i=1}^{k}\pi_i\geq0$ ；
- 考虑形状为 $(n,2)$ 的标准杨表，






# 递归

也成为**分而治之策略**（divide-and-conquer strategy）.

C++ 中每次递归都会创建一个新的变量，相应的递和归具有相同的变量（内存地址）


