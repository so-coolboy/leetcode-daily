链接：https://leetcode-cn.com/problems/can-place-flowers/

假设你有一个很长的花坛，一部分地块种植了花，另一部分却没有。可是，花卉不能种植在相邻的地块上，它们会争夺水源，两者都会死去。

给定一个花坛（表示为一个数组包含0和1，其中0表示没种植花，1表示种植了花），和一个数 n 。能否在不打破种植规则的情况下种入 n 朵花？能则返回True，不能则返回False。

示例 1:

输入: flowerbed = [1,0,0,0,1], n = 1
输出: True
示例 2:

输入: flowerbed = [1,0,0,0,1], n = 2
输出: False
注意:

数组内已种好的花不会违反种植规则。
输入的数组长度范围为 [1, 20000]。
n 是非负整数，且不会超过输入数组的大小。


### 我的解法 ###
```
class Solution {
public:
    bool canPlaceFlowers(vector<int>& flowerbed, int n) {
        
        int count = 0;
        vector<int> temp(flowerbed);
        temp.insert(temp.begin(),0);
        temp.insert(temp.end(), 0);
        int size = temp.size();
        for(int i=0; i<size-2; i++)
        {
            if(temp[i]==0 && (i+2)<size)
            {
                if(temp[i+1]==0 && temp[i+2]==0)
                {
                    count++;
                    i++;
                }
            }
            if(count>=n)
            return true;
        }
        return false;
    }
};
```
仔细分析后发现，一共有两种情况，一种是对于两边是1，中间是任意多的0的时候，如果当前是0，下一个是0，在下一个还是0，那么计数器应该加1，然后此时指针应该后移两位，继续这个判断即可。
还有一种情况是针对开头和结尾是0，比如0，0，1，这时候第一个元素是1也满足条件。那么只需要在开头和结尾都补零就可以了。

### C++解法 ###
```
class Solution {
public:
    bool canPlaceFlowers(vector<int>& flowerbed, int n) {
        int cnt = 0;
        flowerbed.insert(flowerbed.begin(),0);
        flowerbed.insert(flowerbed.end(),0);
        for(int i = 1; i < flowerbed.size()-1;i++){
            if (!(flowerbed[i-1]|flowerbed[i]|flowerbed[i+1]|0)){
                cnt++;
                flowerbed[i] = 1;
            }
        }
        return cnt >= n;
    }
};
```
这个思路和上面思路是一样的，但是这个代码写起来更简单，每次判断后中间元素改成1，这样的确要比我的思路更简洁。

### python解法 ###
```
class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        flowerbed = [0]+ flowerbed
        flowerbed = flowerbed+[0]
        for i in range(1,len(flowerbed)-1):
            if  flowerbed[i-1] == 0 and flowerbed[i] == 0 and flowerbed[i+1] == 0:
                n = n-1
                flowerbed[i] = 1
        return n<=0
```
