
安装 Conda 之后取消默认的激活环境：

```shell linenums="1"
$ conda config --set auto_activate_base false
```

| 指令                                                                | 描述                 | 备注                      |
| ----------------------------------------------------------------- | ------------------ | ----------------------- |
| `conda --version`                                                 | 获取版本号              | `conda -V`              |
| `conda --help`                                                    | 获取帮助               | `conda -h`              |
| `conda somecommand --help`                                        | 查看帮助               | 例如`conda update --help` |
| `conda env -h`                                                    | 查看环境管理的全部命令帮助      |                         |
| `conda create --name your_env_name`                               | 创建环境               |                         |
| `conda create --name your_env_name python=X`                      | 创建指定python版本的环境    |                         |
| `conda create --name your_env_name somepackage1 somepackage2` ... | 创建包含某些包的环境         |                         |
| `conda create --name your_env_name python=X somepackage ...`      | 创建指定python版本，指定包含包 |                         |
| `conda info --envs`                                               | 列举当前所有环境           | `conda env list`        |
| `activate your_env_name`                                          | 进入某个环境             |                         |
| `deactivate`                                                      | 退出当前环境             |                         |
| `conda create --name new_env_name --clone old_env_name`           | 复制某个环境             |                         |
| `conda remove --name your_env_name --all`                         | 删除某个环境             |                         |
| `conda list`                                                      | 在进入环境之后列举出该环境中所有的包 |                         |

在 Conda 激活环境之后就可以下载依赖的信息：

```shell linenums="1"
$ pip freeze > requirements.txt
# $ conda list -e > requirements.txt

# 安装依赖
$ pip install -r ./requirements.txt
```

[reference](https://stackoverflow.com/questions/50777849/from-conda-create-requirements-txt-for-pip3)