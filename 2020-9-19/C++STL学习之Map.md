### map简介 ###
map是STL的一个关联容器，它提供一对一的hash。
* 第一个可以称为关键字(key)，每个关键字只能在map中出现一次；
* 第二个可能称为该关键字的值(value)；

map以模板(泛型)方式实现，可以存储任意类型的数据，包括使用者自定义的数据类型。
Map主要用于资料一对一映射(one-to-one)的情況，map內部的实现自建一颗红黑树，这颗树具有对数据自动排序的功能。在map内部所有的数据都是有序的。
对于迭代器来说，可以修改实值，而不能修改key。

根据key值快速查找记录，查找的复杂度基本是Log(N)，如果有1000个记录，最多查找10次，1,000,000个记录，最多查找20次。

### 使用map ###
使用map得包含map类所在的头文件
```
#include <map>  //注意，STL头文件没有扩展名.h
```
map对象是模板类，需要关键字和存储对象两个模板参数：
```
std:map<int, string> personnel;
```
这样就定义了一个用int作为索引,并拥有相关联的指向string的指针.为了使用方便，可以对模板类进行一下类型定义:
```
typedef map<int,CString> UDT_MAP_INT_CSTRING;
UDT_MAP_INT_CSTRING enumMap;
```

### 插入元素 ###
```
// 定义一个map对象
map<int, string> mapStudent;
 
// 第一种 用insert函數插入pair
mapStudent.insert(pair<int, string>(000, "student_zero"));
 
// 第二种 用insert函数插入value_type数据
mapStudent.insert(map<int, string>::value_type(001, "student_one"));
 
// 第三种 用"array"方式插入
mapStudent[123] = "student_first";
mapStudent[456] = "student_second";
```
以上三种用法，虽然都可以实现数据的插入，但是它们是有区别的，当然了第一种和第二种在效果上是完成一样的，
用insert函数插入数据，在数据的 插入上涉及到集合的唯一性这个概念，即当map中有这个关键字时，insert操作
是不能在插入数据的，但是用数组方式就不同了，它可以覆盖以前该关键字对应的值.


### 查找元素 ###
当所查找的关键key出现时，它返回数据所在对象的位置，如果沒有，返回iter与end函数的值相同.
```
// find 返回迭代器指向当前查找元素的位置否则返回map::end()位置
iter = mapStudent.find("123");
 
if(iter != mapStudent.end())
       cout<<"Find, the value is"<<iter->second<<endl;
else
   cout<<"Do not Find"<<endl;
```

### 刪除与清空元素 ###
```
//迭代器刪除
iter = mapStudent.find("123");
mapStudent.erase(iter);
 
//用关键字刪除
int n = mapStudent.erase("123"); //如果刪除了會返回1，否則返回0
 
//用迭代器范围刪除 : 把整个map清空
mapStudent.erase(mapStudent.begin(), mapStudent.end());
//等同于mapStudent.clear()
```

### map的大小 ###
```
int nSize = mapStudent.size();
```

### map的基本操作函数 ###
* begin()         返回指向map头部的迭代器
* clear(）        删除所有元素
* count()         返回指定元素出现的次数
* empty()         如果map为空则返回true
* end()           返回指向map末尾的迭代器
* equal_range()   返回特殊条目的迭代器对
* erase()         删除一个元素
* find()          查找一个元素
* get_allocator() 返回map的配置器
* insert()        插入元素
* key_comp()      返回比较元素key的函数
* lower_bound()   返回键值>=给定元素的第一个位置
* max_size()      返回可以容纳的最大元素个数
* rbegin()        返回一个指向map尾部的逆向迭代器
* rend()          返回一个指向map头部的逆向迭代器
* size()          返回map中元素的个数
* swap()           交换两个map
* upper_bound()    返回键值>给定元素的第一个位置
* value_comp()     返回比较元素value的函数
