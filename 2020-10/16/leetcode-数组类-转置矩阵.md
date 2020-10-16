链接：https://leetcode-cn.com/problems/transpose-matrix/
描述：
给定一个矩阵 A， 返回 A 的转置矩阵。

矩阵的转置是指将矩阵的主对角线翻转，交换矩阵的行索引与列索引。

示例 1：

输入：[[1,2,3],[4,5,6],[7,8,9]]
输出：[[1,4,7],[2,5,8],[3,6,9]]
示例 2：

输入：[[1,2,3],[4,5,6]]
输出：[[1,4],[2,5],[3,6]]
 

提示：

1 <= A.length <= 1000
1 <= A[0].length <= 1000


### C++代码 ###
转置在数组中都实现就是A[i][j] = B[j][i].此外这个题目还要注意vector声明二维数组和初始化的方法。

代码如下
```
class Solution {
public:
    vector<vector<int>> transpose(vector<vector<int>>& A) {
        int row = A.size();
        int col = A[0].size();
        vector<vector<int>> trans_A(col, vector<int>(row, 0));
        for(int i=0; i<col; i++)
        {
            for(int j=0; j<row; j++)
                trans_A[i][j] = A[j][i];
        }
        return trans_A;
    }
};
```
vector声明二维数组和初始化的方法:
参考：https://blog.csdn.net/sinat_36053757/article/details/71053706
1.直接用初始化方法：
```
vector<vector<int> > data(r, vector<int>(c, 0));
```
2.用resize()来控制大小:
```
vector<vector<int> > res;
res.resize(r);//r行
for (int k = 0; k < r; ++k)
{
    res[k].resize(c);//每行为c列
}
```

再记录一个使用emplace_back直接追加的代码：
```
class Solution {
public:
    vector<vector<int>> transpose(vector<vector<int>>& A) {
        int ro = A.size();
        int co = A[0].size();

        vector<vector<int>> res(co);
        for (int i = 0; i < co; ++i) {
            for (int j = 0; j < ro; ++j)
                res[i].emplace_back(A[j][i]);
        }
        return res;
    }
};
```
emplace_back与push_back的作用类似，但是速度要更快。


### python代码 ###
```
class Solution:
    def transpose(self, A: List[List[int]]) -> List[List[int]]:
        row = len(A)
        col = len(A[0])
        temp = [[0 for i in range(row)] for j in range(col)]
        for i in range(col):
            for j in range(row):
                temp[i][j] = A[j][i]
        return temp
```
注意这里初始化这个二维列表temp的方法即可。
也可以如下：
```
class Solution:
    def transpose(self, A: List[List[int]]) -> List[List[int]]:
        return [[A[i][j] for i in range(len(A))] for j in range(len(A[0]))]
```
第三种方案是直接使用python3中的zip函数，zip函数是将两个list对应位置打包到一起，zip（*）则可以解压
```
class Solution:
    def transpose(self, A: List[List[int]]) -> List[List[int]]:
        return list(zip(*A))
```
