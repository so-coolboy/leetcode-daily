链接：https://leetcode-cn.com/problems/merge-sorted-array/

给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 

说明：

初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 

示例：

输入：
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出：[1,2,2,3,5,6]
 

提示：

-10^9 <= nums1[i], nums2[i] <= 10^9
nums1.length == m + n
nums2.length == n

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/merge-sorted-array
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### 我的不完美解法 ###
```
class Solution {
public:
    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
        vector<int> temp(m+n, 0);
        int i=0,j=0,k=0;
        while(i<m && j<n){
            if(nums1[i]<nums2[j]){
                temp[k]=nums1[i];
                k++;
                i++;
            }
            else if(nums1[i]>=nums2[j]){
                temp[k]=nums2[j];
                k++;
                j++;
            }
        }
        if(i<m){
            for(int kk = i; kk<m;kk++){
                temp[k] = nums1[kk];
                k++;
            }
        }
        if(j<n){
            for(int kk=j; kk<n;kk++){
                temp[k] = nums2[kk];
                k++;
            }
        }
    nums1 = temp;
    }
};
```
这个解法是我自己写的，思想朴实无华，对于STL的函数掌握的还是不多。

### C++解法2 ###
```
void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
    int i = m+n - 1;
    m--;
    n--;
    while (n >= 0) {
        while (m >= 0 && nums1[m] > nums2[n]) {
            swap(nums1[i--], nums1[m--]);
        }
        swap(nums1[i--], nums2[n--]);
    }
}
```
这个解法则是从后往前进行比较，将较大值插入到数组后面，这样做的好处就是不用再浪费一个存储空间，可以直接移动nums1的元素。只需要判断n到零，数组插入就结束了。
