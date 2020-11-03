链接：https://leetcode-cn.com/problems/shift-2d-grid/

给你一个 m 行 n 列的二维网格 grid 和一个整数 k。你需要将 grid 迁移 k 次。

每次「迁移」操作将会引发下述活动：

位于 grid[i][j] 的元素将会移动到 grid[i][j + 1]。
位于 grid[i][n - 1] 的元素将会移动到 grid[i + 1][0]。
位于 grid[m - 1][n - 1] 的元素将会移动到 grid[0][0]。
请你返回 k 次迁移操作后最终得到的 二维网格。

 

示例 1：



输入：grid = [[1,2,3],[4,5,6],[7,8,9]], k = 1
输出：[[9,1,2],[3,4,5],[6,7,8]]
示例 2：



输入：grid = [[3,8,1,9],[19,7,2,5],[4,6,11,10],[12,0,21,13]], k = 4
输出：[[12,0,21,13],[3,8,1,9],[19,7,2,5],[4,6,11,10]]
示例 3：

输入：grid = [[1,2,3],[4,5,6],[7,8,9]], k = 9
输出：[[1,2,3],[4,5,6],[7,8,9]]
 

提示：

1 <= grid.length <= 50
1 <= grid[i].length <= 50
-1000 <= grid[i][j] <= 1000
0 <= k <= 100

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/shift-2d-grid
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### C++解法一 ###
```
class Solution {
public:
    vector<vector<int>> shiftGrid(vector<vector<int>>& grid, int k) {
        int m = grid.size();
        int n = grid[0].size();
        int x=0;
        vector<int> temp;
        for(int i=0; i<m; i++){
            for(int j=0; j<n; j++){
                temp.push_back(grid[i][j]);
            }
        }

        int r = k%(m*n);
        vector<int> xck(m*n,0);
        for(int i=0;i<temp.size();i++){
            xck[i] = temp[(i+m*n-r)%(m*n)];
        }
        for(int i=0; i<m*n; i++){
            grid[i/n][i%n]=xck[i];
        }
        return grid;

    }
};
```
参考了别人的解法，关键是思路，这个二维数组的变动，如果转化成一维数组来看，其实就是一个一维队列中的元素在移动位置。所以先在代码中把二位数组转化成一维，然后计算移动的位置，然后再转换为
二维数组即可。注意这里对队列元素的位置变化使用的是求模来做的，这也是循环队列中求元素位置的办法。

### python解法一 ##3
```
class Solution:
    def shiftGrid(self, grid: List[List[int]], k: int) -> List[List[int]]:
        m, n = len(grid), len(grid[0])
        res = []
        for i in range(m):
            res += grid[i]
        t = k % (m * n)
        res = res[-t:] + res[:-t]
        return [res[i*n: (i+1)*n] for i in range(m)]

```
python的代码和c++的思想是一致的，只不过python使用函数更加简单。
