### C++字符串 ###
下面的声明和初始化创建了一个 "Hello" 字符串。由于在数组的末尾存储了空字符，所以字符数组的大小比单词 "Hello" 的字符数多一个。
```
char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
```
依据数组初始化规则，您可以把上面的语句写成以下语句：
```
char greeting[] = "Hello";
```
#include <string>
strcpy(s1, s2);复制字符串 s2 到字符串 s1
strcat(s1, s2);连接字符串 s2 到字符串 s1 的末尾。
strlen(s1);返回字符串 s1 的长度。
strcmp(s1, s2);如果 s1 和 s2 是相同的，则返回 0；如果 s1<s2 则返回值小于 0；如果 s1>s2 则返回值大于 0
strchr(s1, ch);返回一个指针，指向字符串 s1 中字符 ch 的第一次出现的位置。
strstr(s1, s2);返回一个指针，指向字符串 s1 中字符串 s2 的第一次出现的位置。


### NULL指针 ###
在变量声明的时候，如果没有确切的地址可以赋值，为指针变量赋一个 NULL 值是一个良好的编程习惯。赋为 NULL 值的指针被称为空指针。
NULL 指针是一个定义在标准库中的值为零的常量。
在大多数的操作系统上，程序不允许访问地址为 0 的内存，因为该内存是操作系统保留的。然而，内存地址 0 有特别重要的意义，
它表明该指针不指向一个可访问的内存位置。但按照惯例，如果指针包含空值（零值），则假定它不指向任何东西。


### 指针运算 ###
假设 ptr 是一个指向地址 1000 的整型指针，是一个 32 位的整数，让我们对该指针执行下列的算术运算：
```
ptr++
```
在执行完上述的运算之后，ptr 将指向位置 1004，因为 ptr 每增加一次，它都将指向下一个整数位置，即当前位置往后移 4 个字节。
这个运算会在不影响内存位置中实际值的情况下，移动指针到下一个内存位置。如果 ptr 指向一个地址为 1000 的字符，
上面的运算会导致指针指向位置 1001，因为下一个字符位置是在 1001。

指针和数组并不是完全互换的。
```
#include <iostream>
 
using namespace std;
const int MAX = 3;
 
int main ()
{
   int  var[MAX] = {10, 100, 200};
 
   for (int i = 0; i < MAX; i++)
   {
      *var = i;    // 这是正确的语法
      var++;       // 这是不正确的
   }
   return 0;
}
```
把指针运算符 * 应用到 var 上是完全可以的，但修改 var 的值是非法的。这是因为 var 是一个指向数组开头的常量，不能作为左值。
由于一个数组名对应一个指针常量，只要不改变数组的值，仍然可以用指针形式的表达式。

让数组存储指向 int 或 char 或其他数据类型的指针
```
int *ptr[MAX];
```
在这里，把 ptr 声明为一个数组，由 MAX 个整数指针组成。因此，ptr 中的每个元素，都是一个指向 int 值的指针。


### 指向指针的指针 ###
指向指针的指针是一种多级间接寻址的形式，或者说是一个指针链。通常，一个指针包含一个变量的地址。当我们定义一个指向指针的指针时，
第一个指针包含了第二个指针的地址，第二个指针指向包含实际值的位置。
一个指向指针的指针变量必须如下声明，即在变量名前放置两个星号。例如，下面声明了一个指向 int 类型指针的指针：
```
int **var;
```
当一个目标值被一个指针间接指向到另一个指针时，访问这个值需要使用两个星号运算符


### C++ 从函数返回指针 ###
C++ 允许您从函数返回指针。为了做到这点，您必须声明一个返回指针的函数，如下所示：
```
int * myFunction()
{
.
.
.
}
```


### C++引用 ###
引用变量是一个别名，也就是说，它是某个已存在变量的另一个名字。一旦把引用初始化为某个变量，就可以使用该引用名称或变量名称来指向变量。

引用和指针的区别：
不存在空引用。引用必须连接到一块合法的内存；
一旦引用被初始化为一个对象，就不能被指向到另一个对象。指针可以在任何时候指向到另一个对象；
引用必须在创建时被初始化。指针可以在任何时间被初始化。
```
int&  r = i;
double& s = d;
```

### 把引用传为参数 ###
```
// 函数定义
void swap(int& x, int& y)
{
   int temp;
   temp = x; /* 保存地址 x 的值 */
   x = y;    /* 把 y 赋值给 x */
   y = temp; /* 把 x 赋值给 y  */
  
   return;
}
```

### 把引用作为返回值 ###
通过使用引用来替代指针，会使 C++ 程序更容易阅读和维护。C++ 函数可以返回一个引用，方式与返回一个指针类似。
当函数返回一个引用时，则返回一个指向返回值的隐式指针。这样，函数就可以放在赋值语句的左边。

```
#include <iostream>
 
using namespace std;
 
double vals[] = {10.1, 12.6, 33.1, 24.1, 50.0};
 
double& setValues( int i )
{
  return vals[i];   // 返回第 i 个元素的引用
}
 
// 要调用上面定义函数的主函数
int main ()
{
 
   cout << "改变前的值" << endl;
   for ( int i = 0; i < 5; i++ )
   {
       cout << "vals[" << i << "] = ";
       cout << vals[i] << endl;
   }
 
   setValues(1) = 20.23; // 改变第 2 个元素
   setValues(3) = 70.8;  // 改变第 4 个元素
 
   cout << "改变后的值" << endl;
   for ( int i = 0; i < 5; i++ )
   {
       cout << "vals[" << i << "] = ";
       cout << vals[i] << endl;
   }
   return 0;
}
```
当返回一个引用时，要注意被引用的对象不能超出作用域。所以返回一个对局部变量的引用是不合法的，但是，可以返回一个对静态变量的引用。
```
int& func() {
   int q;
   //! return q; // 在编译时发生错误
   static int x;
   return x;     // 安全，x 在函数作用域外依然是有效的
}
```





