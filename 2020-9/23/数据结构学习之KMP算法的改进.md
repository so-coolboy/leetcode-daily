 ```
 void get_nextval(String T, int *nextval)
 {
    int i,j;
    i=1;
    j=0;
    nextval[1]=0;
    while(i<T[0])
    {
        if(j==0||T[i]==T[j])
        {
            i++;
            j++;
            if(T[i]!=T[j])
                nextval[i]=j;
            else
                nextval[i]=nextval[j];
        }
        else
        {
            j = nextval[j];
        }
    }
}
```
只是对于字串中，首字符往后的字符都与首字符相同的序列，可以用首位next[1]的值
去取代与它相等字符后续next[j]的值。
