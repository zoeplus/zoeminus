Python 的语法相比于 C++ 要简洁 / 简单不少，在 C++ 的基础上也不难理解. 本篇因此更多关注于 Python 能（更容易地）做到的事情，以及程序编写（i.e. 测试、高阶函数）.

# 包管理

```shell title="包管理" linenums="1"
$ pip install <package_name>
# 更新包
$ pip install <package_name> --upgrade
# 卸载包
$ pip uninstall <package_name>

# 查看安装的包和版本
$ pip freeze
$ pip freeze | grep numpy
```

# doctest

可以使用 `doctest` 对于程序进行测试，例如：

=== "primeFactos.py"
    
    /// collapse-code
    ```python title="写入测试文本" linenums="1"
    def prime_factors(n):
        """
        >>> prime_factors(1001)
        7
        11
        13
        >>> prime_factors(55)
        5
        11
        """
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

=== "Terminal"
    
    ```shell title="doctest" linenums="1"
    $ python -m doctest primeFactors.py
    # 或可显示测试过程
    $ python -m doctest -v primeFactors.py
    ```

# 警告

```python title="警告语句" linenums="1"
def circle_area(r):
    assert r > 0, 'a radius must be positive'
    return r * r
```

# 解释器

```shell title="交互模式" linenums="1"
# 交互模式，类似于 R 中的交互 Shell
# 可以在程序运行的基础（已经赋值的变量，定义的函数等）进一步计算；
$ python -i file.py
```

# 表达式和语句

**表达式**（expressions）包括**操作符**（operator）和**操作数**（operands），计算表达式时将会递归地计算子表达式.

表达式是一个值，**语句**（statements）则是一个命令. [check-mse: difference between statements and expressions](https://stackoverflow.com/questions/4728073/what-is-the-difference-between-an-expression-and-a-statement-in-python) .

>[!hint] 在交互模式下，直接输入表达式会返回该表达式的值.
>```shell
>$ python3
>>>>1 / 2
>0.5
>```

下面首先关注 Python 中的字面量常量：

```python title="字面量" linenums="1"
x = 3.0 # x = 3.
inf = float("inf")
print(x + inf)
# inf
```


## 赋值语句

**名称**（name），**赋值**（assignment）语句：将名称和值相关联；

```python
f = max
f
f(1, 2, 3)
```

>[!warning]+ 多变量赋值
>```python title="Python 多变量赋值规则" linenums="1"
> def fib(n):
>    pre, cur = 0, 1
>    k = 1 # 用 k 表示当前计算出的第 k 个 Fibonacci 数的索引（从 0 开始计数）
>    while k < n:
>        pre, cur = cur, pre + cur
>        k += 1
>    return cur;
>```
>
>在右式完成计算之后才会赋值左式；

## 控制语句

```python title="if 语句" linenums="1"
if <left> and <right>:
    statements
if <left> or <right>
    statements
<consequent> if <predicate> else <alternative>
```

```python title="if 语句用于返回语句" linenums="1"
def filter(x)
    return x > 0 and sqrt(x) > 10
```

# 内置数据对象

```python title="列表" linenums="1"
x = [1, 3, 4]
```

## 列表

Python 中的列表是一个可以包含任意类型的元素的线性表.

```python linenums="1"
my_list = [1, 2, 3, "hello", True]
print(my_list[0])  # Output: 1
print(my_list[4])  # Output: True

my_list.append("new_element")
my_list.insert(1, "inserted_element")
# 删除检索到的第一个目标元素
my_list.remove("old_element")
index_value = my_list.index("element_to_find")
# 列表并没有内置函数 / 属性返回其长度
length = len(my_list)
my_list.sort(reverse = True)
my_list.reverse()
# transform list into a string.
result = ",".join(my_list)
```

# 函数

## 内置函数

```python
max(2, 4)
min(-2, 500)
pow(2, 3) # 2 ** 3

