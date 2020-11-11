链接：https://leetcode-cn.com/problems/count-servers-that-communicate/

这里有一幅服务器分布图，服务器的位置标识在 m * n 的整数矩阵网格 grid 中，1 表示单元格上有服务器，0 表示没有。

如果两台服务器位于同一行或者同一列，我们就认为它们之间可以进行通信。

请你统计并返回能够与至少一台其他服务器进行通信的服务器的数量。
输入：grid = [[1,0],[0,1]]
输出：0
解释：没有一台服务器能与其他服务器进行通信。

输入：grid = [[1,0],[1,1]]
输出：3
解释：所有这些服务器都至少可以与一台别的服务器进行通信。

输入：grid = [[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]]
输出：4
解释：第一行的两台服务器互相通信，第三列的两台服务器互相通信，但右下角的服务器无法与其他服务器通信。
 

提示：

m == grid.length
n == grid[i].length
1 <= m <= 250
1 <= n <= 250
grid[i][j] == 0 or 1


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/count-servers-that-communicate
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### C++解法一 ###
```
class Solution {
public:
    int countServers(vector<vector<int>>& grid) {
        int m = grid.size();
        int n = grid[0].size();
        vector<int> count_m(m), count_n(n);
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
                if (grid[i][j] == 1) {
                    ++count_m[i];
                    ++count_n[j];
                }
            }
        }
        int ans = 0;
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
                if (grid[i][j] == 1 && (count_m[i] > 1 || count_n[j] > 1)) {
                    ++ans;
                }
            }
        }
        return ans;
    }
};
```
如果位于 (x, y) 的服务器能够与至少一台其它服务器进行通信，就必须满足：要么第 x 行有一台其它服务器，要么第 y 列有一台其它服务器。

因此我们先遍历所有的服务器，并用数组 count_m 和 count_n 分别记录每一行和每一列的服务器数量。在计数完成之后，我们再次遍历所有的服务器，如果位于 (x, y) 的服务器满足 count_m[x] > 1（即第 x 行至少有一台其它服务器）或 count_n[y] > 1（即第 y 列至少有一台其它服务器），那么它就能够与至少一台其它服务器进行通信，将其计入答案。

作者：LeetCode-Solution
链接：https://leetcode-cn.com/problems/count-servers-that-communicate/solution/tong-ji-can-yu-tong-xin-de-fu-wu-qi-by-leetcode-so/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
