**分布式控制系统**：版本控制系统：保留历史记录. 所有的版本控制系统，<u>只能跟踪文本文件的改动</u>. **分布式**：没有“中央服务器”，个人电脑即为一个完整的版本库.

分布式版本控制系统通常也有一台充当在“中央服务器”的电脑，方便交换修改.

# Git 配置

Git 中 commit 需要声明用户名称和Email地址.

```shell
$ git config [--global] user.name "Your Name"
$ git config [--global] user.email "email@example.com"

# 查看配置
$ git config [--global] user.name
$ git config [--global] user.email
```

`git config`命令的`--global`参数：指定所有的Git仓库都使用这个配置.

**创建版本库**：版本库/仓库（repository），可以理解为一个目录，目录中所有文件都可以被Git管理，Git能够跟踪每个文件的删除和修改.

```shell
mkdir learngit
cd learngit
pwd
```

然后初始化：
```shell
git init
```

# 版本更新和回退

每一次**提交**（commit）视为一次版本. 在对（多个）文件作出修改时，需要决定将哪些修改提交.

1) 使用命令`git add`，将对于文件的改动放到暂存区（changes -> staged changes）
2) `git commit`，将文件提交到仓库`-m`之后输入的是本次提交的说明.

```shell
git add readme.txt
git commit -m "wrote a file"
```

`commit` 可以一次提交多个更改：

```shell
git add file1.txt
git add file2.txt file3.txt
git commit -m "add file1, file2, file3"
```

修改文件之后，运行`git status`命令查看版本库的状态.

解决`git status`不能显示中文的问题：[check](https://zhuanlan.zhihu.com/p/133706032)，将git配置文件`core.quotepath`项设置为`false`：`$ git config --global core.quotepath false`.

查看文件的版本变化

`git diff <filename>`可以查看修改的md文件. （`diff`: difference）

## **版本回退**

`commit` 起到对文件进行一个“保存快照”的作用 / 存档点. 可以通过 `commit` 恢复文件历史版本.

使用 `git log` 查看版本变化，查看一个特定文件的版本变化使用 `git log <file>`  （注意如果不在当前目录下需要声明路径）， `git log` 命令显示从最近到最远的提交日志.

可以使用 `--pretty=oneline` 改变呈现方式.

```shell
git log --pretty=oneline 摘记.md
0b47efeef6f1eaf64b710616684f6b3673f8bc6f (HEAD -> master) nothing
803ea6726ebc05c2349e554ce1b2f70e9eeb569f 创建
```

一长串的内容是 `commit id` （版本号），Git的 `commit id`  #imcomplete-whatever  是一个由SHA1计算出来的非常大的数字，用十六进制表示. 之所以这样做，是因为 Git 是分布式的版本控制系统，这样在多人使用时不会冲突.

每提交一个新版本，Git就会把它们自动串成一条时间线.
Git使用 `HEAD` 表示当前版本，上一个版本是 `HEAD^` ，上上一个版本是 `HEAD^^` ，上100个版本是 `HEAD~100` ；

`git reset --hard HEAD^`回退到上一个版本.

- `--hard` 参数的意义：重置当前分支的 `HEAD` 指针以及工作目录和缓存区（或者说暂存区），使它们与目标提交（以上情形目标即为`HEAD^`，目标提交也成为父提交）保持一致. 这将会彻底地将工作目录和暂存区回滚到<u>目标提交</u>的状态，丢弃之前的所有未提交的更改.
- Git的版本回退速度非常快，因为Git内部有一个指向当前版本的`HEAD`指针，回退版本时，Git仅仅是把HEAD指针的指向进行了改变.
- 如何恢复版本？首先需要找到`commit id`，调用Git的命令`git reflog`，然后使用：`git reset --hard 要恢复版本的id`.

工作区（Working Directory）
- 即为（非隐式）显示的目录.

版本库（Repository）
- 隐藏目录`.git`是Git的**版本库**（不算工作区）

版本库中最重要的是被称为stage（或者index）的**暂存区**，以及Git自动创建的第一个分支`master`，以及指向`master`的一个指针：`HEAD`

创建Git版本库时，Git自动创建了唯一一个 `master` 分支，所以 `git commit` 会向 `master` 分支上提交修改.

管理修改

Git比其他版本控制系统设计的更优秀的原因是：Git跟踪并管理的是修改，而非文件.
- **修改**：新增一行/更改字符/创建一个新文件/删除一个文件.

Git跟踪并管理的是修改，比如进行了如下操作：
第一次修改 -> `git add` -> 第二次修改 -> `git commit`
则只有第一次的修改被提交，第二次修改没有被提交，不会在`git status`中显示.
如果不用`git add`修改添加到暂存区（stage）中，就不会被加入到`commit`中.

撤销修改

如现在在`摘记.md`中加了一行：

```
...
new line
```

如果要纠正，只需要和删除掉这一行，手动把文件恢复到上一个版本的状态：`git reset --hard HEAD`

- `git checkout -- file`可以丢弃工作区的修改；
- 例如`git checkout -- 摘记.md`.
 
`git checkout`会将`摘记.md`在工作区的修改全部撤销. 包含两种情况：
1) `摘记.md`自修改之后还没有还没有放到暂存区，这种情况下，撤销修改就回到和版本库一模一样的状态；
2) `摘记.md`已经添加到暂存区，又做了修改，这种情况下撤销修改就回到添加到暂存区之后的状态.

