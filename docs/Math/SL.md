- [stat462](https://online.stat.psu.edu/stat462/node/77/)

# 符号说明

一部分符号说明和[[DM]]保持一致，不重复.

$\pi_k$ 表示响应的先验概率 $\text{Pr}(Y=k)$ .

$\text{Pr}(Y=k|X=x)$ 或者简记为 $p_k(x)$ ， $\text{Pr}(Y=k|X)$ ；概率密度分布函数 $\text{Pr}(X|Y=k)$ 记为 $f_k(x)$ . 

# 模型假设

## 监督学习假设及概念

假设 $\mathcal{X}\subset \mathbb{R}^n,\mathcal{Y}\subset \mathbb{R}^m$ ，在 $\mathcal{X}$ 和 $\mathcal{Y}$ 上定义随机变量 $X,Y$ ，并假设存在函数 $f$ 和与 $X$ 独立的**随机误差变量**（random error term） $\epsilon$ ，使得： $Y=f(X)+\epsilon,\text{Mean}(\epsilon)=0$ .

称 $x\in \mathcal{X}$ 为**预测因子**（predictor）/ **特征**（feature）/ **协变量**（covariate）， $y=f(x)+\epsilon\in \mathcal{Y}$ 为**响应**（response）/ **目标**（target）/ **标签**（label）. 称 $\mathcal{X}$ 为特征空间， $\mathcal{Y}$ 为响应空间. 将标签和特征统称为**属性**（attributes）.

$f$ 为根据 $x$ 预测 $y$ 提供了**系统信息**（systemmatic information），但仍然存在其他未被观测到的变量会对 $y$ 产生影响，因此假设存在误差项 $\epsilon$ 是合理的. #issue %%而假设其均值为 $0$ ？%%

假设从 $\mathcal{X}$ 中独立同 $X$ 分布（i.i.d）地抽取 $[x_1,x_2,\cdots,x_N]$ ，相应的有 $[y_1,y_2,\cdots,y_N]$ ，于是有**数据集**（data set）： $T=\{(x_1,y_1),(x_2,y_2),\cdots(x_N,y_N)\}$ 称 $(x_i,y_i),i=1,2,\cdots,N$ 为一个**数据点**（data point）/ **元组**（tuple） / **样本**（sample）/ **数据对象** / **实例**（instance） / **示例** / **事务**. 

根据上述定义的数据集 $T$ 估计函数 $f$ 的过程称为监督学习. 一般称 $f$ 为真实函数，估计得到的函数用 $\hat{f}$ 表示.

在监督学习中通常将数据集划分为**训练集**（training set），**验证集**（validation set）和**测试集**（test set）. （或者只有训练集和验证集，具体见[[#交叉检验]]）

估计 $f$ 的目的（场景）有两种：

**预测**（prediction）：只关注给定 $X$ ，根据 $\hat{f}$ 得到的响应 $\hat{Y}=\hat{f}(X)$ 与实际的响应 $Y=f(X)+\epsilon$ 之间的差距： 

$$\begin{aligned}E[(Y-\hat{Y})^2]&=E[(f(X)+\epsilon-\hat{f}(X))^2]\\&=[f(X)-\hat{f}(X)]^2+\text{Var}(\epsilon)\\&\geq \text{Var}(\epsilon)\end{aligned}$$

只关心能否减少这一差距，无所谓 $f$ 的具体形式，即使 $f$ 是黑箱.

**推断**（inference）：关注变量之间的相互作用和关系. #imcomplete %%没说清楚，另外这里我看原文也感觉不清楚，窃以为这里的推断是指可（人为）解释性好，例如线性回归这样的直接可以用系数的正负解释.%%

根据 $Y$ 是连续还是离散可以将监督学习划分为**回归**（regression）和**分类**（classification）

# 模型选择

在[[#监督学习假设及概念]]中，目标是最小化 $E_X[(Y-\hat{Y})^2],\hat{Y}=\hat{f}(X)$ ，但没有测量 $E_X[(Y-\hat{Y})^2]$ 的方法，可供使用的只有数据集 $T=\{(x_1,y_2),(x_2,y_2),\cdots,(x_N,y_N)\}$ 且不可以从 $\mathcal{X}$ 中无限制地抽样.

给定了对于 $f$ 的估计 $\hat{f}$ ，考虑如何衡量 $\hat{f}$ ，以减少 $E[(Y-\hat{Y})^2]$ .

## 衡量模型性能

为了检验 $\hat{f}$ 的性能，需要将其应用于从未出现的数据上. 将 $T$ 分割为**训练集**（train data set）和**测试集**（test data set），使用训练集获取 $\hat{f}$ ，训练过程中需要评估 $\hat{f}$ 的性能，也需要使用测试集评估 $\hat{f}$ 的性能. 通常情况下训练和测试过程中的度量标准是相同的. 下面分别就回归和分类场景提出度量标准.

### 回归：MSE

假设有数据集 $$T=\{(x_1,y_1),(x_2,y_2),\cdots,(x_N,y_N)\}$$ 待评估的函数为$\hat{f}$，则可计算**均方误差**（mean squared error, MSE）： $$\text{MSE}(\hat{f},T)=\frac{1}{N}\sum\limits_{i=1}^{N}(y_i-\hat{f}(x_i))^2$$

假设对于一给定的数据点 $(x_0,y_0)$ ，采用相同抽样方法得到训练集，根据训练集得到 $\hat{f}$ ，将 $\hat{f}$ 视为一个随机变量，并假设与 $\epsilon$ 独立，假设其均值为 $m$ ，则考虑在该点的均方误差期望： $$\begin{aligned}
E[(y_0-\hat{f}(x_0))^2]&=E[(f(x_0)+\epsilon-\hat{f}(x_0))^2]\\
&=E[(f(x_0)-\hat{f}(x_0))^2]+\text{Var}(\epsilon)\\
&=E[(f(x_0)-m+m-\hat{f}(x_0))^2]+\text{Var}(\epsilon)\\
&=E[(f(x_0)-m)^2]+E((m-\hat{f}(x_0)^2))+\text{Var}(\epsilon)\\
&=[\text{Bias}(\hat{f}(x_0))]^2+\text{Var}(\hat{f}(x_0))+\text{Var}(\epsilon)
\end{aligned}$$

#imcomplete [[ML-cheatsheets.pdf]]

为在整体上取得较小的 $E[(Y-\hat{Y})^2]$ ，需要在每个点处取得较小的 $E[(y_0-\hat{f}(x_0))^2]$ ，其可以被拆解为$3$个部分：

- **偏差** $\text{Bias}(\hat{f}(x_0))$（bias）：当改变训练集时得到的 $\hat{f}$ 与真实值之间的平均差距；
- **方差** $\text{Var}(\hat{f}(x_0))$（variance）：当改变训练集时得到的 $\hat{f}$ 的波动程度；
- **不可减少误差** $\text{Var}(\epsilon)$ （irreducible error）

偏差和方差是统计学习中一对矛盾的因素，需要选取合适的模型以取得较低的偏差和较低的方差，这要求将模型的灵活程度（flexity）控制在一定范围内，以上称为**偏差-方差权衡**（bias-variance trade-off）

### 分类：错误率

假设做出的拟合函数为$\hat{f}$，应用在数据集 $T=\{(x_1,y_1),(x_2,y_2),\cdots,(x_N,y_N)\}$ 上，对于 $x_i$ 预测的结果为 $\hat{y}_i(i=1,2,\cdots,N)$ . 则定义**错误率**（error rate）： $$\text{Er}(\hat{f},D)=\frac{1}{N}I(\hat{y}\neq y)$$ 目标即为最小化应用于测试集上得到的错误率.

#issue %%按照ISL中的假设，在分类情境下还有真实函数和误差项吗？%%

>[!quote]- 下面是一段把我CPU干烧的话：
>It is possible to show (though the proof is outside of the scope of this book) that the test error rate $\text{Avg}(I(y_0\neq \hat{y}_0))$ is minimized, on average, by a very simple classifier that assigns each observation to the most likely class, given its predictor values.

所谓**贝叶斯分类器**（bayes classfier）即为将其预测的概率向量中最大的值所对应的类别作为预测类别. 并可以证明 #issue %%在什么条件下？%%此时测试错误率平均来看最小.

#imcomplete %%P56 Exercise%%

### 交叉检验

**交叉检验**（cross valuation）是在最终测试 / 模型部署前进行的步骤，目的是从多个解决方案中选取最好的版本，尤其适合于在特征工程、模型调参时需要决定超参数的情形.

为说明交叉检验的优点，先来考虑一般的方案效果检验步骤：首先将数据集随机地划分为训练和测试集：

```python
from sklearn.model_selection import train_test_split
from sklearn import datasets

X, y = datasets.load_iris(return_X_y = True)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.4, random_state = 0)
```

在进行划分之后，可以进行如下的检验，以支持向量机中的超参 `C` 为例子：

```python
from sklearn import svm
model = svm.SVC(kernel = 'linear', C = 1).fit(X_train, y_train)
model.score(X_test, y_test)
```

这种做法有一个问题：因为测试集总是不变的，所以在手动调参以获取最适合测试集的参数时，实际上是将测试集内的信息泄露给了模型. 最终结果很可能是模型在测试集上保持良好，但检验其泛化效果时表现一般.

因此可将数据集划分为训练集、**验证集**（validation set）和测试集，验证集替代上面提到的测试集的作用，<u>用于估计超参</u>，而测试集（模型之前从未见过）将被用于最终的验证，<u>不会对超参决策造成影响</u>.

这样做有一个问题，模型在从未见过的测试集上的表现<u>并不能代表泛化能力</u>（这个测试集不一定具有代表性），并且，训练集和验证集的选取也会对训练的模型造成很大影响.

事实上，理想的情况是模型可以在多个不同的训练集上分别进行训练，然后分别测试其在从未见过的数据集上的表现，最终体现的就是模型的期望表现（具体指标，e.g. $F1-\text{Score}$ 的期望）.

但现实情况是训练集的大小一般不足以实现这种做法.

**交叉检验**（cross-validation, CV) 的提出即是为了解决这一问题：仍然保留一个数据集（就称之为验证集了）以决定超参数的选取，每一次超参数的选取都将基于在不同数据集上设置该超参数训练出来的模型在不同测试集上的<u>平均表现</u>（以避免模型间接获取测试集内的信息）.

交叉检验有多种形式，一种方法是 **k 折交叉检验**（ k folds CV）：首先将数据集分为 $k$ 份，每次取其中的 $k-1$ 份作为训练集（不同次之间训练集不同），剩下的 $1$ 份用于计算模型表现（e.g. accuracy, F1-Score）模型的综合表现则为上面 $k$ 次的平均值. 相比于将数据集划分为三份而言，交叉检验在计算量上更大，但是保留了更多可以训练的数据. 尤其是在数据量非常少时，可以采用**留一交叉检验法**：每一次用除了一个数据之外的数据作为训练集（比如， KNN 确定超参数）

下面是交叉检验的实现，以 $K$ 近邻算法中选取临近值为例：

```python
from sklearn.model_selection import cross_val_score
from sklearn.neighbors import KNeighborsClassifier
scores_list = []
for i in range(5, 15)
	# i 表示用于分类决策的临近点数量
	model = KNeighborsClassifier(i)
	# cv: 交叉检验次数 / 折数， scoring: 评分函数
	scores_list.append(cross_val_value(model, X, y, cv=5, scoring='f1_macro'))
# 这里考虑的是每一个模型在 cv 次交叉检验下的平均得分
plt.plot(range(5,15),[np.mean(i) for i in scores_list])
```

#imcomplete 

# 线性回归

关注的问题：

- 各个特征与响应之间是否存在关系？关系的强弱如何？
- 特征之间是否存在**协同效应**（synergy effect）；
- 是否存在线性关系，如果不存在能否对变量进行变换以转换为线性关系？

## 单变量情形

先考虑最简单的情形：模型假设为：$$\begin{aligned}
Y &=f(X)+\epsilon\\
&=\alpha_0+\alpha_1X+\epsilon\\
&\text{mean}(\epsilon)=0
\end{aligned}$$并且 $X,\epsilon$ 独立.

下面尝试给出对于$f(X)$的估计：$$\hat{f}(X)=\beta_0+\beta_1X_1$$ 其中$\beta_0,\beta_1$称为系数（coefficients）/ 参数（parameters）

选用 $\text{MSE}$ 度量 $\hat{f}$ 对 $f$ 的拟合程度，或可使用**残差平方和**（residual sum of squres, RSS）： $$\text{RSS}=\text{RSS}(\hat{f},T)=\sum\limits_{i=1}^{N}(y_i-\hat{f}(x_i))^2$$ ^RSS

取 $$\begin{aligned}
&\hat{\beta}_1=\frac{\sum_{i=1}^{N}(x_i-\bar{x})(y_i-\bar{y})}{\sum_{i=1}^{N}(x_i-\bar{x})^2}\\
&\hat{\beta}_0=\bar{y}-\hat{\beta}_1\bar{x}
\end{aligned}$$作为$\beta_1,\beta_0$时最小化. （推导见[[#一般情形]]）

```R
lm.fit(y ~ x)
coef(lm.fit)
```

假设用多个大小相等的数据集 $T$ （其样本均i.i.d）训练 $\hat{f}$ ， $\hat{f}$ 中两个参数 $\beta_0,\beta_1$ 可以视为随机变量，现在估量用上述方法估计得到的参数 $\beta_0,\beta_1$ 与 $f$ 中两个参数 $\alpha_0,\alpha_1$ 之间的差距随着数据集大小 $N$ 的变化会如何变化，考虑计算**标准误差**（standard errors）：$$\begin{aligned}
&\text{SE}(\beta_0)^2=\left[\frac{1}{N}+\frac{\bar{x}^2}{\sum_{i=1}^{N}(x_i-\bar{x})^2}\right]\cdot\text{Var}(\epsilon)\\
&\text{SE}(\beta_1)^2=\frac{\text{Var}(\epsilon)}{\sum_{i=1}^{N}(x_i-\bar{x})^2}
\end{aligned}$$ ^SE

标准偏差定义为$$\text{SE}(Y)^2=\text{Var}(Y)=\frac{\sigma^2}{n}$$其中$\sigma$是随机变量$Y$的
**标准差**（standard deviation）

#imcomplete  %%怎么来的？[https://en.wikipedia.org/wiki/Standard_error]，上式是如何推导得到的？%%

此外，在上式中$\text{Var}(\epsilon)$的估计（称为残余标准偏差，residual standard error，RSE）由$\text{RSS}$给出：$$\text{RSE}=\sqrt{\text{RSS}/(N-2)}$$^RSE

计算得到标准偏差之后可以计算**置信区间**（confidence intervals，CI）；$95\%$的置信区间定义为有$95\%$的概率，参数的真实值将会落在该区间内. 

这里需要特别说明一下置信区间与**可信区间**（credible intervals）之间的差别，置信区间是从频率角度出发定义的，即对于一个给定的分布，使用相同的方法为每一次抽样获取一个区间，在所有的抽样实验中有 $95\%$ 的情况中，参数的真实值将会落在该区间内，则称该区间（一个表达式）为 $95\%$ 置信区间. 而对于可信区间，其是从Bayesian角度出发的，即对于一个样本， $95\%$ 的可信区间指该区间有 $95\%$ 的概率包含真实值.  #imcomplete %%[stack](https://stats.stackexchange.com/questions/26450/why-does-a-95-confidence-interval-ci-not-imply-a-95-chance-of-containing-the)，回答中有一个例子可以留意一下%%

对于线性回归，参数$\beta_1$的$95\%$置信区间大约为：$$\hat{\beta}_1\pm 2\cdot \text{SE}(\hat{\beta}_1)$$

#imcomplete %%注释：上式成立误差项需要服从高斯分布，并且SE前的系数会随着N的变化发生轻微变化，最后是一句看不懂的话：To be precise, rather than the number 2, (3.10) should contain the 97.5% quantile of a t-distribution with n−2 degrees of freedom%%

标准差也可以执行**假设检验**（hypothesis tests），例如**零假设**（null hypothesis）$H_0$：变量$X$和$Y$之间没有关联；**备选假设**（alternative hypothesis）$H_a$：变量$X$和$Y$之间有关联.

在线性回归中，$H_0$对应于$\beta_1=0$，$H_a$对应于$\beta_1\neq0$.

实际进行假设检验时，需要确定精度（accuracy），即对于$\beta_1\neq0$，标准误差$\text{SE}(\beta_1)$在什么范围内时可以认为$\beta_1=0$，从而接受$H_0$.

实际中计算$t-$统计量（t-statistic）：$$t=\frac{\beta_1-0}{\text{SE}(\beta_1)}$$ ^TStatistic

其测量 #issue %%什么意思？？？ the number of standard deviations that $\beta_1$ is away from 0%% 如果$X$和$Y$之间无关联（$H_0$成立） #issue %%什么是有关联？在线性模型下是beta_1，在其他情况下用什么度量，线性关系的度量总是合适的吗？%% 则期望$t-$统计量具有$N-2$个自由度 #issue %%?%% 的$t-$分布.

反之，可以假设$H_0$成立（$\beta_1$=0），因为当$N$充分大（$>30$）时$t-$分布近似于标准正态分布 $\mathcal{N}(0,1)$ . 然后对于 $t-$ 分布，计算 $$P(x>\lvert t\rvert)$$ #issue %%t-分布没说清楚%% 该值定义为$p-$值（$p$-value） #imcomplete %%更多内容见ISL Chap.13%%^pValue

通常来说，设置$p$值截止线为$5\%$或者$1\%$，当$p$值小于该截止线时拒绝零假设.

---

到这里回顾一下已经提到的统计量：
- $$\text{MSE}(\bar{f},T)$$
- $$\text{SE}(\beta_1)=\frac{\sigma}{\sqrt{n}}$$
- $\text{RSS}$：表示模型预测结果与实际值的绝对差平方和；
- #issue %%不理解为什么除自由度-2%%$$\text{RSE}=\sqrt{\frac{\text{RSS}}{N-2}}$$
- $t-$统计量：$$t=\sqrt{\frac{\beta_1-0}{\text{SE}(\beta_1)}}$$
- $p-$值；


为了检测模型的拟合程度（预测），可以选用$\text{MSE},\text{RSS},\text{RSE}$.

为了验证变量之间是否存在关系（推断），可以计算：$t-$统计量，$p-$值

---

下面再引入一些统计量：

$R^2$统计量：$$R^2=\frac{\text{TSS}-\text{RSS}}{\text{TSS}}$$ 其中 $\text{TSS}$（total sum of squares）定义为$$\text{TSS}=\sum\limits_{i=1}^{N}(y_i-\bar{y})^2$$ ^R2

直观上的解释： $\text{RSS}$ 为在进行回归之后计算得到的偏差平方和（不可解释）， $\text{TSS}$ 为在进行回归之前得到的方差，$R^2$ #issue 因此表示 $Y$ 的变动中可以被 $X$ 解释的部分. %%太模糊%%

回顾（样本）协方差的定义：$$\text{Cov}(X, Y)=\frac{\sum_{i=1}^{N}(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum_{i=1}^{N}(x_i-\bar{x})^2}\sqrt{\sum_{i=1}^{N}(y_i-\bar{y})^2}}$$ %%也叫Pearson相关系数%%

```R

```


一般记$r=\text{Cov}(X,Y)$，可以证明： #imcomplete $$R^2=r^2$$

在下面讨论一般情形（多变量）时，无法延申$\text{Cov}(X,Y)$的概念，但$R^2$可以延申.

## 一般情形

现在考虑多个协变量的情形：$X_1,X_2,\cdots,X_d$，下面记：$$X=[X_1,X_2,\cdots,X_d]$$考虑其与标签$Y$之间的关系. 假设：$$Y=\alpha_0+\alpha_1X_1+\alpha_2X_2+\cdots+\alpha_dX_d+\epsilon$$

假设估计得到的函数：$$\hat{f}(X)=\beta_0+\beta_1X_1+\beta_2X_2+\cdots+\beta_dX_d$$

对于数据集$T$，可计算：$$\text{RSS}(\hat{f},T)=\sum\limits_{i=1}^{N}(y_i-\hat{f}(x_i))^2$$

为确定$X$与$Y$之间是否有关联，提出假设检验：

零假设：$$H_0:\alpha_1=\alpha_2=\cdots=\alpha_d=0$$和备选假设：$$H_a:\exists \alpha_i\neq0,i=1,2,\cdots,d$$

下面计算$F-$统计量（$F-statistic$）：$$F=\frac{(\text{TSS}-\text{RSS})/d}{\text{RSS}/(N-d-1)}$$其中：$$\begin{aligned}
&\text{TSS}=\sum\limits_{i=1}^{N}(y_i-\bar{y})^2\\
& \text{RSS}=\sum\limits_{i=1}^{N}(y_i-\hat{f}(x_i))^2
\end{aligned}$$^fStatistic

若线性假设成立，有：$$E[\text{RSS}/(N-d-1)]=\sigma^2$$并且在零假设成立的条件下：$$E[(\text{TSS}-\text{RSS})/d]=\sigma^2$$若不成立则：$$E[(\text{TSS}-\text{RSS})/d]>\sigma^2$$

因此当响应$Y$与预测因子$X$之间不存在关系时，$F-$统计量接近于$1$，否则“明显”大于$1$. #imcomplete %%没有推导%% #implementation %%R实现%%

当$H_0$成立并且误差项 $\epsilon_i$ 服从正态分布时，$F-$统计量服从$F-$分布. #imcomplete %%即使误差项并不是正态分布的，$F-$统计量在$N$充分大时也近似服从$F-$分布%%

从而可以计算$p-$值，进而决定是否拒绝原假设$H_0$. %%这里不明白，$F$的$p-$值要如何取得？%%

更一般的情形，对一部分系数进行假设检验，为方便不妨定义零假设为：$$H_0:\alpha_{d-m+1}=\alpha_{d-m+2}=\cdots=\alpha_{d}=0$$

假设零假设成立，进而给出模型：$$\hat{f}'(X)=\beta_0+\beta_1X_1+\cdots+\beta_{d-m}X_{d-m}$$

同样可以计算$F-$统计量：$$F=\frac{(\text{RSS}_0-\text{RSS})/m}{\text{RSS}/(N-d-1)}$$其中$$\text{RSS}_0=\sum\limits_{i=1}^{N}(y_i-\hat{f}'(X))^2$$而$$\text{RSS}=\sum\limits_{i=1}^{N}(y_i-\hat{f}(X))^2$$

特殊情况：$d=1，m=0$时，$F-$统计量即等同于$t-$统计量. 并且可以证明，只对于单变量$X_i$和响应$Y$分析得到的$t-$统计量，等同于在多变量$X=[X_1,X_2,\cdots,X_d]$中忽略掉$X_i$之后计算得到的$F-$统计量：$$t^2=F$$ #issue %%原文：It turns out that each of these is exactly equivalent to the F - test that omits that single variable from the model, leaving all the others in—i.e. q=1 in (3.24).%% 进而在多变量分析中，为分析单个因素是否对响应起到效果，可以先进行单变量分析，进而排除没有影响的变量.

反之，能否仅根据对单变量分析的结果来判断多变量分析的影响？答案是不可以. #issue %%下面这个例子没有给出证明%% 考虑$d=100$，$H_0$假设成立，则约有$5\%$的$p-$值（单变量分析）将会小于$0.05$. 因此有可能认定存在关系，从而与相悖.

上述情况，若采用$F-$统计量其有$5\%$的概率落在$0.05$以下，与$d$或者$N$无关，因此更容易判断.

>[!warning]- $F-$统计量的限制
>$d>N$时不能使用$F-$统计量，也不能进行回归计算，上述方法失效.

在拒绝零假设之后，需要考虑哪些变量对于响应是有影响的，下面进入到**特征选择**（feature / variable selection）.

直接的方法是取特征的子集分别拟合模型，然后对比模型的性能. #imcomplete %%报菜名：Mallow's $C_p$, Akaike information criterion ($\text{AIC}$), Bayesian information criterion ($\text{BIC}$), adjusted $R^2$. Chap. 6%% 但在$d$过大时显然不可取.

### 决定影响大的变量

三种方法：前向选择、后向选择和混合选择.

**前向选择**（forward selection）首先拟合一个只含有截距的模型：$$\hat{f}_0(X)=\beta_0$$然后对$d$个特征分别进行单变量线性回归，得到：$$\hat{f}_i(X)=\beta_{0i}+\beta_iX_i,i=1,2,\cdots,d$$下面计算：$$\text{RSS}(\hat{f}_0+\hat{f}_{i},T),i=1,2,\cdots,d$$选取其中最小的$\text{RSS}$对应的$\hat{f}_0+\hat{f}_{i}$作为新的双变量线性回归，依次类推，直到达到停止条件. #imcomplete %%什么停止条件？%%

#implementation %%这个筛选方法用R实现一下%%

**后向选择**（backawrd selection）首先拟合包含所有变量的模型：$$\hat{f}(X)=\beta_0+\beta_1X_1+\beta_2X_2+\cdots+\beta_dX_d$$首先移除掉具有最大$p-$值的变量（最不具备统计显著性） #issue %%单变量回归下计算得到的$p-$值？%% 不断重复操作直到剩余的变量拟合得到的模型的$p-$值低于某个预设条件. #imcomplete  %%理论%%

**混合选择**（mixed selection）将前向选择和后向选择结合；首先从只含有截距的模型出发，按照前向选择的方式逐渐增加变量，同时$p-$值（多变量回归计算得到的$p-$值）可能会增大，当$p-$值超过预设线时，移除最近添加的一个变量，再按照前向选择的方式添加新的变量，直到$p-$值达到一个较低的水平，并且增加任何变量都会引起较大的$p-$值时，停止混合选择. #issue %%挺模糊的，需要提前规定threshhold.%% #implementation 

之所以采用混合选择，是因为前向选择采取的是贪心算法，可能会引起较大的$p-$值.

### 模型拟合

模型拟合最主要的是如何度量其拟合效果，有两种常见度量方式：

1. $\text{RSE}$
2. $R^2$

对于$R^2$统计量，需要注意的是在增加变量的情况下$R^2$总是增大接近于$1$的（ #issue 增加一个变量总会引起$\text{RSS}$变小，而$\text{TSS}$总是不变）. 但是模型的拟合效果并不只取决于$\text{RSS}$（仅就训练阶段而言） #issue %%这里还是离不开上面对于$F-$统计量的讨论，先把$F-$统计量搞懂%%

对于$\text{RSE}$统计量，注意其并不等同于$\text{RSS},\text{MSE}$. $\text{RSS}$减少时$\text{RSE}$不一定减少：$$\text{RSE}=\sqrt{\frac{1}{N-d-1}\text{RSS}}$$（回顾一下，RSE试图估算的是$\text{Var}(\epsilon)$）从该式也能看出选取变量与$\text{RSS}$之间的可能矛盾.

---

提醒，这里模型拟合的是 $Y=f(X)+\epsilon$ 而不是 $f(X)$ ，更重要的是 $f(X)$ 的形式也不一定是线性的，判断 $f(X)$ 的形式只能够从数据的分布入手，因此可以画出**残差图**（residual plot）（肉眼）识别模型中的线性或者非线性关系. #issue %%这个统计模型的假设过于难处理了，有 $\epsilon$ 干扰怎么分析 $f(X)$ ，必须先把 $f$ 定了%% 

直接可视化（绘制相应数据的散点图） $\hat{Y}\sim X$ 并不实际，尤其是对于多个特征情形，因此考虑绘制 $Y\sim \hat{Y}$ ，或者 $(Y-\hat{Y})\sim \hat{Y}$. 以评估拟合程度. 在根据数据集 $T$ 绘制出散点图之后，可以进行拟合以观察残差变化趋势.

#imcomplete  %%实现，图 | 这里承接一下非线性方法%%

### 模型预测

注意统计学习的假设是：$$Y=f_0(X)+\epsilon$$

其中$\epsilon$与$X$独立，在线性回归中我们假设$f_0(X)$具有形式：$$f(X)=\alpha_0+\alpha_1X_1+\cdots+\alpha_dX_d$$

所以使用拟合的函数：$$\hat{f}(X)=\beta_0+\beta_1X_1+\beta_2X_2+\cdots+\beta_dX_d$$给出预测值$\hat{Y}=\hat{f}(X)$之后，其与真实值$Y$之间的差距可以看作由两个部分组成：
1) 可减少误差： $\hat{f}(X)$ 与$f_0(X)$之间的差距（尝试用$\hat{f}$逼近 $f_0$ ）；
2) 不可减少误差： $\epsilon$ 项.

或可以写成： $$\begin{aligned}
Y-\hat{f}(X)&=Y-f_0(X)+f_0(X)-\hat{f}(X)\\
&=\epsilon+[f_0(X)-\hat{f}(X)]
\end{aligned}$$

下面关心的问题是：预测值$\hat{Y}$与真实值$Y$之间的差距有多大？能否给出一个**预测区间**（prediction intervals）？

置信区间与预测区间有区别：i.e. 考虑对于 $X=[x_1,x_2,\cdots,x_d]$ 给出了 $95\%$ 置信区间和 $95\%$ 预测区间，前者并未考虑 $\epsilon$ ，其 $95\%$ 指的是包含 $f(X)$ 的概率；后者考虑 $\epsilon$ ，其 $95\%$ 指的是包含 $Y$ 的概率. #issue %%这两个区间都是怎么给出来的？%%

## 线性回归之外

### 变量不是连续值

比较常见的是响应变量不是连续值（分类问题），处理也比较直接，用Logistic函数 $\frac{1}{1+e^{-x}}$ ，或者 $\text{Softmax}$ 处理一下，将响应变量转换为概率值（连续值），然后给出一个threshold说明概率值超过多少时可以认为属于该类即可. #imcomplete %%写得不是很严谨，用tensorflow playground里面得例子吧%%

另一种情况是特征变量不是连续值（factor / qualitative predictors），比如说变量sex只能取male和female，这时可以直接赋值以建立模型假设，例如： $$sex=\left\{\begin{aligned}
&1,\text{if male}\\
&0,\text{if female}
\end{aligned}\right.$$ 或者： $$sex=\left\{\begin{aligned}
&1,\text{if male}\\
&-1,\text{if female}
\end{aligned}\right.$$ 这样一个变量称为**哑变量**（dummy variable, 虚变量）或者**指示变量**（indicators）至于之后取 $\{-1,1\}$ 还是 $\{0,1\}$ 并不重要. #issue %%理论上怎么证明，之前看感知机的时候能看出来是一样的%%

在此基础上建立的模型很容易解释. 但也要依据计算得到的统计量（e.g. $p-$ 值）来检验统计显著性.

### 改变基函数

线性函数： $$\begin{aligned}
&f(X)=\alpha_0+\alpha_1X_1+\alpha_2X_2+\cdots+\alpha_dX_d\\
&X=[X_1,X_2,\cdots,X_d]
\end{aligned}$$ 可以看作由一组基函数：$$f_1(X)=X_1+a_1,\cdots,f_d(X)=X_d+a_d$$ 线性组合得到的，显然其表达能力是很弱的. 

在此基础上，可以添加的常见基函数形式有：

- 乘 e.g. $X_1X_2$ ；
- 幂 e.g. $X_1^2$ ；

## 潜在问题

除了线性函数本身表达能力弱以外，还有以下潜在问题. 不妨假设已经具有了表达能力足够强的模型 $\hat{f}$ ，其能够以任意精度拟合 $f$ .

### 误差项相关性假设

根据[[#监督学习假设及概念]]，根据数据集 $T$ 计算得到的误差项 $\epsilon_1,\epsilon_2,\cdots,\epsilon_n$ 独立同分布. 上面式子中的推导，例如：[标准误差](#^SE)就是基于此假设（如果该假设不成立则标准误差的估计偏小，从而计算得到的置信区间变小）.  并且[p值](#^pValue)的估计也会偏小， #imcomplete #issue %%这段话看不懂：As an extreme example, suppose we accidentally <u>doubled</u> our data, lead- ing to observations and error terms identical in pairs. If we ignored this, our standard error calculations would be <u>as if we had a sample of size 2n</u> (???), when in fact we have only n samples. Our estimated parameters would be the same for the 2n samples as for the n samples, but the confidence intervals would be narrower by a factor of √2! 这里double是指数据量增大？不然double数据大小的话根据公式应该是不变的吧%%
在时间序列数据中，误差项之间可能会出现（较强的）关联性. 为了验证误差项之间是否存在关联性，可以绘制残差图. 一般情况下，时间序列中的相邻时间段中的误差项具有正相关性——相邻的误差项接近. #issue %%没看出来具有正相关性和接近有什么关系 | 这里又有问题，根据上下文能看出来作者提的残差是$y-\hat{y}$，但这并不一定等于 $\epsilon$ ，而且还默认使用线性回归了，问题感觉很大 P106，不过根据P107的三幅图似乎是这种情况，经验上的做法？%%

一个数据集 $T$ 中的误差项 $\epsilon_i,i=1,2,\cdots,N$ 之间存在相关性的情况并不少见，这里举一个简单的例子：分析体重 $\sim$ 身高之间的关系，如果其中一些个体之间有明显的相似性（e.g. 人种、国家），则可能呈现出误差项具有较强的关联性的情况.

大多数统计方法都吃误差项的相关性假设. 特别注意对此进行验证.

### 误差项的方差非常数

上面对于线性回归的分析i.e. [标准误差](#standrdError), 假设检验）中隐含了 $\text{Var}(\epsilon_i)=\sigma^2$ （这里的意思是， $\epsilon$ 对于不同的 $X$ 或者 $Y$ 会具有不同的方差，见下面构造的一个例子）

但实际情况是，误差项的方差并不一定为 $0$ ，可能会随着响应发生变化.（**异差性**，heteroscedasticity）#issue %%对于误差项的估计我持怀疑态度，主要问题还是出在 $f$ 上，下面作者对于 $\epsilon$ 的估计基于 $(y-\hat{y})\sim \hat{y}$%% 可以使用残差图估计异差性是否存在. #implementation %%来个异差性图，FIGUREh3.11%%

（经验上？）如果残差图呈现漏斗状，则存在异差性. 对于异差性，可以尝试对于 $Y$ 进行变换（ $\log Y,\sqrt{Y}$ . 这样做的可以缩小响应的规模，从而减少异差性. #issue  %%本质上不就是更换了一个模型吗？这个说法有问题.%%

在一些情况下， $\epsilon$ 的方差是可以估计的，据此可以为模型的建立提供依据，例如：若第 $i$ 个响应为 $n_i$ 个观测值 #issue %%原文是raw observation%% 的平均值（比如， $\hat{y}_i=\frac{1}{n_i}\sum\limits_{}^{n_i}y_j$ ，如果假设观测值具有方差 $\sigma$ 并且不相关，则响应具有方差 $\sigma_i^2=\sigma^2/n$ . 可以使用**加权最小二乘法**（weighted least squares）拟合模型，权重大小与方差成正比即可（惩罚项）. #imcomplete %%这实际能用吗？？？%%

### 离群值

**离群值**（outliers）指的是数据呈现出来的模式不匹配的值. 可以通过残差图检测离群值，但是需要估计残差到多少时才算是离群值. 因此可以考虑计算**学生化残差**（studentized residuals）： $\frac{y-\hat{y}}{e}\sim \hat{y}$ 其中 $e$ 为对残差的标准误差的估计值. #issue %%如何估计残差的标准偏差? [check](https://online.stat.psu.edu/stat462/node/247/)%% 学生化残差的计算公式为： $$t_i=\frac{y_i-\hat{y}_{(i)}}{\text{std}(y_i-\hat{y}_{(i)})}=\frac{y_i-\hat{y}_i}{\sqrt{\text{MSE}_{(i)}}}(1-h_{ii})$$ 其中 $\hat{y}_{i}$ 表示删除掉 $y_i$ 拟合得到的线性模型对于 $y_i$ 的估计， $\text{MSE}_{(i)}$ 表示去掉 $y_i$ 之后计算得到的 $\text{MSE}$ . $h_{ii}$ 表示杠杆率. #imcomplete %%[check](https://en.wikipedia.org/wiki/Leverage_(statistics)#:~:text=is%20the%20number%20of%20independent,i.e.%2C%20to%20be%20influential%20points.)%% 一般来说 $|t_i|>3$ 时可以认为是离群值. ^Outliers

```R
# compute studentized residuals
rstudent(lm.fit)

par(mfrow=c(2,1))
plot(predict(lm.fit), lm.fit$residuals)
plot(predict(lm.fit), rstudent(lm.fit))
```

一般来说（数据量较大时）占比例较少的离群值不会对模型拟合造成过大影响. 但是对于其他的统计量如[残余标准偏差](#^RSE)的计算会造成影响，进而影响[标准误差](#^SE)的计算，进而影响置信区间的计算（去除异常值后计算偏大）

#imcomplete Delete Residuals %%数据量较少时可以用%%

离群值可能是异常点，但另一方面也可能是模型自身的缺陷造成的，例如缺少预测因子.

### 高杠杆点

离群值指的是响应与其他数据的响应区别大的情况，**高杠杆点**（high leverage points）则指的是预测因子一场的值. 高杠杆点相对于离群值会对模型的拟合结果造成更大的影响. ^HighLeveragePoints

对于单变量线性回归，高杠杆点非常容易识别，只需要观察预测因子是否与大部分预测因子偏离即可. 对于多变量线性回归则不能这样做. 计算**杠杆统计量**（leverage statistic） $$h_i=\frac{1}{n}+\frac{(x_i-\bar{x})^2}{\sum_{j=1}^{n}(x_{j}-\bar{x})^2}$$ 该统计量具有的性质： $$\begin{aligned}
&h_i\in[\frac{1}{n},1]\\
&\text{Avg}(h_i)=\frac{p+1}{n}
\end{aligned}$$ #issue %%p?%%

可以绘制 $t_i\sim h_i$ 用学生化残差和杠杆统计量以检测离群值和高杠杆点. #implementation %%确切的算法实现%%

### 协线性

**协线性**（collinearity）指的是两个或多个特征之间具有强关联性. e.g. $\beta_1=c-\beta_0$

可以绘制等高线图 $\text{RSS}\sim (\beta_i,\beta_j)$ 来观察协线性造成的影响. 如果 $\beta_i,\beta_j$ 对应的 $X_i,X_j$ 没有协线性，则绘制得到的等高线图比较平滑——在相同的 $\text{RSS}$ 下， $\beta_i$ 的变换对应的 $\beta_j$ 的变化比较平滑，从而容易判断参数的范围（考虑进标准误差，结合等高线图几乎可以锁定参数的范围）；而若 $\beta_i, \beta_j$ 具有协线性，则等高线图很窄， $\beta_i$ 的变化会引起 $\beta_j$ 的大幅度变化，很难估计参数范围. #issue %%FIGURE 3.15 这个例子，是会引起几倍的变化，但是也呈现出很强的线相关，怎么就不能估计了？尝试从参数的置信区间考虑这个问题，但是还是看不出来为什么不能允许参数出现明显的线性%%

协线性会造成对于参数的标准误差的估计增大. [t-统计量](#^TStatistic)的估计则会减小，因此很有可能会拒绝对于该参数的零假设. （参数的统计显著性，e.g. $p$ 值、 $t-$ 统计量，因为协线性而降低.）

为了判断协线性，可以观察**协相关矩阵**（correlation matrix）. 根据协相关矩阵中的元素的绝对值大小判断相应预测因子之间是否存在协线性. 而对于两个以上的预测因子之间存在协线性的情况（**多协线性**，multicolinearity），可以计算**方差膨胀因子**（variance inflation factor, $\text{VIF}$），其表示的是拟合整个模型时 $\beta_j$ 的方差除以只采用 $X_j$ 作为拟合模型中的预测因子时得到的 $\beta_j$ 的方差. #issue %%the ratio of the variance of $\beta_j$ when fitting the full model divided by the variance of $\beta_j$ if fit on its own%% $\text{VIF}$ 可以通过以下公式计算： $$\text{VIF}(\beta_j)=\frac{1}{1-R^2_{X_j \,|\,X_{-j}}}$$ 其中 $R^2_{X_j \,|\, X_{-j}}$ 表示拟合 $X_j\sim X\backslash X_j$ 得到的线性回归模型计算得到的[R^2统计量](#^R2)，如果 $R^2_{X_j \,|\,X_{-j}}$ 接近于 $1$ 则存在协线性. 一般 $\text{VIF}$ 超过 $5$ 或者 $10$ 时可认为存在协线性.

## 与K近邻算法比较

线性回归是一种**参数方法**（parametric approach），具有较好的可解释性（只有几个参数），也容易进行显著性检验（还是，只有几个参数）.  但是参数方法主观地估计了 $f(X)$ ，或者说用模型逼近 $f(X)$ ，如果选择的模型表示能力不足，则欠拟合；如果选择的模型表示能力过强，则可能将误差项 $\epsilon$ 也一并拟合，即过拟合.

**非参数方法**（non-parametric approach）并不给出 $f(X)$ 的具体形式. **K近邻算法**（K-nearest neighbors regression, KNN regression）接受距离度量函数 $d$ , $K$ 和 待预测点 $x_0$ ，首先依据 $d$ 计算与 $x_0$ 最接近的 $K$ 个点，记点集合为 $N_0$ ，从而给出预测： $$\hat{f}(x_0)=\frac{1}{K}\sum\limits_{x_i\in N_0}^{}y_i$$

其中 $K$ 值的选择需要考虑[偏差-方差](#回归：MSE)，可以画出 $\text{MSE}\sim \frac{1}{K}$，选取合适的 $K$ 值.

KNN在低维情形情况下（尤其是非线性情形）一般拟合得比线性回归要好. 高维情形下KNN的表现不如线性回归. 经验上，参数方法在数据量较小的情况下比非参数方法拟合效果好.

统计模型在高维情形下表现明显低于低维的情况称为**维数灾难**（curse of dimensionality）. 对于高维情形，KNN中计算得到的近邻点实际上可能非常远，从而造成很差的拟合效果. ^CurseOfDimensionality

此外，如果目的是[推断](#监督学习假设及概念)，一般会舍弃一些拟合较好的非参数方法，用参数方法. %%传统的深度学习模型也算是参数方法吧，但也没什么可解释性%%

## Lab

[[R-Cookbook#Linear Regression]]

# 分类

在[[#变量不是连续值]]中已经提到了预测因子是离散值的情形，现在讨论响应是离散值的情形. 一般称离散响应为**类别**（categorical）. 一般情况下，在进行分类之间会先给出是某一响应的概率，因此也可以尝试用回归的方法处理分类.

常用的分类器有：**逻辑斯蒂回归**（logistic regression），**线性判别分析**（linear discriminnant analysis），**二次判别分析**（quadratic discriminant analysis），**朴素贝叶斯**（naive Bayes），以及KNN.

不采用线性回归，主要原因是类别之间没有明显的“序”的关系，无从谈起大小，即使有序，也很难量化序之间的差异. 而对于一个二元的情形，在[[#变量不是连续值]]中提到了用线性回归的方案. 但是线性回归并不具备可解释性，线性回归的预测结果不是概率 $\text{Pr}(Y|X)$ ，只是数值.

## 评价方法

独立抽样：获得独立测试集；

交叉验证：留一交叉验证（注意每一次都训练一个新的模型）；多倍交叉验证；

准确率的计算： $$\frac{TP+TN}{TP+TN+FP+FN}$$ 

准确率可能会产生误导效果.

混淆矩阵：

- 真阳率 / 灵敏度 / 查全率（recall）： $TPR=TP/(TP+FN)$ ；
- 真阴率： $TNR=TN/(TN+FP)$ ；
- 

精确率（precision ，查准率） $$\text{precision}=\frac{TP}{TP+FP}$$

举例（用条图可视化）

### ROC 曲线

设置各个阈值 $P(+|A)$ 并计算 $FPR,TPR$ 绘制 $ROC$ 曲线. 然后计算面积 $AUC$ . 理想的情况为 $1$ （ROC曲线非常靠近左上角）

#implementation 

$PRC$ (precision recall curve)

$\text{auPRC}$ (area under PRC)

其他评价指标： F1-Score (precision 和 recall 的调和平均值)

## 邻近度

**邻近度**（）是数据挖掘任务（KNN ，聚类，关联分析等）中非常重要的概念，很多描述性算法 / 推断任务都建立在邻近度的基础上.

直观上想，邻近度似乎等同于[拓扑](GTopo.md#度量空间)中在 $\mathbb{R}^n$ 上定义的度量概念，但并非总是如此. 首先

## 分类为什么分不准？

分类中训练集、模型两个要素的选择都会造成很大影响. 在之前的[假设](#监督学习假设及概念)的基础上，分类分布准等同于 $\hat{f}$ 无法拟合 $f$ .

- 训练集不具有代表性：就训练集 $D$ 而言， $D$ 中的特征可能并不是最能 / 完全能反映标签的，不可避免的，有一些对标签起显著影响的**隐变量**（latent）没有被包括在内；此外 $D$ 的大小如果过小，可能使得模型无法捕捉到变量和标签之间的关系；训练集中还含有部分噪声（测量误差、由隐变量造成的误差）；以上因素都会造成模型欠拟合或者过拟合.
    - 训练集缺失代表性的又一种可能性是针对某种特定类别的样本发挥很差（该类别的样本数量可能很少），建议采用**桑基图**可视化分类情况，以确定没有被正确分类的样本的类别.
- 模型本身表示能力：一般称模型的复杂度都是指参数. #issue 如果模型的参数过多，一种情况是训练集大小不足，模型欠拟合，另一种情况是模型直接过拟合（参考，多项式式拟合线性，完美通过每一个点）；如果模型的参数过少，可能欠拟合真实函数；
- 除了训练集和模型本身的问题之外，还有一种可能是真实函数本身也不存在 / 随机程度超出理解，比如天气预报；

可以通过[特征构造]以及[数据降维]获取一个相对更具有代表性的数据集. #imcomplete 而对于模型的构造，现有的模型一般从两个思路方面出发：1) 建立**概率分类模型**，推测给定的样本属于某类的概率 / 置信. （比如下面的朴素贝叶斯） 2) 建立拟合模型，在大容量且高质量训练集的基础上上模型尽可能的拟合真实函数. （比如下面的 logistic 回归）

### 模型过拟合

训练误差、泛化误差.

泛化误差高的原因：噪声、训练集太小 / 缺乏代表性样本.

验证集：从训练集（已经有标签的数据集）中抽出一部分用于测试，也是交叉验证的思想.

## 逻辑斯蒂回归

考虑类别只有两种的情况，用 $0,1$ 代替（只是符号表示）. 定义 $p(X)=\text{Pr}(Y=1|X)$. **逻辑斯蒂函数**（logistic function）定义为： $$p(X)=\frac{e^{\beta_0+\beta_1X}}{1+e^{\beta_0+\beta_1X}}$$

为拟合模型，采取**极大似然估计**（maximum likelihood）. 即为取使得事件最有可能发生的参数： $$(\beta_0,\beta_1)=\arg\max \text{Pr}(Y|X,T)$$ 其中 $T$ 为数据集， $$\begin{aligned}
\text{Pr}(Y|X,T)&=\text{Pr}(y_1,\cdots,y_N|x_1,\cdots,x_N)\\
&=\prod_{i=1}^{N}\text{Pr}(y_i|x_i)\\
&=\prod_{i=1}^{N}\left[\frac{e^{\beta_0+\beta_1x_i}}{1+e^{\beta_0+\beta_1x_i}}\right]^{y_i}\left[\frac{1}{1+e^{\beta_0+\beta_1x_i}}\right]^{1-y_i}
\end{aligned}$$

注意到： $$\frac{p(X)}{1-p(X)}=e^{\beta_0+\beta_1X}$$ 称其为 **赔率**（odds），又： $$\log\left(\frac{p(X)}{1-p(X)}\right)=\beta_0+\beta_1X$$ 称为**log赔率**（log odds）或者**logit**. 

logistic回归也有较强的可解释性，对于上面的赔率，观察到 $X$ 增加一个单位，赔率将增加 $\beta_1$ 个单位，而logit则乘以 $e^{\beta_1}$ 个单位. $\beta_1>0$ 时， $p(X)$ 随着 $X$ 的增加非线性增加.

也可以对于Logistic回归进行零假设检验，计算 $z-$ 统计量即可. 其计算公式与 $t-$ 统计量一样： $\frac{\beta_1}{\text{SE}(\beta_1)}$ ，这里如果零假设成立，则 $p(X)=\frac{e^{\beta_0}}{1+e^{\beta_0}}$ .

下面考虑多变量情形： $$\begin{aligned}
&\log\left(\frac{p(X)}{1-p(X)}\right)=\beta_0+\beta_1X_1+\cdots+\beta_dX_d\\
&p(X)=\frac{e^{\beta_0+\beta_1X_1+\cdots+\beta_dX_d}}{1+e^{\beta_0+\beta_1X_1+\cdots+\beta_dX_d}}
\end{aligned}$$ 仍然采取极大似然估计参数.

ISLRv2中的TABLE 4.2, TABLE 4.3举了一个“矛盾”的例子. 对于哑变量 $X_k$ ，观察到在单变量Logistic和多变Logistic中其对应的 $p$ 值都很小，因此可以拒绝零假设，但是对应的系数分别为正数和负数， $X_k$ 对于 $p(X)$ 的影响在两种情形下相反. 就 FIGURE 4.3 可以观察到是怎么回事：多变量Logistic中 $X_k$ 对应的系数的含义是在其他变量固定的情况下 $X_k$ 的变化（取两种情况之一）对于 $p(X)$ 造成的影响；单变量Logistic中 $X_k$ 则未考虑到这一影响（在FIGURE 4.3右侧图更直观的体现了单变量的局限性：忽略了来自其他多变量的信息）. **在实际应用中**，如果其他相关的变量的信息没有给出，那么应当采取单变量Logistic，否则考虑多变量Logistic. 多变量和单变量情形下的结果（或解释）不同的现象称为**混淆**（confounding） ^Confounding

### 多分类逻辑斯蒂回归 & Softmax

下面考虑响应具有两个以上值的情况. 假设总共有 $K$ 个可取值，不妨记为： $1,2,\cdots,K$ . **多分类逻辑斯蒂回归**（multinomial logistic regression）的形式为： $$\text{Pr}(Y=k|X)=\left\{\begin{aligned}
&\frac{e^{\beta_{k0}+\beta_{k1}X_1+\cdots+\beta_{kd}X_d}}{1+\sum_{j=1}^{K-1}e^{\beta_{j0}+\beta_{j1}X_1+\cdots+\beta_{jd}X_d}},k=1,\cdots,K-1\\
&\frac{1}{1+\sum_{j=1}^{K-1}e^{\beta_{j0}+\beta_{j1}X_1+\cdots+\beta_{jd}X_d}},k=K
\end{aligned}\right.$$ 并且有： $$\log\left(\frac{\text{Pr}(Y=k|X)}{\text{Pr}(Y=K|X)}\right)=\beta_{k0}+\beta_{k1}X_1+\cdots+\beta_{kd}X_d$$ 其中 $k=1,2,\cdots,K-1$ . 上述使用 $\text{Pr}(Y=K|X)$ 作为基准线，其具体的值并不重要. 关注logit即可. 

**Softmax**是logistic的一种替代方法： $$\begin{aligned}
&\text{Pr(Y=k|X)}=\frac{e^{\beta_{k0}+\beta_{k1}X_1+\cdots+\beta_{kd}X_d}}{\sum_{j=1}^{K}e^{\beta_{j0}+\beta_{j1}X_1+\cdots+\beta_{jd}X_d}},k=1,\cdots,K\\
&\log\left(\frac{\text{Pr}(Y=k|X)}{\text{Pr}(Y=k'|X)}\right)=(\beta_{k0}-\beta_{k'0})+\cdots+(\beta_{kd}-\beta_{k'd})X_d
\end{aligned}$$

## 广义分类模型

之前直接估计给定预测因子下响应的概率分布 $\text{Pr}(Y|X=x)$ . 就Logistic回归本身而言：当不同类别之间存在较大差异时，估计得到的参数将会很不稳定. #issue %%结论，和极大似然估计有关？另外什么是存在巨大差异？substantial seperation P152%%

广义分类模型考虑估计概率密度函数 $f_k(x)=\text{Pr}(X=x|Y=k)$ ，然后根据**贝叶斯定理**（Bayesian theorem）计算得到 $$\begin{aligned}
\text{Pr}(Y=k|X=x)&=\frac{\text{Pr}(X=x|Y=k)\text{Pr}(Y=k)}{\text{Pr}(X=x)}\\
&=\frac{\text{Pr}(X=x|Y=k)\text{Pr}(Y=k)}{\sum_{j=1}^{K}\text{Pr}(Y=j)\text{Pr}(X=x|Y=j)}\\
&=\frac{f_k(x)\pi_k}{\sum_{j=1}^{K}\pi_jf_j(x)}
\end{aligned}$$ 称 $\pi_k=\text{Pr}(Y=k)$ 为**先验概率**（prior probability）， $f_k(x)=\text{pr}(Y=k|X=x)$ 为**后验概率**（posterior probability）. 计算完概率分布函数 $f_k(x)$ ，根据贝叶斯分类法即可进行预测）

下面考虑如何对于先验和后验概率进行估计.

### 线性判别分析

**线性判别分析**对于同一类别的样本做正态分布假设 $f_k(x)=\frac{1}{\sqrt{2\pi}\sigma_k}\exp\left(-\frac{(x-\mu_k)^2}{2\sigma_k^2}\right)$ . 一般更简单地假设 $\sigma_1=\sigma_2=\cdots=\sigma_K$ .

带入上式可得： $$\text{Pr}(Y=k|X=x)=\frac{\pi_k\frac{1}{\sqrt{2\pi} \sigma_k}\exp\left(-\frac{(x-\mu_k)^2}{2\sigma_k^2}\right)}{\sum_{i=1}^{K}\pi_k\frac{1}{\sqrt{2\pi}\sigma_i}\exp\left(-\frac{(x-\mu_i)^2}{2\sigma_i^2}\right)}$$ 注意到只需要分子，取 $\log$ ，忽略常数： $$-\frac{x^2}{2\sigma_k^2}+\frac{\mu_k}{\sigma_k^2}x-\frac{\mu_k^2}{2\sigma_k^2}+\log \pi_k$$ 如果假设 $\sigma_1=\sigma_2=\cdots=\sigma_K=\sigma$ ，则只需要考虑： $$\frac{\mu_k}{\sigma^2}x-\frac{\mu_k^2}{2\sigma^2}+\log \pi_k$$ 只与 $x$ 呈线性关系，因此称线性判别分析. 

下面考虑只有两个类别（ $0,1$ ）的情况，可以得到决策界：

## K 近邻

惰性学习：直到测试时才进行训练和分类；

K 近邻算法中的调参问题： $k$ 的取值，如何刻画近邻（确定度量），如何确定最终标签.

进行（留一）交叉验证：依次取 $k$ 值，对于任何一个已经有标签的点再次进行预测，比较正确率； $k$ 值较大模型简单，欠拟合； $k$ 值较小模型复杂，受噪声影响较大.

## 决策树

Dependencies: [树的定义](DSA.md#树).

决策树对于整个数据集进行多轮<u>有依赖的</u>划分（本轮分类是在上一轮分类上进行的），训练决策树即是找出最好的划分条件.

决策树算法中有几个关键元素：

- **测试节点**（也就是**分支结点**）：基于一个或者多个属性对数据进行划分（e.g. 二元属性的 yes / no，连续属性的区间）
- **叶结点**；标签.

Hunt 算法：（采用贪心算法构建决策树，局部最优）

步骤：

1) 若 $D_t$ 中的所有记录都属于同一类，则记 $t$ 为叶结点，用 $v$ 表示；

为不同类型的属性指定测试条件：多路划分 / 二元划分

决策树算法：测试节点、分支、叶子；

Hunt 算法：（采用贪心算法构建决策树，局部最优）

步骤：

1) 若 $D_t$ 中的所有记录都属于同一类，则记 $t$ 为叶结点，用 $v$ 表示；

为不同类型的属性指定测试条件：多路划分 / 二元划分

确定决策树的最佳划分：纯度应该较高（可以用熵值度量）

采取**信息增益算法**，经过分类之后得到的信息量减去原始数据的信息量；

GINI 度量，计算被分为某类的概率；

**分类误差**（classification error）

**增益率**（gain ratio）

**剪枝**： 

- 预剪枝：对于信息增益如 Gini 指标低于阈值或者元素数量低于阈值时停止划分. 但可能导致欠拟合.

- 后剪枝：在生成决策树之后删除节点（转化为叶结点）计算开销大；

>[!question]- **冗余**属性是否会对决策树的效果造成影响？
>不会，在特征筛选阶段就排除了.
>
>如果把冗余属性算进去呢？

>[!warning]- 决策树不能学习特征之间的相关性.
>这里要硬说能学习我觉得也可以，对于具有 $k$ 个属性的数据集，每一次用一个属性训练一个决策树，然后再比对不同决策树分类的相似度. （但似乎只是相关性的必要条件？） #imcomplete 

### 度量局部划分优劣

决策树的优劣直接根据分类结果的精确率或者[[#评价方法]]即可得到. 而依照贪心算法，在每一层的划分中都需要度量局部划分的好坏.

采取**信息增益算法**，经过分类之后得到的信息量减去原始数据的信息量；

**基尼度量**（GINI），计算被分为某类的概率；

**分类误差**（classification error）

**增益率**（gain ratio）

### 剪枝 

决策树很有可能产生过拟合，例如对于一个大小为 $n$ 的数据集，完全可以构造出一个深度为 $n$ 的决策树以实现正确分类 #imcomplete-whatever ，但不可能具备泛化能力.

决策树用剪枝处理以降低树的复杂度：

**预剪枝**：对于信息增益如 Gini 指标低于阈值或者元素数量低于阈值时停止划分. 但可能导致欠拟合.

**后剪枝**：在生成决策树之后删除节点（转化为叶结点）计算开销大；

### 随机森林

**随机森林**是集成学习中 [[#Bagging]] 的一个例子.

随机森林中的“随机”有两层含义， 1) 行随机：选取数据集的子集时随机；2) 列随机：选取数据集的特征时随机.



## 朴素贝叶斯

朴素贝叶斯就是上面提到的[概率分类模型](#分类为什么分不准？)，最简单并且被广泛使用和拓展.

## 支持向量机

**支持向量机**（support vector machine, SVM）试图选取最优的[分离超平面](Opt.md#^SeperateHyperplane)，此处所定义的“最优”指的是距离不同类别的数据点的平均距离最大.

首先定义**决策超平面**： $w^Tx+b=0$ ；假设有超平面 $w^Tx+b=-1,w^Tx+b=1$ ，分别对应于负样本和正样本，这两个超平面的**间隔**（gap）为 $G=\frac{2}{\Vert w\Vert}$ ，问题即转化为最小化 $\Vert w\Vert$ . 此外还需要满足约束： $y_i(w^Tx_i+b)>=1$ ；该问题为**凸二次规划** #imcomplete ；可以将限制条件转换为一个**惩罚项**（penalty term）： 

$$\alpha_i(1-y_i(w^Tx_i+b))$$

其中 $\alpha_i$ 是拉格朗日乘子 #issue .

以上讨论的是二分类问题，可以用二分类器构造多分类器： 将 $k$ 类数据两两组合，构建出 $k(k-1)/2$ 个支持向量机；或者每一次固定一个类别（属于该类别和不属于该类别），构建 $k$ 个支持向量机； #imcomplete

非线性 SVM 和核函数：特征维度的提高可以提高可分性，因为最终关心的只有内积，只需要假设内积的形式 $z_i^Tz_j=K(x_i,x_j)$ ，这即是**核函数**（kernel function）.

软间隔的 C-SVM : 引入**松弛变量** $\xi$ ， C 值较小（大）时，松弛变量大（小），样本误分较多（少），泛化能力强（若）； #issue

## 集成学习

**集成学习**（emsemble learning）组合多个弱分类器以获取一个更好的分类器. 

集成学习采取**投票**的方式进行分类：假设有 $m$ 个的弱分类器，考虑最简单的情形：每个弱分类器分类错误的<u>概率</u>为 $r$ ，则集成后获得的分类器（按照无加权投票）的分类错误的概率为：

$$p=\sum\limits_{\lfloor i=(m+1)/2\rfloor}^{m}\binom{m}{i}r^i(1-r)^{m-i}$$

因此，每一个弱分类器的分类精确度应该大于 $0.5$ ，才能够保证分类器的精确度超过 $r$ . 证明：注意到 $p$ 关于 $r$ 单调递增，若 $m=2k+1$ ，取 $r=0.5$ 时， $p=0.5$ . #imcomplete 

此外注意，上述讨论的只是单个分类器的分类精确度对于分类器的影响. 单分类器之间也应当具有差异性（否则，考虑完全一致的弱分类器，组合是没有意义的）.

集成学习分为两个阶段：训练弱分类器和集成.

为了保证弱分类器之间具有差异性，需要对于数据集进行采样（大小） / 划分（特征），用不同的子数据集训练弱分类器；为保证弱分类器具有较高的分类精度，需要在大小和划分上调整参数.

一般，用于每个弱分类器的特征数量越少，弱分类器的相关性就越小，但同时弱分类器的分类精度也可能降低. 

| 名称      | Bagging | Boosting  |
| ------- | ------- | --------- |
| 采样方法    | 均匀采样    | 根据错误率采样   |
| 采样偏好    | 随机选取    | 与学习结果有关   |
| 是否加权    | 无权重     | 有权重       |
| 是否容易过拟合 | 不易      | 容易（对噪声敏感） |

### Bagging

**Bagging** 对于数据集进行有放回的重采样，以使得用于弱分类器的数据集有一定重合.

Bagging 的一个应用即为 [[#随机森林]]

### Boosting

Boosting: 对于分类错误的样本加以关注（权重增加），获得多个针对特定错误样本的分类器. 

样本权重：根据权值对数据进行抽样；

核心思想：没有先验知识时，所有的样本都是等概率分布.

AdaBoost train:

```
算法名称： AdaBoost

for (k = 1; k < iterations; k++)
    分类器 k 基于权重学习一个弱分类器；
    计算加权分类误差 \epsilon_k
    计算分类器的系数 \alpha_k
    更新权值:
```

集成学习模型： $f(x)=\sum_{m=1}^M\alpha_mG_m(x)$

并采用指数损失函数： $L(y, f(x))=\exp[-yf(x)]$

并且 $f_m(x)=f_{m-1}(x)+\alpha_mG_m(x)$

Adaboost 例子：

初始权值为 $1/N$ ，

弱分类器太复杂容易过拟合；弱分类器太简单容易欠拟合.

### Stacking

**Stacking** 中弱分类器将基于前一个弱分类器进行训练.
