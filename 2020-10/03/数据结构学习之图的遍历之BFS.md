### 定义 ###
BFS类似树中的层次遍历，一次一次的遍历。

图的广度优先遍历算法是利用了队列辅助实现。
```
//邻接矩阵的BFS算法
void BFSTraverse(MGraph G)
{
    int i,j;
    Queue Q;
    for (i=0; i<G.numVertexes; i++)
      visited[i] = False;
    InitQueue(&Q);     //初始化一个辅助用的队列
    for(i=0; i<G.numVertexes; i++)
    {
        if(!visited[i])     //如果没有访问过
        {
            visited[i] = True;    //设置当前顶点已经访问过
            printf("%c", G.vexs[i]); //打印顶点，也可以其他操作
            EnQueue(&Q, i);     //将此顶点入队列
            while(!QueueEmpty(Q))     //若当前队列不为空
            {
                DeQueue(&Q, &i);  //将队中元素出队列，赋值给i
                for(j=0; j<=G.numVertexes; j++)
                {
                    if(G.arc[i][j]==1 && !visited[i])  //判断其他顶点若与当前顶点存在边且未访问过
                    {
                        visited[j] = TRUE;    
                        printf("%c", G.vexs[i]);
                        EnQueue(&Q, i);   //将找到的此顶点入队列
                    }
                }
            }
        }
    }
}
 ```
 
```
//邻接表的BFS算法
void BFSTraverse(GraphAdjList GL)
{
    int i;
    EdgeNode *p;
    Queue Q;
    for(i=0; i<GL->numVertexes; i++)
    {
        visited[i] = FALSE;
    }
    InintQueue(&Q);
    for(i=0; i<GL->numVertexes; i++)
    {
        if(!visited[i])
        {
            visited[i] = TRUE;
            printf("%c", GL->adjList[i].data);
            EnQueue(&Q, i);
            while(!QueueEmpty(Q))
            {
                DeQueue(&Q, &i);
                p = GL->adjList[i].firstEdge; //找到当前顶点边表链表头指针
                while(p)
                {
                    if(!visited[p->adjvex])  //若此顶点未被访问
                    {
                        visited[p->adjvex] = TRUE;
                        printf("%c", GL->adjList[i].data);
                        EnQueue(&Q, p->adjvex); //将此顶点入队列
                    }
                    p=p->next;    //指针指向下一个邻接点
                }
            }
        }
    }
}
```


                    
                        
                
 
