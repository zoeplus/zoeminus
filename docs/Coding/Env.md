# 环境搭建

# 环境变量设置

以 `g++` 为例.

```shell
$ which g++
g++ not found
# 找到 g++ 可执行程序的位置，一般是 /usr/bin/ 下
$ 
```

# C / C++

使用的是 gcc 和 g++ ，以及 cmake .

# Python

用 Conda 进行管理，注意安装包的时候可以用 `pip` ， `conda` debug 麻烦.

# Ruby

ruby 的[安装](https://www.ruby-lang.org/en/documentation/installation/)：


```shell
sudo apt-get install ruby-full
```

gem install

```shell
gem sources --remove https://rubygems.org/
gem sources --a http://ruby.taobao.org/
gem sources -l
```

# IDE

Visual Studio Code . 起始需要作一些配置如下

| 语言      | 配置                | 命令                           |
| ------- | ----------------- | ---------------------------- |
| C / C++ | 设置好环境变量即可         |                              |
| Python  | 对于 Conda 需要额外进行配置 | 更换解释器：用 `select interpreter` |
| R       |                   |                              |
