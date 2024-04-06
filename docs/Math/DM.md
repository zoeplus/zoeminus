# 符号说明

本文采用统一的符号，或在上下文中直接省略符号说明.

$\mathcal{O}=\{O_1,O_2,\cdots,O_N\}$ 表示一组同一类型的数据对象，用于讨论数据类型的转换.

$\mathcal{D}=\{x_1,x_2,\cdots,x_N\}$ 表示数据集. 如果标签是离散值（记为 $1,2,\cdots,K$ ）则记标签为 $k$ 的数据点有 $N_k$ 个.

$x_i$ 表示第 $i$ 个数据点， $x_i^j$ 表示其第 $j$ 个特征. 

$x^j$ 表示第 $j$ 个特征变量. 第 $j$ 个特征的统计特征： $\mu^j$ 均值. $\sigma^j$ 标准差. $\max^j=\max\{x^j_1,x^j_2,\cdots,x^j_N\}$ 最大值，$\min^j=\min\{x^j_1,x^j_2,\cdots,x^j_N\}$ 最小值.

$\mathcal{D}^j$ 表示第 $j$ 个特征对应数据组成的数据集，即： $$\mathcal{D}^j=\{x_1^j,x_2^j,\cdots,x_N^j\}$$ 

$D$ 表示数据集 $D$ 对应的数据矩阵（要求所有的元素都有相同的数值类型. e.g. `float` ，`int`），此处 $d$ 或为特征数量或为数据集的所有属性（包含标签）的数量： 

$$D=\begin{bmatrix}x_1^1 & x_1^2 & \cdots & x_1^d\\ x_2^1 & x_2^2 & \cdots & x_2^d\\ \cdots & \cdots & \cdots &\cdots \\ x_N^1 & x_N^2 & \cdots  & x_N^d \end{bmatrix}$$

$C$ 为对应于 $D$ 的协方差矩阵：

$$C=\begin{bmatrix}c_{11} & c_{12} & \cdots  & c_{1d} \\ c_{21} & c_{22} & \cdots  & c_{2d} \\ \cdots & \cdots & \cdots & \cdots  \\ c_{d1} & c_{d2} & \cdots  & c_{dd}\end{bmatrix}$$

其中 $c_{ij}=\frac{\sum_{i=1}^{N}x_k^ix_k^j}{N}-\mu^i \mu^j,\quad i,j=1,2,\cdots,d$ 或写作：

$$\begin{aligned}&c_{ij}=\frac{D^i\cdot D^j}{N}-\mu^i\mu^j,\quad i,j=1,2,\cdots,d\\&C=\frac{D^TD}{N}-\mu^T\mu\\&\mu=[\mu^1,\cdots,\mu^d]^T\end{aligned}$$

^CovarianceMatrix

对于矩阵 $M$ ，$M_{:k,}$ 表示选取该矩阵的前 $k$ 行组成的子矩阵. $M_{,:k}$ 表示选取该矩阵的前 $k$ 列的子矩阵，类推.

# 数据库系统和数据仓库

**数据库系统**（database system, DBS）：由数据库和一些操作组成.

## 数据仓库

**数据仓库**（data warehouse）：整合多个来源的数据库.

对于大量数据 / 特征数量多的数据，进行一次完整的数据分析成本较高，效果也并不一定好. 因此需要对数据库进行**数据规约**（data reduction）包括**减少数据量**（抽样法：简单随机抽样、分层抽样（尤其对于偏斜数据，<u>重要抽样</u>）、**数据降维**、 **数据压缩**等.

随着维度的增加，特定的数据将会变<u>稀疏</u>（e.g. 某属性大多数是 N，只有极少数是 Y）；子空间的组合将会增加（尤其对于基于规则的分类方法）；维度如果过多，需要学习的参数也会增多，模型复杂度上升，对于样本的数量需求也很大；此外可视化也要求维度较少. 因此需要进行数据降维.

注意样本大小对于数据质量的影响.

注意用于数据规约的时间不应该超过在规约后的数据集上挖掘所节省的时间；规约得到的数据应当比原数据小，但分析的效果应当差不多.

# 数据可视化

## 桑基图

