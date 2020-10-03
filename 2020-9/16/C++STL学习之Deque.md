### deque容器的介绍 ###
Vector 容器是单向开口的连续内存空间，deque 则是一种双向开口的连续线性空间。所谓的双向开口，意思是可以在头尾两端分别做元素的插入和删除操作，
当然，vector 容器也可以在头尾两端插入元素，但是在其头部操作效率奇差，无法被接受。
deque（双端队列）是由一段一段的定量连续空间构成，可以向两端发展，因此不论在尾部或头部安插元素都十分迅速。 在中间部分安插元素则比较费时，因为必须移动其它元素。  

### deque 容器和 vector 容器最大的差异 ###
一在于 deque 允许使用常数项时间对头端进行元素的插入和删除操作。二在于 deque 没有容量的概念，因为它是动态的以分段连续空间组合而成，随时可以增加一段新的空间
并链接起来，换句话说，像 vector 那样，”旧空间不足而重新配置一块更大空间，然后复制元素，再释放旧空间”这样的事情在 deque 身上是不会发生的。也因此，deque 没
有必须要提供所谓的空间保留(reserve)功能。
虽然 deque 容器也提供了 Random Access Iterator,但是它的迭代器并不是普通的指针，其复杂度和 vector 不是一个量级，这当然影响各个运算的层面。因此，除非有必要，
我们应该尽可能的使用 vector，而不是 deque。对 deque 进行的排序操作，为了最高效率，可将 deque 先完整的复制到一个 vector 中，对 vector 容器进行排序，
再复制回 deque。

### deque容器的实现原理 ###
从逻辑上看，deque 容器是连续的空间，这会让我们联想到array 和 vector,array 无法成长，vector 虽可成长，array无法成长，而vector虽然可以成长，但是只能向尾端生长。
其实现原理是：(1) 申请更大空间 (2)原数据复制新空间 (3)释放原空间，这种做法所付出的时间代价是非常大的。
deque 是由一段一段的定量的连续空间构成。一旦有必要在 deque 前端或者尾端增加新的空间，便配置一段连续定量的空间，串接在 deque 的头端或者尾端。Deque 最大的工作
就是维护这些分段连续的内存空间的整体性的假象，并提供随机存取的接口，避开了重新配置空间，复制，释放的轮回，代价就是复杂的迭代器架构。
deque 是分段连续内存空间，有中央控制，维持整体连续的假象。

### 头文件 ###
使用之前必须加相应容器的头文件：
```
#include <deque> // deque属于std命名域的，因此需要通过命名限定，例如using std::deque;
```
定义的实现代码如下：
```
deque<int> a; // 定义一个int类型的双端队列a
deque<int> a(10); // 定义一个int类型的双端队列a，并设置初始大小为10
deque<int> a(10, 1); // 定义一个int类型的双端队列a，并设置初始大小为10且初始值都为1
deque<int> b(a); // 定义并用双端队列a初始化双端队列b
deque<int> b(a.begin(), a.begin()+3); // 将双端队列a中从第0个到第2个(共3个)作为双端队列b的初始值
```

### 基本操作函数 ###
* 容器大小：deq.size();
* 容器最大容量：deq.max_size();
* 更改容器大小：deq.resize();
* 容器判空：deq.empty();
* 减少容器大小到满足元素所占存储空间的大小：deq.shrink_to_fit();
* 头部添加元素：deq.push_front(const T& x);
* 末尾添加元素：deq.push_back(const T& x);
* 任意位置插入一个元素：deq.insert(iterator it, const T& x);
* 任意位置插入 n 个相同元素：deq.insert(iterator it, int n, const T& x);
* 插入另一个向量的 [forst,last] 间的数据：deq.insert(iterator it, iterator first, iterator last);
* 头部删除元素：deq.pop_front();
* 末尾删除元素：deq.pop_back();
* 删除 [first,last] 之间的元素：deq.erase(iterator first, iterator last);
* 清空所有元素：deq.clear();
* 下标访问：deq[1]; // 并不会检查是否越界
* at 方法访问：deq.at(1); // 以上两者的区别就是 at 会检查是否越界，是则抛出 out of range 异常
* 访问第一个元素：deq.front();
* 访问最后一个元素：deq.back();
* 多个元素赋值：deq.assign(int nSize, const T& x); // 类似于初始化时用数组进行赋值
* 交换两个同类型容器的元素：swap(deque&);
* 开始迭代器指针：deq.begin();
* 末尾迭代器指针：deq.end(); // 指向最后一个元素的下一个位置
遍历元素
```
deque<int>::iterator it;
for (it = deq.begin(); it != deq.end(); it++)
    cout << *it << endl;
// 或者
for (int i = 0; i < deq.size(); i++) {
    cout << deq.at(i) << endl;
}
```
