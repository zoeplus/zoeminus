Dependencies: [统计学习](SL.md)

从浅显的角度上来说，神经网络是复合映射，可认为每一个神经网络层为一映射，多个网络层对输入值进行多次线性和非线性映射，最终得到输出. 

以网络的角度看有很多层，因此称为“深度”；根据数据集，以某指标为方向以某种优化方法不断更新神经网络的模型参数，称为“学习”.

>[!cite]- GAN中的一句话，深度学习是**表示学习**（representation learning）
>The promise of deep learning is to discover rich, hierachical models that represent probability distributions over the kinds of data encountered in artificial intelligence applications.

# 线性神经网络

首先关注[监督学习](SL.md#监督学习假设及概念)中预测的两个场景：**回归**和**分类**. 

## 线性神经网络用于回归

**预测器**：神经网络中的预测器是网络，由层和块构成. 其中层（layer）、块（module，由层和块构成）或者网络（net，各种层和块构成）中包含模型参数.

>[!note]- PyTorch：加载数据集并将其分割为训练集、验证集和测试集
>读取一个数组对象作为数据集. [Check here](DLCB.md#^TensorDataset)
>```Python
>import pandas as pd
>import torch
>from torch.utils import data
>train_data = pd.read_csv(.../.../train.csv)
>test_data = pd.read_csv(.../.../test.csv)
>dataset = data.TensorDataset(train_data[:,:-1],train_data[:,-1])
>dataset[0][0] # 访问数据集中第一个样本的特征
>
># 创建迭代器
>data_iter = data.DataLoader(dataset, batch_size=10, shuffle=True)
>count = 0
>for X, Y in data_iter: # 迭代5次，输出样本后停止
>	print(f'The {count+1}th batch samples\' features are {X},\n targets are {Y}')
>	print(X.shape, Y.shape)
>	count += 1
>	if count == 5:
>		break
>```
>下面将数据集随机分割为训练集、测试集和验证集. [Check here](DLCB.md#^RandomSplit)
>^PyTorchDataset

>[!summary]- 概念：回归和线性回归的假设
>- **回归**（regression）：对一个或者多个<u>自变量</u>与一个或者多个<u>因变量</u>之间的关系建模的一类方法. 线性回归（linear regression）最简单并且最流行.
>- **线性回归的假设**：1) 自变量$x$和因变量$y$之间的关系是**线性**的，即$y$可以表示为$x$中元素的<u>加权和</u>，通常允许包含观测值的一些**噪声**（noise）；2) 假设任何噪声都比较“正常”，如噪声遵循正态分布. 3) 关于噪声：大量随机因素的干扰.

>[!summary]- 机器学习中的通用概念
>机器学习中有三个比较通用的概念：**模型**、**策略**和**算法**.
>
>简单来说，<u>模型</u>建立的是输入与输出之间的映射；<u>策略</u>检验模型表现的性能，决定模型应该朝什么方向优化；<u>算法</u>则是如何基于策略进行优化的问题.
>
>线性神经网络使用线性回归模型，初始化模型参数之后，通常采用（小批量）随机梯度下降方法优化均方损失函数，从而不断更新模型参数.相应的三个概念为：
>- 模型（module, model, net）：线性回归模型
>- 策略（strategy, schedule, criterion）：均方损失函数
>- 算法（optimizer, algorithm, updater）：随机梯度下降

>[!summary]- 泛化与过拟合
>在监督学习中，如果一个在训练集上表现良好（计算损失较低）的模型应用于从未进行过训练的数据计算得到的损失也较低，这种现象称为**泛化（generalization）**
>
>为理解泛化的概念，首先考虑
>^GeneralizationOverfitting

>[!summary]- 线性回归模型
>线性回归模型是一个仿射变换.
>- **仿射变换**（affine transformation）：对特征进行**线性变换**（linear transformation，根据权重加权求和），并通过偏置进行**平移**（translation），这里给出的是对于一个二维变量的处理，对张量（三维及以上）的仿射变换类似$$\hat{y}=w^Tx+b,\quad w\in\mathbb{R}^d,x\in\mathbb{R}^d$$
>  或者对于一个大小为$n$的数据集进行作用：$$\hat{y}=Xw+b,\quad \hat{y}\in\mathbb{R}^n,X\in\mathbb{R}^{n\times d},w\in\mathbb{R}^d$$

>[!note]- PyTorch: 线性模型
>```Python
>'''在PyTorch框架下从头搭建一个'''
>class LinearModule1():
>	def __init__(self, weight, bias):
>		self.weight = weight
>		self.bias = bias
>	
>	def forward(self, input):
>		return torch.matmul(self.weight, input) + self.bias
>	
>
>'''使用PyTorch的nn模块'''
>class LinearModule2(nn.Module):
>	def __init__(self, input_nums, output_nums):
>		super().__init__()
>		self.net = nn.Linear(input_nums, output_nums)
>		self.net.weight.data.normal_(0,0.01) # 正态分布初始化权重
>		self.net.bias.data.fill_(0)
>	
>	def forward(self,input):
>		return self.net(input)
>
>input = torch.ones(4)
>
>LM2 = LinearModule2(4,2) # 用PyTorch自身的框架创建模型
>LM2 # 返回一个模型的简单介绍 LinearModule2( (net): Linear(in_features=4, out_features=2, bias=True) )
>LM2.net.weight, LM2.net.bias # 查看模型的参数
>LM2(input)
>
>LM1 = LinearModule1(LM2.net.weight.data, LM2.net.bias.data) # 将LM2的模型参数传到LM1中，注意，使用 .data方法传入的Tensor不再设置requires_grad=True
>LM1.bias, LM1.weight
>
>LM1.forward(input) == LM2(input)
>
>'''nn.Linear(in_features, out_features)是对输入数据的最后一个维度进行计算（与矩阵运算不同）'''
>Seq = torch.rand(2,10,3)
>LN = torch.nn.Linear(3,2)
>LN(Seq)[0,0] == LN(Seq[0,0])
>```
>^PyTorchLinearModel

>[!summary]- 概念：损失函数
>损失函数（loss function, cost function）是度量模型表现好坏的标准，输出数值越大损失越大

>[!summary]- 均方误差损失函数
>**均方误差损失函数**（或损失均值）：最常使用，对于真实标签$y^{(i)}$和预测值$\hat{y}^{(i)}$，定义**损失值**为：$$l^{(i)}(w,b)=\frac{1}{2}(\hat{y}^{(i)}-y^{(i)})^2$$其中常数$\frac{1}{2}$能够使得损失函数在求导后常数系数为1，便于计算. 定义均方误差损失函数：$$L(w,b)=\frac{1}{n}\sum\limits_{i=1}^{n}l^{(i)}(w,b)=\frac{1}{n}\sum\limits_{i=1}^{n}\frac{1}{2}(w^Tx^{(i)}+b-y^{(i)})^2$$

