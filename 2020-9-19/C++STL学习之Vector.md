### 什么是Vector ###
向量（Vector）是一个封装了动态大小数组的顺序容器（Sequence Container）。跟任意其它类型容器一样，它能够存放各种类型的对象。可以简单的认为，向量是一个能够存放任意类型的动态数组。  
vector 同 array 一样可以很方便的通过索引值直接存取任何一个元素，在数组的尾端追加或移除元素均非常快速(当追加元素超出原有分配空间时，vector需要重新分配空间)，但在其中间或头部插入
移除元素就比较费时，需要移动安插点之后的所有元素以保持原来的相对位置。  

### 基本函数实现 ###
1，构造函数  
* vector():创建一个空vector
* vector(int nSize):创建一个vector,元素个数为nSize
* vector(int nSize,const t& t):创建一个vector，元素个数为nSize,且值均为t
* vector(const vector&):复制构造函数
* vector(begin,end):复制[begin,end)区间内另一个数组的元素到vector中

2，常用函数  
* push_back 在数组的最后添加一个数据  
* pop_back 去掉数组的最后一个数据
* at 得到编号位置的数据
* begin 得到数组头的指针
* end 得到数组的最后一个单元+1的指针
* front 得到数组头的引用
* back 得到数组的最后一个单元的引用
* max_size 得到vector最大可以是多大
* capacity 当前vector分配的大小
* size 当前使用数据的大小
* resize 改变当前使用数据的大小，如果它比当前使用的大，者填充默认值
* reserve 改变当前vecotr所分配空间的大小
* erase 删除指针指向的数据项
* clear 清空当前的vector
* rbegin 将vector反转后的开始指针返回(其实就是原来的end-1)
* rend 将vector反转构的结束指针返回(其实就是原来的begin-1)
* empty 判断vector是否为空
* swap 与另一个vector交换数据
