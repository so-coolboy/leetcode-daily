链接：https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/

给你一个正整数数组 arr ，请你计算所有可能的奇数长度子数组的和。

子数组 定义为原数组中的一个连续子序列。

请你返回 arr 中 所有奇数长度子数组的和 。

 

示例 1：

输入：arr = [1,4,2,5,3]
输出：58
解释：所有奇数长度子数组和它们的和为：
[1] = 1
[4] = 4
[2] = 2
[5] = 5
[3] = 3
[1,4,2] = 7
[4,2,5] = 11
[2,5,3] = 10
[1,4,2,5,3] = 15
我们将所有值求和得到 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58
示例 2：

输入：arr = [1,2]
输出：3
解释：总共只有 2 个长度为奇数的子数组，[1] 和 [2]。它们的和为 3 。
示例 3：

输入：arr = [10,11,12]
输出：66
 

提示：

1 <= arr.length <= 100
1 <= arr[i] <= 1000

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


### C++代码一（我自己写的解法）###
```
class Solution {
public:
    int sumOddLengthSubarrays(vector<int>& arr) {
        int len_arr = arr.size();
        int sum=0;

        for(int count=1; count<=len_arr; count+=2)
        {
            int j = 0;
            int temp = 0;
            while(j+count<=len_arr)
            {
                int num=0;
                while(num!=count)
                {
                    temp = temp+arr[j+num];
                    num++;
                }
                j++;
            }
            sum=sum+temp;
        }
        return sum;
    }
};
```
我的解法是最普通的暴力求解，第一层循环是1，3，5，...每次取的元素个数，第二层循环是每次从第一个元素所在的那组一直循环到最后，第三层循环是对每一个组内的元素求累加和。再仔细思考发现即使是
暴力的循环求解，我这个思路还是不如一种思路好用，就是依次遍历数组每一个元素，比如对于第一个元素，求它在1，3，5，。。。等小组的和，再累加，思路要比我这个清晰很多。

### C++解法二 ###
```
#include<numeric>
class Solution {
public:
    int sumOddLengthSubarrays(vector<int>& arr) {
        int res = 0;
        for(int i=0; i<arr.size(); i++)
        {
            for(int sz=1; sz+i-1<arr.size(); sz+=2)
            {
                res = res+accumulate(arr.begin()+i, arr.begin()+i+sz, 0);
            }
        }
        return res;
      
    }
};
```
解法二就是我说的简单的暴力思路。注意这里面使用的STL中的accumulate函数即可，它可以累加一段数字，最后的0表示初始值是多少。

### C++解法三 ###
```
#include<numeric>
class Solution {
public:
    int sumOddLengthSubarrays(vector<int>& arr) {
        int res = 0;
        vector<int> temp={0};
        for(int x: arr)
        temp.push_back(temp.back()+x);
        for(int i=0; i<arr.size(); i++)
        for(int sz=1; sz+i-1<arr.size(); sz+=2)
        {
            res = res+temp[sz+i] - temp[i];
        }
        return res;
    }
};
```
这里的思路和上一种方法是相同的，只不过在计算小组和的时候不一样了，先计算前缀和数组保存起来，这样需要哪个小组，只需要从前缀和数组中找到两边元素做差就可以得到。减少了一个循环。

### C++解法三 ###
```
#include<numeric>
class Solution {
public:
    int sumOddLengthSubarrays(vector<int>& arr) {
        int res = 0;
        int n = arr.size();
        for(int i=0; i<n; i++)
        {
            int left = i+1;
            int right = n-i;
            int left_even = (left+1)/2;
            int left_odd = left/2;
            int right_even = (right+1)/2;
            int right_add = right/2;
            res += (left_even*right_even + left_odd*right_add)*arr[i];
        }
        return res;
    }
};
```
这个解法参考了https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/solution/cong-on3-dao-on-de-jie-fa-by-liuyubobobo/
这里面思路是，计算数组中每个元素一共出现的次数。通过计算它左边右边可能的组合方式计算得到了每个元素可能的出现次数。这个方法只有O(n)的时间复杂度。应该好好学习这里面的思路。

### python解法 ###
```
class Solution:
    def sumOddLengthSubarrays(self, arr: List[int]) -> int:
        
        ans = 0    
        for n in range(1, len(arr) + 1, 2):
            for i in range(len(arr) - n + 1):
                ans += sum(arr[i : i + n])
                
        return ans
```
这个python解法对应了C++中的解法一，思路不再赘述。
