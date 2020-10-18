链接：https://leetcode-cn.com/problems/find-majority-element-lcci/

数组中占比超过一半的元素称之为主要元素。给定一个整数数组，找到它的主要元素。若没有，返回-1。

示例 1：

输入：[1,2,5,9,5,9,5,5,5]
输出：5
 

示例 2：

输入：[3,2]
输出：-1
 

示例 3：

输入：[2,2,1,1,1,2,2]
输出：2
 

说明：
你有办法在时间复杂度为 O(N)，空间复杂度为 O(1) 内完成吗？


### C++解法一 ###
```
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        for(int i=0; i+(nums.size()/2)<nums.size(); i++)
        {
            if(nums[i]==nums[i+(nums.size()/2)])
                return nums[i];
        }
        return -1;
    }
};
```
这个解法的时间复杂度为O(nlogn),也就是排序算法的时间复杂度。空间复杂度可以认为是O（1）。
先排序之后，根据所求元素超过数组长度一半，可以直接进行以数组一般长度进行遍历比较是否相等。

### C++解法二 ###
```
class Solution {
public:
    int majorityElement(vector<int>& nums) {
       unordered_map<int, int> hash;
       for(auto x:nums)
       {
            hash[x]++;
            if(hash[x]>nums.size()/2)
                return x;
       }
       return -1;
    }
};
```
这个解法使用了STL中的unordered_map这种容器，内部无序，根据hash值判断元素是否相同。
时间复杂度为O（n），空间复杂度为O(n).

### C++解法三 ###
```
class Solution {
public:
    int majorityElement(vector<int>& nums) {
       int count = 0;
       int major;
       for(int x: nums)
       {
           if(count == 0)
           {
               major = x;
               count++;
           }
           else
           {
               if(major == x)
                    count++;
                else
                {
                    count--;
                }
           }
       }
       if(count>0)
       {
           int t=0;
           for(int x: nums)
           {
               if(major == x)
                    t++;
           }
           if(t>nums.size()/2)
                return major;
       }
        return -1;
    }
};
```
这个解法是十分巧妙的摩尔投票法，算法的思路是：从第一个开始遍历，一旦有前后元素不一致的情况，就抵消这两个元素，这样如果最后计数仍然大于0，再判断最后剩下的元素
它的重复值是否超过了数组长度的一半即可。（可能存在count>0但是长度没有超过数组一半的情况，比如1，2，3，4，3，4，3，4，5，5）
这个解法的时间复杂度是O(n),空间复杂度是O(1).


### python解法一 ###
```
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        if(len(nums)==0):
            return -1;
        nums.sort()
        mid = len(nums)>>1;
        if nums.count(nums[mid])>mid:
            return nums[mid]
        else:
            return -1
```
python中list的count方法可以方便找到列表某个元素出现的次数，而排序后，若主要元素存在，那么它一定占据了中位数位置。

### python解法二 ###
```
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        dicts = {}
        for i in nums:
            dicts[i]=dicts.get(i,0)+1
            if(dicts[i]>len(nums)/2):
                return i
        return -1
```
这里注意一下python字典的用法即可，从字典中获取key对应的value：get(key, default):返回指定键的值，如果键不在字典中返回 default 设置的默认值
