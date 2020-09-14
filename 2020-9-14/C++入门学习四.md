### const关键字 ###
可以使用 const 前缀声明指定类型的常量
```
const int  LENGTH = 10;
```


### C++修饰符类型 ###
修饰符 signed、unsigned、long 和 short 可应用于整型，signed 和 unsigned 可应用于字符型，long 可应用于双精度型。
修饰符 signed 和 unsigned 也可以作为 long 或 short 修饰符的前缀。例如：unsigned long int。
C++ 允许使用速记符号来声明无符号短整数或无符号长整数。您可以不写 int，只写单词 unsigned、short 或 unsigned、long，int 是隐含的。例如，下面的两个语句都声明了无符号整型变量。
```
unsigned x;
unsigned int y;
```


### C++中的类型限定符 ###
const：const 类型的对象在程序执行期间不能被修改改变。
volatile：修饰符 volatile 告诉编译器不需要优化volatile声明的变量，让程序可以直接从内存中读取变量。对于一般的变量编译器会对变量进行优化，将内存中的变量值放在寄存器中以加快读写效率。
restrict：由 restrict 修饰的指针是唯一一种访问它所指向的对象的方式。只有 C99 增加了新的类型限定符 restrict。



### extern存储类 ###
extern 存储类用于提供一个全局变量的引用，全局变量对所有的程序文件都是可见的。当您使用 'extern' 时，对于无法初始化的变量，会把变量名指向一个之前定义过的存储位置。
当您有多个文件且定义了一个可以在其他文件中使用的全局变量或函数时，可以在其他文件中使用 extern 来得到已定义的变量或函数的引用。可以这么理解，extern 是用来在另一个文件中声明一个全局变量或函数。
extern 修饰符通常用于当有两个或多个文件共享相同的全局变量或函数的时候，如下所示：
第一个文件：main.cpp
```
#include <iostream>
 
int count ;
extern void write_extern();
 
int main()
{
   count = 5;
   write_extern();
}
```
第二个文件：support.cpp
```
#include <iostream>
 
extern int count;
 
void write_extern(void)
{
   std::cout << "Count is " << count << std::endl;
}
```
它会产生下列结果
```
Count is 5
```

### 位运算符 ###
位运算符作用于位，并逐位执行操作。&、 | 和 ^ 。
假设如果 A = 60，且 B = 13，现在以二进制格式表示，它们如下所示：

A = 0011 1100
B = 0000 1101

-----------------

A&B = 0000 1100
A|B = 0011 1101
A^B = 0011 0001
~A  = 1100 0011

### 杂项运算符 ###
sizeof   sizeof 运算符返回变量的大小。例如，sizeof(a) 将返回 4，其中 a 是整数。
Condition ? X : Y    条件运算符。如果 Condition 为真 ? 则值为 X : 否则值为 Y。
.（点）和 ->（箭头    成员运算符用于引用类、结构和共用体的成员。
Cast    强制转换运算符把一种数据类型转换为另一种数据类型。例如，int(2.2000) 将返回 2。
&     指针运算符 & 返回变量的地址。例如 &a; 将给出变量的实际地址。
*     指针运算符 * 指向一个变量。例如，*var; 将指向变量 var。





