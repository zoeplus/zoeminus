# 依赖与简介

依赖： [C++](CPP.md)

数据结构主要分为**线性**和**非线性**两种，其中线性数据结构包含：数组、链表、栈、堆等，非线性数据结构分为树状和非树状两种.

以上考虑的是数据结构的**逻辑结构**，其实现依赖于物理上的**存储结构**：使用连续（如数组）或者离散的存储空间（如链表）.

算法依托于数据结构进行，一般用时间复杂度和空间复杂度计算算法复杂度. 对于时间复杂度，由于硬件和广义上的操作系统（ e.g. 编译器）的不同，通常只考虑最基础操作的数量. 并且只考虑最高阶. 常见的时间复杂度有 $\mathcal{O}(1),\mathcal{O}(n),\mathcal{O}(n\log n),\mathcal{O}(n^2)$ .

# 伪代码标准

```cpp title="伪代码语句" linenums="1"
// 当有多个语句时，为了后文便于解释加上序号
1. statement1;
2. statement2;

while condition statement:
    statements;

if condition statement:
    statements:
```

其他规定：

- 在写伪代码的时候不显示指定任何数据结构，也不使用数据结构对应的接口. e.g. 如果某一问题适合用栈解决，在代码实现时或用该结构，但是在伪代码中不用这一结构表示，也不使用 `.pop()` ， `.push()` 等与该结构相关的接口；
- 伪代码中的数据结构一律用集合表示；

不加声明的常用函数：

```title="伪代码常用函数" linenums="1"
min(S)
min(a, b)
max(S)
max(a,b)

# 默认降序排序
sort(S, reverse = false)
# 根据 W 对 S 进行排序
sort(S, W)
```

# 面向对象编程

**OOP**（object-oriented-programming）并不首先关注内部实现，而是将问题转换为多个对象之间传递信息，设计每一个对象用于接收信息的接口和响应（在 C++ 对应于类设计中的声明）. 这个过程中会将数据（**成员变量**）和函数（**成员函数 / 方法**）**封装**为对象. 不同的对象可能具有相同的特征，可以抽象为**类**. 类可以视为一个**抽象数据类型**（abstract data type, ADT），可以表示为一个三元组 $(D,R,P)$ ，对应数据、关系和处理（processing）.

每个对象具有可以接收消息的接口，根据接口调用相应的方法. 从而限制用户对于对象内部的的访问，保护内部实现.

类与类之间可以存在**继承**关系，分别称为**基类** / 父类和**派生类** / 子类. 子类可以继承父类的特征，**重写**或者添加新的特征.

/// collapse-code
```python title="Python 中定义类" linenums="1" 
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
///

从同一个基类继承得到的子类具有**多态**：对于同一消息有不同的响应（方法）.

# 时间复杂度

对于同输入输出的算法，需要比较其时间复杂度，一般计算**平均时间复杂度**（实际计算）和**最差时间复杂度**（理论上）.

由于操作平台和硬件不同，因此通常通过计算基本语句的数量估计算法消耗的时间.

# 符号说明

$[n]=\{1,\cdots,n\}$ ；

$n!=n(n-1)\cdots1\overset{def}{=}[n]!$ ；

组合数的表示，一般不用 $C_n^k$ ，用 
  
$$\binom{n}{k}=\frac{n!}{k!(n-k)!}=\frac{n(n-1)\cdots(n-k+1)}{k!}$$
  
或称为**二项式系数**（binomial coefficient），二项式展开： 
 
$$(x+y)^n=\sum\limits_{k=0}^{n}\binom{n}{k}x^ky^{n-k}$$

# 线性表

**线性表**（linear list）的特征如下：

1. 第 1 个元素没有**前驱**（predecessor）；
2. 最后的一个元素没有**后继**（successor）；
3. 中间的元素各有一个前驱和一个后继.

可以将线性表表示为： $(e_1,e_2,\cdots,e_N)$ . 或称 $e_1$ 为**首结点**， $e_N$ 为**尾结点**.

以上已经定义了 $(D,R)$ . 线性表的操作 $P$ 可以分为如下几类：

- 创建（长度、内存空间、最大长度）；
- 删除整个线性表；
- 查询；
- 更新：插入、删除某个元素；
- 输出：获取某个元素；

以上介绍的 $(D,R,P)$ 是线性表的逻辑结构. 在具体实现时可以从两个方面入手，分别对应连续和离散的物理存储结构. 一般称为顺序实现和链式实现.

## 顺序表

**顺序表**采取连续的存储空间实现线性表，在 C++ 中顺序表（数组）是内置的数据结构，设数组 $A=\{A[0],\cdots,A[n-1]\}$ ，记 $A[0]$ 的地址为 $A$ 的起始地址，每一个元素占用的存储空间为 $d$ ， $A[s](0\leq s\leq n-1)$ 的物理存储地址为 $i+s*d$ 如下：

/// collapse-code
```cpp title="顺序表" linenums="1"
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
LinearList<T>::LinearList(int LLMaxSize) {
    MaxSize = LLMaxSize;
    element = new T [LLMaxSize];
    length = 0;
}

template<class T>
LinearList<T>::~LinearList() {
    delete [] element;
}

template<class T>
int LinearList<T>::getLength() {
    return length;
}

template<class T>
LinearList<T>& LinearList<T>::insert(int k, const T& x) {
    if (k < 0 || k > length)
        cout << "invalid position";
    else if (length == MaxSize)
        cout << "no place to insert";
    else {
        for (int i = length; i > k; i--) element[i] = element[i-1];
        element[k] = x;
        length++;
    }
    return *this;
}

template<class T>
T* LinearList<T>::getAddress() {
    return element;
}

