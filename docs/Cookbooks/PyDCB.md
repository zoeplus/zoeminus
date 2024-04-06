# Objects

## Series

```Python
## create Series
obj = pd.Series([1,9,1,9], index = ['a','b','c','u'])
# or using dictionaries
obj = {'a':1, 'b':9, 'c':1, 'd':9}

obj.values
obj.index

# change the index
obj.index = ['index0', 'index1', ...]

# name the series
obj.name = 'obj_name'
# name the index of the series
obj.index.name = 'index_name'

obj[['a', 'b']]
obj[obj > 8] # index by boolean

# treat series as a set-length ordered dictionary
'b' in obj # search in the keys (indices)

## operation on series or data frames
obj * 2
np.exp(obj)
# apply a function elementwise
def diy_func(ele):
	return ele ** 2 - 1 
obj.apply(diy_func)
```

## Data Frames

Creating data frames

```python
## Create data frames
my_dict = {
    "key1": value1,
    "key2": value2,
    "key3": value3
}
# Creating DataFrames from a list of dictionaries (by row)
lisf_of_dicts = [{"name":zoe, "breed":human}, {"name":eplus, , "breed":human}]
df = pd.DataFrame(list_of_dicts)

# From dictionaries of lists (by column)
dicts_of_lists = {"name":["zoe", "eplus"],
                 "breed":["human", "human"]}
df = pd.DataFrame(dicts_of_lists)

# from csv file: comma-seperated values (designed for DataFrame-like data)
df = pd.read_csv("path_to_the_csv_file")
df.to_csv("output_path")
```

Navigate data frames & basic operations.

```python
df.columns
df.loc["col1", "col2", ...]
# for multi-level index
df.loc[[('col0', 'col10'), ('col2', 'col21')]]
df.iloc[4,]

## deal with index
df.index
df.set_index("index_name")
df.reset_index() # remove the index
df.reset_index(drop=True) # discard the index
# sort index by some columns
df.sort_index(level=["col1", "col2", ...], ascending=[True, False])

## filtering
filter_list = ['identity1', 'identity2', ...]
df[df['col'].isin(filter_list)]

## opearations
# drop column
df.drop("col", axis=1)
# drop row
df.drop([0,1], axis=0)
```

Using pivot table to get statistics.

```python
# pivot tables
df = df.pivot_table(values="valut_to_be_process", index=["index_1", "index_2"], columns="col") # the default aggfunc is mean()
```

### Opearting with Strings

```Python
# split
df['string_col'].str.split(':')
# return the first of the splited ones
df['string_col'].str.split(':').str.get(0) 
# return a new DataFrame
df['string_col'].str.split(':',expand=True) 
df[['main_string_col', 'substring_col']] = df['string_col'].str.split(':', expand=True)
df.drop('string_col', axis=1, inplace=True)

# concatenate 
df_new['name_author'].str.cat(df_new['lastname_author'], sep=' ')

# can also concatenate / split index with other columns
df.index.str.cat(df['string_col'], sep='-', expand=True)
df.index.str.split('-', expand=True)
```

### Operating with Date

```python
# acquire the components of a date
df["col"].dt.mouth
df["col"].dt.year
```

### Visualization

```python
import matplotlib.pyplot as plt

# histograms
df["col"].hist(bins=20) # change the bin number

# bar plots, for categorical and numeric variables
df.plot(kind="bar", title="title")

# line plots
df.plot(x="x-axis-label", y="y-axis-label", kind="line", rot=45)

# scatter plots, for relationships between numeric variables
df.plot(x="x-axis-label", y="y-axis-label", kind="scatter")

# layering plots
df[some conditions].hist(alpha=0.7) # transparency
df[some conditions].hist(alpha=0.7) 
plt.legend(["plot-1", "plot-2"])

plt.show()
```

# Data Preprosessing

## Factor

#imcomplete 

```Python
# similar to R's factor(vector)
from sklearn import preprocessing
```

## Missing Valuse

```python
# Null value
obj = pd.Series({'a':1, 'b':NaN})

pd.isnull(obj) # obj.isnull()
df.isnull().sum() # check all the columns
pd.notnull(obj) # obj.notnull()
# null's propogation
pd.isnull(obj) / obj.shape[0]

# encode other symbol to null value (suppose the missing value are annotated as '?')
df[df == '?'] = np.nan
df.isnull()
```

## Impute Missing Values with: 

```python
## mode
col = ... # list or string
# for col in co:
df[col].fillna(df[col].mode()[0], inplace=True)
```

# OS

```Python
import os

# acquire dirctory items
directory_path = 'D:/Data/Path'
entries = os.listdir(directory_path)

for entry in entries:
	print(entry)

# acquire item path
entry_0_path = os.path.join(directory_path, entry0)
```

# Model Selection

## Split Data

```Python
from sklearn.model_selection import train_test_split

X_train, X_test, Y_train, Y_test = tarin_test_split(X, Y, test_size=0.3, random_state=0)
```

## Scikit-learn 数据预处理

标准化： `StrandardScalar` 

将特征缩放到某个范围：

处理异常值： `Robustscalar` 

核矩阵的中心化：

---

非线性转换

分位数转换函数 `QuantileTransformer` 

归一化函数 `normalize`

---

生成多项式特征；

样条函数特征生成函数 `SpineTransfromer`

---

自定义转换器 `FunctionTransformer`

## Sklearn 处理缺失值

单变量插补（univariate feature imputation）

多变量插补：

最近邻归因

删除低方差的 `VarianceThreshhold` 

# 生物信息

[Kaggle]()

`epi.pp` preprocessing

remove low quality cells:

```python
epi.pp.filter_cells(adata, min_features = 10)
epi.pp.filter_features(adata, min_cells = 10)
```

reduce feature space to 
the most variable features [check](https://episcanpy.readthedocs.io/en/anna/api/episcanpy.pp.select_var_feature.htm)

```python
epi.pl.cal_var(adata)
epi.pp.select_var_feature(adata, max_score = 0.2, nb_features = 50000)
```