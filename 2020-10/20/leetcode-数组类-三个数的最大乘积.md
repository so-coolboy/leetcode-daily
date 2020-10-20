链接：https://leetcode-cn.com/problems/maximum-product-of-three-numbers/

给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。

示例 1:

输入: [1,2,3]
输出: 6
示例 2:

输入: [1,2,3,4]
输出: 24
注意:

给定的整型数组长度范围是[3,104]，数组中所有的元素范围是[-1000, 1000]。
输入的数组中任意三个数的乘积不会超出32位有符号整数的范围。


### C++解法一 ###
```
#include<vector>
#include<algorithm>

class Solution {
public:
    int maximumProduct(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        int n = nums.size();
        return max(nums[0]*nums[1]*nums[n-1], nums[n-1]*nums[n-2]*nums[n-3]);

    }
};
```
先排序，然后取最大值相乘，这里要注意的是可能会出现有两个负数的情况，因为负负得正。因此最大值也有可能是开头的两个负数（如果有的话）与最后的正数的乘积。

### C++解法二 ###
```
#include<limits.h>
class Solution {
public:
    int maximumProduct(vector<int>& nums) {
        int max1 = INT_MIN;
        int max2 = INT_MIN;
        int max3 = INT_MIN;
        int min1 = INT_MAX;
        int min2 = INT_MAX;
        for(int x: nums)
        {
            if(max1<x)
            {
                max3 = max2;
                max2 = max1;
                max1 = x;
            }
            else if(max2<x)
            {
                max3 = max2;
                max2 = x;
            }
            else if(max3<x)
            {
                max3 = x;
            }
            if(min1>x)
            {
                min2 = min1;
                min1 = x;
            }
            else if(min2>x)
            {
                min2 = x;
            }
        }
        return max(min1*min2*max1, max1*max2*max3);

    }
};
```
这种思路的时间复杂度只有O（N），因为不需要排序操作，只是扫描一遍数组，设定好要找的三个最大值和两个最小值即可。

### pyhton解法 ###
```
class Solution:
    def maximumProduct(self, nums: List[int]) -> int:
        nums = sorted(nums)
        output1 = nums[0] * nums[1] * nums[-1]
        output2 = nums[-1] * nums[-2] * nums[-3]
        return output1 if output1 > output2 else output2
```