from operator import add, mul
```

**函数**（function）将表达式和名称进行关联，在函数被调用时创建局部帧，使用的是该帧（该“环境”）中的局部变量，函数返回时释放局部帧（栈结构）中的所有对象（i.e. 变量、函数）.

```python
from operator import mul

def square(square):
    return mul(square, square)
print(square(4))
```

## 函数设计原则

- 一个函数做好一件事情；
- 不要重复（DRY）
- 函数可泛化；

具体的，介绍**高阶函数**（high-order functions）， Python 中的函数可以将函数作为参数，也可以返回函数.

考虑这两个例子：

$$\begin{aligned}
&\sum\limits_{n=1}^{\infty}\frac{1}{n^2}=\frac{\pi^2}{6}\\
&\sum\limits_{n=1}^{\infty}\frac{8}{(4n-3)(4n-1)}=\pi\\
\end{aligned}$$

两者都具有相同的计算过程：从 $n=1$ 到 $\infty$ 求和，不同的过程在于通项的计算公式，因此可以将求和过程转化为求和函数和通项函数：

=== "求和函数"

    ```python linenums="1"
    def summation(n, term):
        """
        >>> summation(5, cube)
        225
        """
        total = 0
        for k in range(1, n + 1):
            total += term(k)
        return total
    
    def pi_term1(x): return 1 / x * x;
    def pi_term2(x):
        return 8 / ((4 * x - 3) * (4 * x - 1))
    ```

=== "Shell: calculate pi"

    ```shell title="计算 pi" linenums="1"
    $ python3 -i summation.py
    >>> from math import sqrt
    >>> sqrt(6 * summation(10000, pi_term1))
    3.1414971639472147
    >>> summation(10000, pi_term2)
    3.1415426535898203
    ```

以上，函数可以抽象为相同的但有差异的过程；因此，可以将一个函数的参数声明为一个函数，在函数中调用参数函数，从而泛化；

高阶函数还可以将一个函数返回：

=== "返回线性函数"

    ```python linenums="1"
    # mk_linear.py
    def make_linear(params):
        def linear(x):
            total = 0;
            for i in range(x.size())
                total += x[i] * param[i]
    ```

=== "Shell: 线性运算"

    ```shell linenums="1"
    $ python3 -i mk_linear.py
    >>> x = [4, 4]
    >>> params = [1, 2]
    >>> linear_function = make_linear(params)
    >>> print(linear_function(x))
    12
    >>> make_linear([3,5,6])([1,1,2])
    20
    ```

## Lambda 表达式

可以使用 Lambda 表达式返回函数， `lambda params: expression` .

```python
square_lambda = lambda x: x * x
def square_def(x):
    return x * x

# 多个参数
div = lambda x,y: x / y if y != 0 else x * float("inf")
```

Lambda 表达式不能包含多条语句.

```python title="返回函数" linenums="1"
def make_multiplyer(factor):
    return lambda x: x * factor

def make_multiplyer(factor):
    def multiplyer(x): return x * factor
    return multiplyer
```

## 自调用

```python title="函数调用本身" linenums="1"
def print_sums(x):
    print(x)
    def next_sums(y):
        return print_sums(y+x)
    return next_sums

