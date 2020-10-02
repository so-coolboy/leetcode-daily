### C++日期时间 ###
C++ 标准库没有提供所谓的日期类型。C++ 继承了 C 语言用于日期和时间操作的结构和函数。为了使用日期和时间相关的函数和结构，需要在 C++ 程序中引用 <ctime> 头文件。
有四个与时间相关的类型：clock_t、time_t、size_t 和 tm。类型 clock_t、size_t 和 time_t 能够把系统时间和日期表示为某种整数。
结构类型 tm 把日期和时间以 C 结构的形式保存，tm 结构的定义如下：
```
struct tm {
  int tm_sec;   // 秒，正常范围从 0 到 59，但允许至 61
  int tm_min;   // 分，范围从 0 到 59
  int tm_hour;  // 小时，范围从 0 到 23
  int tm_mday;  // 一月中的第几天，范围从 1 到 31
  int tm_mon;   // 月，范围从 0 到 11
  int tm_year;  // 自 1900 年起的年数
  int tm_wday;  // 一周中的第几天，范围从 0 到 6，从星期日算起
  int tm_yday;  // 一年中的第几天，范围从 0 到 365，从 1 月 1 日算起
  int tm_isdst; // 夏令时
}
```
```
#include <iostream>
#include <ctime>
 
using namespace std;
 
int main( )
{
   // 基于当前系统的当前日期/时间
   time_t now = time(0);
 
   cout << "1970 到目前经过秒数:" << now << endl;
 
   tm *ltm = localtime(&now);
 
   // 输出 tm 结构的各个组成部分
   cout << "年: "<< 1900 + ltm->tm_year << endl;
   cout << "月: "<< 1 + ltm->tm_mon<< endl;
   cout << "日: "<<  ltm->tm_mday << endl;
   cout << "时间: "<< ltm->tm_hour << ":";
   cout << ltm->tm_min << ":";
   cout << ltm->tm_sec << endl;
}
```


### C++基本输入输出 ###
I/O 库头文件
<iostream>：该文件定义了 cin、cout、cerr 和 clog 对象，分别对应于标准输入流、标准输出流、非缓冲标准错误流和缓冲标准错误流。
<iomanip>：该文件通过所谓的参数化的流操纵器（比如 setw 和 setprecision），来声明对执行标准化 I/O 有用的服务。
<fstream>：该文件为用户控制的文件处理声明服务。

标准输入流（cin）：cin >> name;
标准错误流（cerr）与cout区别：
cout经过缓冲后输出，默认情况下是显示器。这是一个被缓冲的输出，是标准输出，并且可以重新定向；
cerr不经过缓冲而直接输出，一般用于迅速输出出错信息，是标准错误，默认情况下被关联到标准输出流，但它不被缓冲，也就说错误消息可以直接发送到显示器，
而无需等到缓冲区或者新的换行符时，才被显示。一般情况下不被重定向。


### 定义结构 ###
```
struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
} book;
```
### 结构作为函数参数 ###
可以把结构作为函数参数，传参方式与其他类型的变量或指针类似。


### 指向结构的指针 ###
可以定义指向结构的指针，方式与定义指向其他类型变量的指针相似
```
struct Books *struct_pointer;
```
可以在上述定义的指针变量中存储结构变量的地址。为了查找结构变量的地址，请把 & 运算符放在结构名称的前面.
```
struct_pointer = &Book1;
```
为了使用指向该结构的指针访问结构的成员，您必须使用 -> 运算符
```
struct_pointer->title;
```

### typedef 关键字 ###
下面是一种更简单的定义结构的方式，您可以为创建的类型取一个"别名"
```
typedef struct Books
{
   char  title[50];
   char  author[50];
   char  subject[100];
   int   book_id;
}Books;
```
现在，您可以直接使用 Books 来定义 Books 类型的变量，而不需要使用 struct 关键字:
```
Books Book1, Book2;
```







