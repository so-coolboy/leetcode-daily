链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array/

给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。

 

示例 1：

输入：[-4,-1,0,3,10]
输出：[0,1,9,16,100]
示例 2：

输入：[-7,-3,2,3,11]
输出：[4,9,9,49,121]
 

提示：

1 <= A.length <= 10000
-10000 <= A[i] <= 10000
A 已按非递减顺序排序。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


### C++解法一 ###
```
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        vector<int> ans;
        for(int x: A)
        {
            ans.push_back(x*x);
        }
        sort(ans.begin(), ans.end());
        return ans;
    }
};
```
这是正常思路，记住这些操作函数挺重要。

### C++解法二 ###
```
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        int neg = 0;
        vector<int> ans;
        for(int i=0; i<A.size(); i++)
        {
            if(A[i]<0)
            neg = i;
        }

        int i=neg;
        int j=neg+1;
        while(i>=0 || j<A.size())
        {
            if(i<0)
            {
                ans.push_back(A[j]*A[j]);
                j++;
            }
            else if(j==A.size())
            {
                ans.push_back(A[i]*A[i]);
                i--;
            }
            else if(A[i]*A[i]<A[j]*A[j])
            {
                ans.push_back(A[i]*A[i]);
                i--;
            }
            else
            {
                ans.push_back(A[j]*A[j]);
                j++;
            }

        }
        return ans;
    }
};
```
这个解法使用了双指针，类似归并排序的思想。因为本来数组中是排好序的，也就是数组中先是负数从小到大，再是正数从小达大。因此可以找到最后一个负数，然后用两个
指针分别向两边遍历。
世间复杂度只有O(n).

### C++解法三 ###
```
class Solution {
public:
    vector<int> sortedSquares(vector<int>& A) {
        int n = A.size();
        vector<int> ans(n);
        for(int i=0, j=n-1, pos=n-1; i<=j;)
        {
            if(A[i]*A[i]<A[j]*A[j])
            {
                ans[pos]=A[j]*A[j];
                j--;
                pos--;
            }
            else
            {
                ans[pos]=A[i]*A[i];
                i++;
                pos--;
            }
        }
        return ans;
    }
};
```
这种思路也是双指针，最大的元素肯定对应着数组开头或者结尾，因此可以分别指向数组开头和结尾，然后倒序保存在新的数组中。
时间复杂度也是O(n).


### python解法 ###
```
class Solution:
    def sortedSquares(self, A: List[int]) -> List[int]:
        return sorted([i*i for i in A])
```
python写一个简单的，只需要一行代码，同时这里的时间复杂度其实也很低，因为python list.sort 和Java Arrays.sort的实现都是TimSort。
