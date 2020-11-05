链接：https://leetcode-cn.com/problems/subrectangle-queries/

请你实现一个类 SubrectangleQueries ，它的构造函数的参数是一个 rows x cols 的矩形（这里用整数矩阵表示），并支持以下两种操作：

1. updateSubrectangle(int row1, int col1, int row2, int col2, int newValue)

用 newValue 更新以 (row1,col1) 为左上角且以 (row2,col2) 为右下角的子矩形。
2. getValue(int row, int col)

返回矩形中坐标 (row,col) 的当前值。
 

示例 1：

输入：
["SubrectangleQueries","getValue","updateSubrectangle","getValue","getValue","updateSubrectangle","getValue","getValue"]
[[[[1,2,1],[4,3,4],[3,2,1],[1,1,1]]],[0,2],[0,0,3,2,5],[0,2],[3,1],[3,0,3,2,10],[3,1],[0,2]]
输出：
[null,1,null,5,5,null,10,5]
解释：
SubrectangleQueries subrectangleQueries = new SubrectangleQueries([[1,2,1],[4,3,4],[3,2,1],[1,1,1]]);  
// 初始的 (4x3) 矩形如下：
// 1 2 1
// 4 3 4
// 3 2 1
// 1 1 1
subrectangleQueries.getValue(0, 2); // 返回 1
subrectangleQueries.updateSubrectangle(0, 0, 3, 2, 5);
// 此次更新后矩形变为：
// 5 5 5
// 5 5 5
// 5 5 5
// 5 5 5 
subrectangleQueries.getValue(0, 2); // 返回 5
subrectangleQueries.getValue(3, 1); // 返回 5
subrectangleQueries.updateSubrectangle(3, 0, 3, 2, 10);
// 此次更新后矩形变为：
// 5   5   5
// 5   5   5
// 5   5   5
// 10  10  10 
subrectangleQueries.getValue(3, 1); // 返回 10
subrectangleQueries.getValue(0, 2); // 返回 5
示例 2：

输入：
["SubrectangleQueries","getValue","updateSubrectangle","getValue","getValue","updateSubrectangle","getValue"]
[[[[1,1,1],[2,2,2],[3,3,3]]],[0,0],[0,0,2,2,100],[0,0],[2,2],[1,1,2,2,20],[2,2]]
输出：
[null,1,null,100,100,null,20]
解释：
SubrectangleQueries subrectangleQueries = new SubrectangleQueries([[1,1,1],[2,2,2],[3,3,3]]);
subrectangleQueries.getValue(0, 0); // 返回 1
subrectangleQueries.updateSubrectangle(0, 0, 2, 2, 100);
subrectangleQueries.getValue(0, 0); // 返回 100
subrectangleQueries.getValue(2, 2); // 返回 100
subrectangleQueries.updateSubrectangle(1, 1, 2, 2, 20);
subrectangleQueries.getValue(2, 2); // 返回 20
 

提示：

最多有 500 次updateSubrectangle 和 getValue 操作。
1 <= rows, cols <= 100
rows == rectangle.length
cols == rectangle[i].length
0 <= row1 <= row2 < rows
0 <= col1 <= col2 < cols
1 <= newValue, rectangle[i][j] <= 10^9
0 <= row < rows
0 <= col < cols

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/subrectangle-queries
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### C++解法一 ####
```
class SubrectangleQueries {
public:
   public :
   vector<vector<int>> rectangles;
    SubrectangleQueries(vector<vector<int>>& rectangle) {
          rectangles=rectangle;
    }
    
    void updateSubrectangle(int row1, int col1, int row2, int col2, int newValue) {         
    if(col2>=col1){
       if(row2>=row1){
           for(int i=row1;i<=row2;i++){
               for(int j=col1;j<=col2;j++){
                      rectangles[i][j]=newValue;
               }
            }
        }         
        if(row2<row1){
            for(int i=row2;i<=row1;i++){
               for(int j=col1;j<=col2;j++){
                      rectangles[i][j]=newValue;
               }
            }
          }
    } 
    
    else{
        if(row2>=row1){
           for(int i=row1;i<=row2;i++){
               for(int j=col2;j<=col1;j++){
                      rectangles[i][j]=newValue;
               }
          }
        }  
          if(row2<row1){
            for(int i=row2;i<=row1;i++){
               for(int j=col2;j<=col1;j++){
                      rectangles[i][j]=newValue;
               }
            }
          }
    }   
}

    
    
    int getValue(int row, int col) {
          return rectangles[row][col];
    }
};
```
暴力的方法来做。

### C++ 解法二 ###
```
class SubrectangleQueries {

private:
    vector<vector<int>> rectangle;
    vector<vector<int>> history;

public:
    SubrectangleQueries(vector<vector<int>>& rectangle) : rectangle(rectangle) {}

    void updateSubrectangle(int row1, int col1, int row2, int col2, int newValue) {
        history.push_back({row1, col1, row2, col2, newValue});
    }

    int getValue(int row, int col) {

        for(int i = history.size() - 1; i >= 0; i --)
            if(history[i][0] <= row && row <= history[i][2] &&
               history[i][1] <= col && col <= history[i][3])
                return history[i][4];
        return rectangle[row][col];
    }
};
```
作者：liuyubobobo
链接：https://leetcode-cn.com/problems/subrectangle-queries/solution/bu-bao-li-geng-xin-ju-zhen-yuan-su-de-jie-fa-by-li/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

这道题暴力模拟就可以通过，不多说了。但是，这个问题可以不暴力更新矩阵的内容。

我们可以设置一个history的数组，记录每次调用updateSubrectangle的信息。这样，updateSubrectangle的复杂度是 O(1) 的。

相应的，在 getValue 的过程中，我们只需要倒序查找我们记录的 history，如果发现我们要查找的 (row, col) 包含在某一次历史更新的位置中，直接返回这个历史更新值就好了。否则的，历史更新没有动过这个位置，返回原始矩阵中这个位置的值。

作者：liuyubobobo
链接：https://leetcode-cn.com/problems/subrectangle-queries/solution/bu-bao-li-geng-xin-ju-zhen-yuan-su-de-jie-fa-by-li/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