print_sums(1)(3)(5)
```

CS 61 A 中用环境图来描述局部变量，环境图的创建规则是：

环境图中帧用于分隔变量的作用范围. 

起始只有一个帧 `global` . 每一个帧（称为 `current_frame` ）对应于一个父帧 `<parent>` ，当在该帧中通过名称调用函数或者引用变量时，会首先在 `current_frame` 中查找，然后是 `<parent>` ， `<parent>` 的 `<parent>` . 没有父子关系的帧之间是完全隔离的.

在 `current_frame` 中创建的变量将被添加到 `current_frame` 中： `type <varibale_name> = <variable_value>` .

对于 `current_frame` 中被<u>创建</u>的函数：定义一个<u>对象</u> ` func <func_name>(<parameters>) [parent=<parent>]` ，其中 `parent` 即函数被定义时的当前帧 `<current_frame>` （例如，对于上面这个函数 ` next_sums ` 的 `<parent>` 为 `print_sums` ， `print_sums` 的 `<parent>` 为 `global` ）

注意，在函数被创建时并没有创建帧. 函数的 `parent` 是被创建时的 `current_frame` ，而不是

当函数 `<func_name>` 在 `current_frame` 中被<u>调用</u>时：将会创建一个新的局部帧，该帧的 `<parent>` 为该函数对应的 `<parent>` .

- 在 `<current_frame>` 的基础上添加一个局部帧（local frame）；
- 帧名称习惯上为该函数的名称 `<func_name>`. 
- 帧的 `<parent>` 即为该函数对应的对象（ `func <func_name>(<parameters>) [parent=<parent>]`）中的 `parent` .

注意：局部帧的 `parent` 继承自对象中的 `parent` .

## Return 语句

如果函数中没有声明 `return` ，则 `return None` .

```shell title="return none" linenums="1"
>>> f = lambda: print("hello world!")
>>> x = f()
hello world!
>>> print(x)
None

>>> print(print(1), print(2))
1
2
None None
```

可以通过 `return None` 或者 `return` 结束语句.

```python title="显示地 return none" linenums="1"
def end(n, d):
    """"从数字 n 的最小位开始查找 d
    >>> end(6789123, 9)
    3
    2
    1
    9 
    """
    while n > 0:
        last,n = n % 10, n // 10
        print(last)
        if d == last:
            return None # 或者 break ，或者 return
```

```python title="展示一个写的很好的例子" linenums="1"
def search(f):
    x = 0
    while not f(x):
        x += 1
    return x

def inverse(f):
    """只能算整数"""
    return lambda y: search(lambda x; f(x) == y)
```

## 函数调用与语句的区别

在调用函数时首先会计算传入的每一个参数表达式的值，因此下面的用函数调用取代条件语句是不可行的：

=== "企图用函数调用替代条件语句"

    ```python linenums="1"
    from math import sqrt
    
    def if_(c, t, f):
        if c:
            return t
        else:
            return f
    
    def real_sqrt(x):
        """开方，返回实部"""
        return sqrt(x) if x > 0 else 0.0
    
    def real_sqrt_(x):
        """开方，返回实部"""
        return if_(x > 0, sqrt(x), 0.0)
    ```

=== "Terminal"

    ```shell
    $ python3 -i condition.py 
    >>> real_sqrt(-10)
    0.0
    >>> real_sqrt_(-10)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "../PythonNotes/condition.py", line 13, in real_sqrt_
        return if_(x > 0, sqrt(x), 0.0)
    ValueError: math domain error
    ```A great topic!

## `map`

Python's built-in `map()` function is used to apply a given function to each item of an iterable (such as list, tuple, or set) and returns a list with the results.

**Syntax:**
```
map(function, iterable)
```

**Example 1: Squaring numbers**

Let's say we have a list of numbers and we want to square each number:
```python
numbers = [1, 2, 3, 4, 5]
squared_numbers = list(map(lambda x: x**2, numbers))
print(squared_numbers)  # Output: [1, 4, 9, 16, 25]
```

In this example, the `map()` function takes a lambda function (`lambda x: x**2`) and our `numbers` list as arguments. The lambda function squares each number in the list, and the results are stored in the `squared_numbers` list.

**Example 2: Converting strings to uppercase**

Let's say we have a list of strings and we want to convert each string to uppercase:
```python
strings = ['hello', 'world', 'python']
uppercase_strings = list(map(str.upper, strings))
print(uppercase_strings)  # Output: ['HELLO', 'WORLD', 'PYTHON']
```

In this example, the `map()` function takes a built-in `str.upper` method and our `strings` list as arguments. The `str.upper` method converts each string in the list to uppercase, and the results are stored in the `uppercase_strings` list.

**Important notes:**

* `map()` returns an iterator object, not a list.
* If you want the result as a list, use the `list()` function to convert it (as shown in Examples 1 and 2).
* Starting from Python 3.0, the `map()` function is more strict about types; for example, if your function expects an integer but receives a string, you'll get a TypeError.
* In Python 3.x, `map()` returns an iterator object, while in Python 2.x, it returns a list.

Now you know how to use Python's powerful `map()` function!

In Python, an iterable is an object that can be looped over using a for loop or other iteration constructs. Examples of iterables include:

1. Lists: `my_list = [1, 2, 3]` - You can iterate over the elements of the list using a for loop.

Example:
```
for x in my_list:
    print(x)
