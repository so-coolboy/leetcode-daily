链接：https://leetcode-cn.com/problems/kth-missing-positive-number/

给你一个 严格升序排列 的正整数数组 arr 和一个整数 k 。

请你找到这个数组里第 k 个缺失的正整数。

 

示例 1：

输入：arr = [2,3,4,7,11], k = 5
输出：9
解释：缺失的正整数包括 [1,5,6,8,9,10,12,13,...] 。第 5 个缺失的正整数为 9 。
示例 2：

输入：arr = [1,2,3,4], k = 2
输出：6
解释：缺失的正整数包括 [5,6,7,...] 。第 2 个缺失的正整数为 6 。
 

提示：

1 <= arr.length <= 1000
1 <= arr[i] <= 1000
1 <= k <= 1000
对于所有 1 <= i < j <= arr.length 的 i 和 j 满足 arr[i] < arr[j] 

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/kth-missing-positive-number
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### C++ 解法一 ###
```
class Solution {
public:
    int findKthPositive(vector<int>& arr, int k) {
        vector<int> temp(2001,0);
        int ans = 0;
        int count = 0;
        for(auto a: arr){
            temp[a]=1;
        }
        while(count<k){
            ans++;
            if(temp[ans]!=1){
                count++;
            }
        }
        return ans;
    }
};
```
我的思路是使用一个数组的位置来记录arr中已经出现的数字，那么只要遍历那些没有出现的位置，一直到k就可以了。这里面一定要注意一点，就是temp数组的大小是2001，题目中限定数组arr的长度是1000, 
里面每一个元素在1到1000之间，也就是arr中最大的是1000，此时k也取最大值1000，所以数组temp的最大值是2001.

