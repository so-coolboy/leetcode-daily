### C++程序结构 ###
```
#include <iostream>
using namespace std;
 
// main() 是程序开始执行的地方
 
int main()
{
   cout << "Hello World"; // 输出 Hello World
   return 0;
}
```
C++ 语言定义了一些头文件，这些头文件包含了程序中必需的或有用的信息。上面这段程序中，包含了头文件 <iostream>
C++ 注释一般有两种：
 // 单行注释
 /* 。。。 */ 多行注释

### C++数据结构 ###
一共有七种基本的：bool， char， int， float， double， void， wchar_t
一些基本类型可以使用一个或多个类型修饰符进行修饰：short， long， signed， unsigned


### typedef 声明 ###
可以使用 typedef 为一个已有的类型取一个新的名字。
例如，下面的语句会告诉编译器，feet 是 int 的另一个名称：
```
typedef int feet;
```
现在，下面的声明是完全合法的，它创建了一个整型变量 distance：
```
feet distance;
```

### 枚举类型 ###
枚举类型(enumeration)是C++中的一种派生数据类型，它是由用户定义的若干枚举常量的集合。
如果一个变量只有几种可能的值，可以定义为枚举(enumeration)类型。所谓"枚举"是指将变量的值一一列举出来，变量的值只能在列举出来的值的范围内。
创建枚举，需要使用关键字 enum。枚举类型的一般形式为：
```
enum 枚举名{ 
     标识符[=整型常数], 
     标识符[=整型常数], 
... 
    标识符[=整型常数]
} 枚举变量;
```
如果枚举没有初始化, 即省掉"=整型常数"时, 则从第一个标识符开始。
例如，下面的代码定义了一个颜色枚举，变量 c 的类型为 color。最后，c 被赋值为 "blue"
```
enum color { red, green, blue } c;
c = blue;
```
默认情况下，第一个名称的值为 0，第二个名称的值为 1，第三个名称的值为 2，以此类推。但是，您也可以给名称赋予一个特殊的值，
只需要添加一个初始值即可。例如，在下面的枚举中，green 的值为 5。
```
enum color { red, green=5, blue };
```
在这里，blue 的值为 6，因为默认情况下，每个名称都会比它前面一个名称大 1，但 red 的值依然为 0。
 
