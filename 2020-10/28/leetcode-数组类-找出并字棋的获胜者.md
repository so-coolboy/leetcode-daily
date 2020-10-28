链接：https://leetcode-cn.com/problems/find-winner-on-a-tic-tac-toe-game/

A 和 B 在一个 3 x 3 的网格上玩井字棋。

井字棋游戏的规则如下：

玩家轮流将棋子放在空方格 (" ") 上。
第一个玩家 A 总是用 "X" 作为棋子，而第二个玩家 B 总是用 "O" 作为棋子。
"X" 和 "O" 只能放在空方格中，而不能放在已经被占用的方格上。
只要有 3 个相同的（非空）棋子排成一条直线（行、列、对角线）时，游戏结束。
如果所有方块都放满棋子（不为空），游戏也会结束。
游戏结束后，棋子无法再进行任何移动。
给你一个数组 moves，其中每个元素是大小为 2 的另一个数组（元素分别对应网格的行和列），它按照 A 和 B 的行动顺序（先 A 后 B）记录了两人各自的棋子位置。

如果游戏存在获胜者（A 或 B），就返回该游戏的获胜者；如果游戏以平局结束，则返回 "Draw"；如果仍会有行动（游戏未结束），则返回 "Pending"。

你可以假设 moves 都 有效（遵循井字棋规则），网格最初是空的，A 将先行动。

 

示例 1：

输入：moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
输出："A"
解释："A" 获胜，他总是先走。
"X  "    "X  "    "X  "    "X  "    "X  "
"   " -> "   " -> " X " -> " X " -> " X "
"   "    "O  "    "O  "    "OO "    "OOX"
示例 2：

输入：moves = [[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]]
输出："B"
解释："B" 获胜。
"X  "    "X  "    "XX "    "XXO"    "XXO"    "XXO"
"   " -> " O " -> " O " -> " O " -> "XO " -> "XO " 
"   "    "   "    "   "    "   "    "   "    "O  "
示例 3：

输入：moves = [[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]]
输出："Draw"
输出：由于没有办法再行动，游戏以平局结束。
"XXO"
"OOX"
"XOX"
示例 4：

输入：moves = [[0,0],[1,1]]
输出："Pending"
解释：游戏还没有结束。
"X  "
" O "
"   "
 

提示：

1 <= moves.length <= 9
moves[i].length == 2
0 <= moves[i][j] <= 2
moves 里没有重复的元素。
moves 遵循井字棋的规则。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/find-winner-on-a-tic-tac-toe-game
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



### C++解法一 ###
```
class Solution {
public:

    bool check(unordered_set<int> &S, vector<vector<int>> &wins){
        for(auto win:wins){
            bool flag = true;
            for(auto pos: win){
                if(!S.count(pos)){
                    flag = false;
                    break;
                }
            }
            if(flag){
                return true;
            }
        }
        return false;
    }
    string tictactoe(vector<vector<int>>& moves) {
        vector<vector<int>> wins = {
            {0, 1, 2},
            {3, 4, 5},
            {6, 7, 8},
            {0, 3, 6},
            {1, 4, 7},
            {2, 5, 8},
            {0, 4, 8},
            {2, 4, 6}
        };

        unordered_set<int> A, B;
        for(int i=0; i<moves.size(); i++){
            int pos = moves[i][0]*3 + moves[i][1];
            if(i%2==0){
                A.insert(pos);
                if(check(A, wins)){
                    return "A";
                }
            }
            else{
                B.insert(pos);
                if(check(B, wins)){
                    return "B";
                }
            }
        }
        return (moves.size() == 9 ? "Draw" : "Pending");
    }
};
```
这个解法是一般的解法。思路就是先判断达成A或B胜利的条件是什么。分析一下就可以得到，在3*3的棋盘，一共有8种连线可以取胜。把这八种对应的二维的坐标直接转化为数字，从而直接遍历，是这种方法的
巧妙之处。再注意这里灵活运用了set这种数据结构，可以将每一种情况再集合中进行判断，利用标志变量flag，符合返回true，否则返回false。
时间复杂度：O（n4）， 空间复杂度O（n2）。

### C++解法二 ###
```
class Solution {
public:
    string tictactoe(vector<vector<int>>& moves) {
        vector<int> count(8,0);
        int size = moves.size();
        // 用数组记录0-2行、0-2列、正对角线、副对角线是否已满3个棋子
        // count[0-2]对应0-2行、count[3-5]对应0-2列、count[6]对应正对角线、count[7]对应副对角线
        // 思路第2步已解释为何只需考虑最后一个落棋的人
        // 倒序统计此人走棋情况
        for(int i = size-1; i >= 0; i-=2){
            //对井字棋的行做记录
            count[moves[i][0]]++;
            //对井字棋的列做记录
            count[moves[i][1]+3]++;
            //对井字棋的主对角线做记录
            if(moves[i][0] - moves[i][1] == 0)
                count[6]++;
            //对井字棋的副对角线做记录 // 此棋对副对角线的影响 (此处为3x3的情况，其余大小的棋盘可以类推
            if(moves[i][0] + moves[i][1] == 2)
                count[7]++;
            //满三个棋子则获胜
            if(count[moves[i][0]]==3 || count[moves[i][1]+3]==3 || count[6]==3 || count[7]==3)
            // A先B后 则总长度为偶时 最后为B 反之为A
                  return (size%2==0) ? "B" : "A";

        }
        if(size < 9)
            return "Pending";
        else
            return "Draw";


    }
};
```
注意：这一解法直接复制别人的解法。
思路：（可直接看代码，代码有详细注释）
虽然有A、B、Pending、Draw四种答案的可能。我们首先判断A、B谁能赢，再讨论A、B都未胜的情况下游戏是结束了还是继续进行；
判断A、B是否有人能取胜，只需要判断最后一个落棋的人是否能胜；（因为要是另外一个人赢了，游戏就结束了，不再有继续下棋的机会）
用数组记录最后落棋者的走棋情况，如果等于三，游戏结束，此人胜利；（以3x3为例，其余可以类推）
最后落棋者为未胜时，棋盘被下满则Draw，棋盘未下满则Pending。
这一解法的时间复杂度只有O（N），空间复杂度也取决于棋盘大小。
这里面最核心的就是count数组的运用。