```

Output:
```
1
2
3
```

2. Tuples: A tuple is similar to a list, but it's immutable. `my_tuple = (1, 2, 3)`

Example:
```
for x in my_tuple:
    print(x)
```

Output:
```
1
2
3
```

3. Strings: In Python, strings are iterable sequences of characters. `my_string = "hello"`

Example:
```
for char in my_string:
    print(char)
```

Output:
```
h
e
l
l
o
```

4. Sets: A set is an unordered collection of unique elements. `my_set = {1, 2, 3}`

Example:
```
for x in my_set:
    print(x)
```

Output:
```
1
2
3
```

5. Dictionaries: While dictionaries are not inherently iterable, their keys or values can be iterated over using the `.keys()` or `.values()` methods.

Example:
```
my_dict = {"a": 1, "b": 2, "c": 3}
for key in my_dict.keys():
    print(key)
```

Output:
```
a
b
c
```

6. Generators: A generator is a special type of iterable that uses memory efficiently by generating its values on the fly. `my_gen = (x**2 for x in range(5))`

Example:
```
for val in my_gen:
    print(val)
```

Output:
```
0
1
4
9
16
```

# Python Data Structures

## Lists (`[]`)
A list is a collection of items that can be of any data type, including strings, integers, floats, and other lists.

Example:
```python
numbers = [1, 2, 3, 4, 5]
```
Lists are useful for storing collections of values and can be used as arrays. You can also use the `append()` method to add new elements to a list.

## Tuples (`()`)
A tuple is an immutable collection of items that can be of any data type, including strings, integers, floats, and other tuples.

Example:
```python
person = ("John", 30)
```
Tuples are useful for storing small collections of values where the order of the elements matters. Unlike lists, tuples cannot be modified after they are created.

## Dictionaries (`{}`) or Mappings (Python 3.x)
A dictionary is an unordered collection of key-value pairs. It's similar to a JavaScript object or a Java HashMap.

Example:
```python
person = {"name": "John", "age": 30}
```
Dictionaries are useful for storing and retrieving data based on unique keys. You can use the `get()` method to retrieve values from a dictionary, and the `setdefault()` method to set default values if a key is not present.

## Sets (`{}`)
A set is an unordered collection of unique elements. It's similar to a JavaScript Set or a Java HashSet.

Example:
```python
numbers = {1, 2, 3, 4, 5}
```
Sets are useful for storing collections of values where order does not matter and duplicates should be ignored.

## Queues (`queue.Queue`)
A queue is a First-In-First-Out (FIFO) data structure that follows the principle of "first come, first served". It's similar to a JavaScript Queue or a Java Queue.

Example:
```python
from queue import Queue

q = Queue()
q.put(1)
q.put(2)
print(q.get())  # prints 1
print(q.get())  # prints 2
```
Queues are useful for managing tasks that need to be processed in a specific order.

```python
import math

def exponential(x):
    return math.exp(x)
