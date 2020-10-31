链接：https://leetcode-cn.com/problems/count-good-triplets/

给你一个整数数组 arr ，以及 a、b 、c 三个整数。请你统计其中好三元组的数量。

如果三元组 (arr[i], arr[j], arr[k]) 满足下列全部条件，则认为它是一个 好三元组 。

0 <= i < j < k < arr.length
|arr[i] - arr[j]| <= a
|arr[j] - arr[k]| <= b
|arr[i] - arr[k]| <= c
其中 |x| 表示 x 的绝对值。

返回 好三元组的数量 。

 

示例 1：

输入：arr = [3,0,1,1,9,7], a = 7, b = 2, c = 3
输出：4
解释：一共有 4 个好三元组：[(3,0,1), (3,0,1), (3,1,1), (0,1,1)] 。
示例 2：

输入：arr = [1,1,2,2,3], a = 0, b = 0, c = 1
输出：0
解释：不存在满足所有条件的三元组。
 

提示：

3 <= arr.length <= 100
0 <= arr[i] <= 1000
0 <= a, b, c <= 1000

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/count-good-triplets
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### C++解法一 ###
```
class Solution {
public:
    int countGoodTriplets(vector<int>& arr, int a, int b, int c) {
        int n = arr.size(), cnt = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {
                for (int k = j + 1; k < n; ++k) {
                    if (abs(arr[i] - arr[j]) <= a && abs(arr[j] - arr[k]) <= b && abs(arr[i] - arr[k]) <= c) {
                        ++cnt;
                    }
                }
            }
        }
        return cnt;
    }
};
```
这是本题最普通的解法。

### C++解法二 ###
```
class Solution {
public:
    int countGoodTriplets(vector<int>& arr, int a, int b, int c) {
        int len = arr.size();
        
        int cnt = 0;
        for(int i=0;i<=len-3;++i){
            for(int j=i+1;j<=len-2;++j){
                // 注意这里，判断好第一个条件再开k循环
                if(abs(arr[i] - arr[j])<=a){
                    for(int k=j+1;k<len;++k){
                        if(abs(arr[j] - arr[k]) <= b  &&  abs(arr[i] - arr[k]) <= c)
                            cnt++;
                    }
                }
                else
                    continue;
            }
        }
        return cnt;
    }
};  
```
这一解法和上面的思想是相同的，不同的就是第三重循环前加了判断，可以减少一些不必要的循环。


本题也有将一重循环转化为数组提前存储的办法，时间复杂度编程O(n^2),但是还有一些地方没想明白。先把代码粘贴出来：
```
class Solution {
public:
    int countGoodTriplets(vector<int>& arr, int a, int b, int c) {
        int ans = 0, n = arr.size();
        vector<int> sum(1001, 0);
        for (int j = 0; j < n; ++j) {
            for (int k = j + 1; k < n; ++k) {
                if (abs(arr[j] - arr[k]) <= b) {
                    int lj = arr[j] - a, rj = arr[j] + a;
                    int lk = arr[k] - c, rk = arr[k] + c;
                    int l = max(0, max(lj, lk)), r = min(1000, min(rj, rk));
                    if (l <= r) {
                        if (l == 0) {
                            ans += sum[r];
                        }
                        else {
                            ans += sum[r] - sum[l - 1];
                        }
                    }
                }
            }
            for (int k = arr[j]; k <= 1000; ++k) {
                ++sum[k];
            }
        }
        return ans;
    }
};
```
这里面让我费解的就是sum数组的逻辑不懂。