>[!note]- PyTorch: 均方误差损失函数 [Check here](DLCB.md#^MSELoss)
>```Python
>Y_pred = torch.tensor([1.,2.,3.])
>Y = torch.ones()
>criterion = torch.nn.MSELoss() # 返回损失平均值
>criterion_list = torch.nn.MSELoss(reduction='none') # 返回每个预测值对应的损失值
>criterion_sum = torch.nn.MSELoss(reduction='sum') # 总损失
>```
>^PyTorchMSE

>[!note]- 理论：损失函数与概率的关系，极大似然估计

到这里可以给出从深度学习角度对线性回归（亦称为单层线性神经网络）的解释：

给定训练数据的特征$X$和对应的真实标签$y$，线性回归的目标是找到一组权重向量$w$和偏置$b$：对于从$X$的概率同分布中抽取的新的样本的特征，这组权重向量和偏置能使得新样本预测标签的误差尽可能小.

下面就是怎么选（如何优化损失函数）.

>[!summary]- 概念：优化方法（学习策略，或更新器）
>- **解析解**（analytical solution）：线性回归具有解析解：$$w^*=(X^TX)^{-1}X^Ty$$
>
> 在其他情况下，例如引入了非线性函数（如ReLU函数）的[[1-多层感知机]]就没有解析解，这个时候对于损失函数的优化需要使用其他方法，通常用梯度下降，有以下方法.

>[!summary]- 批量梯度下降、随机梯度下降、小批量随机梯度下降
>- **批量梯度下降**（Batch Gradient Descent, BGD）：计算整个数据集的损失函数$L$的梯度，完全确定性（deterministic）优化.
> 
>- **随机梯度下降**（Stochastic gradient descent, SGD）：随机指每次打乱训练集进行训练（具有不确定性，或者称引入噪声），每一次计算一个样本的损失函数$L$的梯度$\nabla_{(w,b)} L$，然后更新参数：$(w,b)\leftarrow (w,b)-\eta \nabla_{(w,b)} L$（称为梯度下降，gradient descent），反复重复. 
>  - 其中$\eta$为一个提前设定的参数，称为**超参数**（hyper parameter）
>  - 注：根据$n$元函数（标量）的[Taylor公式](#^Taylor)，在局部沿着负梯度的方向函数值的下降最快，但是“局部”在定义域中的不同点是不同的，设置$\eta$（或称学习率）的目的即为保证局部近似有$f(x)=f(x_0)+\nabla f(x_0)\Delta x$，从而更好地优化.
>
>对于大型数据集，随机梯度下降不适用，太慢. 把批量梯度下降和随机梯度下降做一结合：小批量随机梯度下降
>
>- **小批量随机梯度下降**（Batch gradient descent, BSGD 一般把它称为SGD，PyTorch中的SGD也是这个）：在每一次迭代中，随机抽取一个小批量$B$（由固定数量的训练样本组成）进行以下更新：$$(w,b)\leftarrow(w,b)-\frac{\eta}{\lvert B \rvert}\sum\limits_{i\in B}\nabla_{(w,b)}l^{(i)}(w,b)$$其中：
>	- $\lvert B\rvert$表示批量大小（batch\_size，一个批量中包含的样本数量）；$\eta$是提前选定的一个正数，称为学习率（learning rate）.
>	- 对于线性回归，可以明确的将随机梯度更新写为以下形式：$$\begin{aligned}
&w\leftarrow w-\frac{\eta}{\lvert B \rvert}\sum\limits_{i\in B}\partial_{w}l^{(i)}(w,b)=w-\frac{\eta}{\lvert B\rvert}\sum\limits_{i\in B}x^{(i)}(w^Tx^{(i)}+b-y^{(i)})\\
&b\leftarrow b-\frac{\eta}{\lvert B\rvert}\partial_{b}l^{(i)}(w,b)=b-\frac{\eta}{\lvert B\rvert}\sum\limits_{i\in B}(w^Tx^{(i)}+b-y^{(i)})
\end{aligned}$$
>	- 学习率$\eta$和批量大小$\lvert B\rvert$可以调整，但（一般）并不在训练过程中更新. 这种不在训练过程中更新的参数称为**超参数（hyperparameter）**，**调参（hyperparameter tuning）** 是选择超参数的过程. 超参数通常是根据数据迭代结果来调整的，训练迭代结果是在独立的**验证数据集（validation dataset）** 上评估得到的。

>[!note]- PyTorch: SGD [Check Here](DLCB.md#^SGD)
>我们在上面已经介绍了PyTorch中的均方损失函数，PyTorch中可以使用`torch.optim.SGD`来实现随机梯度下降方法，下面给出的一个例子使用一个函数生成了一个噪声玩具数据集，然后用SGD对真实函数进行学习.
>```Python 
>def true_function(input):
>    return torch.matmul(input,torch.tensor([3., 4.]))
>
>def toy_dataset(sample_num):
>	noise = torch.normal(0, 3, (sample_num,1)) # 这里使用了一个均值为0，方差为3的分布生成噪声
>	X = torch.rand(sample_num, 2) * 10 + 5 # 使用(5,15)上的均匀分布生成样本特征
>	y_true = true_function(X).reshape(-1,1) # 真值
>	y = true_function(X).reshape(-1,1) + noise # 标签（观测值）
>	return zip(X, y)
>
>TD = toy_dataset(1000)
>
>W = [torch.tensor([2.,6.], requires_grad=True)] # 初始化参数
>criterion = torch.nn.MSELoss()
>optimizer = torch.optim.SGD(W, lr=0.0001) # 学习率0.0001（这个学习率并不是随便设置的，我事先打印了一些梯度，观察后设置学习率，否则可能会产生梯度爆炸，或者梯度消失）
>
>for X, y in TD: # 训练
>	optimizer.zero_grad()
>	y_pred = torch.matmul(W[0], X)
>	loss = criterion(y_pred, y.reshape(y_pred.shape))
>	loss.backward()
>	optimizer.step()
>
>W[0] # 查看模型参数，我这次返回的是tensor([2.7492, 4.2948], requires_grad=True)，而如果设置样本数量为5000，有一次返回了tensor([2.9938, 4.0046], requires_grad=True)，因为真实函数是凸性的，所以很好拟合.
>```
>^PyTorchSGD

>[!summary]- 概念：权重衰减（$L_2$正则化）
>**权重衰减**（Weight decay），或被称为$L_2$正则化，是一项很常见的技术. 为了提高模型的泛化能力，一般会<u>降低模型的复杂度</u>.
>
>假设函数的模型参数为$\mathbf{w}\in \mathbb{R}^{m\times 1}$，权重衰减使用**惩罚项**（penalty）$\lVert \mathbf{w}\rVert^2=\mathbf{w}^T \mathbf{w}$来度量模型的复杂性，这样做的原因是直观上$\lVert \mathbf{w}\rVert^2$越大，特征在发生微小变化时对结果的影响程度就越大，通常并不符合预期. 
>
>在进行优化时，将惩罚项加入损失函数中：$$L(w,b)+\lambda\lVert w\rVert^2$$其中$\lambda$为需要设定的非负超参数.
>
>- 与$L_2$正则化相对应的还有$L_1$正则化$\lvert \mathbf{w}\rvert=\sum\limits_{i=1}^{m}\mathbf{w}_i$，$L_2$相比于$L_1$而言对权重向量$\mathbf{w}$中的大分量的惩罚更大，算法更偏向于选择在大量特征上权重分布均匀的模型. 而$L_1$正则化有时导致模型将权重集中在一小部分特征上，发生**特征选择**（feature selection）
>^WeightDecay

>[!note]- Momentum
>使用小批量随机梯度下降可以加速计算（计算梯度的次数减少了），而且通过平均梯度还能够减少方差（**???**）
>
>**动量法**（Momentum）也能够减少方差，并且在这种情况下计算得到的梯度可以大于小批量随机梯度下降的平均梯度，这样在针对梯度“平缓”或者是局部最优的情况下更容易摆脱.
>
>**Momentum**（动量）在计算梯度时使用了过去的梯度，在$t+1$次更新时对第$t$次更新时使用的梯度加权，再加上当前批量计算得到的梯度（也加权）：$$\begin{aligned}
& m_{t+1}\leftarrow \beta \cdot m_t + (1-\beta)\sum\limits_{i\in B_t}\nabla_{(w,b)}l^{(i)}(w,b)\\
& (w,b)\leftarrow (w,b)-\alpha \cdot m_{t-1}
\end{aligned}$$
>- $\beta,\alpha$均为超参数，其中$\beta\in[0,1)$ 其中$$m_{t+1}\leftarrow \beta \cdot m_t+(1-\beta)\sum\limits_{i\in B_t}^{}\nabla{(w,b)}l^{(i)}(w,b)$$可以视为平均梯度的一种弱化，这种计算方法也称为**漏平均值**（Leaky average），Momentum还有其他的写法，如：$$\begin{aligned}
&m_{t+1}\leftarrow \beta m_t+\sum\limits_{i\in B_t}^{}\nabla_{(w,b)}l^{(i)}(w,b)\\
&m_{t+1}\leftarrow \beta m_t+\alpha\sum\limits_{i\in B_t}^{}\nabla_{(w,b)}l^{(i)}(w,b)
\end{aligned}$$
>- 直观上理解Momentum：首先每一次计算的批量梯度都加权$1-\beta$，其实可以视为学习率，考虑$\beta m_t$这一部分，如果连续的迭代中$\beta m_t$的正负一致，那么梯度更新速度实际上在不断加快，反之，如果在连续的迭代中$m_t$的符号不能确定，那么将会表现为模型的梯度变化幅度缓慢（减小或者增大）.
>- 关于超参数的设置，如果$\beta$设置较小，那么对于过去的依赖弱，反之越接近于平均（这时学习率要设得更小）.
>
>**Nesterov accelerated momentum**: $$\begin{aligned}
&m_{t+1}\leftarrow \beta m_t + (1-\beta)\sum\limits_{i\in B_t}^{}\nabla_{(w,b)}\frac{\partial{l^{(i)}}[(w,b)-\alpha \cdot m_t]}{(w,b)}\\
&(w,b)\leftarrow (w,b)-\alpha\cdot m_{t+1}
\end{aligned}$$Nesterov acclerated momentum相对于momentum的区别是，直接使用了momentum中梯度更新之后的参数来计算损失函数的梯度（**???** 有用吗，计算梯度的结果改变吗？）
>
>下面用一段伪代码说明带Momentum的SGD算法（参照PyTorch框架），假设函数为$f$，其第$t$次迭代后的参数为$\theta_t$，第$t$次计算得到的梯度为$g_t$，$\lambda$为权重衰减所置超参数，$m_t$为第$t$次迭代时的Momentum（在未使用Nesterov时也即更新梯度），$\mu,\tau$为应用Momentum方法时设置的两个超参数，$\gamma$为在不使用Momentum下设置的学习率：
>$$\begin{aligned}
&\text{for }t=1\ \text{to }T \text{ do}\\
&\quad g_t\leftarrow \nabla_\theta f(\theta_{t-1})\\
&\quad \text{if } \lambda\neq 0\\
&\quad \quad g_t\leftarrow g_t+\lambda \theta_{t-1}\\
&\quad \text{if } \mu\neq0\\
&\quad \quad \text{if }t>1\\
&\quad \quad \quad m_t\leftarrow \mu m_{t-1}+(1-\tau)g_t\\
&\quad \quad \text{else }\\
&\quad \quad \quad m_t\leftarrow g_t\\
&\quad \quad \text{if } nesterov\\
&\quad \quad \quad g_t\leftarrow g_t+\mu m_t\\
&\quad \quad \text{else }\\
&\quad \quad \quad g_t\leftarrow m_t\\
&\text{else}\\
&\quad \theta_t\leftarrow \theta_{t-1}-\gamma g_t
\end{aligned}$$
>^Momentum

>[!note]- Adam
>有时计算得到的梯度太大（太小），我们希望更新时能更中庸一些. 一种直观的想法是对于梯度进行标准化，假设计算得到的梯度为$\text{grad} = \nabla_{(w,b)}L(w,b)$，标准化得到：$$(w,b)\leftarrow (w,b)-\alpha \frac{\text{grad}}{\sqrt{\lvert \text{grad}\rvert^2}+\epsilon}$$
>- 其中$\epsilon$为一个很小的常数项，用于防止数值上溢或者返回Non值（当分母为$0$时）.
>- 使用这种正则化方法能够限制梯度的移动，但是也带来了一些问题：在接近最优点（或者局部最优时）计算得到的原始梯度可能是小的，但是由于标准化，梯度可能仍然维持在较大的水平上，造成模型参数的更新来回震荡.
>
>所以我们仍然需要可调整的梯度，实现方式可以是参照过去的梯度.
>
>**Adam**（Adaptive moment estimation）结合了上述提到的Momentum和梯度标准化的概念，首先，基于之前的梯度更新结果，按照Momentum方法计算$m_{t+1}$，并更新标准化需要用到的方差$v_{t+1}$：$$\begin{aligned}
&m_{t+1}\leftarrow \beta\cdot m_t + (1- \beta)\nabla L_{(w,b)}\\
&v_{t+1}\leftarrow \gamma v_t + (1-\gamma) (\nabla_{(w,b)})^2
\end{aligned}$$在开始的时候，迭代次数少，因此不需要过小的估计（加权可能是不必要的），随着迭代次数的增加越是需要之前的梯度计算数据作为依据调整当前计算梯度，因此有：$$\begin{aligned}
& \widetilde{m}_{t+1}\leftarrow \frac{m_{t+1}}{1-\beta^{t+1}}\\
& \widetilde{v}_{t+1}\leftarrow \frac{v_{t+1}}{1-\gamma^{t+1}}
\end{aligned}$$
>最后对梯度（momentum）进行标准化，更新模型参数$$(w,b)\leftarrow (w,b)-\alpha \frac{\widetilde{m}_{t+1}}{\sqrt{\widetilde{v}_{t+1}}+\epsilon}$$
>- 以上$\gamma,\beta,\alpha$均为超参数（**???** 实践中怎么设置?）在Adam相关的论文中，推荐设置$\epsilon=1e-9,\beta=0.9,\gamma=0.999$
>^Adam

>[!note]- PyTorch: Weight decay, Momentum [Check here](DLCB.md)
>尝试使用一个数据集，用同样的网络和初始参数，MSE作为损失函数，分别使用SGD，SGD + weight dacay, SGD + Momentum优化，更具体的应用具体见这个[例子](#^ExampleCovidCasesPrediction)，注意这里没有使用小批量（而且也没有对数据集进行随机打乱，但是由于每次模型初始参数不同，结果还是有差距的），但是在直观上已经能看出优化算法之间的差异
>
>这里用到的数据集`Dataset`从[PyTorch SGD](#^PyTorchSGD)中写的函数`toy_dataset()`生成的
>```Python
>import copy # 用于克隆模型（不同的内存空间）
>
>def come_my_SGDs(net):
>	SGD = torch.optim.SGD(net.parameters(), lr=0.0001)
>	SGD_wd = torch.optim.SGD(net.parameters(), lr=0.0001, weight_decay=0.2)
>	SGD_m = torch.optim.SGD(net.parameters(), lr=0.0001, momentum=0.9)
>	return SGD, SGD_wd, SGD_m
>
>net_0 = nn.Linear(2,1)
>Dataset = [list(td) for td in toy_dataset(1000)]
>
>for i in range(3):
>	net = copy.deepcopy(net_0) # 每次复制最开始的网络，保证初始化参数完全相同
>	print(net.weight.data, net.bias.data)
>	optimizer = come_my_SGDs(net)[i]
>	for X, y in Dataset:
>		loss = (net(X) - y).pow(2) / 2
>		loss.backward()
>		# print(net.weight.grad, net.bias.grad)
>		# print(net.weight.data, net.bias.data)
>		optimizer.step()
>		# print(net.weight.data, net.bias.data, '\n')
>		optimizer.zero_grad() # 务必注意，否则梯度将会积累，结果将错到离谱
>	print(net.weight.data, net.bias.data)
>	print('\n next one :)\n')
>	
># 最后我的返回是：
># tensor([[0.5320, 0.4991]]) tensor([-0.4939])
># tensor([[3.2596, 3.7796]]) tensor([-0.2124])
>
>#  next one :)
>
># tensor([[0.5320, 0.4991]]) tensor([-0.4939])
># tensor([[3.2576, 3.7735]]) tensor([-0.2019])
>
>#  next one :)
>
># tensor([[0.5320, 0.4991]]) tensor([-0.4939])
># tensor([[3.0263, 4.0161]]) tensor([-0.2356])
>
>#  next one :)
>```
>需要注意的细节：
>- 超参数的设置，这里其实的三个超参中最重要的一个超参是学习率`lr`，我在设置其为$0.1,0.01$都会出现很大的问题，最后的结果严重偏离真实值（而且这个模型一点都不复杂）
>- 从上方的表现来看似乎是Momentum胜出，但是实际上Momentum也受到学习率的影响，事实上在学习率为$0.001$时，有时三者中Momentum的效果反而不如前两者.
>- 模型参数的初始化也会造成结果上很大的变化
>- 我这里使用的数据集在$f=3x_1+4x_2$上加上以$0$为均值，以$3$为方差的正态分布的噪声得到的，注意真实函数$f$不含参数，返回的结果中，模型的偏置也在减小，但是一个有趣的现象是，即使初始化参数中偏置很小（i.e.$0.0160$），经过训练之后模型的权重很接近$f$的权重，但是偏置却并不如此，反而增大（$0.3131, 0.3137, 0.2614$），<u>思考这是为什么</u>.

>[!note]- PyTorch: Adam [Check here](DLCB.md#^Adam)
>Adam中涉及到的超参数有学习率$\alpha$，更新Momentum时设置的$\beta$，更新方差设置的$\gamma$，Adam也可以设置权重衰减所用到的参数$\lambda$.
>^PyTorchAdam

>[!note]- Dropout
>==State: 需要更多完善==
>
>和之前所提到的[权重衰减](#^WeightDecay)的思想相同，Dropout也倾向于降低模型的复杂度. 一种观点认为复杂性较低的模型对于输入的微小特征的敏感程度应该低一些，<u>加入一些随机噪声将不会对结果造成很大影响</u>，具备这种性质的模型也称其具有**平滑性**（smoothness）.
>
>**Dropout**（暂退法）的想法是，在网络进行前向传播时，<u>在计算后面的层之前向其输入中加入一些噪声</u>，而在神经网络的实际训练过程中，实现注入噪声的方法为丢弃一些神经元（所以称为Dropout）
>
>具体算法如下：首先假设上一层（$l$）的输出值为$\mathbf{y}^{(l)}$，在进行计算之前，从Bernoulli分布中随机抽样一个随机向量$\mathbf{r}^{(l)}$：$$r_j^{l}\sim \text{Bernoulli}(p)$$然后对于输入进行丢弃（置$0$，从而等同于丢弃神经元）：$$\widetilde{\mathbf{y}}^{(l)}=\mathbf{r}^{(l)}\circ \mathbf{y}^{(l)}$$其中$\circ$为按元素计算，接着进行传到下一层（$l+1$）中计算.
>
>- 上面所提到的注入噪声的方法，最直观的方法是在输出上添加一个从均值为$0$的分布中采样的噪声，i.e.一个高斯分布：$$x'=x+\epsilon, \epsilon\sim \mathcal{N}(0, \sigma^2)$$这样做的考虑是使得$E[x']=x$，而在Dropout中，我们也希望实现这种效果，因此会将未被Dropout的值缩放，于是Dropout操作可以写作：$$h'=\left\{\begin{aligned}
&0,\quad prob=p\ (dropout)\\
&\frac{h}{1-p}\quad prob=1-p\ (not\ dropout)
\end{aligned}\right.$$因为每一层的Dropout是独立进行的，所以每一层的输出值的期望都等同于输入值. 只不过这种方法有一种显然的问题，参数梯度也被放缩了. 为了解决这一问题需要调整学习率. **!!!** 这里还需要理论上的进一步计算：在链式法则下，这样做具体会对梯度的优化造成什么影响，是否在多次Dropout的情况下一个参数的梯度更新的期望等同于未Dropout的情况？
>- 关于Dropout，还有一个问题是是否需要每次迭代都Dropout，如果不Dropout，或者间隔几次迭代Dropout一次会对结果产生什么影响?

>[!note]- PyTorch: Dropout [Check here](DLCB.md#^Dropout)
>```Python
>class dropout_net(nn.Module):
>	def __init__(self, d1, d2): # 这里设置了两个参数分别表示两个Dropout操作对应的概率
>		super().__init__()
>		self.net = nn.Sequential(
>			nn.Linear(8,8),
>			nn.Dropout(d1),
>			nn.Linear(8,4),
>			nn.Dropout(d2),
>			nn.Linear(4,1)
>		)
>	
>	def forward(self, input):
>		return self.net(input)
>
># PyTorch的Dropout操作会在每一次计算的时候进行执行一次（每次被Drop的都是不同的神经元）
>dn = dropout_net(0.2, 0.3) # 为了简便起见设置的概率较低，实际实践中一般设置0.5以上，并且接近1
>cn = [] # children of the net
>for child in dn.net.children(): # 这里要使用dn.net 是因为在写dropout_net类时其.children()只有net，访问的是dn的孙子们
>	cn.append(child)
>cn # 这里把网络中的各个子层取出来单独分析
>X = torch.ones(8)
>cn[0](X) # 在没有经过Dropout之前，返回的$8$个值是稳定的
>cn[1](cn[0](X)) # Dropout层会依照概率随机丢弃一些神经元的输出，也就相当于丢弃神经元，多次运行，返回的结果并不相同.
>
># 下面查看梯度
>Y = dn(X)
>Y.backward()
>print(cn[0].weight.grad, cn[2].weight.grad, cn[4].weight.grad)
>dn.zero_grad() # 多次运行，观察梯度置零的行和列，理解Dropout对链式法则求导的影响.
>```
>^PyTorchDropout

>[!example]- 例子：线性回归通用，但缺陷很大
>- 图像、自然语言、语音、DNA序列都可以转换为向量表示，从而可以用于线性回归.
>- 但是，这样可能会破坏数据本身的结构，比如，如果使用向量表示图像，那么图像原本的<u>空间结构</u>（例如：边缘）就会被破坏，训练效果会很差. 见[[V-Deep Learning#卷积神经网络]].
>
>还可以从其他方面看到线性本身就存在的问题：
>
>- **XOR**：线性模型无法拟合XOR
>^LinearFlaws

目前介绍了线性神经网络中的所有元素：数据集，预测器（模型），损失函数，优化方法，这些概念是通用的，因而可以给出下面的深度学习（监督学习）一般算法.

>[!note]- PyTorch: 训练模型并测试
>神经网络训练和测试的流程基本相同，在PyTorch框架下：
>1) **加载数据集**（torch.utils.data）：包括将原数据转化为PyTorch中的Dataset对象，然后将其分割为train_data, validation_data, test_data，将train_data传入DataLoader中，根据已经确定的批量大小，返回一个可迭代对象train_iter用于训练；
>2) **定义神经网络模型**（torch.nn.Module）：选择要用到的网络层，定义的网络需要继承torch.nn.Module，并进行初始化，定义forward()方法；
>3) **定义损失函数**（torch.nn）：根据问题选择相应的损失函数（例如对于回归问题用MSE，对于分类问题用CrossEntropy）
>4) **定义优化方法**（torch.optim.Optimizer）；
>5) **训练**：确定训练周期，在每一个训练周期内，网络首先进行前向传播：计算train_iter中每一个批量输出结果，损失函数随后根据数据结果计算网络损失，然后用优化方法对于网络模型进行更新，重复多次；
>6) **验证**：用验证集对于模型的性能进行评估，可能会再次返回到训练阶段继续训练，或者进行数据集的特征选取，网络模型、损失函数、优化方法的修改，然后再进行验证，注意验证集不是固定的，会使用交叉验证的方法确保这点；
>7) **测试**：测试集上的数据不用于训练，模型从来没有见过，用于测试模型的实际性能.
>
>注意：对于每一批（batch）数据，首先需要清零优化器的梯度`optimizer.zero_grad()`([Check here](DLCB.md#^whyzerograd))，然后使用`loss.backward`计算梯度，最后使用`optimizer.step()`调整模型参数
>
>```Python
>import torch
>import torch.nn as nn
>import torch.utils.data
>
>dataset = 
>batch_size = 10
>n_epochs = 3
>
>train_iter = DataLoader(dataset ,batch_size, shuffle=True)
>
>criterion = nn.MSELoss()
>optimizer = torch.optim.SGD(net.parameters(), 0.1)
>
># training the model
>for epoch in range(n_epochs):
>	net.train()
>	for X, Y in train_iter:
>		optimizer.zero_grad()
>		Y_hat = net(X)
>		loss = criterion(Y_hat, Y)
>		loss.backward()
>		optimizer.step()
>	total_loss = criterion(net(train_dataset[:]), Y)
>	
># validate the model
>net.eval()
>total_loss = 0
>
># test the model: the final output
>```

>[!example]- Example: Regreesion with PyTorch：From [Lhy_ML 2023-Spring HW01](https://www.kaggle.com/competitions/ml2023spring-hw1/overview)
>- **Task Description**: COVID-19 Cases Prediction. Given survey results in the past 3 days in a specific staet in U.S., then <u>predict the percentage of new tested postitive cases in the 3rd day</u>
>- **Data**:
>	- Feature:
>		- State (35): encoded to one-hot vectors
>		- COVID-like illness (5): cli, ili ...
>		- Behavior indicators (5): wearing_mask ...
>		- Belief indicators (2): belief_mask_effective
>		- Mental indicators (2): worrier_catch_covid ...
>		- Environmental indicators (3): other_masked_public
>	- Target:
>		- ==Tested Positive Cases== (1): tested_postitive
>- **Evaluation Metric**: MSE
>- **Hints**:
>	- Simple: sample code
>	- Medium: Feature selection
>	- Strong: Different optimizers and L2 regularization
>	- Boss: Better feature selection, different model architectures and try more hyperparameters
>^ExampleCovidCasesPrediction

>[!summary]- 概念：线性回归到神经网络
>下面是一个单层单输出神经网络
>
>![[单层神经网络（单输出）]]
>- 输入层中的**输入数**（或者称为**特征维度**，feature dimensionality）为$d$.
>- 网络的**输出**为$o_1$，这里**输出数**为1.
>- 计算神经元
>- **层数**：注意，模型重点放在发生计算的地方，所以通常在计算层数时不考虑输入层。图中层数为1.
>- 每个输入都与每个输出相连，这种变换称为**全连接层（fully-connected layer）**，或者**稠密层（dense layer）**.

>[!summary]- 概念：神经元角度看神经网络
>![[线性单元表示]]

---
### 线性神经网络用于监督学习：分类

分类问题也是监督学习的一个重要问题，样本标签为离散值（回归的样本标签为连续值），但事实上我们可以将分类问题当成回归问题.

>[!example]- 例子：分类问题
>- 二分类：患病，不患病？
>- 多分类：糖尿病？或心血管疾病？或脑部疾病？...
>- 多标签分类：既有糖尿病，又有心血管疾病？...

>[!summary]- 概念：硬类别，软类别
>- 通常，关注**硬类别**，即属于哪个类别. 但有时分析的是**软硬别**的模型：属于每个类别的概率. 具体到判断属于何种类别时，可以取概率值最大的作为预测类别输出（多分类），或者选择概率值前几个最大的作为预测类别输出（多标签分类）.
>- 在这种情况下，分类就可以当作回归来做，预测的是一个概率值（连续值）

>[!summary]- 概念：类别的自然顺序，独热编码
>- 类别间有一些**自然顺序**. 例如：$$\{total noob, noob, amateur, producer, genius\}$$似乎，可以对离散值分配这样的值：$$\{1,2,3,4,5\}$$但是又不对，例如total noob和noob之间的差别（分配差值为$2-1=1$）等同于noob和amateur之前的差别（差值也为$3-2=1$）吗？显然分类问题不能这样作为回归问题对待.
>- 对于类别间不存在自然顺序的清醒，可以采取**独热编码**（one-hot encoding）i.e.对于$$C=\{human, plant, computer\}$$可以将其编码为：$$\mathcal{Y}=\{(1,0,0),(0,1,0),(0,0,1)\}$$这样模型的每一个输出值都应该是一个$n=\lvert C\rvert$的向量$y\in \mathcal{Y}$.

>[!summary]- softmax运算
>- 比如说我们现在想要给出一个样本的各个类别的概率预测，那么输出的值应该为一个向量，其中的每一个值表示属于该类别的概率，则所有值的和应该为$1$，softmax运算能够将一个向量转化为满足上述条件的向量：$$\hat{y}=softmax(\mathcal{o}),\quad where\quad \hat{y_j}=\frac{exp(\mathcal{o_j})}{\sum\limits_{k}^{}exp(\mathcal{o_j})}$$
>- softmax之所以称“软最大化”

>[!note]- PyTorch: softmax计算 [Check here](DLCB.md#^Softmax)

>[!summary]- 交叉熵损失函数
>考虑一个分类问题，假设待计算损失的集合为：$$S=\{(x_i,y_i,\hat{y}_i)\}_{1\leq i\leq n}$$其中$x_i,y_i,\hat{y}_i$分别为第$i$个样本的特征、标签和预测. 标签$y$是一个独热编码向量，预测$\hat{y}$则是一个概率向量，表示每个类别的概率.
>
>使用极大似然估计法，并结合独立性假设，给定$X$观测到$Y$的似然（函数）为：$$P(Y \,|\,X)=\prod_{i=1}^nP(y_{i}\,|\,x_{i})$$
下面最大化似然函数，相当于最小化负对数似然：$$-\log{P(T \,|\,X)}=\sum\limits_{i=1}^{n}-\log{P(y_i\,|\,x_{i})}=\sum\limits_{i=1}^{n}l(y_{i},\hat{y}_{i})$$
其中，对于任何一对标签$y_j$和模型预测$\hat{y}_j$，损失函数$$l(y_j,\hat{y}_j)=-\log\prod_{k=1}^{q}\left(\hat{y}^{(k)}_j\right)^{y^{(k)}}=-\sum\limits_{k=1}^{q}y^{(k)}_j\log{\hat{y}_j^{(k)}}$$
>该损失函数通常被称为**交叉熵损失（cross-entropy loss）**

>[!note]- PyTorch: 交叉熵损失 [Check here](DLCB.md#^CrossEntropyLoss)
>```Python
>loss = nn.CrossEntropyLoss(reduction='None')
>```

>[!summary]- softmax回归解决分类问题
>计算表达式：$$\begin{aligned}
&O=WX+b\\
&\hat{Y}=softmax(O)\\
&X\in\mathbb{R}^{n\times d},W\in\mathbb{R}^{d\times q},b\in\mathbb{R}^{1\times q}\end{aligned}$$
>实际就是先使用了线性回归，然后用softmax处理后作为输出值输出. 并可以进行类别预测$$c=\mathop{argmax}\limits_{j}\hat{y_j}=\mathop{argmax}\limits_{j}\hat{o_j}$$

>[!note]- softmax回归的上溢和下溢问题
>对于softmax运算：$$\hat{y}_j=\frac{\exp(o_j)}{\sum\limits_{k}\exp(o_k)}$$存在以下两个问题：
>- **上溢**（overflow）：如果$o_k$中的一些数值非常大，$\exp(o_k)$可能大于数据类型所容许的最大数字。这将使分母或者分子变为`inf`，最后得到的$\hat{y}_j$可能为0,`inf`或者`nan`（**???**）；
>  解决该问题的一个技巧是从所有的$o_k$中减去$\text{max}o_k$：$$\begin{aligned}\hat{y}_j
  &=\frac{\exp(o_j-\max(o_k))\exp(\max(o_k))}{\sum\limits_{k}\exp(o_k-\max(o_k))\exp(\max(o_k))}\\
  &=\frac{\exp(o_j-\max(o_k))}{\sum\limits_{k}\exp(o_k-\max(o_k))}
  \end{aligned}$$
>- **下溢**（underflow）经过上述针对上溢的处理之后，部分$o_j-\max(o_k)$可能具有较大的负值，从而使得一些$\exp(o_j-\max(o_k))$有接近零的值，使得$\log(\hat{y}_i)$的值为`-inf`（如果计算时分子的值接近零的话），但实际上，在进行交叉熵计算时：$$\begin{aligned}
\log(\hat{y}_j)&=\log\left(\frac{\exp(o_j-\max(o_k))}{\sum\limits_{k}\exp(o_k-\max(o_k))}\right)\\
&=\log(\exp(o_j-\max(o_k)))-\log\left(\sum\limits_{k}\exp(o_k-\max(o_k))\right)\\
&=o_j-\max(o_k)-\log\left(\sum\limits_{k}\exp(o_k-\max(o_k))\right)
\end{aligned}$$这样，如果不直接计算$\hat{y}_i$，就可以避免数值下溢的问题

>[!note]- 对于交叉熵损失从概率论角度和信息论角度的解释
>- 概率论角度：上面在介绍交叉熵损失时所计算的：$$P(y^{(i)}\,|\,x^{(i)})=\prod_{j=1}^{q}\hat{y}_j^{y_i}$$的意义是模型给出的预测正确的概率，通常为了便于优化和理论计算转换为负对数，即为交叉熵损失；
>
>对于交叉熵损失：也可以写作以下连续形式：$$L=\int p(x)\log \hat{y}(x)dx$$
>
>交叉熵损失这一概念来自信息论，对于下面介绍的内容的一个总结就是：交叉熵相当于在已知概率分布$P$的情况下，对于概率分布$Q$编码所需要的信息量.
>
>- 信息论角度：
>	- **熵**：信息论的核心思想是<u>量化数据中的信息内容</u>，在信息论中，该数值被称为分布$P$中的熵（entropy）：$$\begin{aligned}&H[P]=\sum\limits_{j}-P(j)\log_2 P(j)\\&H[P]=\sum\limits_{j}-P(j)\ln P(j)\end{aligned}$$底数为2的对数表示信息的单位是比特（binary digit，二进制位），底数为$e$的对数表示信息的单位是纳特（nat），一个纳特是$\frac{1}{\ln 2}\approx1.44$比特. 
>	- 熵所反映的直接信息在于：对于概率越大的事件，携带的信息量很小（已经比较确定其会发生）；对于概率越小的事件，其携带的信息量越大（其发生是不确定的）.或者说，熵是一个随机变量的不确定性的度量，越多的信息会导致越小的熵.
>	- **信息量**：如果不能够完全预测每一个事件，可能会感到“惊异”，采用**信息量**$\log\frac{1}{P(j)}=-\log P(j)$量化这种惊异程度. 在观察到一个事件$j$时，赋予其（主观）概率$P(j)$，当赋予一个事件较低的概率时，该事件的惊异程度更大，信息量也就更大，从这个角度看，上面定义的熵即为信息量的期望.
>	- **交叉熵**：如果将熵$H(P)$理解为“知道真实概率的人所经历的惊异程度”，那么对于交叉熵的定义：$$H[P,Q]=\sum\limits_{j}^{}-Q(j)\log P(j)$$可以理解为“主观概率为$Q$的观察者在看到概率$P$生成的数据时的预期惊异”，当$P=Q$时，交叉熵达到最低.

>[!summary]- 分布迁移
>在[泛化](#^GeneralizationOverfitting)中已经提到预测器最终学习到的应该是潜在的概率分布. 但实际上会存在这种潜在的概率分布随着时间发生变化的情况，称为**分布迁移**

---

## 多层感知机

这里特别提了一下感知机.

### 感知机

>[!note]- 写在前面
>感知机可以视为神经网络的前身，相当于非线性神经元，其中采用梯度下降优化、使用激活函数提升拟合性能和多层感知机一致.
>
>但是感知机这种十分简单的模型和现代深度学习的网络结构设计其实又有很大的区别...
>
>本部分将传统感知机称为I型感知机，然后定义了II型感知机.

>[!summary]- 概念：线性假设的不足
>之前在[线性神经网络部分](#^LinearFlaws)中已经提及了线性的不足之处，这里总结一下主要的点：
>- 单调假设：认为一个特征的增大（或者减少）只会使得结果发生单调的变化. 但是：
>  有可能在某个区间段是单调增的，在另一个区间段是单调减的；
>- 单个影响：认为特征的影响是独立于彼此的. 但是：
>  有可能存在特征之间的制约和协同. 例如两个特征同时增大会对结果造成更大的影响.

>[!summary]- 感知机
>**感知机**（perceptron）模型如下：
>
>- I型：$$f(x)=\text{sign}(\mathbf{w}\cdot \mathbf{x}+b),\mathbf{x}\in \mathcal{X}\subset\mathbb{R}^n,\mathbf{w}\in \mathbb{R}^n,b\in \mathbb{R},y\in \mathcal{Y}=\{0,1\}\subset \mathbb{R}$$其中$\text{sign}$为符号函数.
>- II型：$$f(x)=\text{ReLU}(\mathbf{w}\cdot \mathbf{x}+b),\mathbf{x}\in \mathcal{X}\subset\mathbb{R}^n,\mathbf{w}\in \mathbb{R}^n,b\in \mathbb{R}$$
>
>- I型感知机实际上是一个**线性分类器**（linear classifier），其要分类的样本所在的**特征空间**（feature space）为$\mathcal{X}$，从特征空间映射到的输出空间为$\mathcal{Y}$，$\mathbf{w}\cdot \mathbf{x}+b=0$为$\mathcal{X}$中的一个**超平面**（hyperplane）.给定一个训练集$TD=\{(\mathbf{x}_1,y_1), \cdots, (\mathbf{x}_N,y_N)\},\mathbf{x}_i\sim \mathcal{D},y_i=\text{label}(\mathbf{x}_i)$，其中$\mathcal{D}$为一个未知分布，$\text{label}$为真实的标签函数，I型感知机的目的即为从中学习到一个对于特征空间的超平面，将特征空间划分为两部分，使得其对于从未知分布$\mathcal{D}$中生成的新样本具备较好的分类效果.
>  
>- II型感知机则将特征空间$\mathcal{X}$映射到一个新的空间$\mathcal{Y}$中.（与I型感知机对特征空间进行划分对比）
>	- 对于$\mathbf{X}\in \mathbb{R}$的情形，可以简单地理解为曲线拟合，效果非常差.
>^Perceptron

>[!summary]- 从感知机（单个神经元）到多个神经元（一个层）
>之前已经说过，感知机
>^Layer

---
### 从感知机到多层感知机

感知机使用激活函数克服线性模型的限制了一些线性限制，但是仍有不足. 事实上，一个相当重要的能力就是模型的表示能力，为此需要引入分析理论.

>[!note]- 通用近似理论
>Sources: [Wikipedia](https://en.wikipedia.org/wiki/Universal_approximation_theorem)
>通用近似理论（Universal approximation theorem）
>>[!note]- 定理：任意宽度情形下的通用近似理论
>>
>>$C(X,\mathbb{R}^m)$表示从$X\subset \mathbb{R}^n$到$\mathbb{R}^m$的所有连续函数组成的集合，取$\sigma\in C(\mathbb{R},\mathbb{R})$，定义按元素计算$(\sigma\circ x)_i=\sigma(x_i)$. $\sigma$不是多项式当且仅当对于任意$n\in \mathbb{N},m\in \mathbb{N}$，紧集$K\subset \mathbb{R}^n,f\in C(K,\mathbb{R}),\epsilon>0$，存在$k\in \mathbb{N},A\in \mathbb{R}^{k\times n},b\in \mathbb{R}^k, C\in \mathbb{R}^{m\times k}$使得：$$\sup_{x\in K}\lVert f(x)-g(x)\rVert\leq \epsilon$$其中$g(x)=C\cdot (\sigma\circ (A\cdot x+b))$
>>
>>- 该定理表明：隐层具有任意宽度（或任意单元数量）的多层感知机能够近似任意函数.
>>- 任意宽度情形（arbitrary width case, 1989, Kurt Hornik, Maxwell Stinchcombe, Halbert White）证明，多层前馈神经网络（multilayer feed-forward networks）为通用逼近器，并且Hornik之后也指出：并不是激活函数的选择，而是多层前馈结构本身使得神经网络成为通用逼近器. Moshe Leshno等人指出通用近似性质等价于**非多项式激活函数**（nonpolynomial activation function）
>>

>[!note]- 感知机的能力
>感知机模型：$$f(\mathbf{x})=a(\mathbf{w}\cdot \mathbf{x}+b)$$

>[!summary]- 概念：多层感知机
>**多层感知机**（Multilayer perceptron, MLP）的结构如下（以单隐藏层为例）：$$\begin{aligned}
&H=\sigma(XW^{(1)}+b^{(1)})\\
&O=HW^{(2)}+b^{(2)}
\end{aligned}$$
>- $X\in\mathbb{R}^{n\times d}$表示$n$个样本的小批量，其中每个样本有$d$个输入特征.
>- $H\in\mathbb{R}^{n\times h}$表示隐藏层的输出，也称为**隐藏表示**（hidden representation），其具有$h$个**隐藏单元**.
>- 隐藏层和输出层都是全连接的，因而有隐藏层权重$W^{(1)}\in\mathbb{R}^{d\times h}$和隐藏层偏置$b^{(1)}\in\mathbb{R}^{1\times h}$，以及输出层权重$W^{(2)}\in\mathbb{R}^{h\times q}$和输出层偏置$b^{(2)}\in\mathbb{R}^{1\times q}$
>- 在多层感知机的结构中$XW^{(1)}+b^{(1)}$即为线性神经网络中的仿射变换，在仿射变换之后对于每一个**隐藏单元**应用非线性的**激活函数**（activation function）$\sigma$，**激活函数的输出值或被称为**活性值**（activation）
>	- 可以将激活函数视为一个神经网络层，其包含$n$个单元，每个单元分别只与前一个神经网络层的神经元连接，接受该神经元的输出并计算输出活性值.

>[!summary]- 概念：块
>之前讨论[II型感知机](#^Perceptron)时，一个感知机相当于<u>一个神经元</u>，其接收一个或者多个输入（$\mathbf{x}$），对其进行线性变换$\mathbf{w}\cdot \mathbf{x}+b$，然后进行激活（$\text{ReLU}$等）
>
>[随后](#^Layer)介绍了多个II型感知机组成形成的<u>层</u>的能力：将特征空间映射到另一个特征空间，给定一个带标签的训练集，多个感知机组成的层可以从中学习到映射.
>
>**块**（Module, Block）的概念则更为广泛些，块有许多结构，常见的结构有：
>- 顺序结构：块$M$由多个层$L_1,L_2,\cdots,L_m$按照顺序组成，对于输入$X$，按照顺序层对其多次作用以给出输出：$$L_m(\cdots(L_2(L_1(X)))\cdots)$$多层感知机就是一种顺序结构；
>- [残差结构](#^ResidualLayer)：数据的传递并不是顺序的. 例如，假设块$M$中接受输入$X$，包含$L_1,L_2$两个层，该块的输出为$O=X+L_2(L_1(X))$，其中$X$为输入的数据，其首先被传递给了$L_1$，然后$L_1(X)$传递给了$L_2$，但在输出时$X$又被传递到输出层中.
>- 循环结构：该块会被反复使用.
>
>一个块做的事情和层或者单独的神经元类似：
>1) 初始化参数
>2) 前向传播阶段：接收输入数据，计算后将输出传递到之后的层；
>3) 反向传播阶段：接收来自上游的梯度（见[计算图](Graph)），根据链式法则计算梯度并更新块中的参数.
>此外这个块和应该能够访问并修改参数.
>
>块这种概念在现代的网络结构中非常常见，很多网络结构的中间部分都是由多个相同或者相似块组成的，多个块接连作用，使得网络学习到更复杂的表示.
>
>

>[!summary]- 概念：常见激活函数
>
>- **ReLU**（Rectified linaer unit，修正线性单元，或被称为整流函数）：$$\text{ReLU}(x)=\max(x,0)$$
>	- 当输入为$0$时，ReLU不可导，但通常情况下定义输入为$0$时导数为$0$；ReLU的优点在于，进行梯度计算时，导数或为$0$或为$1$，减轻了神经网络的梯度爆炸或梯度消失问题.
>	- ReLU函数有许多变体，例如参数化ReLU（Parameterized ReLU, pReLU）：$$\text{pReLU}(x)=\max(0,x)+\alpha\min(0,x)$$
>- **Sigmoid函数**：$$\text{Sigmoid}(x)=\frac{1}{1+\exp(-x)}$$
>	- Sigmoid函数将输入变换为区间$(0,1)$上的输出，因此特性也被称为**挤压函数**（squashing function）
>	- Sigmoid函数的导数为：$$\frac{d}{dx}\text{Sigmoid}(x)=\frac{\exp(-x)}{(1+\exp(-x))^2}=\text{Sigmoid}(1)(1-\text{Sigmoid}(x))$$
>- **tanh函数**：$$\tanh(x)=\frac{1-\exp(-2x)}{1+\exp(-2x)}=2\text{Sigmoid}(2x)-1$$
>	- 正如上面公式表达的，tanh函数实际即为将Sigmoid函数放大$2$倍之后向下平移$1$个单位，其将输入压缩到$(-1,1)$，并且函数关于原点对称；
>	- tanh函数的导数为：$$\frac{d}{dx}\text{tanh}(x)=1-\tanh^2(x)$$

>[!note]- PyTorch: ReLU, Sigmoid, Tanh [[1-多层感知机#ReLU函数]]
>下面用到的`.backward()`中传入了一个Tensor作为参数，可以在这里理解[Check here](DLCB.md#^Autograd)
>```Python
>from matplotlib import pyplot as plt
>import torch
>import torch.nn as nn
>import torch.nn.functional as f
>'''绘制函数及其导数'''
>def plot_functions(range, functions, titles):
>	x = torch.arange(-range, range, 0.1, requires_grad=True)
>	__, axs = plt.subplots(1,len(functions),figsize=(5*len(functions), 5))
>	for i,f in enumerate(functions):
>		y = f(x)
>		axs[i].plot(x.tolist(), y.tolist())
>		y.backward(torch.ones_like(x), retain_graph=True)
>		axs[i].plot(x.tolist(), x.grad)
>		axs[i].set_title(titles[i])
>		x.grad.zero_() # 画图的时候注意把梯度清零了，因为多次backward()
>	plt.tight_layout()
>	plt.savefig('C:\\Users\\24696\\Desktop\\images.png')
>	plt.show()
>
>plot_functions(8, [torch.sigmoid, torch.tanh, torch.relu], ['Sigmoid', 'Tanh', 'ReLU'])
>
>'''PyTorch中实现激活函数有三种方法，下面以ReLU为例'''
>X = torch.tensor([-1.,0.,1.], requires_grad=True)
>y = torch.relu
>print(y(X)) # torch.sigmoid 只是一个函数
>
>layer = nn.ReLU() # nn.Sigmoid 是一个类，继承了nn.Module
>print(layer(X))
>
>fSigmoid = f.relu
>print(fSigmoid(X))
>```
>还需要完善，`f.relu`和`relu`（以及其他函数）有什么区别？
>[PyTorch Discuss](https://discuss.pytorch.org/t/torch-nn-sigmoid-vs-torch-sigmoid/57691/3)

>[!note]- PyTorch: 多层感知机实现
>在PyTorch框架下近乎无脑的简单. 这里使用Fashion-MNIST数据集 [[Check here]](DLCB)
>```Python
>net = nn.Sequential(nn.Flattern(),
>					nn.Linear(784, 256),
>					nn.ReLU(),
>					nn.Linear(256, 10)
>					)
>def init_weights(net):
>	if type(net) == nn.Linear:
>		nn.init.normal_(net.weights, std=0.01)
>net.apply(init_weights)
>```

>[!important]- 计算图 & PyTorch自动微分
>（参考一下Mathematica的`TreeForm`）
>- 注1：不管理论分析还是PyTorch的实践环节，实际上不太需要**计算图**（Computational Graph）和**自动微分**（Autograd），但是个人这个部分十分基础，没有完全理解计算图就不会真正理解梯度更新，对PyTorch核心中的自动微分也不可能理解. 因此这部分写在了本篇中，[DLCB](DLCB.md#^Autograd)中也涉及这方面的内容.
>- 注2：本部分主要结合PyTorch框架说明计算图的概念，为了不与PyTorch的概念产生冲突使用了一些PyTorch中的术语.
>
>计算图是一种**图结构**，其主要的元素有：
>- 叶节点（leave）<-> 输入数据；
>- 局部节点（local nodes）<-> 中间数据；
>- 运算节点（operations）<-> 运算操作
>- 根节点（root）<-> 输出数据；
>
>计算图中包含两种流动：<u>数据流动</u>和<u>梯度流动</u>，分别对应前向传播和反向传播.
>
>- **前向传播：数据流动**：在前向传播阶段，输入数据通过运算操作传递到中间数据，中间数据接着通过运算操作传递到下一个中间数据（如果有的话），直至最终产生输出数据.
>	- 这个过程<u>构建了一个计算图</u>，从叶节点出发通过运算节点生成局部节点，局部节点通过运算节点再生成局部节点，最终生成根节点.
>	- 规定计算图生成的方向为正，运算节点的负向的节点称为其**下游**（upstream），运算节点的正向的节点称为其**上游**；
>- **反向传播：梯度流动**：在反向传播阶段，<u>按照与计算图生成相反的方向</u>，计算<u>每个</u>运算节点的上游相对于其下游的梯度，然后从<u>根节点</u>出发，按照链式法则，利用已经计算好的梯度，计算根节点相对于所有节点的梯度. 完成一次梯度的流动.
>- PyTorch：在前向传播阶段，给定输入`Tensor`，按照要求的运算逐步计算，并保留每一个运算的**梯度函数**（`grad_fn`）；在反向传播阶段，首先根据`grad_fn`计算对应的梯度，然后通过`Tensor`的`.grad`属性访问计算得到的梯度
>
>```Python
>a = torch.tensor(4., requires_grad=True)
>b = torch.tensor(3., requires_grad=True)
>c = a * b
>a.is_leaf, b.is_leaf, c.isleaf # False, True, True
>c.grad_fn # <MulBackward0 object at 0x0000017BE5B7FC40>
>c.grad_fn.next_functions
>d = torch.tensor(12., requires_grad=True)
>e = c * d
># e.backward() you an not access c.grad() because it is not a leaf, however you can set c.retain_grad() to get its grad
>c += 1. # this is an inplace function, which will change c's version
>c._version, d._version # 1,0
># e.backward() 
># calls into the C++ engine to run the backward pass
># RuntimeError: one of the variables needed for gradient computation has been modified by an inplace operation
>```
>下面这个例子讨论的是`grad_fn`的标号
>```Python
>a = torch.tensor([1.,2.,3.], requires_grad=True)
>b,c,c = a.unbind() #　b,c,d are not leaves
>e = b * c * d
>```
>下面介绍如何在不销毁计算图的情况下将变量从计算图中剥离出来
>```Python
>k.detach()
>k.numpy()
>k.item()
>k.tolist()
>```
>
>考虑一个向量值函数$$\mathbf{y}=F(\mathbf{x}),\mathbf{x}\in \mathbb{R}^n, \mathbb{R}^m$$的Jacobian矩阵：$$J=\begin{bmatrix}\frac{\partial{\mathbf{y}}}{\partial{x_1}} & \cdots & \frac{\partial{\mathbf{y}}}{\partial{}x_n}\end{bmatrix}=\begin{bmatrix}\frac{\partial{y_1}}{\partial{x_1}}& \cdots & \frac{\partial{y_1}}{\partial{x_n}} \\ \vdots & \ddots & \vdots \\ \frac{\partial{y_m}}{\partial{x_1}} & \cdots & \frac{\partial{y_m}}{\partial x_n} \end{bmatrix}$$
>
>PyTorch中自动微分计算的实际上是$\mathbf{y}=F(\mathbf{x})$的Jacobian矩阵与一个向量$v\in \mathbb{R}^m$的乘积（`v.shape==y.shape`）之所以这样设置是为了依据链式法则计算最终的标量函数对于每个变量的梯度. 
>
>例如，计算$l=g(\mathbf{y})$，依据链式法则：$$\frac{\partial{l}}{\partial{\mathbf{x}}}=\begin{bmatrix}\frac{\partial{l}}{\partial{x_1}}\\ \vdots \\ \frac{\partial{l}}{\partial{x_n}}\end{bmatrix}=\left(\frac{\partial{l}}{\partial{\mathbf{y}}}\right)^T \frac{\partial{\mathbf{y}}}{\partial{\mathbf{x}}}=\begin{bmatrix}\frac{\partial{l}}{\partial{y_1}} & \cdots & \frac{\partial{l}}{\partial{y_m}}\end{bmatrix}\cdot J$$
>对应于上面提到的，这里$v=...$
>
>在PyTorch中的实现
>```Python
>n=5
>m=4
>X = torch.ones(n, requires_grad=True)
>Y = torch.matmul(torch.ones(m,n),X)
>V = torch.randn(m)
>Y.backward(torch.randn(m))
>X.grad
>```
>^Graph

>[!summary]- 概念：梯度爆炸，梯度消失
>考虑具有$L$层，输入为$x$，输出为$o$，每一个层$l_i(i=1,2,\cdots,L)$对应一个变换$f_i$，则可以将网络表示为：$$o=f_L\circ f_{L-1}\circ\cdots\circ f_1(x)$$
>从而对于任何一层的参数$\phi_i$，根据链式法则：$$\frac{\partial{o}}{\partial{W^{(l)}}}=\frac{\partial{o}}{\partial{h^{L-1}}}\frac{\partial{h^{L-1}}}{\partial{h^{L-2}}}\cdots\frac{\partial{h^{(l)}}}{\partial{W^{(l)}}}$$
>该梯度实际上为向量$v$和$L-l$个矩阵的乘积，很容易产生梯度爆炸或者梯度消失，甚至是数值上下溢.
>
>应对这种情况的一种方法是使用对数表示，但这只能减轻梯度爆炸的影响，对于梯度消失问题则不可取.
>
>此外，激活函数在反向传播时的梯度如果过小也会使得梯度消失：Sigmoid, Tanh在输入值的绝对值很大时反向传播时的梯度很小，且非常快地接近$0$. 这点在一些处理中将会带来很大的问题，例如应用于[GAN]时.
>
>因此，激活函数的选择也十分重要，目前更稳定的ReLU系列函数已经成为默认的选择.

>[!note]- ReLU系列激活函数
>ReLU函数的稳定性体现在相比于Sigmoid和Tanh不会产生输出值较大时梯度消失的情况，并且无需计算梯度（总为$1$或$0$）. 但是因为其负数部分总为$0$，在实践中没有很大理由这样做.
>
>- **LeakReLU**: $$\text{LeakReLU}(x)=\left\{\begin{aligned}
&x,\quad x>0\\
&x*k,\quad x\leq 0
\end{aligned}\right.$$其中$k$为超参数，或者通过学习得到.
>- **ELU**：$$\text{ELU}(x)=\left\{\begin{aligned}
&x,\quad x>0\\
&\alpha(e^x-1),\quad x\leq 0
\end{aligned}\right.$$

>[!note]- 概念：对称性

>[!Note]- 参数初始化 | Xavier初始化
>下面从经过线性变化之后输出的分布的变化这一角度说明为什么参数初始化是必要的.
>
>假设一个全连接层有输入$X=[x_{k}],k=1,2,\cdots,n$以及权重$W=[w_{ij}]_{m\times n}$，输出为$O=WX=[o_1,o_2,\cdots,o_m]$，那么$$o_i=\sum\limits_{j=1}^{n}w_{ij}x_j$$
>假设权重$W$的各个分量$w_{ij}$独立同分布于$\mathcal{D}_1$，$\mathcal{D}_1$具有零均值和方差$\sigma^2$，假设该层输入$X$的各个分量$x_k$独立同分布于$\mathcal{D}_2$，$\mathcal{D}_2$具有零均值和方差$\gamma^2$，$x_k$和$w_{ij}$独立（$k,j=1,\cdots,n;i=1,\cdots,m$）则有：$$\begin{aligned}E[o_i]
&=\sum\limits_{j=1}^{n}E[w_{ij}x_j]\\
&=\sum\limits_{j=1}^{n}E[w_{ij}]E[x_j]\\
&=0,\\
Var[o_i]&=E[o_i^2]-(E[o_i])^2\\
&=\sum\limits_{j=1}^{n}E[w_{ij}^2x_{j}^2]-0\\
&=\sum\limits_{j=1}^{n}E[w_{ij}^2]E[x_j^2]\\
&=n\sigma^2\gamma^2
\end{aligned}$$在上面的假设下为了保持输出的方差不变，应当设置：$$n \sigma^2=1$$如果不这样做，输出的方差过大或者过小，会造成在反向传播过程中梯度爆炸或者梯度消失的问题.
>在反向传播环节：$$\frac{\partial{l}}{\partial{W}}=$$可得保持梯度的方差不变的条件为$$m\sigma^2=0$$综合考虑，取$$\frac{1}{2}(n+m)\sigma^2=1$$从而得到：$$\sigma=\sqrt{\frac{2}{n+m}}$$
>
>Xavier从均值为$0$，方差$\sigma^2=\frac{2}{n+m}$的Gaussian分布中初始化权重；此外Xavier也可改为从均值为$0$，方差为$\sigma^2=\frac{2}{n+m}$的均匀分布中初始化权重：$$U\left(-\sqrt{\frac{6}{n_{in}+n_{out}}},\sqrt{\frac{6}{n_{in}+n_{out}}}\right)$$（因为$U(-a,a)$的方差为$\frac{a^2}{3}$）
>
>- 在上面分析中的假设都过分简单，但是实践证明Xavier初始化方法确实是有效的.
>- **???** 本部分需要更多理论分析
>^Xavier

>[!note]- PyTorch: Xavier [Check here](DLCB.md#^init)

>[!note]- 启发式参数初始化

>[!note]- 参数初始化和激活函数的结合

>[!note]- Paper: Understanding the difficulty of training deep feedforward neural networks

---
## 卷积神经网络

对于卷积神经网络（Convolutional Neural Network, CNN）可以在[这里](https://poloclub.github.io/cnn-explainer/)有一个直观的认识. (in case that website unvailable, [check here](https://www.youtube.com/watch?v=HnWIHWFbuUQ))

[poloclub](https://poloclub.github.io/)

[Convolution Arithmetic](https://github.com/vdumoulin/conv_arithmetic/blob/master/README.md)

>[!summary]- 概念：图像的性质
>对于图像辨别问题，我们的模型应当考虑到图像的如下性质：
>- **局部性质**：在某些情况下，一张图片中局部的图像与距离其较远的图像没有很大关联，这种情况下很远处的图像不应当有较大的影响
>- **空间不变性**：局部区域内的图像如果出现在其他位置，那么两者应该看起来是一样的，例如对于一个眼睛，其经过平移之后，模型识别时输出的结果应该相差不多.
>- **像素相邻性质**：像素之间的相邻关系（上下左右）不可忽视.

>[!summary]- 概念：二维卷积
>考虑之前提到的图像的性质，提出进行进行卷积操作，对于原始输入$X$的第$(i,j)$位置，矩阵$V$在$X$上的**卷积**（convolution）操作为：$$H_{i,j}=\text{bias}+\sum\limits_{a=-\Delta}^{\Delta}\sum\limits_{b=-\Delta}^{\Delta}V_{a,b}X_{i+a,j+b}$$称$V$为**卷积核**.
>- 卷积：定义$f,g:\mathbb{R}^d\rightarrow\mathbb{R}$的运算$f*g$：$$(f*g)(x)=\int f(\mathbf{z})g(\mathbf{x}-\mathbf{z})d \mathbf{z}$$离散情形则为：$$(f*g)(i)=\sum\limits_{a}^{}f(a)g(i-a)$$对于二维张量：$$f(*g)(i,j)=\sum\limits_{a}^{}\sum\limits_{b}^{}f(a,b)g(i-a,j-b)$$
>- 在实际运算中，上面的运算与$$H_{i,j}=\text{bias}+\sum\limits_{a=0}^{\Delta}\sum\limits_{b=0}^{\Delta}V_{a,b}X_{i+a,j+b}$$等价，通常使用该运算来表达卷积运算，这一运算并不是严格意义上的卷积，而称**互相关运算**（cross-correlation），深度学习习惯上称此为卷积.
>- 对于一个$V\in \mathbb{R}^{m\times n}$的卷积核对于$X\in \mathbb{R}^{h\times w}$的矩阵进行卷积，所返回的输出值的大小为$Y\in \mathbb{R}^{(h-m)+1\times (w-n)+1}$.

>[!note]- PyTorch: 卷积运算
>上面提到的卷积运算在PyTorch中可以表示为一个输入通道为$1$，输出通道为$1$，填充为$1$，步幅为$1$的的卷积层（概念见下）
>```Python
>conv2d = nn.Conv2d(1,1,kernel_size=2,bias=False)
>conv2d.weight
>X = torch.ones(25).reshape(1,1,5,-1) # 对应输入通道为1，输出通道为1
>Y = conv2d(X)
>Z = Y.sum()
>Z.backward()
>conv2d.weight.grad # 每一个参数获得的梯度均为16
>```
>下面实现的卷积运算将二维数据展开之后，利用转换后的卷积核进行运算.
>```Python
>class Conv2d(1, 3, kernel_size)
>```

>[!note]- 一维卷积和三维卷积
>Sources: [stackexchange](https://stackoverflow.com/questions/42883547/intuitive-understanding-of-1d-2d-and-3d-convolutions-in-convolutional-neural-n)

>[!summary]- 概念：多通道
>- **颜色通道**（color channel）：图像一般包括三个通道（RGB），应该视作一个三维张量（$channels\times height\times weight$）
>- **通道**（channel）：卷积中所提到的通道推广了颜色通道的概念，比如说对于一个具有3个颜色通道的图像，可以将其输出为10个通道（在这种情况下卷积曾的大小将为$10\times height\times weight$，可以视为$10$个卷积核在单独作用和学习），这些通道中的一些通道在训练之后可能成为边缘检测通道，有些则是颜色通道，这些通道会再传入下一层（也是多个通道）.
>- 到这里重新定义卷积层：$$[H]_{c,i,j}=\sum\limits_{s=-\Delta}^{\Delta}\sum\limits_{t=-\Delta}^{\Delta}[K]_{c,s,t}[X]_{i+s,j+t}$$表示隐层$H$的第$c$个通道的$(i,j)$位置将由卷积核与$X$的相应位置进行互运算得到.

>[!note]- PyTorch: 卷积核学习 
>```Python
>X = torch.ones(6,8)
>X[:,2:6] = 0
>X.reshape(1,1,6,8) # batch_size, in_channel, height, width
>
>Y = torch.ones(6,7)
>Y[:,1] = 1
>Y[:,-2] = -1
>Y.reshape(1,1,6,7) # batch_size, output_channel, height, width
>
>conv2d = nn.Conv2d(1, 1, kernel_size=(1,2), bias=False) # 1,1 分别对应 in_channels, out_channels
>
>for i in range(10):
>	Y_hat = conv2d(X)
>	l = (Y_hat - Y) ** 2
>	conv2d.zero_grad()
>	l.sum().backward()
>	conv2d.weight.data[:] -= 0.01 * conv2d.weight.grad
>	if (i + 1) % 2 == 0:
>		print(f'epoch {i+1}, loss {l.sum():.3f}')
>```

>[!summary]- 概念：特征映射和感受野
>- **特征映射**（feature map）：卷积层的另一种说法，一个层到另一个层的映射，通常会称一个卷积核为一个特征映射；
>- **感受野**（receptive field）：在前向传播过程中可能影响$x$的所有元素.
>	- 随着卷积层的增多，之后的神经元的感受野可能会越来越大.

>[!summary]- 概念：填充和步幅
>在没有填充和步幅的概念之前，对于（二维情形）形状为$n_h\times n_w$的输入，卷积核形状为$k_h\times k_w$，则输出形状为：$$(n_h-k_h+1)\times(n_w-k_w+1)$$这存在一些问题，例如对于一个$300\times300$像素的图像输入，那么经过$10$层$5\times5$的卷积层之后大小将会降低到$260\times 260$，会造成边界许多有用的信息丢失（边界的像素值将会被更少次地用于卷积核运算）. [Check here](https://www.quora.com/What-is-the-advantage-of-using-padding-in-CNN)
>
>- **填充**（padding）：添加$p_h,p_w$行和列的填充，输出形状为：$$(n_h-k_h+p_h+1)\times(n_w-k_w+p_w+1)$$设置$p_h=k_h-1,p_w=k_w-1$可以使得输入与输出具有相同的高度和宽度.
>	- 注意$k_h,k_w$的奇偶性还会影响具体填充（上下，左右）的方式，一般为了保证上下、左右填充的行或列的数量相同都会选择卷积核的高度，宽度为奇数（对二维）；
>
>步幅做的事情和填充相反，其加速减小图像输出的大小，一些可能的原因：1) 减小存储；2) 小的步幅重复程度太高 [Check here](https://www.quora.com/Why-would-one-use-larger-strides-in-convolutional-NNs-as-opposed-to-smaller-strides)
>
>- **步幅**（stride）：使用垂直和水平步幅分别为$s_h,s_w$的卷积核，连同上面的填充假设，输出形状为：$$[(n_h-k_h+p_h)/s_h+1]\times[(n_w-k_w+p_w)/s_w+1]$$如果设置$p_h=k_h-1,p_w=k_w-1$，则输出形状将简化为：$$[(n_h-1)/s_h+1]\times[(n_w-1)/s_w+1]$$

>[!note]- PyTorch: 带填充和步幅的二维卷积层
>```Python
>import torch.nn as nn
>conv2d = nn.Conv2d(1,1,kernel_size=(2,3), padding=(0,1), stride=(3,4))
>```

>[!summary]- 概念：池化
>**池化核**：一个固定形状的窗口（类似于卷积核），根据给定的步幅大小移动并给出输出，池化核不含参数，其所给出的输出为：
>- 池化核中所有元素的最大值，称为**最大池化**（maximum pooling）；
>- 池化核中所有元素的平均值，称为**平均池化**（average pooling）；
>	- 注：平均池化可以也可以推广为带参数的卷积核：$$\mathbf{k}=(1/l)_{h\times s}$$，在这种情况下核运算也称为**下采样**（downsample），相当于每$10l$个像素在池化之后只占据$10$个像素.
>- 如果池化核形状为$p\times q$，则称其进行的运算为$p\times q$**池化**；
>- 类似卷积核，池化核也可以设置**填充**和**步幅**以获取所需输出形状；
>- 处理多个通道的输入数据时，池化层在每个输入通道上单独运算（❗与卷积层在通道上对于输入然后进行汇总不同）
>- 池化层的目的在于：
>	- 降低卷积层对于位置的敏感性（i.e. 移动一个像素可能会使得卷积层的输出大不相同，但对于汇聚层来说不一定）；
>	- 降低对空间降采样表示的敏感性 **???**

>[!note]- PyTorch：二维汇聚层 [Check here](DLCB.md#^maxavgpool)
>```Python
>X = torch.arange(25, dtype=torch.float32).reshape(1,1,5,-1) # batch_size, channel number, height, width
>
>max_pool2d = nn.MaxPool2d(3, padding=1, stride=2) # 注意，步幅默认与汇聚窗口的大小相同
>max_pool2d(X)
>
>max_pool2d_ = nn.MaxPool2d((2,3), stride=(2,1), padding=(0,1)) # 设置一个任意大小的矩形汇聚窗口
>```

>[!summary]- LeNet-5 (1989 Yann LeCun)
>- 注1：LeCun在其论文中用到的是下采样（subsampling）而不是池化（pooling），其将平均池化层作为有参数（并且带了偏置）的卷积层（见概念：池化）进行处理.
>>[!quote]- Subsampling
>>The four inputs to a unit in S2 are added, then multiplied by a trainable coefficient, <u>and then added to a trainable bias</u>.
>- 注2：LeCun使用的手写数字数据集中每个图片的大小为$28\times28$，但其数据集中字母最大也只占有$20\times20$个像素，LeCun的考虑是希望随着网络层数的加深，笔画的端点也可以出现在感受野的中心：
>>[!quote]- The reason for padding
>>The reason is that it is desirable that <u>potential distinctive features</u> such as stoke endpoints or corner can appear in the center of the receptive field of the highest level feature detectors.
>- LeNet的主要组成部分：
>	- 卷积编码器：两个卷积层和两个池化层；
>	- 全连接层<u>密集块</u>：三个连续的全连接层
>	  
>**LeNet的网络结构**：
>1) $6$通道卷积层，每一个卷积核的大小为$5\times5$，填充为$2$；
> 	 - 注1：这里的填充正好使得图像大小未发生改变（$(-k_h+p_h+1,-k_w+p_w+1)=(0,0)$）
> 	 - 注2：这里参数的参数数量（含偏置）$6\times25+6=156\ll 28^2=784$
>2) $6$通道下采样层（对应前一个卷积层的$6$个通道，$6$个池化核），每一个池化核大小为$2\times2$，有$6$个参数；
>3) Sigmoid激活函数（**???** 用ReLU更好，90s还未被应用）；
>4) $16$通道卷积层（将$6$个通道扩充为$16$个通道，$16\times6=96$个卷积核）：每个卷积核的大小为$5\times5=25$，参数数量为$25\times16+16=1516$个；
> 	    - 注意：$16$通道中的每一个通道接受$6$个通道的输入.
>5) $16$通道下采样层（对应前一个卷积层的$16$个通道）：有$32$个参数；
>6) $120$通道卷积层
> 	 - 注：LeCun用的是每一个卷积核大小为$5\times5$的$120$通道卷积层，但是每一个通道中输入的张量大小为$5\times5$，所以这其实相当于$16*5*5\times120$全连接层. 但是LeCun不将其称为全连接层，其理由：
>>[!quote]- Why not call it a fully connected layer?
>>If LeNet-5 input were made bigger with everything else kept constant, the feature map dimension would be larger than $1\times1$. **???**
>7) $84\times10$全连接层输出$a_i(i=1,2,\cdots,10)$，LeCun选择$84$个单元的理由：
>8) 整流：$x_i=f(a_i)$其中$f(a)=A\tanh(Sa)$，$A$决定上下确界（或振幅，amplitude），$S$决定原点处的斜率. 
>9) 最后使用RBF层，每一个输出计算如下：$$y_i=\lVert \mathbf{x}-\mathbf{w}_i\rVert$$
>   - $\mathbf{x}$表示上一个全连接层的$84$个输出；
>   - $\mathbf{w}_i$表示第$i$RBF神经元的权重，大小亦为$84$；
>   - RBF层的输出可以视为一个惩罚项
>    
>>[!cite]
>   
>   LeCun选择$A=1.7159$理由见附录$A$

>[!note]- PyTorch：LeNet-5
>```Python
>import torch
>import torch.nn as nn
>
>net = nn.Sequential(
>	nn.Conv2d(1, 6, kernel_size=5, padding=2), 
>	nn.AvgPool2d(kernel_size=5, stride=2),
>	nn.Sigmoid(),
>	nn.Conv2d(6, 16, kernel_size=5),
>	nn.AvgPool2d(kernel_size=5, stride=2), nn.Sigmoid(),
>	nn.Flatten(),
>	nn.Linear(16 * 5 * 5, 120), nn.Sigmoid()
>	nn.Linear(120, 84), nn.Sigmoid()
>	nn.Linear(84,10)
>	)
>```

>[!note]- RBF网络 (1988 Broomhead, Lowe)
>RBF（Radial Basis Function）网络可以视为一个三层网络，输入层、隐层和输出层，其核心结构如下：$$\varphi(x)=\sum\limits_{i=1}^{N}a_i \rho(\lVert \mathbf{x}-\mathbf{c}_i\rVert),\mathbf{x}\in \mathbf{R}^n$$
>$\mathbf{x}\in \mathbb{R}^n$为输入
>- $N$为隐层的神经元数量；
>- $\mathbf{c}_i$表示第$i$个神经元的中心向量；
>- $a_i$表示第$i$个神经元的权重；
>- 注意到：函数$\rho(\lVert \mathbf{x}-\mathbf{c}_i\rVert)$关于中心向量$\mathbf{c}_i$是径向对称的（radially symmetric），并且$N$个函数$\rho(\lVert \mathbf{x}-\mathbf{c}_i\rVert)$可以视作生成$\varphi(x)$的基，因此称之为径向基函数（Radial Basis Function）
>- 范数通常取欧氏距离，基函数则一般取高斯函数：$$\rho(\lVert \mathbf{x}-\mathbf{c}_i\rVert)=\exp(-\beta_i \lVert \mathbf{x}-\mathbf{c}_i\rVert)$$并有：$$\lim_{\lVert \mathbf{x}\rVert\rightarrow\infty} \rho(\lVert \mathbf{x}-\mathbf{c}_i\rVert)=0$$

>[!summary]- 概念：特征学习

>[!note]- AlexNet

>[!note]- Transposed Convolution / Fractionally-strided convolution
>[TowardsDataScience](https://towardsdatascience.com/what-is-transposed-convolutional-layer-40e5e6e31c11) and [Python GIFs](https://github.com/aqeelanwar/conv_layers_animation)
>Note that Transposed Convolution $\neq$ DeConvolution, it only reverse the dimensions.
>
>Used for upsampling.
>
>假设输入的单个样本的大小（不考虑通道）为：$$(n_h,n_w)$$则输出的大小为：$$\begin{aligned}
&(s_h(n_h-1)-2p_h+\text{dilation}_h(k_h-1)+\text{output\_padding}_h+1)\times \\
&(s_w(n_w-1)-2p_w+\text{dilation}_w(k_w-1)+\text{output\_padding}_w+1)
\end{aligned}$$

>[!note]- PyTorch: Transposed Convolution [Check here](DLCB.md#^ConvTranspose2d)
>```Python
>conv2dT = nn.ConvTranspose2d(1, 1, kernel_size=2)
>```

## 循环神经网络

### 关于序列数据预测的一个简单介绍

>[!summary]- 概念：序列数据，序列数据预测
>序列数据
>**时间步**，上下文
>$x_t\sim P(x_t \,|\,x_{t-1},\cdots,x_1)$
>在序列数据中，引入状态变量存储过去的信息，结合当前的输入给出输出是一种常见的做法.

>[!summary]- 概念：序列预测的假设，单步预测，和多步预测
>- 序列模型的一个常见假设为：序列本身的动力学不会发生改变，或称序列的动力学是**静止**（stationary）的，整个序列的估计值可以通过：$$P(x_1,\cdots,x_T)=\prod_{t=1}^{T}P(x_t \,|\,x_{t-1},\cdots,x_1)$$获取.
>- **单步预测**（one-step-ahead prediction）预测器只预测未来一个时间步的结果，称为单步预测；
>- **多步预测**（multi-step-ahead prediction）预测器需要给出未来$k$个时间步的预测，在这种情况下其通常需要基于原始序列数据$\{x_{t-1},\cdots,x_{t-\tau}\}$给出预测$\hat{x}_t$，然后将该预测连同原始序列数据用于对$\hat{x}_{t+1}$的预测中，以此类推，这种多步预测的主要问题是：误差会逐次积累，可能完全偏离实际.

>[!summary]- 概念：自回归模型，马尔可夫模型
>为估计$P(x_t \,|\,x_{t-1},\cdots,x_1)$提出：
>- **自回归模型**（autoregressive models）：对于序列数据$\{x_{t-1},\cdots,x_1\}$只选择（最近的）时间跨度为$\tau$的序列用于预测：$\{x_{t-1},\cdots,x_{t-\tau} \}$，则模型的参数是固定的.
>- **隐变量自回归模型**（latent autoregressive models）：保留对过去的预测的总结$h_{t-1}$（$h$在这里表示的是hidden），然后据此同时更新预测$\hat{x}_t=P(x_t \,|\,h_{t-1})$和总结$h_t=g(h_{t-1},x_{t-1})$，因为其中的任何总结$h_t$都并不存在，因此称为隐变量.
>[!summary]- 概念：马尔可夫模型
>马尔可夫模型是一种常见的自回归模型.
>**马尔可夫条件**（Markov condition）：使用$x_{t-1},\cdots,x_{t-\tau}$估计$x_t$的结果和使用$x_{t-1},\cdots,x_1$相比是<u>近似</u>精确的，则称序列满足马尔可夫条件.
>**一阶马尔可夫模型**（first-order Markov model）：$$P(x_1,\cdots,x_T)=\prod_{t=1}^{T}P(x_t \,|\,x_{t-1}),\quad P(x_1 \,|\,x_0)=P(x_1)$$并可以得出：$$\begin{aligned}
P(x_{t+1} \,|\,x_{t-1})&=\frac{\sum\limits_{x_t}^{}P(x_{t+1},x_t,x_{t-1})}{P(x_{t-1})}\\
&=\frac{\sum\limits_{x_t}^{}P(x_{t+1}\,|\,x_t,x_{t-1})P(x_t,x_{t-1})}{P(x_{t-1})}\\
&=\sum\limits_{x_t}^{}P(x_{t+1}\,|\,x_t)P(x_t \,|\,x_{t-1})
\end{aligned}$$（**???** 这里，条件公式能这样用吗）
>^AutoregressiveModel

>[!note]- PyTorch: 一个简单的自回归模型
>用PyTorch写一个自回归模型，信号是一个正弦函数加噪，之后将其截断为两部分，前半部分用于训练，后半部分作为测试集的标签.

### 循环神经网络初步

>[!summary]- 概念：（单层）循环神经网络
>假设在时间步$t$有小批量输入$\mathbf{X}_t\in \mathbb{R}^{n\times d}$，$\mathbf{X}_t$的每一行对应来自相应序列的时间步$t$处的一个样本，时间步$t$处的**隐状态**（hidden state）记为$\mathbf{H}_t\in \mathbb{R}^{n\times h}$，其计算公式为：$$\mathbf{H}_t=\phi(\mathbf{X}_t \mathbf{W}_{xh}+\mathbf{H}_{t-1}\mathbf{W}_{hh}+\mathbf{b}_h)$$
>- $\phi$为激活函数
>- $\mathbf{W}_{xh}\in \mathbb{R}^{d\times h},\mathbf{W_{hh}}\in \mathbb{R}^{h\times h},\mathbf{b}_h\in \mathbb{R}^{1\times h}$，其中$\mathbf{b}_h$通过广播运算作用.
>- 隐变量$\mathbf{H}_{t}$表示直至时间步$t$的所有历史信息（可以理解为神经网络的记忆，更常见的说法是状态），每一个隐状态的计算公式都如此，因此称之为**循环**（recurrent），每一个进行该计算的层称为**循环层**（recurrent layer），这种神经网络称为**循环神经网络**（recurrent neural network, RNN）.
>- 计算隐状态中$\mathbf{X}_t \mathbf{W}_{xh}+\mathbf{H}_{t-1}\mathbf{W}_{hh}$相当于$\mathbf{X}_t$和$\mathbf{H}_{t-1}$沿着$1$轴的拼接得到的矩阵与$\mathbf{W}_{xh}$和$\mathbf{W}_{h\times h}$沿着$0$轴的拼接得到的矩阵的乘积.
>
>在每一个时间步$t$，根据当前时间步的隐状态$\mathbf{H}_t$计算该时间步的输出：$$\mathbf{O}_t=\mathbf{H}_t \mathbf{W}_{hq}+\mathbf{b}_q$$
>- $\mathbf{W}_{hq}\in \mathbb{R}^{h\times q},\mathbf{b}_q\in \mathbb{R}^{1\times q}$
>  
>注意：在任何时间步，循环神经网络<u>都使用相同的模型参数</u>$\mathbf{W}_{xh}, \mathbf{W}_{hh}, \mathbf{b}_{h}, \mathbf{W}_{hq},\mathbf{b}_{q}$计算输出，循环神经网络的参数数量不随输入序列的大小发生改变.
>
>- 在隐状态这一说法下，多层感知机（这里以两层的举个例子）可以被视为“无隐状态”神经网络：$$\begin{aligned}
&\mathbf{H}=\phi(\mathbf{X}\mathbf{X}_{xh}+\mathbf{b}_h)\\
&\mathbf{O}=\mathbf{HW}_{hq}+\mathbf{b}_q
\end{aligned}$$

>[!note]- PyTorch: 循环神经网络实现 [Check here](DLCB.md#^RNN)
>- 注1：本代码中用较低层的代码实现的单层RNN与用PyTorch直接实现的RNN共享参数之后输出的结果基本一致（部分值存在e-07到e-08的误差），该数值误差问题在其他代码中也出现，这个问题现在还未得到解决；
>- 注2：本代码给定输入之后返回的结果中`grad_fn=<SliceBackward0>`，而PyTorch中的RNN返回的结果中`grad_fn=<SelectBackward0>`，该问题还未弄清楚原因.
>```Python
>import torch
>import torch.nn as nn
>
>'''首先从在PyTorch框架下搭建一个'''
>
>class RNNModels(nn.Module):
>	def __init__(self, num_inputs, num_outputs, num_hiddens, activation_function):
>		super().__init__()
>		
>		# 定义隐层
>		self.num_hiddens = num_hiddens
>		self.init_state = torch.zeros(num_hiddens) # 初始状态化状态
>		self.states = None
>		self.W_hx = torch.randn((num_inputs, num_hiddens)) # 这里也可以用nn.Linear(num_inputs, num_hiddens)
>		self.W_hh = torch.randn((num_hiddens, num_hiddens))
>		self.b_h = torch.zeros(num_hiddens)
>		self.a_f = activation_function # 激活函数需要另外提供
>		
>		# 定义输出层
>		self.W_qh = torch.randn((num_hiddens, num_outputs))
>		self.b_q = torch.zeros(num_outputs)
>		
>		# 附上梯度
>		for param in [self.W_hx, self.W_hh, self.b_h, self.W_qh, self.b_q]:
>			param.requires_grad_(True)
>	
>	def calculate_state(self, sequence, time_step):
>		# 循环神经网络需要迭代地处理数据，因此这里先写一个用于迭代的函数，计算每一个时间步处的隐藏状态
>		return self.a_f(torch.matmul(sequence[time_step], self.W_hx)
>			+ torch.matmul(self.states[time_step], self.W_hh) 
>			+ self.b_h)
>	
>	def forward(self, input):
>		# 首先计算隐状态，假设输入形状为 (Batch_size, time_steps, num_inputs)，此处num_inputs指的是一个时间步处一个数据的维度
>		h_states = []
>		for b in range(input.shape[0]):
>			self.states = torch.cat([self.init_state.reshape(1,-1), torch.zeros(input.shape[1], self.num_hiddens)], dim=0)
>			for t in range(0,input.shape[1]):
>				self.states[t+1] = self.calculate_state(input[b], t) # 这里我的隐状态包含了h_0这个初始状态，所以第t个时间对应第t+1个状态
>			h_states.append(self.states)
>			
>		# 我们并不在这前向传播环节计算输出状态，因为一些原因并不是所有的输出状态都需要进行计算.
>		
>		return h_states # 这里返回最近的一次隐藏状态，以及已经计算的每个时间步的隐藏状态
>
>X = torch.ones(2,5,4) # 一个批量大小为2，长度为5，维度为4的数据
>aci_func = torch.nn.functional.tanh
>rnn = RNNModels(4, 4, 16, aci_func)
>states = rnn(X)
>
>'''直接使用PyTorch中定义好的函数，并共享上面的参数'''
>
>rnn_ = nn.RNN(4, 16, batch_first=True, bias=False)
>rnn_.weight_ih_l0.data = rnn.W_hx.detach().t()
>rnn_.weight_hh_l0.data = rnn.W_hh.detach().t()
>
>states_, _ =rnn_(X)
>
># 验证结果是否相同
>states[1][1:] - states_[1] # 这里本人返回的结果中有误差e-07到e-08数量级
>```
>^PyTorchSimpleRNN

>[!summary]- 概念：损失函数：困惑度
>对于一个序列（i.e.语句）：$$S=x_1,x_2,\cdots,x_n$$在给定模型下出现的概率为：$$P(S)=P(x_1,x_2,\cdots,x_n)=P(x_1)P(x_2 \,|\,x_1),\cdots P(x_n \,|\,x_1,x_2,\cdots,x_{n-1})$$
>
>困惑度的想法是当将测试集中的序列输入到模型中时，如果其
>
>一个语言模型的预测应该是准确的，可以用交叉熵损失来度量这点：$$\frac{1}{n}\sum\limits_{t=1}^{n}-\log P(x_t \,|\,x_{t-1},\cdots,x_1)$$
>- 其中$x_t,x_{t-1},\cdots,x_1$均为实际序列在时间步$t$的值，$P$由语言模型给出.
>- 自然语言处理中用**困惑度**（perplexity）对此进行衡量：$$\exp \left(-\frac{1}{n}\sum\limits_{i=1}^{n}\log P(x_t \,|\,x_{t-1},\cdots,x_1)\right)$$
>	- 当模型预测结果中真实标签的概率总为$1$时，模型的困惑度为$1$；
>	- 当模型预测结果中真实标签的概率总为$0$时，模型的困惑度无穷大；
>	- 如果模型的预测$P$是一个均匀分布，则困惑度为$n$（词表的唯一词元的数量），应该作为衡量模型质量的基线，有用的模型的困惑度必须要低于这个上限.

>[!note]- PyTorch: 计算困惑度
>

>[!summary]- RNN的损失函数
>在RNN中，损失函数计算的是一个序列的损失，即对于长度为$T$的序列$\{x_1,x_2,\cdots,x_T\}$，对应的标签为$\{y_1,y_2,\cdots,y_T\}$，RNN的预测序列为$\{\hat{y}_1,\hat{y}_2,\cdots,\hat{y}_T\}$，在定义损失函数（例如交叉熵）之后计算每一个时间步$t$处的损失$L(\hat{y}_t,y_t)$，然后求和作为该序列的损失：$$L(\hat{y},\hat{y})=\sum\limits_{t=1}^{T}L(\hat{y}_t,y)$$

>[!summary]- 概念：通过时间反向传播
>**通过时间反向传播**（backpropagation through time, BPTT）的的思想是：将循环神经网络的计算图一次展开一个时间步，以获取模型变量和参数之间的依赖关系，然后基于链式法则，应用反向传播计算和存储梯度.
>
>在（单层）循环神经网络中提到，RNN的模型参数是共享的，并且由网路本身的循环性质会造成梯度的“循环”性质，下面是数学推导，首先回顾：$$\begin{aligned}
&\mathbf{H}_t=\phi(\mathbf{X}_t \mathbf{W}_{xh}+\mathbf{H}_{t-1}\mathbf{W}_{hh}+\mathbf{b}_h)\\
&\mathbf{O}_t=\mathbf{H}_t \mathbf{W}_{hq}+\mathbf{b}_q
\end{aligned}$$我们直接使用简化的写法：用$h_t$表示隐藏层张量$\mathbf{H}_t$，用$w_h$表示隐层的权重张量$\mathbf{W}_{xh}, \mathbf{W}_{hh}$（因为可以视为拼接情形进行计算），用$x_t$表示输入张量$\mathbf{X}_t$，用$o_t$表示输出张量$\mathbf{O}_t$，用表示输出层的权重张量$\mathbf{W}_{hq}$，偏置$\mathbf{b}_h,\mathbf{b}_q$可以作为权重张量的一部分，因此可以将$t$时间步的隐状态和输出写为：$$\begin{aligned}
&h_t=f(x_t,h_{t-1},w_h)\\
&o_t=g(h_t,w_o)
\end{aligned}$$设时间步$t$对应的标签为$y_t$，设在所有$T$个时间步的损失函数为：$$L(x_1,\cdots,x_T,y_1,\cdots,y_T,w_h,w_o)=\frac{1}{T}\sum\limits_{t=1}^{T}l(y_t,o_t)$$按照链式法则：$$\begin{aligned}
\frac{\partial{L}}{\partial{w_h}}&=\frac{1}{T}\sum\limits_{t=1}^{T}\frac{\partial{l(y_t,o_t)}}{\partial{w_h}}\\
&=\frac{1}{T}\sum\limits_{t=1}^{T}\frac{\partial{l(y_t,o_t)}}{\partial{o_t}}\frac{\partial{g(h_t,w_0)}}{\partial{h_t}}\frac{\partial{h_t}}{\partial{w_h}}
\end{aligned}$$前面提到，$w_h$是各个隐状态共享的参数，于是该梯度计算中的问题出现在：$$\frac{\partial{h_t}}{\partial{w_h}}=\frac{\partial{f(x_t,h_{t-1},w_h)}}{\partial{w_h}}+\frac{\partial{f(x_t,h_{t-1},w_h)}}{\partial{h_{t-1}}}\frac{\partial{h_{t-1}}}{\partial{w_h}}$$这就构成了一个梯度计算的循环，最终可以得到：$$\frac{\partial{h_t}}{\partial{w_h}}=\frac{\partial{f(x_t,h_{t-1},w_h)}}{\partial{w_h}}+\sum\limits_{i=1}^{t-1}\left(\prod_{j=i+1}^{t}\frac{\partial{f(x_j,h_{j-1},w_h)}}{\partial{h_{j-1}}}\right)\frac{\partial{f(x_i,h_{i-1},w_h)}}{\partial{w_h}}$$当$t$很大时，该链会变得很长，如果完全计算，梯度爆炸和梯度消失的可能性非常大，不可行；
>- **截断时间步**：一种直观的方法是在反向$\tau$步之后不再计算，即只计算：$$\cdots+\sum\limits_{t-\tau}^{t-1}\left(\prod_{j=i+1}^{t}\cdots\right)\cdots$$但是这样又会使得模型主要侧重于短期影响. 
>- **???** **随机截断**：可以使用一个随机变量替换某一个

>[!note]- RNN梯度计算的具体细节
>建议参考附录部分的矩阵微分理解.
>
>

>[!summary]- 概念：梯度裁剪

### 自然语言处理

>[!summary]- 概念：词元，词表，语料，语言模型
>- **词元**（token）：文本的基本单位，例如单词；根据文本获取词元的过程称为**词元化**（tokenization），主要存在以下问题：
>	- 标点符号（punctuation）：除了对于显见的单词、字母进行编码，我们同样需要对标点符号进行编码. （例如，一个语句中的问号、引号包含的信息可能同样很重要）
>- **词表**（vocabulary）：一个字典，将字符串类型的次元与数字索引一一对应；
>- **语料**（corpus）：一个文本中的所有不重复的词元构成语料，通常会将很少出现的词元移除以便于处理.
>- **语言模型**（language model）：假设长度为$L$的文本序列中的词元依次为$x_1,\cdots,x_L$，则$x_t(1\leq t\leq L)$可以被认为是文本序列在时间步$t$处的观测（标签），语言模型的目标为估计序列的联合概率：$$P(x_1,\cdots,x_2,\cdots,x_L)$$从而对于一个给定的文本序列$\{x_{t-1},\cdots,x_1\}$，可以通过逐次抽取次元$x_t\sim P(x_t \,|\,x_{t-1},\cdots,x_1)$生成自然文本.
>	- 这里定义的语言模型完全按照概率运行，其并不理解语法，但是这仍然是有用的，例如在语音识别中“to recognize speech”和“to wreck a nice beach”读音尽管相似，但是前者的概率更大，后者不太可能是结果，于是可以通过语言模型来提高识别的正确性.

>[!note]- Python: 文本预处理的常用方法
>[Check here](PyDoc.md#^RegularExpression)
>```Python
>'''按行阅读.txt文件'''
>with open(txt_path, 'r') as f:
>	lines = f.readlins() # 返回一个二维列表，每一行对应文本中的一个行
>for line in lines:
>	print(line)
>line1 = lines[0]
>
>'''常用操作'''
>line1.strip() # 去前后字符
>line1.lower() # 全转小写
>lines = [line.strip().lower() for line in lines] # 统一处理
>
>'''正则化字符'''
>import re
>re.sub('[^A-Za-z]+',' ', line1)
>re.sub('[A-Za-z]+', ' ', line1) # 当然，也可以把英文字符转换为空格
>```

>[!note]- 拉丁语系次元化
>>[!note]- Word-based
>
>>[!note]- Character-based
>
>>[!note]- Subword tokenization
>>不将常用词拆分为更小的子词，而将稀有词分解为有意义的子词
>>Let's do tokenization!
>>Let's\</w> | do\</w> | token | ization\</w> | !\</w>

>[!note]- 各种词元化
>```Python
>import re
>re.findall(r"[\w']+|[.,!?;]", "Hello, I'm a string!")
>```

>[!note]- PyTorch: 将文本词元化，并生成词表

>[!summary]- 子词处理

>[!summary]- 概念：词嵌入
>**词嵌入**（Embeddings，或称词向量）技术是将词汇映射到高维空间的方法，与其人工设计词汇间的对应关系，词嵌入技术让模型去学习对应关系，直观表现是相似的词语（walk, walked/dog, cat/hello, goodbye）在高维空间中的距离更近；
>
>首先假设我们有一个大小为$\lvert V\rvert$的词表，对于一列输入$\mathbf{X}$，可以将每一个词元依据词表转换为一个独热向量进行处理.
>^Embeddings

>[!Note]- PyTorch: Embedding [Check here](DLCB.md#^Embedding)
>```Python
>class Embedding(nn.Module):
>	def __init__(self, num_embeddings, embedding_dim):
>		super().__init__()
>		self.weight = nn.Parameter(torch.randn(num_embeddings, embedding_dim))
>	
>	def forward(self, input):
>		return self.weight[input]
>
>emb = Embedding(10, 3)
>indices = torch.tensor([[1,2],[2,5]])
>emb(indices)
>
>emb_ = nn.Embedding(10,3)
>emb_.weight.data = Embedding.weight.data
>emb_(indices)
>```
>^Embedding

>[!summary]- 概念：语言模型的学习
>按照语言模型的定义，序列$\{x_1,x_2,\cdots,x_t\}$的概率为：$$\prod_{t=1}^{t}P(x_t \,|\,x_{t-1},\cdots,x_1),P(x_1 \,|\,x_0)=x_1$$
>为训练一个语言模型需要计算单词的概率以及给定单词后出现某个单词的条件概率.
>- 一种训练方法是根据已有文本计算相对词频：$$\hat{P}(\mathrm{on} \,|\,\mathrm{move})=\frac{n(\mathrm{move},\mathrm{on})}{n(\mathrm{move})}$$但是获取正确的估计并不简单，例如上面$\text{on}$的频率显然远远大于$\text{move on}$.
>- **拉普拉斯平滑**（Laplace smoothing）通过引入超参数试图解决上面提到的问题：$$\begin{aligned}
&\hat{P}(x)=\frac{n(x)+\epsilon_1/m}{n+\epsilon_1}\\
&\hat{P}(x' \,|\,x)=\frac{n(x,x')+\epsilon_2 \hat{P}(x')}{n(x)+\epsilon_2}\\
&\hat{P}(x''\,|\,x,x')=\frac{n(x,x',x'')+\epsilon_3\hat{P}(x'')}{n(x,x')+\epsilon_3}\\
&\cdots\cdots
\end{aligned}\end{center}$$显然这又是有问题的，如何选择超参？
>- 奇普夫定律（Zipf's law）指出：第$i$个最常见的单词的频率$n_i$有如下近似关系：$n_i\propto \frac{1}{i^{\alpha}}$
>- 此外语言学习还需要考虑意思相近的词；

>[!note]- PyTorch: 判定消极评论和积极评论
>Sources: 
>通过阅读

>[!summary]- 概念：稀疏特征，紧密特征
>[here](https://induraj2020.medium.com/what-are-sparse-features-and-dense-features-8d1746a77035)

>[!note]- AdaGrad
>**一个问题**：Adagrad是否适合在Fine-Tune阶段进行？
>
>多数情况下，我们希望降低学习率以提高优化效果. 然而在一些情况下，对于一些出现次数少的特征（**稀疏特征**，sparse features），比如说在训练语言模型中对于一些不常见的词语或者是词语搭配，我们希望<u>提高学习率</u>来学会这个特征.（**???** 太笼统了）同时，对于一些经常出现的特征，希望<u>减少学习率</u>，也就是一个同时进行的过程.
>
>一种想法是：可以用观测到稀疏特征的次数$S(t,i)$作为第$t$次更新特征$i$时学习率调整的依据，从而为每一个特征定制学习率：$$\eta_i=\frac{\eta_0}{\sqrt{S(t,i)}+\epsilon}$$
>
>Adagrad以<u>计算先前的梯度之和</u>作为一个粗略的计数器$S(t,i)$
>
>算法如下：$$\begin{aligned}
& g_t=\partial_{\mathbf{w}}l(y_t,f(x_t;\mathbf{w}))\\
& s_t=s_{t-1}+g_t^2\\
& \mathbf{w}_t=\mathbf{w}_{t-1}-\frac{\eta_0}{\sqrt{s_t}+\epsilon}\cdot g_t\\
& s_0=0
\end{aligned}$$
>但是AdaGrad也有一个缺陷，学习率下降地太快（$s_t$基本以线性速率增长，学习率的变化为$\mathcal{O}(t^{-\frac{1}{2}})$）.我们会希望学习率降低地更慢一些.
>
>^AdaGrad

## 残差网络

>[!summary]- 网络的序列结构及其缺陷
>MLP和CNN都是序列结构的网络，可以被视为复合映射.
>
>事实上，序列结构的网络越深其表示能力应当越强，实践中随着网络层数加深到一定程度之后模型的表现能力反而下降，这说明问题出在对于网络的训练上. 关于网络无法被理想地训练，一种猜想是模型参数初始化的问题.
>
>??? However, the derivative assumes an infinitesimal change in the parameter, whereas optimization algorithms use a finite step size. （指的应该是Learning Rate限制了梯度的连续变化，梯度只能够进行离散的变化，相当于是完全盲目的.，所以深层网络的损失函数太过于复杂，以至于这种离散优化的问题变得严重？）
>
>经验观察：浅层网络的输出的梯度随着输入的变化改变地更**慢**，然而，对于深层神经网络来说，输入结果的一点变化就会引发一个完全不同的梯度
>
>- **破碎梯度**（shattered gradients）：深层神经网络的梯度的自相关性随着$\Delta x$的增大会迅速减小在$0$附近，对于这种现象的一种猜想是浅层的神经网络会对更深层的神经网络造成更复杂的影响，i.e. 对于一个包含$3$个隐层的序列结构网络：$$\begin{aligned}
&h_1 = f_1(x,\omega_1)\\
&h_2 = f_2(h_1, \omega_2)\\
&h_3 = f_3(h_2, \omega_3)\\
&y = f_4(h_3, \omega_4)
\end{aligned}$$计算网络输出相对于$h_1$的梯度：$$\frac{\partial{y}}{\partial{f_1}}=\frac{\partial{f_4}}{\partial{f_3}}\frac{\partial{f_3}}{f_2}\frac{\partial{f_2}}{\partial{f_1}}$$如果改变$f_1$的参数，序列中的其他的函数的梯度也会发生变化（因为在序列结构网络中深层的参数来自浅层的），从而使得最终计算得到的梯度本身发生更复杂的变化（就是梯度爆炸）

>[!summary]- 概念：残差连接和残差层
>对于上面的$3$个隐层的序列神经网络，残差神经网络定义为：$$\begin{aligned}
&h_1 = x + f_1(x, \omega_1)\\
&h_2 = h_1 + f_2(h_1, \omega_2)\\
&h_3 = h_2 + f_3(h_2, \omega_3)\\
&y = h_3 + f_4(h_3, \omega_4)
\end{aligned}$$称$x,h_1,h_2,h_3$为**残差连接**（residual connection）. 输入$x$（或者$h_i$）和$f_i(h_{i-1}, \omega_{i}),h_0=x$的加法组合称为**残差层**（residual layer）
>之所以称为残差，是因为从另一个角度看网络学习到的实际上是$H(x)=f(x)-h(x)$，称为残差其中$h$为之前的层，不需要在$H$层学习.
>^ResidualLayer

>[!note]- PyTorch: 残差层
>残差层非常容易实现，下面是一个简单的例子
>```Python
>class ResModule(nn.Module):
>	def __init__(self):
>		super(ResModule, self).__init__()
>		self.f1 = nn.ReLU()
>		self.f2 = nn.Linear(2,2)
>		self.f3 = nn.ReLU()
>		self.f4 = nn.Linear(2,1)
>	
>	def forward(self, input):
>		h1 = input + self.f1(input)
>		h2 = h1 + self.f2(h1)
>		h3 = h2 + self.f3(h2)
>		return h3 + self.f4(h3)
>```

>[!summary]- 概念：残差层中的运算顺序
>在顺序结构网络中，输入往往是经过线性变换（全连接层、卷积层）之后应用激活函数（例如ReLU），但是在残差层中如果使用这种运算顺序，会使得输出值只能是输入值的增加（为理解这点，将输出值展开即可）
>
>因此残差层中，输入通常先进行一次线性计算，在使用激活函数（例如ReLU）之后再次应用线性计算. 通常来说残差层不会首先使用ReLU()进行作用，一个直观的考虑是如果输入中的负值太多，ReLU()会直接输出$0$，影响之后的层的表现，可能直接降低网络的表示能力.

>[!summary]- 概念：ReLU中的梯度爆炸

>[!summary]- 标准化
>在进行对于BN，LN的讨论之前，先来谈谈为什么要对样本进行标准化.

Batch Normlaization的原理仍然没有得到很好的解答[Towards Data Science](https://towardsdatascience.com/batch-normalization-in-3-levels-of-understanding-14c2da90a338#b93c)

>[!summary]- 概念：批量正则化
>**批量正则化**（Batach normalization, BatchNorm）的观点是：首先将样本进行标准化（均值为$0$，标准差为$1$），然后在网络中引入参数$\delta,\gamma$，让网络自己学习对样本的均值和标准差进行偏移和放缩.
>
>首先计算每一个批量中的激活值（用$h$表示）的经验均值和标准差：$$\begin{aligned}
&\mu_h=\frac{1}{\lvert B\rvert}\sum\limits_{i\in B}^{}h_i\\
&\sigma_h=\sqrt{\frac{1}{\lvert B\rvert}\sum\limits_{i\in B}^{}(h_i-\mu_h)^2}
\end{aligned}$$然后根据经验均值和标准差*标准化*该批量中的每个激活值：$$h_i\leftarrow \frac{h_i-\mu_h}{\sigma_h+\epsilon},\forall i\in B$$其中$\epsilon$是一个小值数字，用于避免分母为$0$（**???** 这标准化之后会让值非常的大吗？）. 在进行标准化之后，使用$\gamma$和$\delta$再次进行处理**正则化**：$$h_i\leftarrow \gamma h_i + \delta,\forall i\in B$$在处理之后，批量样本的均值和标准差被改变为$\delta$和$\gamma$，其中$\delta$和$\gamma$则是<u>在网络中经过学习得到的参数</u>.
>- 批量正则化在一个隐藏单元上独立地进行处理，对于一个具有$K$个层全连接的网络，每一层中有$D_k$个隐藏单元，则将会设置$\sum\limits_{k=1}^{K}D_k$个独立的$\delta$和$\gamma$
>  
>- 注1：对于具有$K$个卷积层的卷积神经网络，一个层中包含$C_k$个通道，则设置$\sum\limits_{k=1}^{K}C_k$个$\delta$和$\gamma$.
>  对于卷积神经网络，使用BatchNorm时会对一个卷积层中的每一个通道分别进行正则化：
>  假设输入的形状为$(N,C,H,W)$，批量大小$m$，通道个数$c$，高度$h$，宽度$w$
>  首先对于一个通道上的卷积核在所有位置处理之后的输出值$\mathbf{A}=[a_{ij}]$，进行统一的标准化. 假设输出的大小为$(p,q)$（亦或称特征映射的大小），那么*有效*的批量大小为$m\times p \times q$（而不是$m$），使用有效批量中的所有数据计算均值和标准差$\mu,\sigma$，然后对输出值$\mathbf{A}$进行标准化之后添加学习参数$\delta,\gamma$，再传入到激活函数中. ==注意==：以上这种操作，即使批量大小为$m=1$，也可以进行BatchNorm操作（有效批量大小为$p\times q$）
>  
>- 引入批量正则化方法训练后的网络用于测试时，一个问题是如何对于测试集进行<u>标准化</u>，测试集并不会被分成批量，因此常用的方法是根据对整个测试训练集进行标准化（计算整个测试集的均值与标准差）.

>[!note]- 批量正则化变体：GhostNorm, Batch Renormalization, LayerNorm
>- **GhostNorm**（Ghost batch normalization）相比于BathcNorm并不使用一个批量中的所有样本进行标准化，而是从中选取一部分进行正则化，加入了更多的噪声，**???** increases the amount of regularization when the batch size is very large.
>- **Batch Renormalization**：当批量大小很小，或者对于NLP中的一个批量（样本之间的变化往往非常大 **???**），BatchNorm一般不可靠，
>
>- **LayerNorm**（Layer normalization）不使用批量的数据标准化样本，而使用每一个层的计算结果进行标准化. 
>  下面对一个具有$H$的隐藏单元的层$l$，首先计算样本输入之后在<u>未激活</u>之前的值$a^l_i(i=1,2,\cdots,H)$的经验均值$\mu^l$和经验标准差$\sigma^l$，然后对$a=[a_1,a_2,\cdots,a_H]$进行标准化，如下：
>  $$\begin{aligned}
&\mu^l=\frac{1}{H}\sum\limits_{i=1}^{H}a_i^l,\sigma^l=\sqrt{\frac{1}{H}\sum\limits_{i=1}^{H}(a_i^l-\mu^l)^2}\\
&a^l\leftarrow \frac{a^l-\mu^l}{\sigma^l}
\end{aligned}$$
>  然后进行偏移：$$\bar{a}^l\leftarrow \delta^l + \gamma a^l$$最后将$\bar{a}^l$进行激活之后输出.
>  将以上连起来即可得到网络$l$使用LayerNorm处理之后的输出值：
>  $$h^l = f(\gamma \frac{a_i-\mu}{\sigma}+\delta)$$
>  - 其中$f$为激活函数.
>  - ==注意==，这里提到的$a^l$为网络在未激活之前的值，针对RNN、CNN和全连接层有不同的情形.
>  - 对于RNN，在第$t$个时间步，未激活的隐层的输出值为：$\mathbf{a}^t=W_{hh}h^{t-1}+W_{xh}\mathbf{x}^t$
>  
>  PyTorch Code Example: [Check here](https://wandb.ai/wandb_fc/LayerNorm/reports/Layer-Normalization-in-Pytorch-With-Examples---VmlldzoxMjk5MTk1)
>	- LayerNorm最初的提出是针对于RNN的，因为BatchNorm中所提到的“批量”在RNN中并不适用，一个想法：RNN中的输入形状为$(N,T,D)$，批量大小，时间步和每一个时间步处的维度，RNN所处理的输入的典型特征即为$T$不相同（序列的长度不同），因此如果按照批量计算均值，那么*时间步就对不上*，也就没有实际意义
>	- LayerNorm的优势：$\text{LayerNorm}(\mathbf{x})=\text{LayerNorm}(\alpha \mathbf{x})$
>^BatchNormVariants

>[!note]- PyTorch: BatchNorm, LayerNorm，以及从数据张量角度理解BatchNorm和LayerNorm [Check here](DLCB.md#Regularization)
>代码实现查看上面的链接.
>
>注意从数据张量的角度，对于<u>一个输入</u>，<u>一个数据样本</u>习惯上<u>只涉及到</u>最后的几个维度上.
>
>例如图片是$(B,C,H,W)$，其中$(C,H,W)$对应的是一个样本的数据张量（通道数$\times$图片高度$\times$图片宽度）；
>或者序列数据$(B,N,T,D)$其中$(T,D)$对应的是一个样本的数据矩阵（时间步$\times$单个时间步的数据的维度）；
>
>现在我们统一地将一个样本的数据矩阵记为$D$，注意对于图片来说，其实际上的数据矩阵有所不同，具体见[批量正则化](#^BatchNorm)注1
>
>那么在上面这种习惯规定下，BatchNorm即为沿着第一个维度$B$对于数据矩阵$D_1,D_2,\cdots,D_m$（假设$\lvert B\rvert=m$）进行正则化. 而LayerNorm则是对于数据矩阵本身进行正则化.

>[!note]- ResNet | Paper: Deep Residual Learning for Image Recognition
>>[!note]- 衰减问题（Degradation）
>>随着网络深度增加，训练误差会很快达到上限（饱和），并且相比于浅层网络训练误差和测试误差都很大.
>>
>>这个问题并不是由过拟合造成的（深层网络的拟合能力比浅层网络要强 **???**，理论支撑），相反，深层网络完全可以采用这样一种构造：在浅层网络的基础上增加恒等映射层，这样处理效果至少不会比浅层网络差. 但是事实恰好相反.
>
>考虑到上面的衰减问题，显然不能再采取序列结构网络（一层一层地堆叠块），那么是否可以让网络学习到恒等映射呢（或者比恒等映射效果更好的表示）？
>
>考虑输入$\mathbf{x}$的一个映射$\mathcal{H}$，让网络学习$\mathcal{F}(\mathbf{x})=\mathcal{H}(\mathbf{x})-\mathbf{x}$，从而得到$\mathcal{H}$. 则在最坏的情况下，$\mathcal{H}$也应该学习到一个恒等映射.
>
>残差块可以写作：$$\mathbf{y}=\mathcal{F}(\mathbf{x};W)+\mathbf{x}$$其中$\mathbf{x}$和$\mathbf{y}$分别是残差块接收的输入和输出.
>
>如果$\mathcal{F}(\mathbf{x})$和$\mathbf{x}$的形状不同，可以对$\mathbf{x}$进行线性变换：$$\mathbf{y}=\mathcal{F}(\mathbf{x};W)+W'\mathbf{x}$$
>
>^ResNet

>[!note]- DenseNet

>[!note]- U-Nets

## 注意力机制

>[!summary]- 概念：非自主性提示，自主性提示
>- 在没有自身注意力的引导下，人们会不自主地受到外界的影响发生注意力转移，而当注意力会受到自身提示的引导时也会发生转移，并且这种自主的影响一般大于外界的影响.
>- **非自主性提示**：环境中的物体的突出性和易见性引导注意力变化，i.e. 黑白照片中的彩色部分；
>	- 神经网络表示非自主性提示：含参数的全连接层，或者不含参数的最大池化层、平均池化层；
>- **自主性提示**：主观意愿引导注意力变化，i.e. 从干扰中专注于当前的阅读.

>[!summary]- 概念：查询，键，值
>神经网络中通过给值加权重（注意力）的方式实现注意力汇聚，权重是依据查询（自主性提示）和键（外界环境）之间的符合程度给出的.
>
>i.e. 当我走进一间教室选择位置落座时，教室里面有黑板、第一排、第二排···
>- 在没有任何注意力的情况下（即我没有任何想法时），每一个键$k_i$对应一个<u>值</u>$v_i$：在这里设置为我前往的意愿值.
>- 现在，我的注意力（<u>查询</u>）$q$为第五排.
>- 与我的查询不符合的键对应的值都会被分配很低的<u>注意力权重</u>$a(q,v_i)$，而对于和我的查询符合的键键将会被给予很高的注意力权重.
>- 我开始检查教室里的<u>键</u>和我的查询的符合程度分配权重并计算值：讲台$a(q,v_0)=0.01,a(q,v_0)v_0$、第一排$a(q,v_1)=0.02,a(q,v_1)v_1$····第四排$a(q,v_2)=0.2,a(q,v_4)v_4$···
>- 第五排这个键和我的查询符合，因此我会基于其对应的值很高的注意力权重$a(q,v_5)=0.7$，加权之后第五排的值大于其他排的值，于是我给出输出：前往第五排.
>
>
>- **查询**（query）：在注意力机制中自主性提示被称为查询，给定查询之后，通过**注意力凝聚**（attention pooling）将选择引导至**感官输入**（sensory inputs，例如中间特征表示）

>[!summary]- 概念：Nadaraya-Watson核回归（1964），注意力汇聚
>对于一个数据集$\{(x_1,y_1),\cdots,(x_n,y_n)\}$，学习一个$f$预测$\hat{y}=f(x)$；
>首先考虑平凡的平均汇聚：$$f(x)=\frac{1}{n}\sum\limits_{i=1}^{N}$$
>显然，效果是非常差的，因为没有考虑输入$x$的位置会造成影响，**Nadaraya-Watson核回归**为：$$f(x)=\sum\limits_{i=1}^{N}\frac{K(x-x_i)}{\sum\limits_{j=1}^{n}K(x-x_j)}y_i$$其中$K$称为核.
>
>在注意力机制框架下，类似于上面的思想，有**注意力汇聚**（attention pooling）公式：$$f(x)=\sum\limits_{i=1}^{n}\alpha(x,x_i)y_i$$
>- $x$为查询，$(x_i,y_i)$为键值对，$\alpha(x,x_i)$为**注意力权重**（attention weight）
>- 约定注意力权重是一个概率分布：$\alpha(x,x_i)\geq0, \sum\limits_{i=1}^{n}\alpha(x,x_i)=1$；
>
>在这个说法下，Nadaraya-Watson是不含参数的注意力汇聚，称为**非参数注意力汇聚**（nonparametric attention pooling）

>[!summary]- 概念：注意力评分函数
>假设有一个查询$\mathbf{q}\in\mathbb{R}^q$，$m$个键值对$(\mathbf{k}_1,\mathbf{v}_1),\cdots,(\mathbf{k}_m,\mathbf{v}_m)$
>注意力权重的计算：先确定**注意力评分函数**（attention scoring function）$s(\mathbf{q},\mathbf{k}_i)$，然后转换为注意力权重（例如通过Sigmoid函数）：$$\alpha(\mathbf{q},\mathbf{k}_i)=\mathrm{(s(\mathbf{q},\mathbf{k}_i))}=\frac{\exp(s(\mathbf{q},\mathbf{k}_i))}{\sum\limits_{j=1}^{m}\exp(s(\mathbf{q},\mathbf{k}_j))}$$

>[!example]- 高斯核注意力汇聚
>以高斯核（Gaussian kernel）作为注意力评分函数：$$K(u)=\frac{1}{\sqrt{2\pi}}\exp \left(-\frac{u^2}{2}\right)$$
>- 非参数注意力汇聚：定义查询$x$与键$x_i$之间的注意力权重：$$\begin{aligned}
\alpha(x,x_i)&=\frac{K(x-x_i)}{\sum\limits_{j=1}^{n}K(x-x_j)}\\
&=\sum\limits_{i=1}^{n}\mathrm{softmax}\left(-\frac{1}{2}(x-x_i)^2\right)y_i
\end{aligned}$$这里定义的注意力权重：键$x_i$越是接近查询$x$，分配给对应的值$y_i$的注意力权重越大.

>[!note]- 遮蔽softmax操作/遮蔽注意力
>在某些情况下，并非所有的注意力都需要被计算. 也就是说给定一个序列数据$[\mathbf{x}_1,\mathbf{x}_2,\cdots,\mathbf{x}_T]$，在指定$\mathbf{x}_m$为查询时，我们可能不需要汇聚所有的注意力（$[a[\mathbf{x_1},a[\mathbf{x}_m],a[\mathbf{x_2},\mathbf{x}_m],\cdots,a[\mathbf{x_n},\mathbf{x}_m]]$）来计算注意力权重，例如在之后介绍的[GPT3](#^GPT3)中，对于查询$\mathbf{x}_m$，注意力汇聚时只需要考虑键$\mathbf{x}_1,\mathbf{x}_2,\cdots,\mathbf{x}_m$（其他键则因为一些原因被被遮蔽了），最终在计算$\mathbf{x}_m$对各个键对应的值的注意力权重时：$$\begin{aligned}
&w[\mathbf{x}_i,\mathbf{x}_m]=\frac{\exp(a[\mathbf{x}_i,\mathbf{x}_m])}{\sum\limits_{j=1}^{m}\exp(a[\mathbf{x}_j,\mathbf{x}_m])}\quad 1\leq i\leq m\\
&w[\mathbf{x}_i,\mathbf{x}_m]=0\quad m<i\leq n
\end{aligned}$$
>- 注：这里略去了相关的参数.
>- 在实现时，会将要被遮蔽的注意力设置为一个非常大的负值. **???** 最后直接设置为$0$不可以吗？

>[!note]- PyTorch: 遮蔽注意力 [Check here](DLCB.md#^MultiheadAttention)
>遮蔽注意力，函数的话下面是一个直接的例子
>```Python
>def masked_attention(Seq, masked_positions=None):
>	if masked_positions is None:
>		return nn.functional.softmax(Seq, dim=-1)
>	else:
>		for i in range(len(masked_positions)):
>			Seq[i][masked_positions[i]] = -1e6
>		return nn.functional.softmax(Seq, dim=-1)
>X = torch.ones(8).reshape(2,-1)
>X[:,3] = torch.tensor([2.,3.])
>nn.functional.softmax(X, dim=-1) # 输出未经过遮蔽的注意力权重
>masked_attention(X, [1, [1,2]]) # 分别遮蔽X[0]的第2个和X[1]的第2,3个注意力以计算注意力权重
>```
>当然也可以用$0-1$矩阵来做Masking，[inspired by here](https://discuss.pytorch.org/t/attn-mask-in-nn-multiheadattention/173603)
>^MaskedAttention

下面介绍一些注意力评分函数.

>[!summary]- 点积注意力

>[!summary]- 可加性注意力
>当查询$\mathbf{q}\in \mathbb{R}^q$和键$\mathbf{k}\in\mathbb{R}^k$是不同长度的向量时，定义**可加性注意力**（additive attention）的评分函数为：$$s(\mathbf{q},\mathbf{k})=\mathbf{w}_v^T\tanh(\mathbf{W}_q \mathbf{q}+\mathbf{W}_k \mathbf{k})\in \mathbb{R}$$
>- 可学习参数为$\mathbf{W}_q\in \mathbb{R}^{h\times q},\mathbf{W}_k\in \mathbb{R}^{h\times k},\mathbf{w}_v\in \mathbb{R}^h$
>- 该评分函数即将$\mathbf{q},\mathbf{k}$连接起来之后输入到一个多层感知机中.

>[!summary]- 缩放点积注意力
>直接将查询$\mathbf{q}$和键$\mathbf{k}$进行点积操作可以衡量两者之间的相似程度，点积操作要求$\lvert \mathbf{q}\rvert=\lvert \mathbf{k}\rvert$. **缩放点积注意力**（scaled dot-product attention）评分函数定义为：$$s(\mathbf{q},\mathbf{k})=\mathbf{q}^T \mathbf{k}/\sqrt{d}$$
>- 上式的意义是，假设$\mathbf{q},\mathbf{k}$中的所有元素都是独立的随机变量，并且满足均值为$0$，方差为$1$，则两个向量的均值和方差仍然保持不变.
>- 实际操作中使用小批量提高效率，例如对于$n$个查询和$m$个键值对，其中查询和键的长度均为$d$，值的长度为$v$，查询$\mathbf{Q}\in \mathbb{R}^{n\times d}$，键$\mathbf{K}\in \mathbb{R}^{m\times d}$，值$\mathbf{V}\in \mathbb{R}^{m\times v}$的缩放点积注意力为：$$\text{Softmax}\left(\frac{\mathbf{QK}^T}{\sqrt{d}}\right)\cdot\mathbf{V}\in \mathbb{R}^{n\times v}$$
>- 使用点积的意义：点积的计算效率相比于其他评分函数中的运算要高.
>- **???** 但缩放点积计算得到的注意力权重和不缩放的一样啊. 意义何在?

>[!summary]- 概念：自注意力
>给定一个输入$X$

>[!note]- PyTorch: 缩放点积自注意力
>在自注意力运算中需要对于每个批量中的矩阵分别进行计算，PyTorch的`torch.bmm`提供了这种方法，[Check here](DLCB.md#^bmm)，并且而需要在每个批量中转置查询Q来完成注意力计算，PyTorch的`torch.transpose`提供了交换两个维度的方法，[Check here](DLCB.md#^transpose) 
>
>PyTorch中也提供了实现缩放点积注意力方法，[Check here](DLCB.md#^MultiheadAttention)
>```Python
>Embeddings = torch.rand(3, 10, 5) # 批量大小为3，长度为10的序列，词向量大小为5
>class SDP_Attention(nn.Module):
>	def __init__(self, D):
>		super().__init__()
>		self.Q = nn.Linear(D, D, bias=False)
>		self.K = nn.Linear(D, D, bias=False)
>		self.V = nn.Linear(D, D, bias=False)
>		self.D = D
>		
>	def forward(self, Seq):
>		Sa = torch.bmm(self.Q(Seq), torch.transpose(self.K(Seq),1,2)) / torch.sqrt(torch.tensor(self.D))
>		Sa_weight = nn.functional.softmax(Sa, dim=-1)
>		return torch.bmm(Sa_weight,self.V(Seq))
>```		
>下面直接使用PyTorch的框架. 注：这里本来想用PyTorch框架的结果验证我写的代码，但是PyTorch的写法是在多头注意力框架下的，单头注意力为多头注意力的特殊情形，最后还加了一层全连接层（与多头保持一致）具体[Check here](DLCB.md#^MultiheadAttention)
>```Python
>input = torch.rand(3, 10, 5)
>Singlehead = nn.MultiheadAttention(5, 1, bias=False)
>
>```

>[!summary]- 概念：多头注意力机制
>多头注意力的理念是：在同一个注意力机制下（例如相同的注意力评分函数）应用多个注意力模型，分别关注不同的行为，然后将其组合起来.
>
>一个包含$H$个自注意力头的模型，其第$h$个自注意力头有独立的权重计算值、查询和键：$$\begin{aligned}
&Q_h=\beta_{qh}+XW_{qh}\in \mathbb{R}^{N\times D_q}\\
&K_h=\beta_{kh}+XW_{kh}\in \mathbb{R}^{N\times D_k}\\
&V_h=\beta_{vh}+XW_{vh}\in \mathbb{R}^{N\times D_v}\\
&D_q=D_k
\end{aligned}$$
>- 这里假设输入大小为$N\times D$.
>使用缩放点击注意力，该自注意头的输出可以被写作：$$\text{Sa}_h[X]=\text{Softmax}\left[\frac{Q_hK_h}
>{\sqrt{D_q}}\right]\cdot V_h\in \mathbb{R}^{N\times D_v}$$
>再次强调：每个注意力头有独立的参数$\{\beta_{vh},W_{vh}\},\{\beta_{qh},W_{qh}\},\{\beta_{kh},W_{kh}\}$
>考虑一种特殊的表示方法：假设输入$\mathbf{X}$的维度为$N\times D$，注意力头的数量为$H$，并设置键、查询和值的权重矩阵大小均为$N\times D/H$，可以将所有注意力头的输出$$Sa_1[\mathbf{X}],Sa_2[\mathbf{X}],\cdots,Sa_H[\mathbf{X}]\in \mathbb{R}^{D/H}$$沿着维度$1$进行连接，组成$N\times D$矩阵之后再次进行线性变换：$$W_C \begin{bmatrix}\text{Sa}_1[\mathbf{X}] & \text{Sa}_2[\mathbf{X}] & \cdots &\text{Sa}_n[\mathbf{X}]\end{bmatrix}$$直观上，这可以理解为多个注意力头平行的进行计算（就像一个卷积层中的多个卷积核一样）然后将结果进行线性变换（卷积核则一般是相加）
>- 多头注意力并不会改变参数矩阵的数量

>[!note]- PyTorch：多头注意力
>下面构建的多头用缩放点积作为注意力函数，下面的写法模仿了PyTorch中Multihead的做法，因为我发现如果将Multiheads的权重矩阵写为`(num_heads, 3, embed_dim, head_dim)`在计算的时候十分难以操作，不如直接写为：`(embed_dim * 3, embed_dim=num_heads * head_dim)`，然后在计算的时候再做分割.
>```Python
>class MultiHeadAttention(nn.Module):
>	def __init__(self, embed_dim, num_heads):
>		super().__init__()
>		head_dim = embed_dim / num_heads
>		heads_weights = torch.rand(num_heads, embed_dim, head_dim)
>		heads_bias = torch.rand(num_heads, 1, head_dim)
>	
>	def forward(self, query, key, value):
>		# 此处，我假设query, key, value的形状均为$(B,N,D)$（批量大小，长度，嵌入维度）
>		proj_query = torch.matmul(heads_weights.transpose(1,2), query)
>```
>下面的实现使用了之前的[缩放点积注意力](#^PyTorchScaledDotAttention)，但做了一些改编.具体见Jupyter Notebook
>```Python
>class Multi_Head_Attention(nn.Module):
>	def __init__(self, embed_dim, num_heads):
>		super().__init__()
>		self.num_heads = num_heads
>		self.heads = [None] * num_heads
>		self.attention_values = [None] * num_heads
>		for i in range(num_heads):
>			heads[i] = Scaled_Dot_Attention(embed_dim, embed_dim / num_heads)
>		
>		self.heads_weight_Q_data = torch.cat([head.Q.weight.data for head in heads],dim=0)
>		self.heads_weight_K_data = torch.cat([head.K.weight.data for head in heads],dim=0)
>		self.heads_weight_V_data = torch.cat([head.V.weight.data for head in heads],dim=0)
>		
>		self.out_proj = nn.Linear(embed_dim, embed_dim, bias=False)
>	
>	def forward(self, input):
>		for i in range(self.num_heads):
>			self.attention_values[i] = self.heads[i](input)
>			return self.out_proj(torch.cat(self.attention_values, dim=1))
>```
>^PyTorchMultiHeadAttention

### Transformer

[Youtube](https://www.youtube.com/watch?v=dichIcUZfOw)

>[!summary]- 位置编码
>Sources: [stackexchange](https://datascience.stackexchange.com/questions/51065/what-is-the-positional-encoding-in-the-transformer-model)
>自注意力相较于RNN的顺序计算，其并行计算会忽略序列的位置信息，为此提出使用**位置编码**（Position encoding）向序列中注入位置信息，假设长度为$N$，嵌入维度大小为$d$的序列$X$（已经进行过嵌入处理），其位置编码表示为：$$P=(P_{i,j})_{N\times d}$$则加入位置编码之后得到的嵌入为:$$X+P$$（**???** 采用乘法如何？）
>
>位置编码可以通过学习和预设得到，这里介绍的位置编码为预设的，其形式为：$$\begin{aligned}
&P_{i,2j}=\sin\left(\frac{i}{10000^{2j/d}}\right)\\
&P_{i,2j+1}=\cos\left(\frac{i}{10000^{2j/d}}\right)
\end{aligned}$$

>[!note]- PyTorch: Position Encoding
>```Python
>class PositionEncoding(nn.Module):
>	'''这里使用的是绝对？相对？位置编码'''
>	def __init__(self, num_pos, d_model, dropout=False):
>		super().__init__()
>		pos = torch.arange(num_pos).unsqueeze(1)
>		divided = torch.pow(10000., torch.arange(0, d_model+1, 2) / d_model)
>		# 这里我看见别人写的代码：torch.exp(torch.arange(0, d_model, 2) * -(math.log(10000.) / d_model))
>		# 然后 pe[:, 0::2] = torch.sin(pos * divided)
>		self.pe = torch.zeros(num_pos, d_model)
>		self.pe[:, 0::2] = torch.sin(pos / divided[:self.pe[:, 0::2].size(1)])
>		self.pe[:, 1::2] = torch.cos(pos / divided[:self.pe[:, 1::2].size(1)]) # 这里默认是d_model是偶数，如果奇数，则需要计算的divided应该增加一个长度
>		if dropout=False:
>			self.dropout = nn.Dropout()
>	
>	def forward(self, input):
>		return input + self.pe[:input.size(0), :input.size(1)]
>```
>^PyTorchPositionEncoding

>[!summary]- 逐位前馈神经网络
>逐位前馈神经网络（positionwise feed-forward network, PFFN）使用相同的MLP对于序列中的所有位置进行处理.
>
>逐位前馈神经网络和感知机的概念相同，使用“逐位”所表达的意思是：对于一个输入形状为$(B,T,D)$的数据（批量大小、时间步、词嵌入维度），传入到PFFN中，每一个时间步的数据将被单独进行处理，并输出，因而称之为“逐位”.

>[!note]- PyTorch：逐位前馈神经网络
>和一般的感知机完全相同
>```Python
>class PFFN(nn.Module):
>	def __init__(self, num_hiddens, num_outputs):
>		super().__init__()
>		self.net = nn.Sequential(
>					nn.LazyLinear(num_hiddens),
>					nn.ReLU(),
>					nn.LazyLinear(num_outputs)
>					)
>	
>	def forward(self, X):
>		return net(X)
>```

>[!summary]- Transformer
>Transformer中所涉及到的主要结构为多自注意力头和[LayerNorm](#^BatchNormVariants)方法，两者组成一个块（或者子层，sublayer）：$$\begin{aligned}
&\mathbf{X}\leftarrow \mathbf{X} + \text{MhSa}[\mathbf{X}]\\
&\mathbf{X}\leftarrow \text{LayerNorm}[\mathbf{X}]\\
&\mathbf{X}_n\leftarrow \mathbf{X}_n+\text{mlp}[\mathbf{X}_n]\\
&\mathbf{X}\leftarrow \text{LayerNorm}[\mathbf{X}]
\end{aligned}$$
>Transformer模型有三种类型，这里针对[[#自然语言处理]]：
>- **编码器**（Encoder）：将文本转化为[词嵌入](#^Embeddings)之后转换为能够处理多种任务的表示；
>- **解码器**（Decoder）：根据输入的文本预测下一个词元；
>- **自解码器**（Encoder-decoder）：通常用于**序列到序列**（sequence-to-sequence）任务中，将文本首先进行编码，然后解码，例如机器翻译.
>^Transformer

>[!note]- PyTorch: Transformer [Check here](DLCB.md#^Transformer)
>输入首先转换为[Embedding](#^Embedding)，然后加上[位置编码](#^PyTorchPositionEncoding)，
>
>下面搭建Transformeer的Encoder的一个子块，其包含两个子层：
>
>之前已经提到过使用[Scaled Dot Self-Attention](#^PyTorchScaledDotSelfAttention) 多头注意力即为Scaled Dot Self-Attention的简单推广，见[Multihead Attention](#^PyTorchMultiheadAttention)
>- 子层$1$：
>  -> $X_0$（实际向多头注意力层传入$(X_0,X_0,X_0)$） 
>  -> 多头注意力层 $Y_0$ 
>  -> Dropout $Y_0'$
>  -> 残差连接 $X_0+Y_0'$
>  -> 层正则化 $X_1$
>- 子层$2$：
>  -> $X_1$
>  -> MLP $Y_1$
>  -> Dropout $Y_1'$
>  -> 残差连接 $X_1+Y_1'$
>  -> 层正则化 $X_2$
>   

>[!summary]- 概念：迁移学习
>**迁移学习**（transfer learning）的思想是：为了实现某一任务（称之为<u>主任务</u>），首先在一个<u>与其相关</u>（i.e. 都是NLP）的任务（称之为<u>第二任务</u>）上通过**自监督学习**（self-supervision）**预训练**（pre-train）一个模型，然后将其应用于主任务上进行训练.
>- 迁移学习的一种使用场景是主任务的数据量较少，但是第二任务的数据量多，足以训练一个良好的适用于第二任务的模型；
>- 迁移模型在具体实现方面有以下形式：
>	- 冻结预训练好的模型，其层的参数完全固定，在此基础上添加层，或者移除掉网络最后的一些层后冻结，在此基础上添加层进行训练；
>	- 人工监督学习，**微调**（fine-tune）
>- 预训练的一个例子：以下面介绍的BERT为例，其在预训练阶段的主要任务是“完形填空”：根据一个给出的不完整的句子，在空处填入词元. 在训练过程中BERT使用了包含$3.3b$的语料库，最大输入词元数为$512$，批量大小为$256$

>[!summary]- 编码器举例: BERT
>BERT属于一种编码器，其所使用的词表包含$30000$个词元，输入文本在词元化之后转化为大小为$30000\times T$的独热向量组成的矩阵，词嵌入处理之后转化为大小为$1024\times T$的词嵌入，将词嵌入传入到$24$个Transfomer中（Transfomer的结构如上），每一个Transformer包含$16$大小的多头自注意力，每个自注意力头的查询、键和值的大小均为$64\times T$（即$\Omega_{vh},\Omega_{qh},\Omega_{kh}$的大小分别为$64\times1024$），最终输出的大小仍然为$1024\times T$，Transformer中的多层感知机的全连接层的隐层大小为$4096$. Bert的参数数量约为$340m$.
>>[!note]- 进一步了解BERT，参数数量计算
>>- **嵌入矩阵**（Embedding matrices）
>>	- 词嵌入矩阵（Word embedding eatrix）：$\text{Vocabulary size}\times \text{Embedding dimension}=30522\times 768$
>>	- 位置编码矩阵（Position embedding matrix）：$\text{Maximum sequence length}\times \text{Embedding dimension}=512\times 768$
>>	- 词元类型嵌入矩阵（Token type embedding matrix）：$2\times 768$
>>	- 层正则化：$768 + 768$（权重和偏置）
>>	- 总数量：
>>- **注意力头**:
>>	- $12$个注意力头的参数总量：每个注意力头的查询、键、值权重矩阵（大小全部相同，均为$768\times 64$）：$768\times 64\times 3$，偏置：$768\times 3$，每一个$12$头注意力的参数总量：$12 * (784\times 64+368)\times 3*$
>>	- 多注意力头之后的全连接层（Dense weight for projection after concatenation of heads）：$768\times 768$，偏置：$768$
>>	- 层正则化：$768+768$
>>	- 逐位前馈神经网络（Positionwise feedforward network）：$3072\times768+3072 + 768\times3072+368$
>>	- 层正则化：$768+768$
>>- **输出层**：
>>	- Dense Weight Matrix and Bias $768\times 768 + 768$
>
>BERT使用了迁移学习，在预训练阶段，模型从大型语料库中进行**自监督学习**（self-supervision），模型在这一阶段学到一些大概的语言特性（例如：\_指甲，模型更可能填入“剪”，而不是“撕”，语言特性也可理解为一种弱常识），在微调阶段，使用相对预训练阶段要小的数据进行监督学习，以学会某一样具体的任务 **???**
>
>BERT在经过预训练阶段之后进入到微调阶段，在原有网络的基础上，针对不同的任务添加了一些层（例如MLP）
>- 文本分类（Text classificatiion）：在BERT的预训练阶段，每一段文本的都添加了一个特殊的词元\<cls\>（放在文本的最开始）. 例如，对于情感分析（积极、消极）

>[!summary]- 解码器举例: GPT3
>NLP中解码器的目的：生成下一个词元，从而可以生成一段文本.
>之前已经介绍了[自回归模型](#^AutoregressiveModel)，在解码器的训练过程中，输入数据为一段文本（转换为词嵌入），解码器需要给出这段文本的联合概率. i.e. 输入一段文本转换为词嵌入$\{\mathbf{x}_1,\mathbf{x}_2,\cdots, \mathbf{x}_T\}$那么模型给出的联合概率：$$\begin{aligned}
&Pr(\mathbf{x}_1,\mathbf{x}_2,\cdots,\mathbf{x}_T)=\\
&Pr (\mathbf{x}_1)\times Pr(\mathbf{x}_2 \,|\,\mathbf{x}_1)\cdots\cdots Pr(\mathbf{x}_T \,|\,\mathbf{x}_1,\mathbf{x}_2,\cdots,\mathbf{x}_{T-1})
\end{aligned}$$
>在这里产生问题：如果直接将整段文本直接用于训练，那么模型其实是可以通过注意力机制注意到$\mathbf{x}_m$之后的数据$\mathbf{x}_{m+1},\cdots$，而在实际测试时，模型并不能注意到这些不存在的文本（模型需要生成它们），所以这样做是有问题的，直观上相当于开卷. 为此需要遮蔽$\mathbf{x}_m$之后的注意力以计算权重. 需要用到[注意力遮蔽](#^MaskedAttention). **一个直观的图**：
>- 此外，应用注意力遮蔽之后，序列中每一个词向量的概率都只取决于先前的词，计算结果可以循环使用. **???** 需要更详细的算法
>- GPT3的这种学习策略，一种出乎意料的效果是其可以在不进行微调的情况下进行其他类型的任务：纠正语法错误、写代码、翻译... **???** 需要再补充（Few-shot learning）
>^GPT3

>[!note]- Paper: Attention is all you need
>
>>[!note]- Optimizer
>>[Adam](#^Adam) optimizer: $\beta_1=0.9, \beta_2=0.98, \epsilon=10^{-9}$
>>
>>Adjust the learning rate over the course of training: $$lr=d_{model}^{-0.5}\cdot \min(step\_num^{-0.5}, step\_num\cdot warmup\_steps^{-1.5})$$ 
>>
>>$warmup\_steps=4000$

>[!note]- 维数处理 & 数据矩阵角度看待深度学习中的常见方法
>本文和[计算图 & 自动微分](#^Graph)一样结合PyTorch讨论深度学习中的问题.

## 图神经网络

>[!summary]- 图
>一个带有边的点集
>- 图：$(V,E,U)$
>- 简单有向图：$G=(V,E,\varphi)$

>[!summary]- 图神经网络的下游任务
>- 图层面
>- 边层面
>- 节点层面

>[!note]- 谱域卷积方法
>

## 生成对抗神经网络

>[!note]- PyTorch: 一个自编码器的例子
>看这篇用Tensorflow写的文章不错，有空试着用PyTorch实现[Autocoder](https://www.tensorflow.org/tutorials/generative/autoencoder), 计算生物前沿课程中有一个简单的概览[[自编码器（Auto-encoder）]]

>[!summary]- 概念
>**生成对抗网络**（General Adversial Network, GAN）的目的是学习真实数据的概率分布$\mathcal{D}$. 其特点在于：
>1) 最终获得的网络不借助Markov链或者其他概率方法（不是概率模型），**生成器**（Generator）完全借助**隐变量**（Latent variable）生成数据；
>2) 生成器并不直接接触真实数据，由**判别器**（Discriminator）计算损失；这样做的主要原因为了同时让生成器和判别器提升.

>[!note]- 初代GAN算法：minimax损失函数 + 小批量随机梯度下降
>Ian Goodfellow et.(2014)最早提出的GAN算法.
>
>定义<u>生成器</u>$G(z;\theta_G)$：$$G：z\in \mathcal{Z}\rightarrow x^*\in \mathcal{X}$$，其中$z\sim P_z$，于是生成器隐式地对应于一个分布$P_G$；
>
><u>真实数据</u>$x\in \mathcal{X}$，$x\sim P_{data}$.
>
><u>定义判别器</u>$D(x;\theta_D)$：$$D: x\in\mathcal{X} \rightarrow y\in[0,1]$$
>
>设置超参数$k$，$m$
>
>1) 从$1$迭代到$k$，从$P_{data}$中采样$m$个样本$$\mathbf{x}=\{x_1,x_2,\cdots,x_m\}$$从$P_{z}$中采样$m$个样本，由$G$映射到$$\mathbf{x}^*=\{x_1^*,x_2^*,\cdots,x_n^*\}$$其中$x_i^*=G(z_i),i=1,2,\cdots,n$.
>   定义<u>判别器的损失函数</u>：$$L(D,\mathbf{x},\mathbf{x}^*)=-\frac{1}{m}\sum\limits_{j=1}^{m}\log(D(x_j))-\frac{1}{m}\sum\limits_{i=1}^{m}\log(1-D(x_i^*))$$
>   用梯度更新算法更新判别器$D$：$$\theta_D\leftarrow\theta_D-\nabla_{\theta_G}L(D,G)$$
>2) 从$P_{G}$中采样$m$个样本$\mathbf{x}'=\{x_1^*,x_2^*,\cdots,x_m^*\},x_i^*=G(z_i),i=1,2,\cdots,m$，<u>计算判别器的损失（固定判别器）</u>：$$C(G,\mathbf{x}')=+\frac{1}{m}\sum\limits_{i=1}^{m}\log (1-D(G(z_i)))$$用梯度更新算法更新生成器$D$（注意上面是加号）：$$\theta_G\leftarrow \theta_G-\nabla_{\theta_G}C(G,\mathbf{x}')$$

>[!note]- 初代GAN理论
>通过误差的反向传递对于$f$进行求解：
>$$\lim_{\sigma\rightarrow0}\nabla_x E_{\epsilon\sim\mathcal{N}(0,\sigma^2I)}f(x+\epsilon)=\nabla_xf(x)$$
>
>1) 在交叉熵损失函数度量下，判别器最优化得到：$$D^*=\frac{P_{data}}{P_G+P_(data)}$$hint：以上的GAN算法相当于最大化：$$V(G,D)=\int_{x}P_{data}(x)\log(D(x))dx+\int_{x^*}P_g(x^*)\log(1-D(x)))dx^*$$
>2) 定义$C(G)=\max_{D}V(G,D)$，$C(G)$取得最小值当且仅当$P_g=P_{data}$，最小值为$-\log 4$.
>   $$\begin{aligned}
C(G)&=\max_{D}V(G,D)\\
&=E_{x\sim P_{data}}[\log D^*(x)]+E_{x\sim P_{G}}[\log(1-D^*(x))]\\
&=E_{x\sim P_{data}}\left[\log \frac{P_{data}(x)}{P_{data}(x)+P_G(x)}\right]+E_{x^*\sim P_G}\left[\log \frac{P_G(x^*)}{P_{data}(x)+P_G(x^*)}\right]
\end{aligned}$$
>
>**3)** 如果每一次$G,D$都能达到最优化状态，则$P_G\rightarrow P_{data}$

>[!note]- PyTorch: 一个玩具GAN
>这里实现一个GAN，其所要学习的表示很简单：$$\begin{bmatrix}x_1 &0 &0&0 \\ x_2 & x_3 & 0 &0 \\ x_4 & x_5 & x_6 & 0  \\ x_7 & x_8 & x_9 & x_{10}\end{bmatrix}\quad x_i\in \mathcal{U}(1,5)$$
>定义一个隐变量：$z\in \mathcal{N}(0,1)$
>```Python
>'''真实分布'''
>def data(shape=(4,4), from_=1, to=5):
>	return torch.tril(torch.empty(shape).uniform_(from_, to)) # 返回下三角形矩阵
>
>'''生成器'''
>class Generator(nn.Module):
>	def __init__(self, latent_shape=8, data_shape=16):
>		super().__init__()
>		self.net = nn.Sequential(nn.Linear(latent_shape,8), nn.ReLU(), nn.Linear(8,data_shape))
>		self.latent_shape = latent_shape
>	
>	def forward(self, num, train=False):
>		shape = (num,) + (self.latent_shape,)
>		if train == True:
>			return self.net(torch.empty(shape).normal_(0,1))
>		else: 
>			with torch.no_grad():
>				return self.net(torch.empty(shape).normal_(0,1))
>
>'''判别器'''
>class Discriminator(nn.Module):
>	def __init__(self, data_shape=16):
>		super().__init__()
>		self.net = nn.Sequential(nn.Linear(data_shape, 8), nn.ReLU(), nn.Linear(8,1), nn.Sigmoid())
>	
>	def forward(self, input, train=True):
>		if train == True:
>			return self.net(input)
>		else:
>			with torch.no_grad():
>				return self.net(input)
>
>D, G = Generator(), Discriminator()
>a = G(10) # 只生成值看看
>a[0].reshape(4,-1)
>D(a, False) # 只生成值看看
>```
>下面制定一个训练方案，训练周期设为$N$，一次首先取$m$个真实数据样本和$m$个生成样本，训练$k$次判别器；再取$m$个生成样本，以判别器返回的损失训练生成器.
>```Python
>criterion = nn.BCELoss()
>optimizer1 = torch.optim.SGD(D.parameters(), lr=0.001, momentum=0.8)
>optimizer2 = torch.optim.SGD(G.parameters(), lr=0.001, momentum=0.8)
>def train(generator, discriminator, criterion, optimizer1, optimizer2, m=1, k=10, N=100, wait_me=False):
>	# 首先训练判别器
>	for n in range(N):
>		if wait_me == False:
>		# 每一次先训练k次判别器
>			for i in range(k):
>				rd = data((m,4,4)).reshape(m,16)
>				fd = generator(m) # 默认：train=False
>				y_rd = discriminator(rd, True)
>				y_fd = discriminator(fd, True)
>				loss1 = criterion(y_rd, torch.ones(y_rd.shape)) + criterion(y_fd, torch.zeros(y_fd.shape))
>				loss1.backward()
>				optimizer1.step()
>				optimizer1.zero_grad()
>		
>		# 训练1次生成器
>		fd_ = generator(m, True)
>		y_fd_ = discriminator(fd_)
>		loss2 = - criterion(y_fd_, torch.zeros(y_fd_.shape))
>		loss2.backward()
>		# print(y_fd_)
>		# print(loss2)
>		optimizer2.step()
>		optimizer2.zero_grad()
>```

>[!note]- DCGAN

>[!note]- 对GAN的理论分析 Paper: Towards Principled Methods for Training Generative Adversarial Networks
>**!!!** 本部分对于流形部分的理论只进行罗列，没有证明.
>
>GAN是一个[Nash均衡](https://en.wikipedia.org/wiki/Nash_equilibrium)问题. 包含两个损失函数
>
>- 原始论文中使用的Sigmoid函数本身的缺陷：如果判别器训练地过好，使得生成数据与真实数据之间能完全分开时，Sigmoid函数返回的梯度会很小，也就使得梯度接近于$0$，这是生成器无法训练起来的一个原因：生成器的损失太低了.（这里引用UDL中的一张图片）
>
>- 此外在实践中，根据理论分析生成器的损失应该至多为：$$-2\log 2+2D_{JS}(P_{data}\ \Vert\ P_G)$$（当判别器收敛时），但是实际上损失达到了$0$，这种结果出现的原因只有两种可能：
> 	 - 分布是不连续的；
> 	 - 两个分布具有不交的**支撑集**（support，低维空间中的流形）这个有证据支撑：经验和理论说明$P_{data}$实际上依赖于低维流形（extremely concentrated on a low dimensional manifold），而对于$P_{G}$，其是根据隐变量$z\sim P(z)$生成的；如果$z\in \mathcal{Z}$，那么$P_G$的支撑将包含在低维流形的一个并下，因此在$\mathcal{X}$中的测度为$0$. ==所以问题的主要原因在于==：所选择的隐变量空间的维度与实际上要生成的图片（或者是其他）的==支撑集的维度不同==！
> 
>针对上面所谈到的问题，有以下定理可以说明：
>>[!note]- 引理：常规神经网络函数作用在隐变量上形成的概率分布包含在低于该隐变量维度的低维流形的并集上
>>设$g:\mathcal{Z}\rightarrow \mathcal{X}$为由仿射变换和逐点非线性函数（i.e. rectifiers, leaky rectifiers, smooth strictly incrreasing functions (sigmoid, tanh, softplus, etc.)）复合而成的函数，则$g(\mathcal{Z})$将包含在维数小于$\mathcal{Z}$的低维流形的可数并集中. 从而，如果$\mathcal{X}$的维度低于$\mathcal{X}$，那么$g(\mathcal{Z})$在$\mathcal{X}$中的测度为$0$.
> 
>总之：如果$P_{data}$和$P_G$的支撑集是不交的或者是低维流形，那么总（极大可能）存在判别器能够将两者很好地分开. 这解释了为什么一个最优的判别器会直接干爆生成器.
>
>下面这个定理则说明了在生成分布和真实分布的支撑不交的情况下，生成器无法优化.
>
>>[!note]- 定理：对于支撑不交的两个分布，存在一个光滑的判别器完全分离之，并且梯度为$0$
>>设$P_{data},P_G$具有分别包含在两个不交紧致集合$\mathcal{M},\mathcal{P}$中的支撑；则存在$D^*:\mathcal{X}\rightarrow[0,1]$，其满足$P_{data}[D(x)=1]=1,P_{G}[D(x)=0]=1$，并且$$\nabla_xD^*(x)=0,\forall x\in \mathcal{M}\cup \mathcal{P}$$
>
>>[!note]- 定义：横截性
>>设$\mathcal{M},\mathcal{P}$是流形$\mathcal{F}=\mathbb{R}^d$的两个无界正规子流形（boundary free regular submanifolds），设$x\in \mathcal{M}\cap \mathcal{P}$，称$\mathcal{M}$和$\mathcal{P}$在$x$点**横截**（trasversally）相交，如果$T_x\mathcal{M}+T_x\mathcal{P}=T_x\mathcal{F}$，其中$T_x\mathcal{M}$表示$x$点附近的切空间
>
>>[!note]- 定义：完全平行
>>称两个无界流形$\mathcal{M},\mathcal{P}$**完全平行**（perfectly align）如果存在$x\in \mathcal{M}\cap \mathcal{P}$使得$\mathcal{M},\mathcal{P}$在$x$不横截相交
>
>下面这个定理说明任何两个低维流形不能完全平行
>
>>[!note]- 引理：两个不满维的正规子流形的扰动不完全平行的概率为$1$
>>设$\mathcal{M},\mathcal{P}$为$\mathbb{R}^d$的两个正规子流形并且不满维，设$\eta,\eta'$为两个任意的<u>独立连续随机变量</u>. 定义扰动流形：$\widetilde{\mathcal{M}}=\mathcal{M}+\eta,\widetilde{\mathcal{P}}=\mathcal{P}+\eta'$则有：$$P_{\eta,\eta'}(\widetilde{\mathcal{M}}\text{ does not perfectly align with }\widetilde{\mathcal{P}})=1$$
>
>>[!note]- 引理：不完全平行且不满维的正规子流形$\mathcal{M}$，$\mathcal{P}$的交$\mathcal{L}$在$\mathcal{M}$和$\mathcal{P}$中的测度均为$0$
>>设$\mathcal{M},\mathcal{P}$为两个$\mathbb{R}^d$的正规子流形，不完全平行并且不满维度. 如果$\mathcal{M},\mathcal{P}$无界则令$\mathcal{L}=\mathcal{M}\cap\mathcal{P}$，则$\mathcal{L}$也是一个流形，并且维度严格小于$\mathcal{M}$和$\mathcal{P}$；如果$\mathcal{M},\mathcal{P}$有界，则$\mathcal{L}$ is a union of at most 4 stricly lower dimensional manifolds. 在两种情况下$\mathcal{L}$在$\mathcal{M}$和$\mathcal{P}$中的测度均为$0$.
>
>>[!note]- 定理：
>>设$P_{data}$和$P_G$为两个概率分布，其支撑集包含在两个<u>不完全平行</u>且<u>不满维</u>的闭流形$\mathcal{M}$和$\mathcal{P}$中，假设两个概率分布$P_{data}$和$P_G$在其各自的流形中是连续的（即，如果有一个在$\mathcal{M}$中测度为$0$的集合$A$，则$P_r(A)=0$，对$P_G$也是如此）
>>
>>从而，存在一个最优的判别器$D^*:\mathcal{X}\rightarrow[0,1]$满足：$$P_{data}(D(x)=1)=1,P_{G}(D(x)=0)=1$$并且对于几乎任何$x\in \mathcal{M}$或者$x\in \mathcal{P}$，$D^*$在$x$的附近是平滑的，且$$\nabla_xD^*(x)=0$$
>
>总之，以上两个定理说明了对于两个不完全平行的低维流形$\mathcal{M}$和$\mathcal{P}$，总存在一个光滑的判别器将其完全分开，并且满足$$P_{data}(D(x)=1)=1,P_{G}(D(x)=0)=0$$从而无法进行梯度更新.
>
>下面这个定理则说明了用KL散度和JS散度本身存在的问题.
>
>>[!note]- 定理：KL散度和JS散度的性质
>>设$P_{data}$和$P_{G}$的支撑集分别包含在两个子流形$\mathcal{M}$和$\mathcal{P}$中，$\mathcal{M},\mathcal{P}$均不满维并且不完全相交，假设$P_{data}$和$P_G$在其相对应的流形中是连续的，则有：$$\begin{aligned}
&D_{JS}(P_{data}\ \Vert\ P_G)=\log 2\\
&D_{KL}(P_{data}\ \Vert\ P_G)=+\infty\\
&D_{KL}(P_G\ \Vert\ P_{data})=+\infty
\end{aligned}$$
>

>[!note]- WGAN
>Wasserstein距离相比于$KL$散度和$JS$散度的优越性在于：对于两个没有重叠的分布，Wasserstein距离仍然能够进行度量.
>
>**Wasserstein距离**（或称Earth-Mover距离，EM）：$$W(P_{data},P_G)=\int_{\gamma\in \prod (P_{data}, P_G)}E_{(x,y)\sim \gamma}\left[\left\lVert x-y\right\rVert\right]$$其中$\prod(P_{data},P_G)$为$P_{data}$和$P_G$的联合分布的集合：对于$\gamma\in\prod(P_{data},P_{G})$，其边缘分布分别为$P_{data},P_G$，也可以从规划的角度理解这件事：$\gamma$是一个路径规划，Wasserstein距离计算的即为移动分布$P_{data}$到$P_G$所消耗的质量（反之也是）==（用Wiki的图）==
>
>作者举了一个例子来说明Wasserstein距离的优越性：
>
>但计算Wasserstein距离是一件十分困难的事情，但其具有对偶形式：$$W(P_{data},P_G)=\frac{1}{K}\{\sup_{\left\lVert f\right\rVert_L\leq K}E_{x\sim P_{data}}[f(x)]-E_{x\sim P_G}[f(x)]\}$$其中$\left\lVert f\right\rVert_L\leq K$指的是$f$满足Lipschitz连续条件：$$\left\lvert f(x_1)-f(x_2)\right\rvert\leq K\left\lvert x_1-x_2\right\rvert,\forall x_1,x_2\in D$$其中$D$为$f$的定义域，==该条件等价于==$\left\lvert \nabla f\right\rvert\leq K$，则只需要如下求解Wesserstein距离：$$W(P_{data},P_G)\approx\frac{1}{K}\max_{w:\left\lVert f_w\right\rVert_L\leq K} E_{x\sim P_{data}}[f_w(x)]-E_{s\sim P_{G}}[f_w(x)]$$
>
>为了满足Lipshitz条件，一种非常简单的做法是==Clip==：$$w_i\in[-0.01,0.01]$$，另外在实际计算中也不必关心$K$，学习率调参即可.

>[!note]- Papers: Wasserstein GAN

>[!note]- WGAN算法
>为了求得Wasserstein距离，不再使用Sigmoid函数限制判别器的输出（其输出也不直接表示为损失，需要进一步计算得到Wasserstein距离）
>
>因此相对初代GAN有以下改动：
>1) 判别器的最后一层不为挤压函数（i.e. Sigmoid）；
>2) 判别器的损失更改，相应的生成器的损失也更改；
>3) 作者本人通过实验指出，不应当使用动量进行优化.
>
>设置学习率$\alpha$，截断参数$c$，批量大小$m$，每迭代一次生成器对应判别器的迭代次数$n$，设生成器$$G:z\in \mathcal{Z}\rightarrow x\in \mathcal{X}$$参数为$\theta_G$，设判别器$$D:x\in \mathcal{X}\rightarrow y\in \mathbb{R}$$参数为$\theta_D$.
>
>当$\thete_G$未收敛时：
>
>从$1$迭代到$n$，每次迭代从$P_{data}$中采样$m$个样本$$\mathbf{x}=\{x_1,x_2,\cdots,x_m\}$$从$P_{z}$中采样$m$个样本，并由$G$映射到：$$\mathbf{x}^*=\{x_1^*,x_2^*,\cdots,x_m^*\}$$其中$x_i^*=G(z_i),i=1,2,\cdots,m$，计算梯度：$$g_{\theta_D}=\nabla_{\theta_D}\left[\frac{1}{m}\sum\limits_{i=1}^{m}f_{\theta_D}(x_{i})-\frac{1}{m}\sum\limits_{i=1}^{m}f_{\theta_D}(x^*_{i})\right]$$对$\theta_D$进行梯度更新：$$\begin{aligned}
&\theta_D\leftarrow \theta_D+\alpha\cdot \text{RMSProp}(\theta_D,g_{\theta_D})\\
&\theta_D\leftarrow \text{clip}(\theta_D,-c,c)
\end{aligned}$$结束迭代.
>
>从$P_z$中采样$m$个样本，计算梯度并更新参数$\theta_G$（注意是尽可能增大Wasserstein距离，所以加负号）：$$\begin{aligned}
&\theta_G\leftarrow -\nabla_{\theta_G}\frac{1}{m}\sum\limits_{i=1}^{m}D(G(z_i))\\
&\theta_G\leftarrow \theta-\alpha\cdot \text{RMSProp}(\theta_G,g_{\theta_G})
\end{aligned}$$

>[!note]- RMSProp
>在[[#^AdaGrad]]中提到学习率下降太快了，所以一种简单的做法是  
>^RMSProp

>[!note]- WGAN-GP
>$$L(D)=-E_{x\sim P_{data}}[D(x)]+E_{x\sim P_G}[D(x)]+\lambda E_{x\sim \mathcal{X}}[\left\lVert \nabla_xD(x)\right\rVert_p-K]^2$$
>其中对于惩罚项的计算：$$x\sim P_{data},x^*\sim P_G,\epsilon\sim \text{Uniform}(0,1)$$接着进行随机插值抽样：$$\hat{x}=\epsilon x+(1-\epsilon)x^*$$这样就得到了一个分布$\mathcal{P}_{x}$然后计算：$$\lambda E_{x\sim \mathcal{P}_{x}}[\left\lVert \nabla_xD(x)\right\rVert_p-K]^2$$
>上面这种采样的思想是：重点关注生成样本集中区域、真实样本集中区域和两者之间的区域.


# Part II: Advanced Topics

>[!info]-
>This part focus on more theoretical/practical topics.

## Theory


## Application

### How to select hyperparameters?

Sources: [stackexchange](https://stats.stackexchange.com/questions/95495/guideline-to-select-the-hyperparameters-in-deep-learning)

>[!questions]- In what order shoule we tune hyperparameters?
>Sources: [stackoverflow](https://stackoverflow.com/questions/37467647/in-what-order-should-we-tune-hyperparameters-in-neural-networks)

# 附录

## 数学

### 微积分

>[!note]- $n$元局部Taylor公式
>设$D\subset \mathbb{R}^n$为开区域，$\mathbf{x}^0=(x_1^0,x_2^0,\cdots,x_n^0)\in D$，$\Delta \mathbf{x}=(\Delta x_1,\Delta x_2,\cdots, \Delta x_n)$若函数$f:\mathbb{R}^n\rightarrow \mathbb{R}^1$在$D$上$m$次可微，则有：$$f(\mathbf{x}_0+\Delta \mathbf{x})=\mathbf{f}(\mathbf{x}_0)+\sum\limits_{k=1}^{m}\frac{1}{k!}\sum\limits_{i_1,i_2,\cdots,i_k=1}^{n}\frac{\partial^k{f}}{\partial{x_{i_1}}\partial{x_{i_2}}\cdots \partial{x_{i_k}}}(\mathbf{x}^0)\Delta x_{i_1}\Delta x_{i_2}\cdots \Delta x_{i_k}+R_m(\Delta \mathbf{x}),\lvert \Delta \mathbf{x}\rvert\rightarrow0$$
>^Taylor

>[!note]- 映射微分链式法则
>设$D\subset \mathbb{R}^n$为开区域，$F:D\rightarrow \mathbb{R}^m$，$\Omega\subset \mathbb{R}^l$为开区域，$G:\Omega\rightarrow \mathbb{R}^n

>[!note]- 矩阵微分
>Sources: [Wikipedia](https://en.wikipedia.org/wiki/Matrix_calculus#Derivatives_with_matrices)
>- **标量函数被矩阵变量微分**：设$y:\mathbb{R}^{p\times q}\rightarrow \mathbb{R}$，$\mathbf{X}\in \mathbb{R}^{p\times q}$，则有：$$\frac{\partial{y}}{\partial{\mathbf{X}}}=\begin{bmatrix}\frac{\partial{y}}{\partial{x_{11}}}&\frac{\partial{y}}{\partial{x_{21}}}&\cdots \frac{\partial{y}}{\partial{x_{p1}}}\end{bmatrix}$$

### 概率论

>[!note]- 概率分布
>>[!note]- Dirichlet分布
>>

>[!note]- 支撑
>设函数$f:X\rightarrow \mathbb{R}$，定义$f$的**支撑**（support）为：$$\text{supp}(f)=\{x\in X:f(x)\neq0\}$$
>
>一个概率分布的支撑指的是该分布中非零概率的值所组成的集合.

>[!note]- KL散度
>Sources: [Wikipedia]()
>测量概率分布$p(x)$和$q(x)$之间的差异：$$D_{KL}[p(x)\,
>\Vert\,q(x)]=\int p(x)\log \left[\frac{p(x)}{q(x)}\right]dx$$
>离散情形：$$D_{KL}\left[p(x)\,\Vert\,q(x)\right]=\sum\limits_{x\in \mathcal{X}}^{}p(x)\log \left[\frac{p(x)}{q(x)}\right]$$
>KL散度总是大于$0$的：$$\begin{aligned}
D_{KL}[p(x)\,\Vert\,]&=\int p(x)\log \left[\frac{p(x)}{q(x)}\right]dx\\
&=-\int p(x)\log \left[\frac{q(x)}{p(x)}\right]dx\\
&\geq \int p(x)\left(1-\frac{q(x)}{p(x)}\right)dx=0\\
\end{aligned}$$
>对于KL散度的一个浅显的解释是：要计算两个概率分布$p(x),q(x)$之间的差异，需要计算在给定观测$x$之下$p(x)$和$q(x)$之间的差异的期望，我们假设$x\sim p(x)$，或者说$p(x)$是真实的概率分布，$q(x)$是模型给出的概率分布，那么如果$q(x)=p(x),\forall x$，那么按照KL散度，两者之间的差距为$0$，否则如果两者差异较大，无论是$\frac{p(x)}{q(x)}$过小，还是$\frac{p(x)}{q(x)}$过大，都会使得KL散度变大.

### 信息论

>[!note]- 交叉熵
>Sources: [Wikipedia](https://en.wikipedia.org/wiki/Cross-entropy)
>连续形式：
>离散形式：
>估计真实交叉熵，Monte Carlo测量（经验交叉熵）：