```

```python
def exponential(x, precision=10):
    result = 0.0
    factorial = 1.0
    power = x
    
    for i in range(precision):
        result += (power / factorial factorial *= (i + 1)
        power *= -x
    
    return result
```

In this implementation, the `precision` parameter controls the number of terms used in the Taylor series expansion. A higher value of `precision` will provide a more accurate result.

## Comparing Performance

Both implementations have their own strengths and weaknesses. The built-in `math.exp()` function is generally faster and more efficient than the custom implementation from scratch, especially for large input values. However, the custom implementation can be useful when you need to implement the exponential function in a specific context or require fine-grained control over the calculation.

# Conclusion

In this example, we explored two ways to implement an exponential function in Python: using the built-in `math.exp()` function and implementing it from scratch using mathematical formulas. The choice of implementation depends on your specific requirements and constraints.

# Golden Search Algorithm Implementation in Python

The golden search algorithm, also known as the 0.618 search, is a method for finding the maximum or minimum of a unimodal function (a function that has only one local maximum or minimum). It's an efficient and effective way to find the optimal value within a given interval.

Here's the implementation in Python:

```python
def golden_search(f, a, b, tol=1e-5):
    """
    Golden search algorithm for finding the maximum or minimum of a unimodal function.

    Parameters:
    f (function): The function to optimize.
    a (float): The lower bound of the interval.
    b (float): The upper bound of the interval.
    tol (float, optional): The tolerance for convergence. Defaults to 1e-5.

    Returns:
    float: The optimal value within the given interval.
    """
    phi = (1 + 0.61803398875) / 2  # Golden ratio
    c = b - (b - a) * phi  # Initial guess

    while abs(c - a) > tol or abs(c - b) > tol:
        if f(c) < f(a):
            a = c
        else:
            b = c
        c = b - (b - a) * phi  # Update the guess

    return c

# Example usage:
def my_function(x):
    return x**2 + 3*x + 1

a, b = 0, 5  # Define the interval [a, b]
optimal_value = golden_search(my_function, a, b)
print("Optimal value:", optimal_value)
```

In this code:

*   We define the `golden_search` function, which takes in a unimodal function `f`, and an interval `[a, b]`.
*   The algorithm starts by calculating the initial guess `c` using the golden ratio.
*   It then iteratively updates the guess until the difference between consecutive guesses is less than the specified tolerance `tol`.
*   Within each iteration, it checks if the current guess `c` is a local maximum or minimum and adjusts the interval accordingly.
*   Finally, it returns the optimal value within the given interval.

In the example usage, we define a simple quadratic function `my_function(x) = x^2 + 3x + 1`, and use the `golden_search` algorithm to find its global minimum within the interval `[0, 5]`.

# Limiting Output to Certain Digits in Python

You can use the `format` function or f-strings (Python 3.6+) to limit the output to a certain number of digits.

## Using format Function
```
num = 1234567890
print("{:.0f}".format(num))  # Output: 1000000
print("{:,.0f}".format(num))  # Output: 1,000,000
```

In the above example, `:.0f` means fixed-point notation with zero digits after the decimal point. The `{}` is a placeholder for the value of `num`.

## Using f-strings (Python 3.6+)
```
num = 1234567890
print(f"{num:.0f}")  # Output: 1000000
print(f"{num:,.0f}")  # Output: 1,000,000
```

In the above example, `:.0f` means fixed-point notation with zero digits after the decimal point. The `f` before the string is used to indicate that it's an f-string.

## Using String Formatting
```
num = 1234567890
print("%d" % num)  # Output: 1000000
print("%,.0f" % num)  # Output: 1,000,000
```

In the above example, `"%d"` is a placeholder for an integer. The `%` operator is used to substitute the value of `num` into the string.

All these methods will limit the output to 6 digits as requested.

# Numpy

- [check-np-api-tail](https://numpy.org/doc/stable/reference/generated/numpy.tile.html)

```python title="变换" linenums="1"
np.tail(A, reps)
```

- [check-np-broadcasting](https://numpy.org/doc/stable/user/basics.broadcasting.html)

```python title="广播" linenums="1"
```

```python title="运算" linenums="1"
np.dot(arr_A, arr_B)
```