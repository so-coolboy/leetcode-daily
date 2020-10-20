链接：https://leetcode-cn.com/problems/contains-duplicate-ii/

给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的 绝对值 至多为 k。

 

示例 1:

输入: nums = [1,2,3,1], k = 3
输出: true
示例 2:

输入: nums = [1,0,1,1], k = 1
输出: true
示例 3:

输入: nums = [1,2,3,1,2,3], k = 2
输出: false


### 我的错误解法记录 ###
```
class Solution2 {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        int n = nums.size();
        for(int i=0; i<n-1;i++)
        {
            for(int j=i+1; (j-i<=k) & (j<n);j++)
            if(nums[i]==nums[j])
            return true;
        }
        return false;

    }
};

class Solution1 {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        int n = nums.size();
        int count = 0;
        for(int i=0; i<n;i++)
        {

            count = 0;
            while(count != k)
            {
                if(i+count+1==n)
                break;
                if(nums[i]==nums[i+count+1])
                return true;
                count++;



            }
        }
        return false;

    }
};

class Solution {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        for(int i=1; i<=k && i<nums.size();i++)
        {
            vector<int> temp = {nums.begin()+i, nums.end()};
            for(int j=0; j<temp.size(); j++)
            {
                if(temp[j]==nums[j])
                return true;
            }
        }
        return false;
    }

};
```
我一共想了三种错误解法，也不能说是错误，只是这种想法在本题的判断中是超出时间限制的。不论哪一种想法，都是O(N2)的时间复杂度。也就是朴素的查找比较是不行的。

### C++解法一 ###
```
class Solution {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        unordered_map<int, int> map;   //key是数组元素，value是数组下标
        for(int i=0; i<nums.size(); i++)
        {
            if(map.find(nums[i])!=map.end())  //当前的key不是最后一个，说明之前出现过这个key
            {
                int distance = i-map[nums[i]];     //距离是当前的i减去之前的key出现的value，也就是对应下标
                if(distance<=k)
                    return true;
                map[nums[i]]=i;                //距离超过k，不满足，加入到map中
            }else
            {
                map[nums[i]]=i;       //新元素直接插入到map中即可
            }
        }
        return false;
    }

};
```
这种解法主要是使用了哈希表的思想，利用map这种容器，将数组值作为key，对应下标作为value,注意这里的find函数，它查找key出现的位置，不是最后一个位置，说明这个元素还没有在
map中出现过。