[reference-wiki](https://en.wikipedia.org/wiki/Sankey_diagram)

**桑基图**（sankey diagram）是一种反映数据流动的图. 箭头的粗细表示流动比例.

# 数据预处理

## 属性的数据类型

这里关注的是**数据可以如何进行表示**，而<u>不是</u>数据来源的类型（e.g. 事务数据、图像、音频这种Raw data）

### 数值（Numeric）

**区间**（interval）和**比率**（ratio）是两种常见的数值数据.

### 类别（Categorical）

**标称**（nominal）和**序数**（ordinal）是两种常见的类别数据类型. 前者一般指的是没有顺序的值；后者多表示程度.

### 时间序列（Time Series）

### 离散序列（Discrete Sequence）

### 空间数据（Spatial）

### 文本（Text）

文本类数据的最大特点是：一个样本中含有大量的特征，因此如何从中筛选出有用的信息十分重要. 常见的手法是 **tfidf** . #imcomplete 

其他类型的数据也具有相同的特点，例如单细胞的基因表达，一个样本可能具有几十万个特征.

### 图（Graph）

## 数据类型的可移植性

<u>为什么需要进行数据类型的转换？</u>通常处理的都是混合类型的数据，为每一种数据类型组合建立模型比较困难，因此将不同的数据类型统一转换为相同的数据类型（例如数值型）；所以试图进行数据类型的转化.

#implementation

[[DMDraw]]中列举出了数据类型之间的转换方法. 常用的方法有：**数据泛化**（用抽象的概念替代具体，比如年龄用青年、中年、老年替代原先的具体数值；）、**离散化**、**特征构造**.

下面假设需要被转化的数据类型对应的数据集为$\mathcal{D}_0$，目标数据类型对应的数据为$\mathcal{D}_1$

### 数值 -> 类别

将 $\mathcal{D}_0$ 划分为 $\phi$ 个区间，然后标记区间为$1,2,\cdots,\phi$，从而完成转换.

1. **等宽均分区间**（Equi-width）：
	- 求出 $\min(\mathcal{D}_0),\max(\mathcal{D}_0)$ ，然后均分区间 $[\min(\mathcal{D}_0),\max(\mathcal{D}_0)]$ .
	- 均分区间存在问题：i.e. $[200,400]$ 中的数据量可能远远大于 $[400,600]$ ，这就起不到一个良好区分的效果.

#implementation 

2. 均分$\log(\mathcal{D}_0)$等：
	   - 假设$\mathcal{D}_0$的数据项的频率分布是呈指数形式的，用这一方法能够取得较好的区分效果.
	   - 推及一般，假设$\mathcal{D}_0$的累次频率分布可以用函数$f$近似表达，则只要选出$f$的分点对应的值即可.

3. **等深 / 等频率均分区间**（Equi-depth）：首先$\text{sort}(\mathcal{D}_0)$，然后进行取中值点逐步均分.
4. **聚类**（cluster）

对区间进行赋值：按照中值、均值、边界值赋值 / 平滑.

### 时间序列 -> 离散序列

使用符号聚合近似方法（Symbolic aggregate approximation, SAX），假设时间序列$\mathcal{D}_0$可以转换为离散序列$\mathcal{D}_1$（以符号为元素），并假设$\mathcal{D}_1$中的每一个符号都对应于数量近似相等的时间序列数据.

SAX方法包含两个步骤：

1. 基于窗口平均（Window-based average） #issue %%滑动窗口平均？还是其他类型的？%%
2. 基于值的离散化（Value-based discretation）：假设经过窗口平均之后的时间序列数据服从Gaussian分布，并以窗口为单位计算均值和方差，进而确定分位点 #issue %%什么叫做以窗口为单位进行平均，以及如何确定分位点的数量（包括上面已经提到的数值转类别的方法）%%

这个方法描述的有些抽象，实际上所谓符号可以理解为“时期”，例如对于某件商品的日销售量数据构成的时间序列，可以使用SAX方法将该时间序列进行符号序列化，划分为旺季、淡季两个符号.

#implementation 

### 时间序列 -> 数值

可以使用离散小波变换（Discrete Wavelet Transformation）或者离散傅里叶变换（Discrete Flourier Transformation）将时间序列转换为一组系数. 这组系数能否反应该时间序列的不同位置之间的（平均 #issue ）差异.

The common property of these transforms is that the various coefficients are no longer as dependency oriented as the original time-series values. #issue

### 离散序列 -> 数值

分成两步进行，首先是采取独热变量的方法将离散序列转化为多条序列，i.e.（直接复制课本上的例子）

$$ACACACTGTGACTG$$

可以转换为：

$$\begin{aligned}
10101000001000\\ 
01010100000100\\
00000010100010\\
00000001010001
\end{aligned}$$

对应$4$条序列，之后对于每一条序列进行离散小波变换（Discrete Wavelet Transformation, DWT） #issue 最终再得到一个多维数值型数据.

#implementation 

### 空间数据 -> 数值

#issue

### 图 -> 数值

#issue 对于用加权边表示节点之间的相似度的图，可以使用多维缩放（Multi-dimensional scaling，MDS）；此外也可以使用光谱变换（Spectral transformation）进行类型转换.

### （基于相似度）任何数据类型 -> 图

对于一些基于相似度的算法，可以将相应的一组数据对象转化为图.

对于一组数据对象：$$\mathcal{O}=\{O_1,O_2,\cdots,O_n\}$$

创建一组相应的节点：$$N=\{N_1,N_2,\cdots, N_n\}$$

创建边可以使用下面的方法：

- 设置超参数$\epsilon$，当相似度$d(O_i, O_j)>\epsilon$时，在节点$N_i,N_j$之间创建加权无向边. 
- 使用KNN方法，在节点$N_i,N_j$之间创建有向边 #issue %%能否忽略？%%. 随后边权重$w_{ij}$为相似度的一个核函数 #issue ，越大的相似度对应于越大的边权.

## 数据清洗

### 处理缺失值（imputation）

1. 当缺失值不多时，直接丢弃缺失值所在的数据点.

```R
data <- na.omit(data)
```

2. 估计缺失值. 对于具有 #issue 依赖关系的数据（空间数据，时间序列等），缺失值的估计比较简单，例如可以采用插值法，均值法.

3. #issue The analytical phase is designed in such a way that it can work with missing values. Many data mining methods are inherently designed to work robustly with missing values. This approach is usually the most desirable because it avoids the additional biases inherent in the imputation process.

### 处理非一致值

所要处理的数据总体上可能呈现某种分布，同时可能出现与该分布不一致的值，可能是**错误记录的值**或者是**异常值**（outliers）

1. 一致性检测（Inconsistency detection）. #issue 
2. 专业知识；
3. 以数据为中心的方法. 计算出数据的统计特征以进行离群值的检测.

### 归一化和标准化

多数场景下，不同的特征具有不同的量度. 在这种情况下，某些算法（例如基于欧式距离）会失效，因此需要进行**归一化**（scaling）和**标准化**（normalization）. #issue %%normalization和standardization有什么区别？%%

常见的方法是**标准化**（standardization, z-score 前提是特征值服从正态分布），对于第$j$个特征变量$x^j$，其标准化之后的值为：$$z^j=\frac{x^j-\mu^j}{\sigma^j}$$

或者可以使用如下归一化方法：$$z^j=\frac{x^j-\min^j}{\max^j-\min^j}$$

该方法需要确定最大值和最小值不是异常值.

此外还有 $L_1,L_2,\cdots$ 规范化.

#imcomplete %%Python数学建模与实验%%

## 数据降维和变换

### 数据采样

对于数据量比较大的情况，例如在一个实时场景下进行数据采集时，需要采用数据采样的方法创建一个较小的数据库.

1. **对于静态数据进行采样**：静态数据是指我们实现已经有了一个确定大小的数据库$\mathcal{D}$（而不是实时收集的）. 首先确定采样率$\alpha$，假设有$N$条数据项，则从$\mathcal{D}$中无重复随机抽取$\alpha N$条数据项即可. 通常不采用重复（with replacement）抽样的方法. #issue %%为什么？比如异常值检测为什么不能使用重复检测的方法？%%

下面讨论对于静态数据的随机抽样方法.

**有偏采样**（biased sampling）：在分析过程中某些数据可能有更大的价值，例如：

- **时间衰减偏见**（temporal-decay bias）：越接近当前时间点的数据被记录的更多，因此有更大的概率被采样到（ #issue %%所以？如果没有时间标记的话如何解决这件事，就算知道分布又如何?%%）. 一种假设是指数衰减偏见（expoential-decay bias）$$p(X)\propto e^{-\lambda t}$$即数据点$X$被观测到的概率与时间间隔$t$成指数反比关系.

#implementation %%找一个数据集，分别利用有偏采样和分层采样试一试%%

**分层采样**（stratified sampling）：在某些数据集中不同类型的样本并没有得到均等的记录，一些有同样或者更高重要性的数据记录少. 分层采样因此首先将数据进行分层，按照比例从每一层中抽样. 

与分层采样类似的是基于密度采样

2. 对于数据流进行蓄水池采样

#imcomplete %%先跳过了，P39%%

### 特征选择

选取最具有代表性 / 变动（variable）的特征进行分析. 所排除的特征为**冗余特征**（e.g. height, weight, bpm）、无效特征（e.g. id） 、变动小的特征（可以用方差度量）.

主要有两大类特征选择方法：

1. **无监督特征选择**（unsupervised feature selection）基于某些分类器提供的权重删除特征. #imcomplete %%Chap.6 数据聚类时会讲到%%
2. **监督特征选择**（supervised feature selection）：只选取与标签值有较强关系的特征. #imcomplete %%Chap.10 数据分类%%

在筛选特征时可以递归地筛选特征.

### 用坐标变换进行数据降维

将原先的所有特征用更少的特征表示出来，也就是降低数据维度.

在数据集中，不同特征之间可能存在关联性. 因此需要处理这些冗余. #issue %%如果不处理这些冗余有很大影响吗？，这块可以参考一下[[SL#协线性]]和[[SL#^CurseOfDimensionality]]；此外，在涉及到相似性分析的时候，数据降维似乎是有用的？%%

坐标变换是处理数据降维的一种方法，例如考虑： #imcomplete  %%这里举个例子就好了，将一个三维向量[0,0,z]乘以一个满秩矩阵得到[x,y,z]，可视化一下，反过来就是一个3维用1维+2个低方差维度（这些低方差维度可以去掉，从而就是1个维度）表示即可，这里让我想起了Weiserstain GAN%%

基于坐标变换的方法有**主成分分析**（principal component analysis, PCA）和**奇异值分解**（singular value decomposition, SVD）两种. 两者本质上是矩阵分解. 

PCA和SVD除了用于数据降维之外还可以用于以下层面： #imcomplete %%P48%%

1. **减少噪音**（noise reduction）： PCA和SVD中的小的特征值（对应于距离中心点 / 原点具有较小方差（或者说较小的平均欧式距离）的特征）很可能是噪音 #issue %%这里 P48 也只是给出了这个论断， often the result of noise, 另外这里对于噪音没有确切定义，但应该不是指统计学习中的 $\epsilon$ . 应该指的是没有统计显著性的变量. %%
2. **数据设算**（data imputation, 对于数据集中的缺失值的处理） #imcomplete %%P49 Chap 18. Sect 18.5）%%
3. **求解线性方程组**：许多数据挖掘场景 #imcomplete %%比如%% 最终都可以被转化为求解线性方程组 $Ay=0$ . 矩阵 $A$ 的任何一个右奇异向量 #issue %%这里指的是SVD中的 $P$ ?%% 都是该方程组的一个解.
4. 矩阵求逆：SVD中 $D=Q\Sigma P^T$ ，从而可以得到 $D^{-1}={P^T}^{-1}\Sigma^{-1}Q^{-1}=P\Sigma^{-1}Q^T$ . 该方法也可以推广到确定秩为 $k$ 的矩阵 $D$ 的**Moore-Penrose伪逆矩阵**（pseudoinverse）：只反转 $\Sigma$ 的非零对角线项. #issue %%[wikipedia](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse#Definition)%% #imcomplete %%用处，线性回归、社会网络分析 P49%%
5. 矩阵代数：比如说再一些网络挖掘应用 #imcomplete %%比如随机游走，还有马尔可夫链吧%%需要计算矩阵的幂，因此可以将矩阵分解为 $D=Q\Delta Q^T$ （PCA）从而计算 $D^k=Q\Delta^kQ^T$ .

#### 主成分分析

PCA通常在对于数据集进行中心处理之后（对于整个数据集按照索引轴取均值向量，然后每个数据点减去该均值向量）使用. #issue %%然而，也可以不使用均值中心，只要数据集的均值是分别存储的. 这句话是什么意思？P42%% ^MeanCenter

PCA的目的是将数据集旋转，从而获取到方差很大的新的维度（即，$\sigma^2D^j$或者$(\text{diag}D)_j$）. #issue %%这段不知道怎么准确用数学语言描述，什么是一个“维度的方差”%% 注意到[协方差矩阵](#^CovarianceMatrix) $C$ 是半正定矩阵：$$v^TCv=\frac{(Dv)^TDv}{N}-(\mu v)^2\geq 0,\forall v\in \mathbb{R}^d$$ PCA的目的为连续地 #issue %%这里的连续（successively）没有说清楚，下面给的计算方法是按照特征值递减的顺序取特征向量. 应该是按照方差递减的顺序取向量%% 确定能够最大化 $v^TCv$ 的正交向量.（ $v^TCv$ 即为数据集 $D$ 在向量 $v$ 上投影得到的向量的方差）由 $C$ 是半正定矩阵，从而存在矩阵 $P$ 使得：$$C=P\Lambda P^T$$ 其中 $P$ 的列由 $C$ 的正交特征向量组成（按照特征值递减的顺序按左排列）. $\Lambda$ 为由 $C$ 的非负特征值组成的对角矩阵. $C$ 的非负特征值对应的特征向量组成了最大化 $v^TCv$ 的一组连续正交解 #issue %%successive orthogonal solution，这里提到的successive是什么意思？）在下面中的注1给出的解释看不懂 P42 但这里要按照特征值递减的顺序给出正交变量解.%% 

特征向量和特征值的数据分布的几何解释：如果将坐标系旋转到上述求解得到的正交特征向量组成的新坐标系. 可以证明 #imcomplete 计算得到的每两个特征对应的数据值的协方差为 $0$ . 即保持最大方差的同时也实现了相关性为 $0$ ；每一个特征向量相应的特征值对应于下数据点沿着该特征向量方向上计算得到的方差. #implementation %%画个三维图表示一下%% 称这些特征向量为**主成分**（principal components）. 一般可以保留方差最大的几个特征向量，而舍弃其他向量，从而降维. 

经过坐标变换之后的数据矩阵为： $$D'=DP\in \mathbb{R}^{n\times d}$$ 最终只保留前 $k$ 列的数据作为降维后的数据，新的特征将具有较大的方差. #issue %%不理解：Each of the remaining $d-k$ columns of $D'$ will be approximately equal to the mean of the data in the rotated axis system. %% 对于进行过[中心处理](#^MeanCenter)的数据，剩余 $d-k$ 列的均值应该接近 $0$ #issue %%应该指的是：$\Vert[\text{mean}(D'^{k+1}),\cdots,\text{mean}(D'^{d})]\Vert\approx0$，所以这应该是选取 $k$ 值的依据：低方差 + 均值为 $0$ ，类似于[[SL#监督学习假设及概念]]中 $\text{mean}(\epsilon)=0$%% 并且可得： $$C'=\text{Cov}(D')=\frac{(DP)^T(DP)}{N}-(\mu^T P)^T(\mu^TP)=\Lambda=P^TCP$$ 其中 $\mu$ 见符号说明. #issue %%这里原书写错了吧，好像没有考虑行列向量这回事， P42，此处没有推这个公式%% 由上式结合 $C=P\Lambda P^T$ 可以得到 $P^TP=PP^T=I$ .

在实际应用中，经过主成分分析之后 $\Lambda$ 对角线上的特征值（对应数据集在相应维度上的方差）在前 $k$ 个较大特征值之后会快速下降. #implementation %%P44%%

#imcomplete %%PCA也可以被拓展为发现非线性嵌入层（embeddings，应该是NLP的说法）%%

#### 奇异值分解

**奇异值分解**（singular value decomposition）可以看作是沿着特征（ $D$ ）和沿着索引（  $D^T$ ） #issue ，从而获得两组基向量. 在均值中心处理之后（沿着每一个特征计算得到的均值为 $0$ ），SVD与PCA计算得到的基向量组相同. SVD通常被用于没有进行过均值中心处理的稀疏非负数据，e.g. #issue %%document-term matrices，是什么？文档转独热编码？%% SVD将数据矩阵进行分解： $$D=Q\Sigma P^T$$ 其中 $Q\in \mathbb{R}^{n\times n}$ 的列正交，称为**左奇异向量**（left singular vectors），$\Sigma\in \mathbb{R}^{n\times d}$ 为准对角矩阵，对角线上为 $D$ 的特征值，并且 $\text{Rank}(\Sigma)=\text{Rank}(D)$ ， $P\in \mathbb{R}^{d\times d}$ 的列正交，称为**右奇异矩阵**（right singular vectors）.  并且 $P^TP=I_{d\times d},Q^TQ=I_{n\times n}$ . ^SVD

注意到以下事实：

1. $Q$ 为 $DD^T$ 的正交特征向量： $$DD^T=Q\Sigma\Sigma^TQ^T$$ $DD^T$ 的特征值即为 $\Sigma\Sigma^T$ .
2. $P$ 为 $D^TD$ 的正交特征向量： $$D^TD=P\Sigma^T\Sigma P^T$$ $D^TD$ 的特征值即为 $\Sigma^T\Sigma$ . 
3. 注意到对于均值中心的数据矩阵 $D$ ，其协方差矩阵为 $\frac{D^TD}{N}$ ，并且 $P$ 为 $\frac{DD^T}{N}$ 的正交特征向量组成的矩阵. 所以 $P$ 等同于对于 $D$ 进行PCA得到的基向量组成的矩阵．

不妨设 $\Sigma$ 的对角线上的元素按递减顺序排列，根据SVD分解结果，可以用 $k$ 个新的特征代替 $d$ 个特征： $$D\approx Q_{,:k}\Sigma_{:k,:k}P_{,:k}$$ 经过转换并降维之后的数据矩阵表示为： $$D_{,:k}=DP_{,:k}=Q_{.:k}\Sigma_{:k,:k}$$ 

之前在PCA部分提到：PCA转换之后（但未进行降维）的矩阵的右边的 $d-k$ 列对应的数据按照特征求均值应当接近于原先数据矩阵的均值. （如果经过均值中心处理，则接近于 $0$ ）. 而SVD转换之后（但未进行降维）的矩阵的右边的 $d-k$ 列对应的矩阵按照特征求均值应当接近于 $0$ （无论是否进行过均值处理） #imcomplete %%贴一下原文，P45，PCA projects the data on a low-dimensional hyperplane passing through the data mean, whereas SVD projects the data on a low-dimensional hyperplane passing throught the origin%% PCA的目的是最大化方差（或者说，与数据中心（沿着索引求均值）的欧式距离），而SVD的目的是最大化数据点与原点的距离.

上面这种将投影变换之后的矩阵再选取前 $k$ 列（默认对应的特征值从大到小排列）的处理称为**截断**（truncate）.

 下面证明包含截断的SVD能够最大化数据点与原点之间的累计欧式距离：考虑向量 $v$ ，数据集 $\mathcal{D}$ 在 $v$ 上的投影为 $Dv$ ，计算投影点到原点的距离之和： $(Dv)^T(Dv)$ . 采取拉格朗日松弛法 #issue 将 $(Dv)^T(Dv)-\lambda(\lVert v\rVert^2-1)$ 的梯度设为 $0$ 得到 $D^TDv-\lambda v=0$ . #imcomplete %%P46%%

#### 潜在语义分析

潜在语义分析（latent sematic analysis, LSA），针对文本领域. v

#issue %%参考Python数学建模，以及机器学习方法，完成之后在这里做一个索引%%

### 用类型转换进行数据降维

在[[#数据类型的可移植性]]中提到数据类型之间可以进行转换. 这个过程也可以实现数据降维. 例如：

- 采用DWT或者DFT可以将时间序列转换为 #issue %%数据项数更小还是数据维度更小%%多维数据；
- 加权图 #issue %%什么意思，embedding techniques%% 可以被转换为多维数据.

#### Haar小波变换

**小波**（wavelet）是将时间序列转换为多维数据的一种常见方法，其将时间序列分解为一组小波基向量，每个系数都代表相邻一个时间区间均分成的两个时间区间之间的估计的差距. 小波系数具有不同的**阶**（order），取决于分析的时间长度（粒度，granularity）. 低阶系数表示时间序列更大范围的变化（大趋势），高阶系数则表示更局部的变化. #issue %%此处 P51 疑似%%

**Haar小波**是小波方法中比较直观的一类. 假设时间序列长度为 $2^l$ （最小的时间粒度为 $1$ ）. 定义 $2^l/2^{k-1}(k\geq1)$ 长度的时间序列对应的小波系数的阶数为 $k$ 阶，对应的时间粒度（最小分辨率）即为 $2^{l-k+1}$ . 第 $k$ 阶的第 $j(j\geq1)$ 个系数用于表示 $T_k^j=[(j-1)\cdot 2^{l-k+1}+1,j\cdot2^{l-k+1}](1\leq j\leq 2^{k-1})$ 这一时间区段内的上下文变量的变化趋势. 使用 $\psi_k^i$ 表示时间段 $T_k^j$ 对应的小波系数 ，用 $\phi_k^i$ 表示这段时间内的上下文属性的平均值，进而计算Haar小波系数：$$\psi_k^i=(\phi_{k+1}^{2j-1}-\phi_{k+1}^{2j})/2$$ 对于长度为 $2^l$ 的时间序列，其系数的阶数从 $1$ 到 $l$ . 如果全部计算则会得到 $1+2+\cdots+2^{l-1}=2^l-1$ 个系数，根据这些系数，再计算 $\phi_1^1$ 就可以还原整个时间序列，相当于没有压缩信息. 

可以绘制出**误差树**（error tree）：只关注从低阶系数（最开始是 $\phi_i$ ）出发到高阶系数的差值. 

处理时间序列数据的一个问题是过密集性：相邻时间步的上下文属性可能十分接近. 需要为上下文属性的变化确定区间. 




# 描述性统计量

## 离散度测量

- **总体方差** $\frac{1}{N}\sum\limits_{i=1}^{N}(x_i-\mu)^2$ **（无偏）样本方差** $\frac{1}{N-1}\sum\limits_{i=1}^{N}(x_i-\mu)^2$ . #imcomplete [[Prob]] . **标准差** ；
- **极差**： $\max-\min$ ；
- **MSE** $\frac{1}{N}\sum\limits_{i=1}^{N}(x_i-\bar{x})^2$ ；
- **绝对平均偏差**（MAD） $\text{Median}\{\lvert x_i-\bar{x}:1\leq i\leq N\rvert\}$ ；
- **四分位数**（quantile） $Q_1,Q_2,Q_3$ ， 有更一般的百分位数 $X_p$ ，定义 $\text{IQR}=Q_3-Q_1$ . 根据四分位数可以绘制**箱线图**（boxplot）： $\min,Q_1,\text{median},Q_3,\max$ ，其中 $\max=Q_3+1.5\text{IQR},\min=Q_1-1.5\text{IQR}$ ，其中 $1.5$ 是一个可以调整的系数. 

## 中性化趋势

**分组数据中位数**：$$M=L+\frac{\frac{N}{2}-S_{m-1}}{f_m}\times d$$ 其中 $L$ 表示该中位数所在组的下限， $N$ 表示数据集 $T$ 的数据个数， $S_{m-1}$ 表示中位数所在组之下的数据个数， $f_m$ 表示该组的数据个数， $d$ 表示该组的组距.

## 偏度系数

**偏度系数**（skewness）描述数据分布的偏斜程度： $$\text{Sk}(D)=E\left[\left(\frac{X-\mu}{\sigma}\right)^3\right]=\frac{\mu^3}{\sigma^3}$$ $S_k\approx0$ 表示数据近似对陈， $S_k>0$ 表示数据呈现右偏分布， $S_k<0$ 表示数据呈现左偏分布. 

数据的偏斜程度会影响中位数、均值、众数的分布，见 [[StatDraw]]

## 峰度系数

**峰度系数**（kurtosis）表示数据分布的发散程度： $$\text{Ku}(D)=E\left[\left(\frac{X-\mu}{\sigma}\right)^4\right]=\frac{\mu^4}{\sigma^4}$$ $\text{Ku}<0$ 表示数据更分散（峰度小）， $\text{Ku}>0$ 表示数据更集中（峰度大）. $\lvert \text{Ku}\rvert$ 越大，对应的数据分布特征就越明显. 

# 基本特征构造

单调变换：对数、指数

线性组合：适用于决策树（帮助其建立特征之间的关系）

比例：

时间序列特征的构造：时间类型数据转换，划分时间段；对振动信号进行 fourier 变换和小波变换；

离散数据**亚编码**：将 $m$ 个标称映射到 $0,1,\cdots,m-1$ ；二值化（e.g. 用 $3$ 个二值 $x_1,x_2,x_3$ 表示 $5$ 个类别）；