总之就是，将文件回到最近一次`git commit`或者`git add`时的状态.
❗注意：`git checkout --file`中的`--`如果没有，就会切换到另一个分支.

- 已经将修改后的文件添加到暂存区（还没有`commit`）：可以使用`git reset HEAD <file>`把暂存区的修改撤销（unstage），重新放回工作区，**但是**此时工作区仍然有修改. 然后丢弃工作区的修改`git checkout -- <file>`
- 已经将修改后的文件添加到缓存区（staged changes），又从缓存区提交到了版本库（commited），则需要进行版本回退`git reset --hard HEAD~<number>`.
- 已经将把<u>本地版本库</u>推送到<u>远程版本库</u>，就无法挽回了.

总结：

| 在工作区修改了文件 | 是否提交到暂存区 | 是否提交到版本库 | 是否推送到远程版本库 | 措施 |
| ---- | ---- | ---- | ---- | ---- |
| 是 | 否 | 否 | 否 | 直接在工作区修改 + 版本回退到`HEAD`或者`git checkout -- <file>`，可以直接丢弃工作区的修改. |
| 是 | 是 | 否 | 否 | `git reset HEAD <file>` 将暂存区的修改撤销，然后`git checkout -- <file>`丢弃工作区的修改. |
| 是 | 是 | 是 | 否 | 直接版本回退：`git reset --hard commit_id`. |
| 是 | 是 | 是 | 是 | 不能改. |

[!note]- 删除文件
一般情况下，可以直接在文件管理器中把文件删除，或者使用`$ rm <file> `（remove）
使用`git status`命令查看哪些文件被删除了.
这时候可以：
- 确认删除：`git commit -m "remove <file>"
- 误删，可以通过版本库恢复`git checkout -- <file>`
- `git checkout`是用<u>版本库中的版本替换工作区中的版本</u>.
- ❗注意：从来没有被添加到版本库就被删除的文件无法在Git中恢复.

 远程库配置

# 远程库

[reference-github](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories)

## 添加远程库

本地的Git仓库和GitHub仓库之间的传输通过 #issue **SSH 加密**的，需要进行如下设置：

1) 创建SSH Key
   如果用户主目录下没有`.ssh`，则打开Git Bash，创建SSH Key:
   `ssh-keygen -t rsa -C "youreamil@example.com"`
   之后回车.
   在用户主目录中找到 `.ssh` 目录，其中有 `id_rsa` 和 `id_rsa.pub` 
   `rsa`：RSA（Rivest, Shamir, Adleman）密钥算法，一种非对称加密算法，用于生成加密和解密密钥对。公钥用于加密数据，私钥用于解密数据。使用私钥证明自己的身份，从而获得对远程服务器的访问权限，而无需再网络上传输密码。
2) GitHub中添加 SSH Keys

在本地已经创建一个Git仓库后，想要在GitHub创建一个Git仓库，让两个仓库进行远程同步。这种情况下，GitHub上的仓库既可以作为备份，又可以让其他人通过该仓库协作。

[github 私人仓库](https://zhuanlan.zhihu.com/p/130813593#:~:text=%E4%BB%8A%E5%A4%A9%EF%BC%8CGitHub%E5%AE%A3%E5%B8%83%E5%90%91%E6%89%80%E6%9C%89,%E5%AF%B9%E6%89%80%E6%9C%89%E4%BA%BA%E5%85%8D%E8%B4%B9%E5%BC%80%E6%94%BE%E3%80%82)不限制人数。

在GitHub上创建一个新仓库。

在本地的仓库下运行命令

```shell title="Git 添加远程库"
$ git remote add remote_valut_name git@github.com:github_usr_name/valut_name.git

