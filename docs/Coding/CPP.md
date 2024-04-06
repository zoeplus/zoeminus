# 编译器（compilers）

用高级语言编写好的程序称为**源代码**（source code），需要编译成可执行程序，即机器语言指令.

[gnu](https://gcc.gnu.org/)

**the development toolchain** : a compiler and its linker.

**Compilers** / interpreters / assemblers : translating high level language to **machine language** ; 

查看库文件： 

```shell
idconfig -p # 查看linux系统上的头文件.
```

### g++ command

```shell
g++ -o hello -Wall hello.cpp
```

# 声明、作用域（scopes）与内存分配

C++ 中所有命名的实体：变量、函数、复合类型等都需要提前**声明**（declaration）. 

有多种方式对实体进行声明，常见的是显示地指定数据的类型，例如：

```cpp
int x;
double square(double); // 声明返回类型，参数类型（特征标）
```

一种是交给编译器判断应该是什么类型：

```cpp
auto x = 1; // int
auto name = "zoezoe"; // string
```

不同的声明位置会影响该实体可被访问的范围以及生命周期（何时被销毁）.

此外也可以给类型起别名：

```cpp
typedef double real;
typedef const double *(*pf)(const double, int)
```

**全局作用域**（global scope）：定义在所有的块之外. 静态变量，具有完整的生命周期.

注：可以用 `static <typeName> <variableName>` 声明静态变量. 但该静态变量的作用域仍然局限在所在块内，函数内定义的静态变量只需要创建一次，例如下面的代码.

```cpp
string numberToString(int n) {
	// 只会被创建一次，但作用域仅限于函数内.
    static const string numbers[] = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};

    if (n >= 0 && n <= 9) {
        return numbers[n];
    } else {
        return "Greater than 9";
    }
}
```

**局部作用域**（block scope）：自动存储的变量，存储在栈中，随着函数的返回会被释放.

在 C++ 中用 `{}` 划定作用域，没有包含关系的作用域不能访问. 对于包含的作用域：内部的作用域可以访问外部的作用域，也可以创建新的同名实体，但不影响外部作用域：

```cpp
// innerOuterScope.cpp
#include <iostream>
using namespace std;
int main()
{
    int x = 10;
    int y = 5;
    {
        int x; // x is in inner space
        x = 3;
        y = 6; // still using outer space's y
        cout << "inner block:" << endl;
        cout << "x:" << x << endl << "y" << y <<  endl; 
    }
    cout << "outer block:" << endl;
    cout << "x:" << x << endl << "y:" << y <<  endl; 
    return 0;
}
// 
// inner block:
// x:3
// y6
// outer block:
// x:10
// y:6
```

**动态存储**：通过 `new` 和 `delete` 进行控制.

**命名空间**（namespace）：C++ 中不允许同一名称的实体出现在同一作用域中（e.g. `double x`, `int x`），命名空间将具有全局作用的实体进行划分.

[check](https://cplusplus.com/doc/tutorial/namespaces/)

```cpp
// nameSpace.cpp 

// namespace identifier
// {
// 	named_entities
// }

#include <iostream>

namespace bar
{
    int value = 4;
}

namespace foo
{
    double value = 5;
}

int main()
{
    std::cout << "bar:" << bar::value << std::endl;
    std::cout << "foo:" << foo::value << std::endl;
    return 0;
}
//
// bar:4
// foo:5
```

也可以声明使用某个命名空间中的变量或者使用整个命名空间，例如： `using bar::value` ， `using namespace foo` ；也可不生命：用**作用域运算符**（scope operator） `::` 直接访问，e.g. `std::cout << foo::value` .

命名空间只在声明的作用域内有效.

标准 C++ 库中（standard C++ library）中的实体可以用命名空间 `std` 声明.

此外，也可以用 `::` 访问类中的成员.


## 常量（constants）

将非 `const` 值赋给 `const` 是合法的，反之是非法的.

### 字面量

**literal constants** : integer, floating-point, characters, strings, Boolean, pointers, user-defined literals.

```cpp
75 // decimal
0113 // octal
0x4b // hexadecimal

75
75u // unsigned int
75l // long
75ul // unsigned long
75lu // unsigned long

75.0f // or 75.0F float
75.0l // or 75.0L long double

6.02e23
1.6e-29

'z' // single-character literals
"Hello fucking life" // string literals
```

different char types

```cpp
char16_t // prefix u
char32_t // prefix U
wchar_t // prefix L
```

string literals.

```cpp
u8 // prefix, encoded in UTF-8
R // raw string
```

boolean

```cpp
bool foo = true;
int *p = nullptr // null pointer value
```

### 常量表达式

```cpp
const double pi = 3.1415926;
const char tab = '\t';
```

or c-style: the replacement preformed by the preprocesser will happened before compiling. ATTENTION: the validity of the types or syntax is not checked.

```cpp
#define PI 3.14
```

### 类型转换

以下是 C++ 中常用的类型转换函数以及它们所需的头文件：

| 函数                   | 描述                 | 头文件         |
| -------------------- | ------------------ | ----------- |
| `std::stoi`          | 将字符串转换为整数          | `<string>`  |
| `std::stol`          | 将字符串转换为长整数         | `<string>`  |
| `std::stoll`         | 将字符串转换为长长整数        | `<string>`  |
| `std::stoul`         | 将字符串转换为无符号长整数      | `<string>`  |
| `std::stoull`        | 将字符串转换为无符号长长整数     | `<string>`  |
| `std::stof`          | 将字符串转换为单精度浮点数      | `<string>`  |
| `std::stod`          | 将字符串转换为双精度浮点数      | `<string>`  |
| `std::stold`         | 将字符串转换为长双精度浮点数     | `<string>`  |
| `std::to_string`     | 将数值转换为字符串          | `<string>`  |
| `std::to_wstring`    | 将数值转换为宽字符字符串       | `<string>`  |
| `std::atoi`          | 将字符串转换为整数          | `<cstdlib>` |
| `std::atol`          | 将字符串转换为长整数         | `<cstdlib>` |
| `std::atoll`         | 将字符串转换为长长整数        | `<cstdlib>` |
| `std::atof`          | 将字符串转换为单精度浮点数      | `<cstdlib>` |
| `std::atof`          | 将字符串转换为双精度浮点数      | `<cstdlib>` |
| `std::stoi`          | 将字符串转换为整数          | `<string>`  |
| `std::istringstream` | 从字符串中提取数据          | `<sstream>` |
| `std::ostringstream` | 将数据转换为字符串          | `<sstream>` |
| `std::stringstream`  | 提供同时从字符串读取和写入数据的功能 | `<sstream>` |

### C-风格格式标识符

| 格式标识符   | 数据类型           | 描述                        |
| ------- | -------------- | ------------------------- |
| `%d`    | `int`          | 十进制整数                     |
| `%f`    | `float/double` | 浮点数                       |
| `%c`    | `char`         | 字符                        |
| `%s`    | `char*/string` | 字符串                       |
| `%ld`   | `long`         | 长整型                       |
| `%lld`  | `long long`    | 长长整型                      |
| `%u`    | `unsigned int` | 无符号整数                     |
| `%x/%X` | `int`          | 十六进制整数                    |
| `%o`    | `int`          | 八进制整数                     |
| `%p`    | `void*`        | 指针                        |
| `%e/%E` | `float/double` | 科学计数法浮点数                  |
| `%g/%G` | `float/double` | 根据值自动选择 `%f` 或 `%e/%E` 格式 |
| `%a/%A` | `float/double` | 十六进制浮点数                   |
| `%n`    | `int*`         | 该格式化输出的字符数将被写入参数中         |

```cpp title="C++ 用标识格式符控制输出" linenums="1"
double x = double(1) / double(3);
printf("%.5f", x);
```

## 简单数据结构

### Compound types

```cpp
auto bar = foo = 0;
```

```cpp
#include <iostream>
#include <string> // make string class available
#include <cstring>

char charr1[10];
char charr2[10] = "zoeminus"; 
// char charr2[] {"zoeminus"};
strcpy(charr1, charr2);
// INVALID charr1 = charr2
// Note that this may cause memory problem if charr1's size is less than sizeof charr1 + sizeof charr2;

// using namespace std or std::string
string str1;
string str2 = "zoeplus";
// string str2 {"zoeplus"}
str1 = str2; // VALID

cin >> charr1;
cin.getline(charr1, 20); // indicate maximum input length
getline(cin, str); // not a object method
cin >> str1;

charr1_2 = strcat(charr1, charr2);
str1_2 = str1 + str2;

cout << strlen(charr1);
cout << str1.size();

```

Raw string.

```cpp
cout << R"(is " a " \n')";
cout << R"+*(("who?").)*+";
```

Structure

注意区分：声明时用的是 `;` 但创建变量时用的是 `,` 以及 `struct` 的结尾都以 `;` 结尾.

```cpp
struct person
{
	// members of person structure
	char name[20];
	float height;
	float weight;
	string habbit;
}; // zoe

struct person zoe; // c-style
person zoe = 
{
	"Zoe Ning",
	1.79,
	65
	"ML(do I?), Music, Math(do I?)";
};
```

**外部声明** - 可以用在该文件的所有函数中；**内部声明** - 只能使用在该函数中.

# 复合数据结构

## 数组（arrays）

## 结构（structures）和共同体（union）

可以将**结构**（structure）视为多个字段（fields）组成的数据结构. 其一般的定义形式如下：

```cpp
struct myStruct {
	typeName value;
};

// 初始化

```

## 指针（pointers）

[in structures](https://cplusplus.com/doc/tutorial/structures/)

**address-of operator**

```cpp
type * name; // here type is the one of variable pointer point to
foo = &var;
```

可以用 `p == NULL` 检查指针指向的是否是空地址. 注意不是 `*p == NULL` .

**pointers**: variables storing other variables' address.

**dereference operator**

```cpp
bar = *foo
```

### Allocated & Delete Memory

```cpp
int* pvar = new int;
int* parr = new int [5];
```

### 数组和指针

数组名 `arr` 为指向第一个数组第一个元素 `arr[0]` 的指针. 可以用 `&arr` 获取指向数组的指针的地址. 使用 `sizeof(arr)` 可以得到最小存储单位的字节. （g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0）

```cpp
&arr[i] == arr + i;
arr[i] == *(arr + i);
```

### 字符串和指针

将字符数组首地址传给 `cout` 对象时，其会按照地址递增输出字符，直到碰到 `'\0'` . 因此，对于输入长度为 `n` 的字符串，用 `n+1` 大小的字符数组存储：

```cpp
#include <iostream>

const int MaxLength = 4;
char* pstr = new char [MaxLength + 1];
char* pstart = pstr;
int count = 0;

int main()
{
	using namespace std;
	while (count < MaxLength) // 达到最大长度停止计数
    {
        cout << "输入字符：";
        cin >> pstr;
		pstr++;
		count++;
        cout << "还可以输入: " << MaxLength - count << " 个字符" << endl;
        cout << "count:" << count << endl;
	}
	cout << "输入了: " << pstart << " 共输入了: " << count << "个字符";
    delete [] pstart;
    return 0;
}
```

上面这个例子，用 `new char` 初始化的数组，每个位置都是 `'\0'` ，其中 `pstart` 指向的是 `pstr` 初始化的位置， `cout << pstart;` 将会按照地址递增输出字符，直到遇到 `'\0'` ，此外不可使用 `delete [] pstr;` 释放创建的数组内存，因为 `pstr` 已经移动了.

`\0` 等价于 `false` ，可以通过以下方法遍历字符串：

```cpp
#include <iostream>

int main()
{  
    using namespace std;
    const char* str = "hello"; // 注意这里需要声明是常量.
    while (*str)
    {
        cout << "hi!" << endl;
        str++;
    }
    return 0;
}
```

### 结构和指针

可以使用 `->` 访问指针指向的结构的成员，例如：

```cpp
struct 
```

# 运算符（operators）

算数运算符： `+ - * /` ，取余 `%`

**递增运算符**（increment operator） `++` .

```cpp
x = 3;
y = ++x;
// x = 4, y = 4

x = 3;
y = x++;
// x = 4, y =3
```

**条件运算符** `?:` .

```cpp
(a>b) ? c : d;
```

comma operator `,`

```cpp
a = (b=3, b+2); // a = 5
```

**按位**（bit-wise）运算符：

```cpp
& // AND
! // OR
^ // XOR (X-Y)\cup(Y-X)
~ // NOT
<< // Shift bits left
>> // Shift bits right
```

Precedence of operators

[check](https://cplusplus.com/doc/tutorial/operators/)

有几个需要注意的运算符顺序： `[]` 的优先级在 `*` 之上. `*pa[i]` 会解除 `pa[i]` ， `(*pa)[i]` 则是解除 `pa` .

# 表达式和语句

任何值与运算符的组合都是**表达式**.

这里列举一些常用的表达式；

```cpp
// ==Reverse==
int temp, a = 1, b = 2;
temp = a; a = b; b = temp;

// ==Max==
// 这里使用的是 >=
int maxAB = a>=b?a:b;
```

# 输入输出

C++ 中的**输入流类**是用于从<u>输入源</u>（键盘、文件、字符串等）中读取数据的类，提供了一系列成员函数进行提取和操作.

C++ 中 `std::istream` 是输入流类的基类， `istream` 类的实例代表一个输入流，可以用其成员函数从中提取数据. 并且有如下常见子类：

- `std::ifstream` 从文件中读取数据的输入流类；
- `std::istringstream` 从字符串中读取数据；
- `std::cin` 从键盘中读取数据.

使用 `while` 用入口条件循环控制输入的退出条件：

```cpp
// whileInput.cpp
#include <iostream>
int main()
{
	using namespace std;
	char ch;
	int count = 0;
	cout << "Enter # to quit:\n";
	cin >> ch;
	while (ch != '#')
	{
		cout << ch;
		++count;
		cin >> ch;
	}
	cout << endl << count << " character read";
	return 0; 
}
//
// Enter # to quit:
// Hello:)#Zoe   
// Hello:)
// 7 character read
```

**输入缓冲区**用于暂时存放从输入设备（例如键盘）输入的数据，等待程序处理。在C++中，标准输入流（如 `cin` ）通常与输入缓冲区相关联。

从键盘输入字符时，这些字符首先存储在输入缓冲区中，直到被程序读取. `cin`  从输入缓冲区中读取数据，当其执行输入操作时，如果输入缓冲区中还有剩余字符，这些字符会被 `cin` 使用，直到满足读取要求或者输入缓冲区为空为止.


注意，发送给 `cin` 的输入会被缓冲：只有当按下回车键之后用户输入的内容才会被发送给程序，上述例子在遇到 `#` 之后停止接受输入流中的字符. 此外，空格和换行符将会被忽略.

另一个关于缓冲的例子：

```cpp title="cin 缓冲" linenums="1"
#include <iostream>
using namespace std;

int main() {
    char c1, c2;
    cout << "Enter two characters: ";
    cin >> c1;
	cout << "next one";
    cin >> c2;
    cout << "You entered: " << c1 << " and " << c2 << endl;
    return 0;
}
// 
// Enter two characters: ab  
// next one
// You entered: a and b
//
// next one 之后的 cin >> c2 直接用了缓冲区中的 b .
```


## `cin.get()`

通常需要检查每个字符，包括空格、制表符、换行符. `cin` 所属的 `istream` 类（在 `iostream` 中定义的）中的成员函数 `get()` 可以满足这点. 上面的代码只需要修改为：

```cpp
// cinGet.cpp
#include <iostream>

int main()
{
	using namespace std;
	char ch;
	int count = 0;
	cout << "Enter # to quit:\n";
	cin.get(ch);
	while (ch != '#')
	{
		cout << ch;
        count++;
	    cin.get(ch);
	}
	cout << endl << count << " characters read" << endl;
	return 0; 
}
//
// Enter # to quit:
// Do you have some things to play with?#I guess you don't.
// Do you have some things to play with?
// 37 characters read
```

也可以为 `get()` 提供两个参数：字符串数组地址和整数，这里用到了函数重载：

```cpp
char name[ArSize];
// ...
cout << "Enter name:\n";
cin.get(name, ArSize).get();
```

#issue `cin.ignore()` 忽略之前输入的字符.

## stringstream

C++ stringstream 是用于操作字符串的**流类**（stream class），其对于基于内存的流进行输入和输出操作（input / output operations on memory based streams），适合于从字符串中<u>解析</u>不同类型的变量.

对于 stringstream 对象常用的操作有： `>>` **提取**格式化数据（formatted data）， `<<` **插入**格式化数据， `str()` 获取字符串设备对象的内容（contents of underlying string device object）， `str(string)` 设置字符串设备对象的内容.

>[!warning]+ 声明  `stringstream` 类的库名称为 `sstream` 而不是 `stringstream` .

```cpp title="C++ stringstream 示例" linenums="1"
#include <sstream>
// 从字符串中获取数字
string name;
getline(cin, name);
int iname;
stringstream(name) >> iname;

// 从字符串中解析以逗号作为分隔符的整数
stringstream ss("23,4,56");
char ch;
int a, b, c;
// 将逗号弃置到 ch 中
ss >> a >> ch >> b >> ch >> c;
// 注意，如果 >> 返回了一个值，则作为条件其是真，若没有返回值则是否
```

或者也可以将字符串、字符通过 `ss << string1 << char1 << string2 << string3;` 输入到 ss 中，再调用 `str()` 将 ss 中输入的字符输出到其他对象中，例如 `string conStr = ss.str()`

| #issue 服务器与本地之间的文件传输.

## Input / Ouput with files

- `ofstream`: stream class to write on files;
- `ifstream`: stream class to read from files;
- `fstream`: stream class to both read and write from / to files.

```cpp
#include <iostream>
#include <fstream>
int main ()
{
	ofstream myfile;
	myfile.open ("example.txt");
	myfile << "Writing this to a file";	
	return 0;
}
```

## `printf scanf`

C 语言输入输出示例

```cpp
#include <cstdio>
using namespace std;

char ch;
double d;
scanf("%c %lf", &ch, &d);
printf("%c %lf", ch, d);
```

`scanf` 和 `printf` 相比于 `cin` `cout` 在读写和输出大量数据时更快.

数据类型标识符见[[#C-风格格式标识符]].

# 循环

## `for`

for 循环是**入口条件**（entry-condition）循环:：在循环之前都会首先计算测试表达式 `loopTest` 的值.

```cpp
for (initial; loopTest; loopUpdate)
{
	// 
}
```

还可以采取 range-based for 循环：

```cpp title="C++ range-basd for 循环" linenums="1"
string str {"Hello!"}
for (char c : str)
{
	cout << c;
}

vector<int> arr {1, 2, 3, 10};
for (int aEle : arr) {
    cout << aEle;
}
```

## `while`

```cpp
#include <iostream>

int main()
{
    using namespace std;
    int n = 4, m = 4;
    while (n-- > 0) cout << n; // 先判断再更新
    cout << '\n';
    while (--m > 0) cout << m;
    return 0;
}
//
// 3210
// 321  
```

# 流控制

```cpp
if (x == 100)
{
	cout << "Life's GOod!";
}
else if (x == 50)
{
	cout << "life's good!";
}
else
	cout << "life is good!";
```

`break` ：直接终止当前循环结构；

`continue` 结束本轮循环，进入到下一循环.

`goto` a label.

`switch` ：根据表达式的值运行语句，注意 `break` .

```cpp
switch (expression)
{
	case constant1:
		statements;
		break;
	case constant2;
		...;
		break;
	default:
		statements;
}
```


# 函数

使用 C++ 中的函数必须提供**函数定义**和**函数原型**（function prototype），然后调用. 

库函数已经被定义并提供函数原型（在标准库文件中），因此只要正确调用即可.

函数原型放在 `main()` 之前，提供函数的返回值类型，以及参数列表（参数类型，数量，但不必须提供变量名称），如果没有参数，则可以用 `typeName functionName();` 或者 `typeName functionName(void);` 指出. 而对于不指出参数列表的情况，用 `typeName functionName(...);` 表示之.

函数原型对于编译器编译有很大帮助，例如根据返回值的类型，编译器知道需要读取多少字节；并且编译器也会检查参数的数量是否正确；以及如果提供的参数类型与原型中的类型不同，则编译器会将其转化为原型中的参数类型.

按照有无返回将函数分为两大类：

```cpp
void functionName(parameterList)
{
	statement(s);
	return; // optional
}

typeName functionName(parameterList)
{
	statement(s);
	return value;
}
```

上述如果返回的值的类型与 `typeName` 不同，将会被强制转化为 `typeName` . 此外 C++ 中返回实体不能是数组（但可以使包含数组的结构），其他数据类型均可以.

 arguments passed by values and references

when arguments paased as references , modified their values in the functions will also modifity them (instead of local) 

```cpp
type function_name (type& argument_name)
{
	...
}
```

## 函数重载

或函数多态

一般通过函数的**特征标**：参数列表确定使用哪个重载函数. 要使用某一个重载函数，传入的参数数量和参数类型都必须保持一致.

```cpp
void print(const char* str, int width);
void print(double d, int width);
```

注意：编译器在检查函数的特征标时，会将类型引用 #issue 和类型本身视为同一个特征标：

```cpp
double cube(double x);
double cube(double & x);
```

区分 `const` 与非 `const` 变量：

```cpp
void drink(char* volume);
void drink(const char* volume);
```

将数组作为参数传入到函数中有两种做法：

```cpp
const int n = 5;
int sum(int arr[], int n);
int sum_same(int* arr, int n);
```

注意，在这种情况下，用指针修改数组的值会修改传入的数组. （但这仍是下面所说的按值传递，只不过复制的值是指针地址）. 当数组本身非常大时，这样做可以节省复制产生的时间和存储成本，但同时也有破坏数组的风险.

函数中使用的变量是**局部变量**，随着函数的调用自动分配内存，随着函数调用结束自动释放内存. 有两种局部变量：一种是**形式参数**复制调用函数过程中传入的**实际参数**创建的变量（称为**按值传递**），一种是函数内部创建的变量.

## 函数模板

函数模板体现的是**泛型编程**（generic programming）的思想，例如：

```cpp
#include <iostream>
using namespace std;

template <class T> // 或者用 template <typename T>
void Swap(T& a, T& b) // 这里直接引用，注意 std::swap ，不能重名
{
	T temp;
	temp = a;
	a = b;
	b = temp;
}

int main()
{
	int i = 5, j = 10;
	double k = 4.4, l = 2.2;
	Swap(i, j);
	cout << i << ' ' << j << endl;
    Swap(k, l);
	cout << k << ' ' << l << endl;
	return 0;
}

```

## Dynamic memory

```cpp
int * foo
foo = new int // get address
foo = new int [5] // get the first address of a sequence

if (foo == nullptr)
	cout << "Error: memory could not be allocated";
```

`nothrow` will return a null pointer when memory allocation failed.

```cpp
foo = new (nothrow) int [5];
if (foo == nullptr)
	cout << "Error: memory allocation failed!"
```

delete:

```cpp
delete pointer
delete[] pointer
```

## 内联函数

在[[#编译器（compilers）]]中已经提到源代码需要经过编译获得可执行程序. 操作系统随后会将可执行程序载入到内存中，逐步地执行指令，或者跳过一些指令（例如，循环、条件选择）.

常规的函数调用：程序将会跳转到函数的地址，当某一函数出现多次时，这样执行时间成本可能会上升很多.

C++ 因此提供了另一种<u>编译方式</u>：**内联函数**（inline function）声明. 编译器在编译内连函数时会直接复制一份内联函数的代码对应的指令.

相比于 C 的**宏定义**，内联函数可以传入表达式. 例如：

```c
#define SQUARE(x) x * x;
```

上面的代码在遇到 `SQUARE(2 + 3)` 时因为运算符的优先级就会出错. 但 C++ 不会：

```cpp
#include <iostream>

inline double square(double x);

int main()
{
    using namespace std;
    cout << square(4.0 + 2.0) << endl;
    return 0;
}

inline double square(double x)
{
    return x * x;
}
```

## 引用（reference）

**引用**对已经定义的变量定义一个别名. 调用引用将会直接调用对应的变量. 而不是复制.

```cpp
#include <iostream>
using namespace std;

int main()
{
    int zoe = 19;
    int& eplus = zoe;
    cout << "zoe: " << zoe << ", eplus: " << eplus << endl;
    eplus = 22;
    cout << "zoe: " << zoe << ", eplus: " << eplus << endl;
    return 0;
}
//
// zoe: 19, eplus: 19
// zoe: 22, eplus: 22
```

### 左值（lvalue）

**左值**是可以被引用的数据对象，包括：简单类型变量、数组元素、结构成员、指针、解除引用的指针等.

非左值有：字面常量（用引号扩起来的字符串除外，其由地址表示 #issue %%有点乱%%）

若在引用参数时声明 `const` ：

1. 实参类型复合，但是非左值；
2. 实参类型不符合，但是可以转换为形参类型；

则都会创建一个临时变量存储该参数的值（相当于按值传递）

## 函数指针

函数调用需要进行的步骤：

1. 保存函数地址；
2. 为被调用函数的局部变量分配存储空间；
3. 将控制转移到被调用函数的入口；

可以声明指向函数地址（存储其机器语言代码的内存的起始地址）的指针，需要声明函数的返回类型和特征标，随后直接调用函数名以调用函数地址：

```cpp title="C++ 函数指针" linenums="1"
double (*pf) (int);
```

# 类（class）

[[DSA#面向对象编程]]

[check](https://cplusplus.com/doc/tutorial/classes/)

```cpp
class class_name 
{
	access_specifier_1:
		member1;
	access_specifier_2:
		member2;
	...
} object_names; // optional
```

类中的访问标识符（**access specifier**）有以下三种： 

- `private` 默认情况，只能被同一个类中的其他成员访问.
- `protected` 可以被同类以及同**派生类**（derived class）中的成员访问.
- `public` 可以被程序中的任意实体访问.

在类中定义成员函数有两种方法，一种是**内联**（inline）：直接在类中定义；另一种非内联：首先在类中声明，然后用 `::` 在类的外部定义.

```cpp
class Rectangular
{
	int width, height;
	public:
		void set_value(int, int);
		void area(void) {return width*height};
		// access privates
};

void Rectangular::set_value(int x, int y)
{
	width = x;
	height = y;
	// access privates
}
```

最后，在类中进行成员的声明（包括成员函数和成员变量）最后都以 `;` 结尾，类所在块的最后也以 `;` 结尾.

## 构造

注意，私有变量在声明时不可以初始化；可以用**构造函数**（constructor）对类中的成员变量进行赋值.

```cpp
class Rectangule
{
	int width, height;
	public:
		Rectangule (int, int) // use the same name as class name, do not need to declare return type.
		// Rectangule (int x, int y) {width = x; height = y;}
		void area(void) {return width*height};
};

Rectangule rect (4, 6) // initialization
```

和一般的函数一样，可以重载类的构造：

```cpp
Rectangule::Rectangule ()
{
	int width = 5;
	int height = 5;
}

Rectangule rect (4, 6);
Rectangule rectb ();
Rectangule rectc; // default constructor
```

上式中创建 rectc 时使用的是**默认构造**（default constructor）：成员将不会被赋予任何值. #issue 

除了上面的**函数形式**（functional form），如果构造只有一个参数，可以直接通过 `className objectName = initialValue;` 进行赋值，也可以用下面的**统一初始化**（uniform initialization ，） `className objectName {val1, val2, ...};` 此外也可以用 `className objectName {}` 调用默认构造.

还可以使用**成员初始化**（member initialization ，或者称为成员初始化列）进行赋值，例如：

```cpp
class Cycle
{
	double radius;
	public:
		Cycle (double r): radius(r) {}; 
		void area() {return 3.14 * radius * radius;}
}
```

可创建指向类的对象的指针，和结构相同，使用 `->` 访问成员.

## 引用自身

在类中通过引用自身来节省成本、进行连续的操作，例如下面的 `Counter` 类：

```cpp
#include <iostream>
using namespace std;

class Counter
{
	int count;
	public:
		Counter(int initialValue): count(initialValue) {};
		
		Counter& operator++(int) // 定义后缀用途，如果是前缀则是 operator++()
		{
			count++;
			return *this;
		};

		int getCount() { return count; };
};

int main()
{
	Counter counter = Counter(0);
	for (int i = 1; i < 5; i++) counter++;
	cout << counter.getCount();
	return 0;
}
```

# 标准库

| 标准库           | 描述                 | 常用函数                                                                                  |
| ------------- | ------------------ | ------------------------------------------------------------------------------------- |
| `<iostream>`  | 输入输出流库             | `cout`, `cin`, `cerr`, `clog`                                                         |
| `<iomanip>`   | 控制输出格式             | `setw`, `setprecision`, `setfill`, `left`, `right`, `fixed`                           |
| `<fstream>`   | 文件输入输出流库           | `ofstream`, `ifstream`, `fstream`                                                     |
| `<string>`    | 字符串处理库             | `string`, `getline`, `substr`, `find`, `replace`, `compare`                           |
| `<vector>`    | 动态数组库              | `vector`, `push_back`, `pop_back`, `size`, `at`, `front`, `back`                      |
| `<array>`     | 固定大小数组库            | `array`, `at`, `size`, `front`, `back`, `fill`                                        |
| `<list>`      | 双向链表库              | `list`, `push_back`, `push_front`, `pop_back`, `pop_front`, `size`, `insert`, `erase` |
| `<map>`       | 关联数组 (键值对) 库       | `map`, `insert`, `erase`, `find`, `at`, `size`                                        |
| `<set>`       | 关联容器，不允许重复元素       | `set`, `insert`, `erase`, `find`, `size`                                              |
| `<queue>`     | 队列库                | `queue`, `push`, `pop`, `front`, `back`, `empty`, `size`                              |
| `<stack>`     | 栈库                 | `stack`, `push`, `pop`, `top`, `empty`, `size`                                        |
| `<algorithm>` | 算法库                | `sort`, `find`, `count`, `min`, `max`, `reverse`, `rotate`, `unique`                  |
| `<cmath>`     | 数学函数库              | `sqrt`, `pow`, `sin`, `cos`, `tan`, `log`, `exp`, `abs`, `ceil`, `floor`, `round`     |
| `<ctime>`     | 时间库                | `time`, `clock`, `difftime`, `ctime`, `asctime`, `localtime`, `gmtime`                |
| `<cstdlib>`   | C 标准库的 C++ 版本      | `malloc`, `free`, `rand`, `srand`, `exit`                                             |
| `<cctype>`    | 字符处理库              | `isalpha`, `isdigit`, `islower`, `isupper`, `tolower`, `toupper`                      |
| `<cstdio>`    | C 标准 I/O 库的 C++ 版本 | `printf`, `scanf`, `fprintf`, `fscanf`, `fgets`, `fopen`, `fclose`                    |
| `<cstring>`   | C 字符串库的 C++ 版本     | `strcpy`, `strncpy`, `strlen`, `strcmp`, `strcat`, `strstr`, `strtok`                 |

## vector

```cpp title="C++ vector 示例" linenums="1"
#include <vector>
#include <iostream>

int main()
{
    int n;
    // 创建一个大小为 0 的数组
    vector<int> vi; 
    // 可以用非常量初始化数组，第二个参数指定初始值
    cin >> n;
    vector<double> vd(n, 0);
    // 创建多维数组
    vector<vector<int>> arr {{1,2,3}, {2,3}, {4}};
    cout << "rows of arr: " << arr.size();
    // 创建大小为 n * n 的数组
    vector<vector<int>> matrix(n, std::vector<int>(n));
    return 0;
    // 从其他数组中选取元素以对另一数组进行初始化
    vector<int> viCopy(vi.begin(), vi.end());
}
```

| 函数               | 描述              |
| ---------------- | --------------- |
| `push_back()`    | 在尾部插入元素         |
| `pop_back()`     | 移除尾部元素          |
| `size()`         | 返回元素个数          |
| `empty()`        | 判断是否为空          |
| `clear()`        | 移除所有元素          |
| `resize()`       | 调整容器大小          |
| `reserve()`      | 预留存储空间          |
| `at()`           | 访问指定位置的元素       |
| `front()`        | 返回首元素           |
| `back()`         | 返回尾元素           |
| `begin()`        | 返回指向第一个元素的迭代器   |
| `end()`          | 返回指向尾部之后的位置的迭代器 |
| `erase()`        | 移除一个或多个元素       |
| `insert()`       | 插入一个或多个元素       |
| `emplace()`      | 在指定位置构造元素       |
| `emplace_back()` | 在尾部构造元素         |
| `assign()`       | 用新元素替换原有内容      |
| `swap()`         | 交换两个向量的内容       |
| `operator[]`     | 访问指定位置的元素       |
| `data()`         | 返回指向底层数据的指针     |

对于 `vector` 进行数学运算，使用 `numeric` 中的库函数：

```cpp title="C++ vector 常用数学运算" linenums="1"
#include <numeric>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> vec(5);
// 0.0 是初始值， accumulate 是 numeric 库函数.
accumulate(vec.begin(), vec.end(), 0.0);
// 求解最大值和最小值， max_element, min_element 是 algorithm 库函数
int vMax = *max_element(vec);
int vMin = *min_element(vec);
```

## array

与数组相同，固定长度，使用栈进行静态内存分配.

```cpp
#include <array>
using namespace std;

int main()
{
	const int num = 5;
	array<int, num> ai;
	return 0;
}
```

## queue

| #imcomplete 

```cpp
#include <queue>

queue<int> q;
q.empty();
q.size();
q.front();
q.back();
q.push();
q.top();
```

## deque

C++ 中使用 `deque` 实现**两端队列**（double ended queue）

```cpp title="C++ 两端队列示例" linenums="1"
deque<value_type>
deque<int> mydeque;
int length = mydeque.size();
```

## stack

C++ 中使用 `stack` 实现栈.

```cpp title="C++ 栈实现示例" linenums="1"
#include <stack>
#include <iostream>
using namespace std;

stack<int> st;
st.push(10); st.push(20);
cout << st.top();
st.pop();
```

# 其他

`#include <bits/stdc++.h>` ： `<iostream>`, `<fstream>`, `<algorithm>`, `<string>`, `<vector>`, `<map>`, `<set>`, `<cmath>` .

# 字符串解析

string 类成员函数： `substr (pos, len) const`;

其中 `pos` 是起始位置， `len` 指的是选取长度