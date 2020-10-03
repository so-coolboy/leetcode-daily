### 定义 ###
从图中某一顶点出发遍历所有顶点，且使每个顶点只被访问一次，称为图的遍历。

### 深度优先遍历 ###
可以简单理解为每次都沿着最左边相连的顶点往下走，当没有顶点时，开始往上一层层回溯，当发现没有经过的顶点时，还是从它的左边顶点往下遍历。
重复这个过程，直到所有的顶点都被遍历。



//邻接矩阵的DFS遍历方法
```
tyepdef int Boolean;   
typedef visited[MAX];    //记录顶点有没有被访问过的数组
//邻接矩阵的深度优先递归算法
void DFS(MGraph G, int i)
{
    int j;
    visited[i]=TRUE;
    printf("%c", G.vexs[i]);  //打印顶点，也可以其他操作
    for(j=0; j<G->numVertexes; j++)
    {
        if(G.arc[i][j]==1 && !visited[j])
            DFS(G, j);     //对访问的邻接点递归调用
     }
 }
 //邻接矩阵的深度遍历操作
 void DFSTraverse(MGraph G)
 {
    int i;
    for(i=0; i<G.numVertexes; i++)
        visited[i]=FALSE;  //首先初始化数组
    for(i=0; i<G->numVertexes; i++)
    if(!visited[i])
        DFS(G, i);
  }
  ```
  
  如果时邻接表结构，与邻接矩阵类似，只不过递归函数中将数组换成了链表。
  //邻接表的DFS遍历方法
  ```
  void DFS(GraphAdjList GL, int i)
  {
      EdgeNode *p;   //数组遍历可以用j但是链表遍历就要用指针
      visited[i] = TRUE;
      printf("%c", GL->adjList[i].data); //打印顶点，也可以其他操作
      p = GL->adjList[i].firstedge;
      while(p)
      {
          if(!visited[p->adjvex])
              DFS(GL, p->adjvex);  //对未访问的邻接顶点做递归调用
          p = p->next;
      }
  }
  //邻接表的遍历操作
  void DFSTraverse(GraphAdjList GL)
  {
      int i;
      for(i=0; i<GL->numVertexes; i++）
          visited[i] = FALSE;
      for(i=0; i<GL->numVertexes; i++)
      if (!visited[i])
          DFS(GL,i);
  }
  ```
  
  对以上进行对比，对于n个顶点e条边的图来说，邻接矩阵由于是二维数组，要查找每个顶点的邻接点需要访问矩阵中的所有元素，因此需要O（n2）的时间，而
  邻接表做存储结构时，所需要的存储时间取决于顶点和边的数量，所以是O（n+e).显然对于点多边少的稀疏图来说，邻接表结构使得算法在时间效率上大大提高。
  