int main() {
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
///

## 链表

链表采用的是离散的存储空间，通过指针找到前驱和后继.

需要说明的是，虽然顺序表插入元素的时间复杂度为 $\mathcal{O}(n)$ ，链表插入元素的复杂度为 $\mathcal{O}(1)$ ，但是链表需要先查找（通过索引）到插入位置原先的元素，这一过程的复杂度为 $\mathcal{O}(n)$ ，而顺序表通过索引获取元素的复杂度为 $\mathcal{O}(1)$ #issue %%不太清楚，如果数组长度非常大时时间复杂度还低吗？%%

| #imcomplete 

```cpp title="C++ 实现链表"

// 链表的销毁需要一个一个节点进行
void ~LinkedList(LinkedList& L) {
    while (L) {
        T* p = L;
        L = L->next;
        free(p);
    }
    L = nullptr;
}
```

以上实现的是单向链表，此外还有**循环链表**：尾部指针指向头；**双向链表**：每一个元素都分别有一个指向前驱和后继的指针.

## 线性表的应用

| #imcomplete-further-wanted 

## 广义表

广义表（向量）：线性表的推广，不要求线性表中的元素具有相同的数据类型；可表示为 $V=\{V[0],\cdots,V[n-1]\}$ ，定义元素的**秩**（rank）为其前驱元素的数量，通过秩访问元素的方式被称为**循秩访问**（call-by-rank）. 例如：

- $A = ()$ ；
- $C = (a,(b,c,d))$ ；
- $D = (A, B, C)$ ；
- $E = (e, E)$

# 栈

C++ 中提供了实现栈的模板类 [stack](CPP.md#stack)

## 栈的应用

>[!example]- 括号匹配.

>[!example]- 根据运算符（前缀/中缀/后缀）的优先级求解表达式的值. E.g. $4+5*5-10$ .
>算法依赖于两个栈进行，其中一个栈存储运算数，另一个栈存储运算符.

>[!example]- 多项式相加. 适合用链表求解.
>考虑简单的情形，一元多项式可以被表示为 $(a_0,e_0),\cdots,(a_n,e_n)$ 的形式，其中 $a_i,e_i,1\leq i\leq n$ 分别表示系数和指数.

>[!example]- 进制转换.

# 队列

队列分别有一个只有一个前驱和只有一个后继的元素，称为**队头**（front）和**队尾**（rear），剩余的元素都只有一个前驱和一个后继. 队列遵从**先进先出**（FIFO）的数据存放机制，但也有另外定义出入顺序的**优先列表**.

首先考虑用顺序结构实现链表：问题主要出现在对 `pop()` 和 `push()` 的定义，如果用一个定长的数组实现，则需要分别指定队头 `front` 和队尾 `rear` ，按照[[#顺序表]]的插入 / 删除方法，以 `pop()` 为例， `front` 会和 `rear` 重合，即**假上溢**. 因此考虑采取循环（取模）. #imcomplete 此外还需要定义队列的长度，以区分队列为空和队列为满的情况.

用链式结构实现队列则要简单地多： #imcomplete 

也可以用 C++ 中的模板类 [deque](CPP.md#deque) 实现.

## 队列的应用

| #imcomplete 

>[!example]- 计算杨辉三角.

>[!example]- 叫号机：模拟三个队列（窗口），1) 先到先服务（叫号机），计算平均等待时间 / 2) 只能单个窗口排队，计算平均等待时间；为什么 1) 要比 2) 好?
>BankQueueSimulator 模拟顾客号、顾客到达时间（随机），服务时间（随机）；

## 栈与队列的区别

根据算法选择数据结构时，需要考虑问题中对数据进行的操作. 栈和队列的根本区别在于对于数据的<u>缓冲</u>不同：数据存入的顺序与处理的顺序是否保持一致，一致则采取队列（先进先出），否则采取栈（后进后出）.

# 图

设集合 $V$ ，定义 $E\subset V\times V$ ，称为 $V$ 上的边集，称 $G=(V,E)$ 为**图**. 如果 $\forall e=(v_i,v_j)\in E$ 若存在 $e'=(v_j,v_i)$ 认为 $e\neq e'$ ，则称 $G$ 为**有向图**，若 $\forall e=(v_i,v_j)$ ，认为 $(v_i,v_j)=(v_j,v_i)$ ，则称 $G$ 为**无向图**；否则，称 $G$ 为**混合图**.

称 $G$ 为**加权图**，如果定义 $f:E\rightarrow \mathbb{R}$ ， $G=(V,E,w)$ ， $w(e)$ 称为边 $e$ 的**权重**；

定义**路径**：存在 $P=\{(i, v_1),\cdots, (v_n,i)\}\subset E$ 则称 $i,j$ 之间存在路径；定义**圈 / 回路**，存在 $i$ 到 $i$ 的路径；定义**连通图**：对于任意的 $i, j\in V$ ，存在 $i$ 到 $j$ 的路径；定义**连通区域** $(V',E')\subset (V,E)$ ：区域中的任意两点都有路径；

定义图中的结点的度 $d(v)=\#\{e: v\in e\}$ ，表示和 $v$ 相关联的边的个数（而不是定义作结点的个数，考虑重边）；

定义**简单图**：无重边，无圈的无向图；**完全图**：图中的任意两个点都有边，此时 $\lvert E\rvert=C_{\lvert V\rvert}^2$ ，并且 $\sum\limits_{v\in V}^{}d(v)=2 \lvert E\rvert$ ， $d(v)=n-1,\lvert E\rvert=\frac{n(n-1)}{2}$ ；

# 树

**树**是连通简单图（无重边，无圈，无向）；由定义，树中一定有度为 $1$ 的点，称为叶结点，其他的点则称为内点.

定义图的**生成树**：若 $(V',E')$ 是 $(V,E)$ 的连通子图，并且 $V'=V$ ，且为简单图（符合树的定义）

树具有以下性质：

>[!note]- 对于 $T=(V,E), V-E=1$
>证明：一方面，由树无圈知树中的任意两个结点至多只有一个关联的边，由树的连通性可知任意两个结点至少有一个关联的边，所以任意两个结点都有一个关联边，从而得结论；另一方面，根据 Euler 定理： $V-E+F=2$ ，在图中， $V,E$ 分别表示结点数和边数， $F$ 表示连通区域的个数，而在树中连通区域只有一个，树本身 #ilp ，因此 $F=1$ ，所以 $V-F=1$ .

>[!note] 生成树是原图 $G$ 的极小连通子图：去掉生成树任何一条边后得到的图不连通，在生成树上增加任何一条边都会产生圈；

树可以分为：
- **有根树** / **无根树**；
- **有向树** / **无向树**；
- **编号树** / **非编号树**；
- **有序树** / **无序树**；

---

从数据结构实现角度考虑，**树**是非线性结构，一个元素可以有多个后继，但最多有一个前驱.

可以用递归的方式定义树：考虑 $n$ 个元素组成的集合，若 $n=0$ 则称该树为空树， $n>0$ 时，其满足以下条件：

1. 有且只有一个元素没有前驱，称为**根结点**，称其后继为**分支结点**.
2. 将根结点去除后，剩下的 $n-1$ 个元素形成两两不交的集合，每个集合称为一个**子树**，其满足 1. 2. 条件.

称没有后继的元素为**叶结点**. 根结点、分支结点和叶结点统称为**结点**，结点的后继的数量称为该结点的**度**. 树的度则定义为其所有结点的度的最大值.

结点 $n$ 与其后继 $n_1$ 之间的“连线” $(n,n_1)$ 称为**分支**， $s,t$  两个结点之间的路径则为 $(s,n_1),(n_1,n_2),\cdots,(n_{l-1},t)$ 组成的集合，其中 $n_m$ 为 $n_{m-1}$ 的后继（ $n_l=t,n_0=s,1\leq m\leq l$ ），记为 $(s,n_1,n_2,\cdots,n_{l-1}, t)$ ，由树的定义，如果两个结点之间存在路径，则路径唯一.

树有多种类别：按照是否关心树的左右顺序有**有序树**和**无序树**.

## 有序平面树

>[!summary] 自查表
>- 有序平面树的定义（这也是数据结构中对于一般的树的定义）；
>- $n$ 边有序平面树的个数以及证明思路；

定义**有序平面树**（planar trees）： 树 $T=(V,E)$ ， $V$ 中有一个特定点 $s$ 称为**根**. $V\backslash s$ 后形成多个连通子图： $S_1,\cdots,S_n$ ，两两不交，并且仍然为有根树，称为**子树**，如果子树之间有序关系存在（分左右），则称 $T$ 为**有序平面树**.

定义从根到叶结点的路径经过的结点个数为该结点的**层数**（e.g. $s,v_1,\cdots,v_n$ 则 $v_n$ 的层数为 $n+1$ ），并可以定义树的**深度**：最大的结点层数；

有序平面树因此是“有向”的（尽管如此，仍然没有承认树具有有向边，与树的定义：连通简单图并不矛盾）：对于有关联边的两个结点 $v_i,v_j$ ，如果 $v_i$ 的层数比 $v_j$ 的要小，则称 $v_i$ 为 $v_j$ 的**父结点**， $v_j$ 称为 $v_i$ 的**子结点**（child）；如果 $v_j$ 的层数比 $v_i$ 低，但存在 $v_i$ 和 $v_j$ 之间的一条路径，则称 $v_j$ 为 $v_i$ 的**后代**（descendant）；如果 $v_i,v_j$ 层数相同，并且有相同的父结点，则互为**兄弟结点**（sibiling），如果层数相同但是没有相同的父结点，则互为**堂兄弟**.

>[!hint]+ 在数据结构的具体实现中，借助前驱和后继的说法也可以再对上述概念作出解释.
>根据结点之间的前驱后继关系可以定义： **父结点 / 双亲结点**：结点的直接前驱；**子结点**：结点的直接后继；**兄弟**：两个结点具有同一个直接前驱结点；**祖先**：该结点的前驱；**后代**：结点的后继.

>[!question] 以上的定义能否说明 $S_i$ 的根与 $s$ 有关联边？

下面讨论 $n$ 边（ $n+1$ 顶点）的有序平面树的个数，记为 $t(n)$ .

>[!note]- $t(n)=C_n=\frac{1}{n+1}\binom{2n}{n}$ .
>证明：考虑 $n$ 边有序平面树 $T$ ，设 $s$ 与其最左边的子结点之间的关联边为 $e$ . 考虑 $T-\{e\}$ ，可以得到两个新的子树 $T_1,T_2$ ， $T=T_1\cup \{e\}\cup T_2$ ，假设 $T_1$ 有 $k$ 条边，则 $T_2$ 有 $n-1-k$ 条边，因此 $t(n)=\sum\limits_{k=0}^{n-1}t(k)t(n-1-k)$ 并且 $t(0)=t(1)=1$ ，从而可得 $t(n)=C_n$ .

进而可以利用生成函数求 $t(n)$ .

## 二叉树

>[!summary]+ 自查表
>- 二叉树、完美二叉树、完全二叉树、普通二叉树的定义；
>- 完美二叉树的深度和结点数的关系；

**二叉树**（binary trees）为每个结点的度不超过 $2$ 的有序树；**顺序编号法**按照深度递增，从左往右对结点进行编号. 如果深度为 $l$ 的二叉树的最大编号为 $2^l-1$ 则称该二叉树为**完美二叉树**（perfect binary trees，也称作满二叉树，但在下面定义了一种满二叉树，故不用此说法），如果深度为 $l$ 的二叉树中的结点的编号与相同深度的完美二叉树对应的编号相同，则称该二叉树为**完全二叉树**（complete trees），非完全二叉树称为**普通二叉树**；如果 $\forall u\in T,d(u)=2$ 或者 $d(u)=0$ ，则称 $T$ 为**满二叉树**（full binary trees）. ^BinaryTree

二叉树具有以下性质：

- 深度为 $l$ 的二叉树最多有 $2^k-1$ 个结点；
- 记度为 $0$ 的结点的个数为 $n_0$ ，度为 $2$ 的结点个数为 $n_2$ 则， $n_0=n_2+1$ ；证明：设度为 $1$ 的结点个数为 $n_1$ ，树的结点数为 $n$ 由树的定义，该树中所有是后继的结点的数量为 $n-1=0\cdot n_0+n_1+2n_2$ ，并且 $n=n_0+n_1+n_2$ ，可得结论.
- 具有 $n$ 个结点的完全二叉树的深度为 $\lfloor \log_2n\rfloor+1$ ；
- 对于采取顺序表示的完全二叉树，编号为 $i$ 的结点的左侧子结点（如果有的话）的编号为 $2i$ ，右侧子结点（如果有的话）的编号为 $2i+1$ . 因此，可以采取顺序存储的方式实现完全二叉树（以及普通二叉树）. #imcomplete-lack-proofs 

### 二叉树的实现

如上性质，可以采取顺序存储表示二叉树，对于完全二叉树进行顺序编号之后将所有结点以 $s-1$ 为索引填充到数组中即可，其中 $s$ 表示结点的编号. #imcomplete 

```cpp linenums="1"
```

而对于普通二叉树，将其缺失的结点补全后，按照完全二叉树的方法表示即可. #imcomplete 

```cpp linenums="1"
```

二叉树的顺序表示很可能造成空间的浪费. 

---

下面介绍二叉树的链式实现：每一个结点定义一个左指针（指向左子树的根结点 / 左子结点）和右指针（指向右子树的根结点 / 右子结点）对于空子树则指针指向空. #imcomplete 

这种单向指针的实现在查找当前结点的父结点时比较耗时（需要借助栈实现）. #imcomplete 

### 二叉树的遍历

关于树的遍历： [check-wiki](https://zh.wikipedia.org/zh-cn/%E6%A0%91%E7%9A%84%E9%81%8D%E5%8E%86)

对树的结点的遍历主要分为三个步骤：对当前结点进行<u>访问</u>（e.g. 输出结点对应的数值），遍历左子结点，遍历右子结点；

当采用非并行计算时，对于一个多个子结点，只能先访问一个子结点；因此需要以某种方式保存其他未被访问的子结点，常用栈或者队列；

遍历方式的顺序的一种最简单的划分是：深度优先（先访问子结点，再访问父结点，再访问其他的子结点），广度优先（先访问当前层的所有子结点，再访问父结点）；

深度优先可以按照根结点相对于左右子结点的访问先后进行划分；

前序遍历 / 先序遍历（pre-order traversal，或 NLR）：按根结点、左结点、右结点进行（递归地）顺序遍历；

```cpp title="先序遍历" linenums="1"
void preOrderTraversal(TreeNode *root) {
    statements // 对根结点进行访问操作，例如输出对应值
    if (root -> lchild != nullptr) preOrderTraversal(root -> lchild);
    if (root -> rchild != nullptr) preOrderTraversal(root -> rchild);
}
```

>[!hint] 先序遍历适合一般的访问结点（e.g. 就输出值）的任务.

/// collapse-code
```cpp title="依据数列进行先序构建树和先序遍历树" linenums="1"
#include<iostream>
#include<vector>
using namespace std;

template<typename T>
struct Node {
    T val;
    Node* left;
    Node* right;
    Node(T v): val(v), left(nullptr), right(nullptr) {}
};

template<typename T>
class BiTree {
private:
    Node<T>* root = new Node(0);
public:
    void buildSubtree(vector<T>& vec, int i, Node<T>* head) {
        if (2 * i + 2 <= vec.size() && vec[2 * i + 1] != -1) {
            head -> left = new Node<T>(vec[2 * i + 1]);
            buildSubtree(vec, 2 * i + 1, head -> left);
        }
        if (2 * i + 3 <= vec.size() && vec[2 * i + 2] != -1) {
            head -> right = new Node<T>(vec[2 * i + 2]);
            buildSubtree(vec, 2 * i + 2, head -> right);
        }
    };
    // 根据数组（对应一个完全树）按先序排序生成树，用 -1 表示空
    BiTree(vector<T>& vec) {
        root -> val = vec[0];
        buildSubtree(vec, 0, root);
    };
    // 先序遍历
    void nodeTraverse(Node<T>* head) {
        cout << head -> val << endl;
        if (head -> left != nullptr) nodeTraverse(head -> left);
        if (head -> right != nullptr) nodeTraverse(head -> right);
    };
    void NLRTraverse() {
        nodeTraverse(root);
    };
};

int main() {
    vector<int> vec = {1, 3, 4, 5, -1, 6, 8, -1, 9};
    BiTree bitree(vec);
    bitree.NLRTraverse();
    return 0;
}
```
///

中序遍历（in-order traversal）：以左结点、根结点、右结点（递归地）顺序遍历；

```cpp title="中序遍历" linenums="1"
void inOrderTraversal(TreeNode *root) {
    if (root -> lchild != nullptr) inOrderTraversal(root -> lchild);
    statements // 对根结点进行访问操作，例如输出对应值
    if (root -> rchild != nullptr) inOrderTraversal(root -> rchild);
}
```

后序遍历（post-order traversal）：按左结点、右结点、根结点（递归地）进行遍历；

```cpp title="后序遍历" linenums="1"
void postOrderTraversal(TreeNode *root) {
    if (root -> lchild != nullptr) postOrderTraversal(root -> lchild);
    if (root -> rchild != nullptr) postOrderTraversal(root -> rchild);
    statements // 对根结点进行访问操作，例如输出对应值
}
```

>[!hint]+ 后序遍历的特点.
>考虑一串有后序遍历输出的序列 $v_1\cdots v_n$ . 则 $v_n$ 应该为根结点， $v_{n-1}$ 则为 $v_n$ 的右结点.
>
>在此基础上如果有更多的信息（例如 $v_{n-1}$ 是否是叶结点）可以得到更多关于原树的信息，甚至换元树（见下面的满二叉树中构造的映射 $\varphi$ ）
>
>此外后序遍历会优先遍历叶结点. 这意味着当遍历到根结点时，左右子结点及其后代已经被遍历过了. 所以<u>后序遍历适合删除结点</u>（尤其对于链式实现）.

**逐层遍历** / 广度优先遍历：可以用队列实现，


### 满二叉树

考虑前面提到的[满二叉树](#^BinaryTree)，记 $2n+1$ 个顶点的满二叉树的个数为 $tf(n)$ .

>[!note]- $2n+1$ 顶点的满二叉树具有 $n+1$ 个叶结点和 $n$ 个内结点.
> $n_0=n_2+1$ .

>[!note]- $tf(n)=C_n=\frac{1}{n+1}\binom{2n}{n}$ .
>证明：构造从 $2n+1$ 顶点的满二叉树全体 $\mathcal{T}F_n$ 到 $n$ 长 Dyck 路全体 $D_n$ 的映射 $\varphi$ ：
>
>对于任意的 $T\in \mathcal{T}F_n$ ，首先对于 $T$ 进行后序遍历得到 $S_{2n+1}$ .
>
>序列中的第一个元素（即移除 $T$ 中最左侧的叶结点）.
>
>将剩下的序列 $S_{2n}$ 与 Dyck 路中的上升 / 下降步进行映射： $S_{2n}$ 中的 $T$ 中的叶结点对应上升步，内结点对应于下降步.
>
>下面来证明这样映射得到的 $P$ 是一条 Dyck 路，首先在去掉一个叶结点之后剩余有 $n$ 个叶结点和 $n$ 个内结点；此外后序遍历先从叶结点开始访问，再由满二叉树（减去了一个叶结点）的完整子树仍然是满二叉树可知，任何子树的叶结点数量大于<u>等于</u>内结点的数量（等于是考虑到被去掉一个叶结点的树.）在后序遍历的过程中，每次都将遍历完当前子树的所有叶结点后归，因此被遍历的叶结点的数量在任一时刻都大于<u>等于</u>内结点. 所以 $P$ 是 Dyck 路. （关键：满二叉树的任何子树的叶结点比内结点多 $1$ 个）
>
>$\varphi$ 是单射是显然的，对于满射的验证，首先注意到 $P$ 对应于 $n$ 个叶结点和 $n$ 个根结点；其次，最后一步一定是 $D$ ，为方面起见举例说明，对于 $UUDDUD$ 这一 Dyck 路，以最后一个 $D$ 为根结点，从右到左，如果遇到 $D$ ，则将其作为上一个结点的右结点，遇到 $U$ 时仍然将其作为上一个结点的右结点，并且下一个不管是 $U$ 还是 $D$ 都不再作为一个右结点（因此该 $U$ 形成了一个右结点）将下一个 $U$ 或者 $D$ 作为最开始的 $D$ 的左结点，按照同样的规则构造，最后再添上一个左结点构成满二叉树. 具体见[[DSADraw]]
>
>综上 $\#\mathcal{T}F_n=\# D_n=C_n$ .

有推广结论：

>[!note] 对于 $kn+1$ 个顶点的满 $k$ 叉树，其全体个数为 $\frac{1}{kn+1}\binom{kn}{n}$ .

## 二叉排序树

>[!summary]+ 自查表
>- 二叉排序树的定义；
>- 平衡二叉排序树的概念；

**二叉排序树**（二叉查找树）：若非空树，则具有如下性质：

- 若左子树非空，则左子树的所有结点的值小于根结点，左子树也是二叉排序树；
- 若右子树非空，则右子树的所有结点的值大于根结点，右子树也是二叉排序树；

由此，对二叉排序树进行中序遍历可以得到一个有序序列（升序）；

二叉排序树的生成：每一次插入的结点都作为一个叶结点插入；不允许有重复的数字出现；具体如下

```cpp title="二叉排序树的生成伪代码" linenums="1"
// 算法名称：二叉排序树的生成，对于一个待插入的元素 $N$ ：

// 输入：集合 S = {N_1, N_2, ..., N_m}
// 输出：二叉排序树；

若二叉排序树是一个空树，则将该元素作为根结点；
root = N_1

for (node : S):
    if node.value == root.value continue；
    if node.value < root.value { 
        将 node 插入 root.左子树中；
        root = root.左子结点；
    }
    if node.value > root.value {
        将 node 插入 root.右子树中；
        root = root.右子结点；
    }
```

二叉排序树的查询：与每一个结点进行对比，然后进入到下一个子树中；

二叉排序树的查找效率：如果原先的数据集是有序的，生成二叉排序树之后的结构等同于链表，二叉排序树查询效率与线性表查询一致；

为使得二叉排序树的查找效率提高，需要生成的二叉排序树左右尽量均衡（AVL）；

具体地，每加入一个新的结点，若形成的左右子树的深度差超过 1 ，则对深度大的子树进行调整. #imcomplete-further-wanted 

下面介绍二叉排序树的应用： #imcomplete-further-wanted 

### 霍夫曼编码

[refer-wiki](https://zh.wikipedia.org/zh-cn/%E9%9C%8D%E5%A4%AB%E6%9B%BC%E7%BC%96%E7%A0%81)

考虑对一串字符进行二进制编码，例如 A, B, C, D，进行编码时一个很重要的问题是不能使得某一字符的编码与另一字符的编码的字串相同，例如： A - 0, B - 1, C - 10，则对于 1010 无法区分是 BAC，CC，BABA，CBA 等. 

稳妥的做法是采取<u>定长编码</u>，例如： A - 0001 ， B - 0010 ， C - 0011 ， D - 0100 . 但是在某些情况下，例如某一个字符出现的频率想当高，如果用简短的编码表示可以提高传输效率，这时地<u>变长编码</u>就值得采取.

霍夫曼编码即为一种变长编码算法，其首先基于字符串中各个字符的频率构建一个二叉排序树，然后进行编码，具体实现如下：

首先定义**树的带权路径长度**：树中所有叶结点的带权路径长度的和 $\text{WPL}=\sum_{i=1}^nW_iL_i$ . 其中 $n$ 表示叶结点的数目， $W_i$ 表示第 $i$ 个叶结点的权重（视具体情况而定，例如对应的字符出现的频率）， $L_i$ 表示第 $i$ 个叶结点的层数.

称在具有相同的叶结点的二叉树中具有最小的带权路径长度的二叉树为**霍夫曼树 / 最优二叉树**：

下面介绍霍夫曼树的构造方法：

```cpp title="霍夫曼树构造伪代码" linenums="1"
// 算法名称：霍夫曼树构造

// 输入：结点集合 {N_1, N_2, ..., N_m} ，权重 {W_1, W_2, ..., W_m}
// 输出：霍夫曼树

1. 以 N_i 作为根结点，构造 n 个只有根结点的树，记为 S = {T_1, T_2, ..., T_m}；
2. 从 S 中选取带权路径长度最小的两个树 T_p, T_q；
3. 构造新的结点 N_pq ，权重为 W_p + W_q；
4. 构造一个新的树 T_pq ，其左，右子结点为 N_p, N_q（默认无序树），其根结点为 N_pq；
5. 更新 S：移除 T_p， T_q，加入 T_pq ，回到 2.
```

| #imcomplete-lack-codes

按照上述构造方法，霍夫曼树的结点的度均为 $0$ 或者 $2$ ，不可能为 $1$ .

在完成霍夫曼树的构造之后，根结点的编码设为 $1/0$ ，子结点继承父结点的编码，每一层的左结点编码在继承的编码上添加 $0$ ，右结点编码添加 $1$ （或者反之，无所谓）； $S$ 中的所有元素均为霍夫曼树的叶结点；因此不可能出现编码包含. #imcomplete-lack-proofs 

哈夫曼树的应用：压缩、传输、加密、解码

哈夫曼解码：借助哈夫曼树完成；

| #imcomplete-lack-examples 

## 最小生成树算法

深度优先遍历（DFS）：

```
1. 从图中选取结点 v ；
2. 遍历操作：
    while v 仍有未被遍历的关联结点：
    选取结点 v 的一个关联结点 v' ：
        2.1 如果 v' 有非 v 的关联结点 v'' ，对 v'' 执行遍历操作；
        2.2 否则，停止遍历，转到 2；
```

广度优先遍历（WFS / BFS, broadcast fisrt search）

```
1. 从图中选取结点 v ；
2. 遍历操作：
    遍历 v 的所有关联结点 v' ；
    对 v' 执行遍历操作；
```

### 最小生成树算法

| #imcomplete 

对加权图 $G(V,E,w)$ ，定义 $G$ 的最小生成树（minimal spanning tree, MST）：边权重和最小的生成树；

>[!note]- 设 $N=(V,E)$ ， $U\subset V,U\neq \emptyset$ ，令 $F=\{(v_1,v_2):v_1\in U,v_2\in V\backslash U\}$ ，设 $e$ 为 $F$ 中权重最小的边，则 $e$ 一定包含在 $N$ 的最小生成树中. #imcomplete-lack-proofs 

| #imcomplete-lack-proofs 

Prime 算法，需要遍历 $1+2+\cdots+(n-1)$ 次，其中 $n=\lvert V\rvert$ ，算法复杂度为 $\mathcal{O}(n^2)$ ：

```title="Prime 算法伪代码" linenums="1"
algorithm Prime(V, E, W) is:
    E' = emptyset;
    取边权最小的未被选取的边 e 加入到 E';
    while E' 不包含所有的 V:
        在 E' 包含的点中确定与其关联的 E\E' 中的权最小，并且不连成圈的边，加入到 E' 中;
    return V, E, W;
```

[Kruskal 算法](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm)，在对于边进行排序之后，每次只需要在已有的边中选取不形成圈的最小边，算法复杂度为 $\mathcal{O}(\lvert E\rvert)$ ：

```title="Kruskal 算法伪代码" linenums="1"
algorithm Kruskal(V, E, W) is:
    E' = emptyset;
    E_candidates = sort(E, W);
    while E' 不包含所有的 V:
        选取 E_candidates 中边权最小且不形成圈的边，并从 E_candidates 中移出 e;
    return V, E', W;
```

>[!question]- 在什么情况下最小生成树唯一？ #imcomplete-further-wanted 

### 完全树的生成树

下面讨论完全图的生成树的个数，记 $t_n$ 为 $[n]$ 的完全图的生成树的个数.

```title="Prufer 编码" linenums="1"
algorithm PruferEncoding(T) is:
    T_1 = T
    codes = emptyset
    for i = 1 to n - 1, step = 1, do:
        取 T_i 中的编号最小的叶结点 u_i;
        从 T_i 删除 u_i 得到 T_i+1;
        
    return v_1, ..., v_n;
```

# 堆

**堆**（heap）的定义：任何一个子树中根的值都最大（小），则称该树为**大根堆**（**小根堆**）
 
以大根堆为例，其具有一个性质：按照层数遍历到叶结点将会得到一个降序子列（优先队列）.

在对堆顺序实现时，首先需要考虑堆的表示，为节省存储空间，采取完全的堆，

```cpp title="堆的排序算法"
堆中仍然有元素：
    1. 取出堆的根；
    2. 堆的最后一个元素作为候选根；
    3. 将候选根与其子结点进行比较并交换其中最大的元素，如果比两个子结点都大，形成新的堆，停止转 1；否则将交换后的元素继续与其子结点进行比较，直到比两个子结点都大.
```

最终拿出的元素形成升序列（优先队列）时间复杂度为 $\mathcal{O}(n\log n)$ ，此外构建堆的过程的时间复杂度也为 $\mathcal{O}(n\log n)$ . 对比，冒泡排序 $\mathcal{O}(n^2)$ . #imcomplete

/// collapse-code
```cpp title="对序列建堆并进行堆排序"
#include<iostream>
#include<vector>
using namespace std;

void swap(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

class Heap {
private:
    vector<int> seq;
    int len;
public:
    Heap(vector<int> arr): seq(arr) { len = seq.size(); };
    // 构造堆：对于单个结点
    void constructNode(int i) {
        while ((i + 1) / 2 >= 1) {
            if (seq[(i + 1) / 2 - 1] < seq[i]) {
                swap(seq[(i + 1) / 2 - 1], seq[i]);
                i = (i + 1) / 2 - 1;
                constructNode(i);
            }
            break;
        }
        return;
    };
    // 构造堆
    void construct() {
        for (int i = 0; i < seq.size(); i++) {
            constructNode(i);
            printHeap();
        }
    };
    // 排序堆：对于单个结点
    void sortNode(int i, int len) {
        // 没有子结点则停止
        if (2 * i + 2 > len) return;
        // 若有两个子结点
        if (len >= 2 * i + 3) {
            if (seq[i] > seq[2 * i + 1] && seq[i] > seq[2 * i + 2]) return;
            if (seq[2 * i + 1] > seq[2 * i + 2]) {
                swap(seq[i], seq[2 * i + 1]); i = 2 * i + 1;
            } else {
                swap(seq[i], seq[2 * i + 2]); i = 2 * i + 2;
            }
            sortNode(i, len);
        }
        // 只有一个子结点，并且该子结点无子结点（假定为完全堆），因此判断交换之后停止
        if (len == 2 * i + 2 ) { swap(seq[i], seq[2 * i + 1]); return; }
    };
    // 排序堆
    void sort() {
        while(len > 2) {
            swap(seq[0], seq[len - 1]);
            len--;
            sortNode(0, len);
            printHeap();
        };
    };
    // 打印操作，用于可视化构造和排序的每一步的情况
    void printHeap() {
        for (int i = 0; i < seq.size(); i++) {
            cout << seq[i] << " ";
        }
        cout << "\n";
    };
};

int main() {
    vector<int> arr = {2, 4, 10, 9, 8, 7, 3, 5, 6};
    Heap heap = Heap(arr);
    cout << "初始化: "; heap.printHeap();
    cout << "\n";
    cout << "构造堆：\n";
    heap.construct();
    cout << "排序堆：\n";
    heap.sort();
    return 0;
}
```
///

## 堆的计数问题

堆也被称为**递增二叉树**：对于编号二叉树，从根出发的二叉树的编号递增. 有以下结论：

>[!note]- $[n]$ 上的递增二叉树的个数为 $n!$ . #imcomplete-lack-proofs 
>证明：设 $[n]$ 上递增二叉树全体为 $IB(n)$ ，采取中序遍历建立与 $S_n$ 的双射（这里后序遍历会首先返回左侧结点，因此对于以最小数在最开头的排列，根结点将不是最小的，不是递增二叉树；同理先序遍历会首先返回根结点，因此对于最大数在开头的排列，根结点将不是最小的，因此先序、后序都不能建立双射，于是猜测中序遍历）.

考虑 $2n+1$ 顶点的递增<u>满</u>二叉树的全体个数，根据满二叉树中序遍历的特点（子结点 -> 根结点 -> 子结点），输出的序列的编号呈现的序为： $a_1<a_2>a_3<\cdots<a_{n-1}>a_n$ . 这一排列是**交错排列**.

# 排列

## 排列的表示方式

用 $S$ 表示一个 $n$ 元集合，通常记为 $S=\{1,2,\ldots,n\}$ . $S$ 的一个**排列**是将 $1,2,\cdots,n$ 排成一列，记为 $\pi=\pi_1\pi_2\cdots\pi_n$ . 用 $S_n$ 表示 $S$ 的排列的集合，此为一**对称群**（symmetric group），并且 $\lvert S_n\rvert\overset{def}{=}\#S_n=n!$ .

>[!note]- 用程序生成 $S_n$ . #imcomplete-whatever 
>思路可以考虑抽象代数中生成 $S_n$ 的方法. [stack](https://math.stackexchange.com/questions/903225/generators-of-the-symmetric-group-s-3)

对于排列 $\pi$ 可以从下面几个角度理解：

**行表示**（one-line notation），即 $\pi=\pi_1\pi_2\cdots\pi_n$ 的写法；

**二行表示**， $\pi$ 可以看作是一个双射： 

$$\begin{aligned}\pi:&S\rightarrow S_n \\&i\mapsto \pi(i)\overset{def}{=}\pi_i\end{aligned}$$ 
或可写作： 

$$\pi=\begin{bmatrix}1&2&\cdots&n \\  \pi_1&\pi_2&\cdots&\pi_n\end{bmatrix}$$

**矩阵表示**，可以采用类似于独热编码的方式. 例如对于 $\pi=1324$ 可以写作： 

$$\pi=\begin{bmatrix}1&0&0&0\\ 0&0&1&0\\ 0&1&0&0\\ 0&0&0&1\end{bmatrix}$$ 

并且可以验证在此标记下对于两个排列的复合（称之为**乘积**） $\pi\circ \sigma$ 等同于对应的矩阵乘法. （注意运算是 $\pi(\sigma(i))$ ）.

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

## 交错排列

**交错排列**（alternating permutation, a.p）为排列 $a_1\cdots a_n$ 对于任意的 $a_{i-1}a_ia_{i+1}$ 有 $a_{i-1}<a_i>a_{i+1}$ .

>[!hint] 记忆：对堆进行后序遍历可以得到交错排列，因此序是 $a_{i-1}<a_i>a_{i+1}$ .

**反交错排列**（o.a.p）则为排列 $a_1\cdots a_n$ ，对于任意的 $a_{i-1}a_ia_{i+1}$ 有 $a_{i-1}>a_i<a_{i+1}$ .

>[!note]- 交错排列的个数等于反交错排列的个数.
>考虑映射 $\varphi:i\rightarrow n+1-i$ .

记 $n$ 长的交错排列的个数为 $E_n$ . $E_{2n+1}$ 也被称为 **Euler 数**.

>[!note]- $E_n$ 的递推公式： $2E_{n+1}=\sum\limits_{k=0}^{n}E_kE_{n-k}\binom{n}{k}$ .
>考虑 $E_{n+1}$ 中交错排列和非交错排列全体中的元素：
>
>$$\cdots >u_1<n+1>v_1<\cdots$$ 
>去掉 $n+1$ 之后得到了两个排列，并不关心其是交错还是反交错，因为两者个数都是一样的. 因此可以得到：
>
>$$E_{n+1}+E_{n+1}=\sum\limits_{k=0}^{n}\binom{n}{k}E_kE_{n-k}$$

>[!note]- $E_n$ 的生成函数： $\sum\limits_{n\geq0}^{}E_n\frac{x^n}{n!}=\sec x+\tan x$ . 并由奇偶性有推论： $\sum\limits_{n\geq0}^{}E_{2n}\frac{x^{2n}}{(2n)!}=\sec x$ ， $\sum\limits_{n\geq0}^{}E_{2n+1}\frac{x^{2n+1}}{(2n+1)!}=\tan x$ . 或称 $E_{2n}$ 为第 $n$ 个正割数， $E_{2n+1}$ 为第 $n$ 个正切数.
>证明：令 $y=\sum\limits_{n\geq0}^{}E_n\frac{x^n}{n!}$ .
>
>$$\begin{aligned}
>2\sum\limits_{n\geq1}^{}E_{n+1}\frac{x^n}{n!}&=2(y'-1)\\
>&=\sum\limits_{n\geq1}^{}\sum\limits_{k=0}^{n}E_kE_{n-k}\binom{n}{k}\frac{x^n}{n!}\\
>&=\sum\limits_{n\geq0}^{}\sum\limits_{k=0}^{n}E_kE_{n-k}\frac{x^k}{k!}\frac{x^{n-k}}{(n-k)!}-1\\
>&=y^2-1
>\end{aligned}$$
>
>从而：
>
>$$2\frac{dy}{dx}=y^2+1$$ 
>得到： $\arctan y=\frac{1}{2}x+c$ ， $y=\tan(x+c)$ 并且 $y(0)=1$ ，所以 $c=\frac{\pi}{4}$ . 从而可得结论.

# 排序算法

## 堆栈排序

>[!example]- 汉诺塔（Tower of Hanoi）：有三根杆子 $A,B,C$ ，其中 $A$ 杆上的圆盘大小自上而下呈递增趋势，下面要将所有的圆盘转移到 $C$ 上，在此过程中需要满足以下两个条件：1) 每一次只能移动一个圆盘；2) 大圆盘不能放置在小圆盘上. 问：对于 $n$ 个圆盘，需要移动多少次才能全部转移到 $C$ 杆上.
>假设对于 $n$ 个圆盘需要移动 $a_n$ 次，可以证明： $$a_n=a_{n-1}+1+a_{n-1}$$ （即，首先将 $n-1$ 个圆盘移动到 $B$ 杆上，将最大圆盘移动到 $C$ 杆上，再将 $n-1$ 个圆盘移动到 $C$ 杆上. 又 $a_1=1$ ，可得 $a_n=2^n-1$ .

**堆栈排序**（stack sorting）算法如下：

```cpp title="堆栈排序伪代码"
// 输入: 排列 pi=pi_1pi_2...pi_n ；
// 输出: 排列 S(pi)=sigma_1sigma_2...sigma_n

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

| #imcomplete-whatever 

考虑经过堆栈排序之后得到 $\text{id}$ 的排列（即为不包含 231-pattern 的排列）的数量： $\#\{\pi\in S_n:S(\pi)=\text{id}\}$ . 称为 **Cataland数** $C_n$ ，可以证明： $C_n=\frac{1}{n+1}\binom{2n}{n},C_0=1$ . $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ . ^Cataland

更多关于 Cataland 数的内容可以见 [R.P Stanley Cataland Numbers](https://math.mit.edu/~rstan/catalan/) ，之后也会反复出现 Cataland 数.

并且可以证明： $\#\{\pi\in S_n:\pi\text{ 不包含 }\sigma-\text{pattern}\}=C_n$ .

## 耐心排序

以一个纸牌游戏为场景：假设一组纸牌的排列为 $\pi$ ，现在依次抽取 $\pi_i,i=1,\cdots,n$ . 如果 $\pi_{i}>\pi_{i-1}$ ，则形成一新的牌堆，以 $\pi_i$ 为该牌堆的首牌，如果 $\pi_i<\pi_{i-1}$ ，则或可选择让该牌作为首牌形成一新的牌堆，或可选择让该牌加入到 $\pi_{i-1}$ 所在的牌堆上（ $\cdots\pi_{i-1}\pi_i$ ）.

现在的问题是：如何进行选择能够使得最终形成的牌堆数目最小？

**耐心排序**（patience sorting）算法的方法是：每一次新加入的牌都放置在最左侧的符合要求的牌堆上.

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

| #imcomplete 经过耐心排序之后再经过一次插入排序就可以得到顺序排列.

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
> $f^{(3)}=1,f^{(2,1)}=2,f^{(1,1,1)}=1$ ，具体见[[DSADraw]].

>[!note]- 若 $\lambda\vdash n$ ，则 $f^\lambda=\frac{n!}{\prod_{u\in \lambda}^{}h_u}$ 

下面介绍 R.S. 算法，其构造 $S_n$ 到 $\{(P,Q):P,Q\ \text{为形状相同的标准杨表}\}$ 之间的一个映射.

首先介绍下面这个算法：

```cpp
// 算法名称：杨表添加元素

// 输入：杨表 T ，正整数 i （与杨表中已经填入的数字没有重复）
// 输出：杨表 T'

r = 0;
while (r <= n):
	if i > 第 1 行中所有元素:
        // 注意此处设置 r = 0 ，下一次插入仍然从第 1 行开始
		将 i 插入到该行末尾， r = 0;
		return T'; 
	else if i < 该行中的某个元素，设为 j:
		用 i 替换 j 所在位置;
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

下面给出 R.S.(K) 算法：

```cpp
// 算法名称： R.S.(K) 排序

// 输入: 排列 pi=pi_1pi_2...pi_n;
// 输出: (P,Q): P,Q 是具有相同形状的标准杨表.

// 这里使用的 add 为上面介绍的 杨表添加元素 算法
T' add(T, i);
// 重载该函数：当只提供一个参数 i 时初始化只含有一个元素的杨表
T' add(i);

count = 0;

// 初始化两个杨表:
P = add(1);
Q = add(2);
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

例如：考虑 $\begin{bmatrix}4  \\ 2\end{bmatrix}$ ，注意到能够放入 $2\times2$ 个小方格排列称的正方形中的杨图有 $\emptyset$ （空图）， $(1),(2),(1,1),(2,1),(2,2)$ ，从而 

$$\begin{bmatrix}4 \\ 2\end{bmatrix}=1+q+2q^2+q^3+q^4$$

并且观察到系数呈先递增后递降顺序，该结论可以推广到所有 $n\geq1$ 的情形.

# 格路

**格路**（lattie path）指的是由邻接的格子（也可能是多边形）拼起来后，相邻的格子重叠的部分形成的路径. 例如 $\mathbb{Z}^2$ 形成的格路，在格路上可以定义移动，例如 $U,R,D,L$ .

## Dyck 路

首先介绍**自由 Dyck 路**（free dyck path）： $\mathbb{Z}^2$ 上由 $(0,0)$ 到 $(n,n)$ 的格路，只允许进行 $U,R$ 移动，称为 **n 长 Dyck 路**，则不难发现这样的 Dyck 路有 $\binom{2n}{n}$ 条.

**n 长 Dyck 路**首先是自由 Dyck 路，并且满足始终位于 $y=x$ 的上方（允许触碰到 $y=x$ ）. 可以用符号抽象 Dyck 路，例如当 $n=2$ 时有 Dyck 路 $UURR,URUR$ . 一般地，对于 $n$ 长 Dyck 路，其有 $C_n=\frac{1}{n+1}\binom{2n}{n}$ 条 Dyck 路， $C_n$ 即为 [Cataland数](#^Cataland). 并且有这个公式可以看出 $n$ 长 Dyck 路占自由 Dyck 路的 $1/(n+1)$ .

对于 Cataland 数，可以先证明其递归公式： $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ .

>[!note]- 设 $C_n$ 为 $n$ 长 Dyck 路的个数，定义 $C_0=1$ ，证明 $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ .
>证明：用 $L$ 表示一个 $n$ 长 Dyck 路，按照如下规则将其划分为 $L_1,L_2$ 两条路：以除零点外第一个接触 $y=x$ 轴的点为分点划分 $L$ ，如果该点为 $(n,n)$ 则记 $L_2=\emptyset$ ，并设 $L_1$ 的落点位置为 $(i,i)$ ，则 $L_2$ 有 $C_{n-i}$ 种. 进一步，将 $L_1$ 的起始向上和终止向右曲调，则 $L_1$ 可以由一条 $i-1$ 长 Dyck 路决定，有 $C_i$ 种，从而 $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ .

除此之外， $n$ 长 Dyck 路、不含 231-pattern 的排列全体还有如下的等价结构：

- 由 $n$ 个 $1$ 和 $n$ 个 $-1$ 构成的排列全体，并且满足 $\forall k\geq1,\sum\limits_{i=1}^{k}\pi_i\geq0$ ；
- 考虑形状为 $(n,2)$ 的标准杨表，

定义 Dyck 路的**峰**：相邻的一个上升步和一个下降步，记有 $k$ 个峰的 $n$ 阶 Dyck 路的个数为 $N(n,k)$ ，称为 **Narayana 数**. ^DyckPeak

>[!note]- $N(n,k)=\frac{1}{n}\binom{n}{k}\binom{n}{k-1}$ . #imcomplete-lack-proofs 

>[!note]- $\sum\limits_{k=1}^{n}N(n,k)=C_n$
>证明： 
>
> $$\begin{aligned}
>\sum\limits_{k=1}^{n}N(n,k)&=\frac{1}{n}\sum\limits_{k=1}^{n}\binom{n}{k}\binom{n}{k-1}\\
>&=\frac{1}{n}\sum\limits_{k=1}^{n}\binom{n}{n-k}\binom{n}{k-1}\\
>&=\frac{1}{n}\binom{2n}{n-1}=C_n
>\end{aligned}$$

# 集合划分

将集合 $[n]$ 划分为 $k$ 块，每一块中的元素个数大于等于 $0$ ，划分个数的计算：相当于 $y_1+\cdots+y_k=n,y_i\geq0(1\leq i\leq k)$ ，从而 $\sum\limits_{i=1}^{k}(y_i+1)=n+k$ ，对于 $n+k$ 个元素采取挡板法，有 $\binom{n+k-1}{k-1}$ 种分法.












# 匹配

设图 $G=(V,E)$ ，对 $M\subset E$ ，如果 $M$ 中的任意两个边无顶点（即不相交，或称不相邻），则称 $M$ 为 $G$ 的一个**匹配**. 如果 $M$ 的边覆盖了 $G$ 的所有顶点，则称 $M$ 为 $G$ 的一个**完美匹配**. 此时 $M$ 的顶点数为 $M$ 的边数乘 $2$ . 若记 $V=[n]$ ，匹配 $M$ 实际上是对集合 $[n]$ 的一个划分，并且集合划分的每一块中的元素个数至多有两个，称 $M$ 为**贫划分**（poor partition）.

>[!example] $M=\{(1,3),(2,4),(5,6)\}$ 是 $[6]$ 的一个完美匹配.

划分有如下的**线图表示**：

![[MatchLinearRepresentation.png]]

## 完美匹配与 Dyck 路

考虑沿 $y=x$ 旋转 $45^\circ$ 的 Dyck 路， $n$ 阶 Dyck 路的个数等于 Cataland 数： $D_n=C_n=\frac{1}{n+1}\binom{2n}{n}$ . 下面来讨论完美匹配的数目与 Cataland 数的关系.

可以建立完美匹配与 Dyck 路之间的一个映射，注意到完美匹配的线图表示中，每个匹配对应的两个结点有一个上升和下降的方向（以下也称上弧和下弧）. 分别可以对应于 Dyck 路上的 $(1,1),(1,-1)$ 两个行进方向. 因此有映射，但显然这一映射不是双射.

记 $M_{2n}$ 为 $[2n]$ 上的全体完美匹配，定义完美匹配的**交叉数**（crossing numbers）： 

$$\text{Cr}(M)=\#\{(i,j)\in [2n]^2:i<j<M(i)<M(j)\}$$

定义完美匹配的**嵌套数**（nesting numbers）：

$$\text{Ne}(M)=\#\{(i,j)\in[2n]^2:i<j<M(j)<M(i)\}$$

称交叉数、嵌套数为完美匹配的两个统计量. 如果 $\text{Cr}(M)=\emptyset(\text{Ne}(M)=\emptyset)$ 则称 $M$ 为无交叉（嵌套）匹配.

记 $M_1$ 为全体非交叉完美匹配的集合， $M_2$ 为全体非嵌套完美匹配的集合.

考虑从 $M_1$ 到 $D_n$ 的映射，规则与上相同. 则 $\lvert M_1\rvert\leq \lvert D_n\rvert$ ，另一方面，对 $D\in D_n$ ，<u>从后往前</u>逐渐地构造，每一个下降方向的结点与其左侧最近的上升方向的结点匹配，得到交叉数为 $0$ 的匹配，所以 $\lvert D_n\rvert\leq \lvert M_1\rvert$ ， $\lvert D_n\rvert=\lvert M_1\rvert$ ；

从 $M_2$ 到 $D_n$ 的匹配与上相同，对 $D\in D_n$ ，从前往后逐渐地构造，每一个上升方向的结点都与其右侧最远的下降方向的结点匹配，可得到嵌套数为 $0$ 的匹配.

所以 $\lvert D_n\rvert=\lvert M_2\rvert=\lvert M_1\rvert=\frac{1}{n+1}\binom{2n}{n}$ .

记 $P_{n,k}=\{M\in M_n:\text{Cr}(M)=k\}$ ， $Q_{n,k}=\{M\in M_n:\text{Ne}(M)=k\}$ .

>[!note]- $\#P_{n,k}=\#Q_{n,k}$ .
>证明：对于第 $i$ 个<u>下降步</u>，定义其高度为 $h_i$ ，对应于 Dyck 路的结点的坐标. 如图：
>
> ![[HeightOfSteps.png]]
>
>并设由高度 $h_1,\cdots,h_n$ 生成的向量为 $A=\{(a_1,\cdots,a_n):0\leq a_i\leq h_i,a_i\in \mathbb{N}\}$ . $\# A=\prod_{i=1}^{n}(h_i+1)$ . 定义映射： $\varphi: D_n\times A\rightarrow M_n$ ，对于 $(D,a_k)\in D_n\times A$ ，用 $a_i(1\leq i\leq n)$ 限制 $D$ 向 $M\in M_n$ 的映射（由 $n$ 个这样的限制），令  $a_k=\#\{m:m<k<M(k)<M(m)\}$ ，表示包含 $(k,M(k))$ 的弧 $(m,M(m))$ 的数量，下面根据 $(a_1,\cdots,a_n)$ 和 $D$ 构造 $M$ ：对于 $a_i$ ，自左向右对 $D$ 留出 $a_i$ 个上弧不连接，取第 $a_{i}+1$ 个上弧与自左向右的第 $1$ 个下弧连接，将已经连接的上下弧排除，重复操作. 并可以证明 $\sum\limits_{k=1}^{n}a_k=\text{Ne}(M)$ ：
>
>$$\begin{aligned}
>\text{Ne}(M)&=\#\{(i,j):i<j<M(j)<M(i)\}\\
>&=\sum\limits_{k=1}^{n}\{i:i<k<M(k)<M(i)\}\\
>&=\sum\limits_{k=1}^{n}a_k
>\end{aligned}$$
>
>其中 $a_k$ 表示第 $k$ 个上弧的位置，由映射中的构造可知 $a_k=\#\{m:m<k<M(k)<M(m)\}$ ，故结论成立.
>
>另一方面，也可以用交叉数作为限制构造 $D_n\times A\rightarrow M_n$ 的映射，具体规则为自左向右第 $1$ 个下降弧与其左侧数第 $a_{i}+1$ 个上弧连接，并可以证明 $\sum\limits_{k=1}^{n}a_k=\text{Cr}(M)$ .
>
>再考虑 $P_{n,k},Q_{n,k}$ ，可知 $\lvert P_{n,k}\rvert=\lvert Q_{n,k}\rvert=\#\{(a_i)_{1\leq i\leq n}\in A:\sum\limits_{i=1}^{n}a_i=k\}$ ，具体需要由 $A$ 的限制讨论 $\lvert P_{n,k}\rvert$ 的大小. （分拆加上上界限定） #imcomplete-further-wanted 
>
>具体的例子见 [[按嵌套数和交叉数分别映射.png]]

## 一般匹配和 Motzkin 路

下面讨论一般匹配，可以将其中的孤立点对应到“水平步”，其他则按照 Dyck 路中的映射进行.

定义 **Motzkin 路**：从 $(0,0)$ 出发，最终回到 $x$ 轴，只允许进行 $(1,1),(1,-1),(1,0)$ 三种操作. 或可将 Motzkin 路视为 Dyck 路中插入一部分水平步. Motzkin 路中的**峰**定义为去掉水平步之后得到的 [Dyck 路的峰](#^DyckPeak).

记 $n$ 长 Motzkin 路全体为 $\mathcal{T}_n$ ， $T_n=\lvert t\rvert$ ， $T_{n,k}=\#\{T\in \mathcal{T}_n:T\text{ 有 }k\text{ 个峰}\}$ ；称 $T_n$ 为 **Motzkin 数**，记 $T_0=1$ .

下面考虑 Motzkin 路和 Dyck 路的关系：

对于 $j$ 长 Dyck 路，可以插入 $n-2j$ 个水平步以得到 Motzkin 路，并且峰数保持不变； $j$ 长 Dyck 路共有 $2j+1$ 个位置可以插入水平步，每一个位置可以至少 $0$ 个水平步，因此有： $\binom{n-2j+2j+1-1}{2j+1-1}=\binom{n}{2j}$ 种分法.

所以 $T_{n,k}=\sum\limits_{j=0}^{n}\binom{n}{2j}N(j,k)$ . 其中 $N(j,k)$ 为 Narayana 数. $N(j,k)=\frac{1}{j}\binom{j}{k}\binom{j}{k-1}$ .

>[!note]- $T_n=T_{n-1}+\sum\limits_{k=0}^{n-2}T_kT_{n-k-2},n\geq2$ .
>证明：对于 $T\in \mathcal{T}_n$ ，若其第一步为水平步，则有 $T_{n-1}$ 中可能情况；若其第一步为上升步，以 $T$ 中第一个返回到 $x$ 轴的下降步作为分界将 $T$ 分割成两部分，分别形成了两个新的 Motzkin 路，从而有 $\sum\limits_{k=0}^{n-2}T_kT_{n-k-2}$ 种情况. 综上可得结论.

>[!example]- 计算 $T_4$ .
>$$\begin{aligned}
>T_4&=T_3+\sum\limits_{k=0}^{2}T_kT_{2-k}\\
>&=T_3+2T_0T_2+T_1^2\\
>&=4+2\times 1\ \times 2+1^2=9
>\end{aligned}$$

下面讨论 Motzkin 数的生成函数：

$$\begin{aligned}
M(x)&=\sum\limits_{n\geq0}^{}T_nx^n\\
&=1+T_1x+\sum\limits_{n\geq2}^{}T_{n-1}x^n+\sum\limits_{n\geq2}^{}\sum\limits_{k=0}^{n-2}T_{k}T_{n-k-2}x^n\\
&\overset{(1)}{=}1+x M(x)+x^2\sum\limits_{n\geq0}^{}\sum\limits_{k=0}^{n}T_kT_{n-2}x^{k}x^{n-k}\\
&=1+xM(x)+x^2\left(\sum\limits_{n\geq0}^{}T_nx^n\right)^2\\
&=1+xM(x)+x^2M^2(x)
\end{aligned}$$

整理可得： $x^2M^2(x)+(x-1)M(x)+1=1$ ，从而解得： $M(x)=\frac{1-x\pm \sqrt{(1-x)^2-4x^2}}{2x^2}$ ，并且 $M(0)=0$ ，所以 $M(x)=\frac{1-x+\sqrt{(1-x)^2-4x^2}}{2x^2}$ . （ $(1)$ 中的第 $3$ 项是卷积.）

进而可以通过对 $M(x)$ Taylor 展开计算 $T_n$ .

>[!note]- $n$ 长非交叉匹配的个数为 $T_n$ . #imcomplete-lack-proofs 

## RNA 二级结构

[RNA 二级结构](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC92549/)是一个集合的非交叉匹配，并且匹配的弧长 $\geq2$ （即，两个匹配的元素不能是相邻的）.

记 $S_n=\#\{n \text{ 长 RNA 二级结构}\}$ ， $S(n,k)=\#\{n \text{ 长 RNA 二级结构，有 }k \text{ 个弧}\}$ .

可以得到递推公式： $S(n+1)=S(n)+\sum\limits_{j=1}^{n-1}S(j)S(n-j)$ . （ $1$ 为上升弧（下降弧对应 $j$ ）和 $1$ 为孤立点）

可以将 RNA 二级结构对应到 Dyck 路：去掉 RNA 结构中的所有孤立点后得到的即为完美匹配，假设得到的完美匹配对应于 $j$ 长 Dyck 路，设其峰数为 $p$ ，在每个峰处（相邻的上升步和下降步之间）插入 $1$ 个水平步以使得匹配的弧长 $\geq2$ ，共插入 $p$ 个，为了形成 $n$ 长的路，还需要插入 $n-p-2j$ 个水平步到已有的 $2j+1$ 个位置中，共有： $\binom{n-p-2j+2j+1-1}{2j+1-1}=\binom{n-p}{2j}$ . 或者是将剩余的 $n-2j-p$ 个孤立点插入到 $2j+1$ 个位置，有： $\binom{n-2j-p+2j+1-1}{2j+1-1}=\binom{n-p}{2j}$ 种情况. 综上 $S(n,k)=\sum\limits_{p\geq 0}^{}N(k,p)\binom{n-p}{2k}$ . 并且 $N(k,p)=\frac{1}{k}\binom{k}{p}\binom{k}{p-1}$ ，所以：

$$\begin{aligned}
S(n,k)&=\sum\limits_{p=0}^{n}\frac{1}{k}\binom{k}{p}\binom{k}{p-1}\binom{n-p}{2k}\\
&=\frac{1}{k}\sum\limits_{p=0}^{n}\binom{n-k+p}{k+1+k-1}\binom{k}{p}\binom{k}{k+1-p}\\
&\overset{(1)}{=}\frac{1}{k}\binom{n-k}{k+1}\binom{n-k-1}{k-1}
\end{aligned}$$

$(1)$ 取等用到 [[#^RiordanIdentity]]  .

# 离散数据结构的计数

对于离散数据结构的计数有以下方法：

- 直接用初等函数的计数公式；
- 将该数据结构双射到另一数据结构，计数；
- 根据递推公式求解；
- 利用生成函数求解；

# 递归

也成为**分而治之策略**（divide-and-conquer strategy）.

C++ 中每次递归都会创建一个新的变量，相应的递和归具有相同的变量（内存地址）

并不是所有情况都需要递归：

/// collapse-code
```python title="分解质因数" linenums="1"
def prime_factors(n):
    i = 2
    while (i <= n):
        if (n % i == 0):
            print(i) 
            n /= i
            i = 2
        else: 
            i += 1

prime_factors(1001)
```
///

# 附录：组合恒等式

**乘法原理**，**加法原理**

**多重组合数**： 

$$\begin{aligned}
\binom{n}{k_1k_2}&=\binom{n}{k_1}\binom{n-k_1}{k_2}\\
&=\frac{n!}{k_1!(n-k_1)!}\frac{(n-k_1)!}{k_2!(n-k_1-k_2)}\\
&=\frac{n!}{k_1!k_2!(n-k_1-k_2)!}
\end{aligned}$$

$$\begin{aligned}
&2^n=\binom{n}{0}+\binom{n}{1}+\cdots+\binom{n}{n}\\
&n2^{n-1}=\binom{n}{1}+2\binom{n}{2}+\cdots+n\binom{n}{n}
\end{aligned}$$

>[!note]- $$\binom{n}{r}=\binom{n-1}{r-1}+\binom{n-1}{r}$$ 
>证明：包含和不包含 $n$ 

>[!note]- Vandermonde 恒等式： $\binom{m+n}{r}=\sum\limits_{k=0}^{r}\binom{m}{k}\binom{n}{r-k}$ .
>证明：考虑 $(1+x)^{m+n}=(1+x)^m(1+x)^n$

>[!note]+ Riordan 恒等式： 
>$$\binom{m}{p}\binom{n}{q}=\sum\limits_{j}^{}\binom{n+j}{p+q}\binom{m-n+q}{j}\binom{n-m+p}{p-j}$$
>
>^RiordanIdentity

# 附录： Cataland 数

[check-OEIS](https://oeis.org/A000108)

离散数据结构中常见的数之一.

$$C_n=\frac{1}{n+1}\binom{2n}{n}$$

$1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862,\cdots$ .

要证明一个数据结构的计数是 Cataland 数，可以利用下面的递推公式.

>[!note] Cataland 数递推公式： $C_n=\sum\limits_{i=1}^{n}C_{i-1}C_{n-i}$ 或写为 $C_n=\sum\limits_{k=0}^{n-1}C_nC_{n-1-k}$ . 
>该公式的证明一般依靠将数据结构划分为两个集合. 例如 Dyck 路的“触点”；有序平面树划分为两个子树.

在此基础上也可以得出 Cataland 数的生成函数：

>[!note]- $\sum\limits_{n\geq0}^{}C_nx^n=\frac{1-\sqrt{1-4x}}{2x}$ .
>令 $C(x)=\sum\limits_{n\geq0}^{}C_nx^n$ ，利用上面的递推得到：
>
>$$\begin{aligned}
>C(x)-1&=\sum\limits_{n\geq1}^{}\sum\limits_{k\geq0}^{n-1}C_kC_{n-1-k}x^n\\
>&=x\sum\limits_{n\geq0}^{}\sum\limits_{k=0}^{n}C_kC_{n-k}x^{n-k}x^k\\
>&=xC^2(x)
>\end{aligned}$$
>
>从而可以得到： $C(x)=\frac{1\pm \sqrt{1-4x}}{2x}$ ，再由 $C(0)=1$ 可以得到结论.

对生成函数进行 Taylor 展开即可以得到 $C_n$ .

Cataland 数的例子有：

- 堆栈排序之后得到 $\text{id}$ 的排列的数量（不含 $231-$ pattern 的排列个数）；

- $n$ 长 Dyck 路的个数；

- [[#有序平面树]]： $n$ 边有序平面树的个数 $t_n$ ；
- $2n+1$ 个顶点的 [满二叉树](#^BinaryTree) 的个数 $tf(n)$ ；