补上两数之和问题的C++版本解答：
```
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> a;
        vector<int> b(2,-1); //vecotr里包含两个为-1的值
        for (int i=0; i<nums.size(); i++)
        {
            if (a.count(target - nums[i])>0)
            {
                b[0] = a[target - nums[i]];
                b[1] = i;
                break;
            }       
            a[nums[i]] = i;
        }
        return b;

    }
};
```
这几天学习了STL的常用容器，感觉的确方便了编程。
