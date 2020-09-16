### List的用法 ###
Lists将元素按顺序储存在链表中. 与 向量(vectors)相比, 它允许快速的插入和删除，但是随机访问却比较慢

### 常用函数 ###
* assign() 给list赋值   
* back() 返回最后一个元素   
* begin() 返回指向第一个元素的迭代器   
* clear() 删除所有元素 
* empty() 如果list是空的则返回true 
* end() 返回末尾的迭代器 
* erase() 删除一个元素 
* front() 返回第一个元素 
* get_allocator() 返回list的配置器 
* insert() 插入一个元素到list中 
* max_size() 返回list能容纳的最大元素数量 
* merge() 合并两个list 
* pop_back() 删除最后一个元素 
* pop_front() 删除第一个元素 
* push_back() 在list的末尾添加一个元素 
* push_front() 在list的头部添加一个元素 
* rbegin() 返回指向第一个元素的逆向迭代器 
* remove() 从list删除元素 
* remove_if() 按指定条件删除元素 
* rend() 指向list末尾的逆向迭代器 
* resize() 改变list的大小 
* reverse() 把list的元素倒转 
* size() 返回list中的元素个数 
* sort() 给list排序 
* splice() 合并两个list 
* swap() 交换两个list 
* unique() 删除list中重复的元素

### C++ vector和list的区别 ###
1.vector数据结构
vector和数组类似，拥有一段连续的内存空间，并且起始地址不变。  
因此能高效的进行随机存取，时间复杂度为o(1);  
但因为内存空间是连续的，所以在进行插入和删除操作时，会造成内存块的拷贝，时间复杂度为o(n)。  
另外，当数组中内存空间不够时，会重新申请一块内存空间并进行内存拷贝。  

2.list数据结构
list是由双向链表实现的，因此内存空间是不连续的。  
只能通过指针访问数据，所以list的随机存取非常没有效率，时间复杂度为o(n);  
但由于链表的特点，能高效地进行插入和删除。  

 使用原则：
（1）如果需要高效的随机存取，而不在乎插入和删除的效率，使用vector；  
（2）如果需要大量高效的删除插入，而不在乎存取时间，则使用list；  
（3）如果需要高效的随机存取，还要大量的首尾的插入删除则建议使用deque，它是list和vector的折中；  