# 查看远程库
$ git remote -v

# 删除远程仓库（只是删除了连接）
$ git remote -rm remote_valut_name
```

```shell title="Git 推送到远程仓库" linenums="1"
# 其中 -u 设置上游，之后只需要运行 git push 即可
$ git push -u remote_valut_name local_git_branch_name
```

SSH 警告：第一次使用Git的 `clone` 或者 `push` 命令链接GitHub时会得到警告：

```
The authenticity of host 'github.com (xx.xx.xx.xx)' can't be established.
RSA key fingerprint is xx.xx.xx.xx.xx.
Are you sure you want to continue connecting (yes/no)?
```

Git 使用 SSH 连接， SSH 链接在第一次验证 GitHub 服务器的 Key 时，需要你确认GitHub的Key的指纹信息是否真的来自GitHub的服务器.

### GitHub 信息验证

首先是因为没有公钥造成的 GitHub 拒绝连接：

```shell
$ git clone git:github.com:usrname/valutname
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

没有该计算机的公钥（public key）

创建 SSH Key pair ，这里创建名称和密码都没有填写

```shell
$ ssh-keygen                              
Generating public/private rsa key pair.
Enter file in which to save the key (/home/fzn/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/fzn/.ssh/id_rsa
Your public key has been saved in /home/fzn/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:YgWcbAbQTxpZNh9jYqP3ggGCFswB9SnOfMvR25/T86s fzn@zoezoe
The key's randomart image is:
+---[RSA 3072]----+
|B+*o.*O.+        |
|.= o+=BB o       |
|. . =B. o        |
| + ..=.o         |
|  + + = S        |
|   o + =         |
|    o . .  .     |
|         ...o    |
|          o.E+o. |
+----[SHA256]-----+

# 复制公钥，接下来要用
$ xclip -sel clip /home/fzn/.ssh/id_rsa.pub   
```

然后在 GitHub 中设置

Settings -> SSH and GPG keys -> New SSH key

将上面复制的公钥添加到仓库中即可

---

注意，若使用 HTTPS URL ，则需要用 personal access token 作为密码进行验证（而不是 GitHub 用户登录密码）

创建 personal access tokens: Settings -> Developer Settings -> Tokens (classic)

选择失效日期；在 Scopes 中选中 `repo`（以及如果用到 GitHub Actions ，选中 `workflow` ）即可.

## 删除远程库

可以使用`git remote rm <name>`命令删除远程库。

在使用之前，先使用`git remote -v`查看远程库信息。

根据名字删除。`$ git remote rm origin`

注意，此处删除是解除了本地和远程的绑定关系，远程库的删除需要登录到GitHub进行删除。

## 从远程库克隆

之前的步骤是：先创建本地库，然后再创建远程库（在GitHub上），并且对两者关联。

假设从零开发，那么最好的方式是<u>先创建远程库</u>，然后从远程库<u>克隆</u>。

首先在GitHub上创建一个仓库，勾选Initialize this repository with a README，这样会创建一个`README.md`文件。

使用`git clone`克隆一个本地库：
`$ git clone git@github.com:Eplus22/鼠学煎馍劝退计划`

# 分支管理

分支之间是独立的.

在版本回退中，每次提交，Git都会将其串成一套时间线，这条时间线就是一个分支. 目前，只有一条时间线，在Git中，这个分支称为**主分支**，称为 `master` 分支，`HEAD` 严格来说指向的是 `master`，`master` 指向提交，所以 `HEAD` 指向的就是当前分支.

```shell title="Git 更改分支名称" linenums="1"
$ git branch -M main
```

## 创建与合并分支

假设主分支为 `master` ，下面创建分支 `dev` 并切换到 `dev` 分支

```shell title="Git 创建分支并切换" linenums="1"
$ git branch dev
# 切换分支
$ git checkout dev
# 也可以运行 git checkout -b dev 创建分支并切换

# 查看当前分支 
$ git branch
```

合并分支：

```shell title="Git 合并分支" linenums="1"
$ git merge dev

# 删除 dev 分支
$ git branch -d dev
```

`git checkout <branch>`可以切换分支，`git checkout -- <file>`则是撤销修改操作。

Git提供了`git switch`命令切换分支：
- 创建并切换到新的`dev`分支：
  `git switch -c dev`
  或者之前：`git checkout -b dev`
- 直接切换到已有的`master`分支：
  `git switch master`

## 解决冲突

## 分支管理策略

## Bug分支

## feature分支

