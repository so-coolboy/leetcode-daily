### 函数原型及说明 ###
```
void *malloc(long NumBytes)
```
该函数分配了NumBytes个字节，并返回了指向这块内存的指针。如果分配失败，则返回一个空指针（NULL）。
同时，当内存不再使用的时候，应使用free()函数将内存块释放掉.
void*,表示未确定类型的指针，c,c++规定void*可以强转为任何其他类型的指针.
malloc分配的内存大小至少为参数所指定的字节数.
malloc和free是配对的，如果申请后不释放就是内存泄露，如果无故释放那就是什么也没做，释放只能释放一次，
如果一块空间释放两次或者两次以上会出现错误.

```
void free(void *FirstByte)
```
该函数是将之前用malloc分配的空间还给程序或者是操作系统，也就是释放了这块内存，让它重新得到自由。

### 函数用法 ###
```
// Code...
 
char *Ptr = NULL;
 
Ptr = (char *)malloc(100 * sizeof(char));
 
if (NULL == Ptr)
{
    exit (1);
}
 
gets(Ptr);
 
// code...
 
free(Ptr);
 
Ptr = NULL;
 
// code...
```

