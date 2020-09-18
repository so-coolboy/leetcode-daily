在Turbo C中, 结构也是一种数据类型, 可以使用结构变量, 因此, 像其它类型的变量一样, 在使用结构变量时要先对其定义。
定义结构变量的一般格式为:
```
struct string 
 { 
      char name[8]; 
      int age; 
      char sex[2]; 
      char depart[20]; 
      float wage1, wage2, wage3, wage4, wage5; 
 } person; 
 ```
 这个例子定义了一个结构名为string的结构变量person, 如果省略变量名 person, 则变成对结构的说明。用已说明的结构名也可定义结构变量。这样定义 时上例变成:
 ```
  struct string 
 { 
      char name[8]; 
      int age; 
      char sex[2]; 
      char depart[20]; 
      float wage1, wage2, wage3, wage4, wage5; 
 }; 
 struct string person; 
 ```
 如果省略结构名, 则称之为无名结构, 这种情况常常出现在函数内部, 用这种结构时前面的例子变成:
 ```
  struct 
 { 
      char name[8]; 
      int age; 
      char sex[2]; 
      char depart[20]; 
      float wage1, wage2, wage3, wage4, wage5; 
 } Liming, Liuqi; 
```
### 结构数组 ###
结构数组就是具有相同结构类型的变量集合。假如要定义一个班级40个同学 的姓名、性别、年龄和住址, 可以定义成一个结构数组。如下所示:
```
 struct{ 
      char name[8]; 
      char sex[2]; 
      int age; 
      char addr[40]; 
 }student[40]; 
 ```
 ### 结构指针 ###
 结构指针是指向结构的指针。它由一个加在结构变量名前的"*" 操作符来定义, 例如用前面已说明的结构定义一个结构指针如下:
 ```
  struct string{ 
      char name[8]; 
      char sex[2]; 
      int age; 
      char addr[40]; 
 }*student; 
 ```
 ### 结构体定义 typedef struct 用法详解 ###
 若struct node {}这样来定义结构体的话。在申请node 的变量时，需要这样写，struct node n;
 若用typedef，可以这样写，typedef struct node{}NODE; 。在申请变量时就可以这样写，NODE n;
 区别就在于使用时，是否可以省去struct这个关键字。
 在C中定义一个结构体类型要用typedef:
 ```
 typedef struct Student
{
    int a;
}Stu;
```
在声明变量的时候就可：Stu stu1;如果没有typedef就必须用struct Student stu1;来声明.
但在c++里很简单，直接:
```
struct Student
{
    int a;
};
```
于是就定义了结构体类型Student，声明变量时直接Student stu2；


在c++中如果用typedef的话，又会造成区别：
```
struct Student
{
    int a;
}stu1;//stu1是一个变量
typedef struct Student2
{
    int a;
}stu2;//stu2是一个结构体类型
```
使用时可以直接访问stu1.a
但是stu2则必须先 stu2 s2;
然后 s2.a=10;

另外注意: 在C中，struct不能包含函数。在C++中，对struct进行了扩展，可以包含函数。
