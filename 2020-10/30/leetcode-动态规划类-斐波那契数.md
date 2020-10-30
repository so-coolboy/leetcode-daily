链接：https://leetcode-cn.com/problems/fibonacci-number/

斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
给定 N，计算 F(N)。

 

示例 1：

输入：2
输出：1
解释：F(2) = F(1) + F(0) = 1 + 0 = 1.
示例 2：

输入：3
输出：2
解释：F(3) = F(2) + F(1) = 1 + 1 = 2.
示例 3：

输入：4
输出：3
解释：F(4) = F(3) + F(2) = 2 + 1 = 3.
 

提示：

0 ≤ N ≤ 30

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/fibonacci-number
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

### C++解法一 ###
```
class Solution {
public:
    int fib(int N) {
        vector<int> temp(N+1,0);
        return helper(temp, N);
    }

    int helper(vector<int>& temp, int N){
        //base case
        if(N==0) return 0;
        if(N==1) return 1;
        //已经计算过
        if(temp[N]!=0) return temp[N];
        temp[N] = helper(temp, N-1)+helper(temp, N-2);
        return temp[N];
    }
};
```
这里面与普通的递归不同的是增加了一个备忘录，这个备忘录的好处在于将原本时间复杂度为O(2^n)转化为O(n)，原来的递归算法时间复杂度高的原因是存在了大量的重复的运算，比如res=fib(n-1)+fib(n-2),当n=19，
左边会计算一次fib(19), fib(18),右边也会计算一次fib(18),这样在递归的过程中，会存在大量的递归运算，而一种消除这种重复的方法就是使用备忘录，将每次的结果保存下来，就不需要再重复计算了。

### C++解法二 ###
```
class Solution {
public:
    int fib(int N) {
        int dp[N+2];
        dp[0]=0;
        dp[1]=1;
        for(int i=2; i<N+2; i++){
            dp[i] = dp[i-1]+dp[i-2];
        }
        return dp[N];
    }
};
```
这是dp动态规划解法，直接按要求生成斐波那契数列，然后返回第N个元素位置即可。对比第一种解法，这种解法是从低向上的解法，而第一种解法是从顶向下的解法。
