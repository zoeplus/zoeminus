# 更新

- Mar 31 ：添加 MATH.

[仓库地址](https://github.com/zoeplus/zoeminus)，[网站地址](https://zoeplus.github.io/zoeminus/)

# 渲染

## Obsidian Callouts

>[!note]- Note Callout
>- This is a piece.

>[!note]+ Unfolded Callout
>You can see me.

## 分行

```
不严格分行或者是
严格分行
```

不严格分行或者是
严格分行

```
不严格分行或者是

严格分行
```


不严格分行或者是

严格分行

## 公式

内联的 LaTeX 公式只能用单 `$` 渲染，块形的随意.

`$$\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2$$`

$$\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2$$

`$$ \frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 $$`

$$ \frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 $$

```
$$ 
\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 
$$
```

$$ 
\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 
$$

```
带有一段话的 LaTeX $$\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2$$

带有一段话的 LaTeX ver.2 $$ \frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 $$
```

带有一段话的 LaTeX $$\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2$$

带有一段话的 LaTeX ver.2 $$ \frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 $$

>[!note]+ 带有一段话的 LaTeX
>带有一段话的 $\LaTeX$ ， $$\frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2$$
>带有一段话的 $\LaTeX$ ver.2 $$ \frac{1}{n}\sum\limits_{i=1}^{n}(\hat{x}_i-x_i)^2 $$

```
>[!note]- LaTeX aligned in Callouts
>Obsdiain 中的不严格 Markdown 不能再用了.
>$$
>\begin{aligned}
>&\text{Weak Rendering}\\
>&\text{Strick Language}\\
>&\text{How to fix?}
>\end{aligned}
>$$
> #issue
```

>[!note]+ LaTeX aligned in Callouts
>Obsdiain 中的不严格 Markdown 不能再用了.
>$$
>\begin{aligned}
>&\text{Weak Rendering}\\
>&\text{Strick Language}\\
>&\text{How to fix?}
>\end{aligned}
>$$

似乎是唯一可行的方法：

```
>[!note]- LaTeX aligned in Callouts
>Obsdiain 中的不严格 Markdown 不能再用了.
>$$ \begin{aligned} &\text{Weak Rendering}\\ &\text{Strick Language}\\ &\text{How to fix?} \end{aligned} $$
```

>[!note]- LaTeX aligned in Callouts
>Obsdiain 中的不严格 Markdown 不能再用了.
>$$ \begin{aligned} &\text{Weak Rendering}\\ &\text{Strick Language}\\ &\text{How to fix?} \end{aligned} $$

## Hello World!

The `index.md` in the `/docs` folder is the homepage you see here.

The folders in `/docs` appear as the main sections on the navigation bar.

The notes appear as pages within these sections. For example, [[Note 1]] in `Topic 1`