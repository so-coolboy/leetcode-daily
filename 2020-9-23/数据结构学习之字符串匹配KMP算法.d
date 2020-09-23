KMP算法的核心在于求解字串的next数组。字串的next数组的每一个位置的数值都反映了他前面一部分字串
中的最长的相同的前缀和后缀。

```
//求解字串的next数组
void get_next(String T, int *next)
{
    int i=1; 
    int j=0;
    next[1]=0;
    while(i<T[0])
    {
        if(j==0 || T[i] == T[j])
        {
            i++;
            j++;
            next[i]=j;
        }
        else
        {
            j=next[j];//回溯
        }
    }
}
```
这段代码中最难理解的应该是j=next[j]这一句话，这类似于递归的思路，要明白next数组中存的都是
当前位置之前的字符串匹配的最大前缀后缀，当此使的j不满足要求是，通过这一句，找到了这部分字串
中匹配的最大前缀的位置，这样继续匹配，如果还不相同，再往前回溯，一直到next[0],此时j=1.

KMP算法如下：
```
int Index_KMP(String S, String T, int pos)
{
    int i = pos; 
    int j = 1;
    int next[255]; //记录字串的next数组
    get_next(T, next);
    while(i<S[0] && j<T[0])   //不要超过字符串最大长度
    {
        if(j==0 || S[i] ==S[j])  //增加j=0，因为next[1]=0.
        {
            i++;
            j++;
        }
        else
        {
            j = next[j];
        }
    }
    if(j>T[0])
        return i-T[0];
    else
        return 0;
}
```
代码与朴素的KMP算法的区别就在于，当本次匹配不成功时，i不要回退，j不需要再从字串开始进行匹配。
