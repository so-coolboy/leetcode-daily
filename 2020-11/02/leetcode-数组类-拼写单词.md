链接：https://leetcode-cn.com/problems/find-words-that-can-be-formed-by-characters/

给你一份『词汇表』（字符串数组） words 和一张『字母表』（字符串） chars。

假如你可以用 chars 中的『字母』（字符）拼写出 words 中的某个『单词』（字符串），那么我们就认为你掌握了这个单词。

注意：每次拼写（指拼写词汇表中的一个单词）时，chars 中的每个字母都只能用一次。

返回词汇表 words 中你掌握的所有单词的 长度之和。

 

示例 1：

输入：words = ["cat","bt","hat","tree"], chars = "atach"
输出：6
解释： 
可以形成字符串 "cat" 和 "hat"，所以答案是 3 + 3 = 6。
示例 2：

输入：words = ["hello","world","leetcode"], chars = "welldonehoneyr"
输出：10
解释：
可以形成字符串 "hello" 和 "world"，所以答案是 5 + 5 = 10。
 

提示：

1 <= words.length <= 1000
1 <= words[i].length, chars.length <= 100
所有字符串中都仅包含小写英文字母

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/find-words-that-can-be-formed-by-characters
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


### C++解法一 ###
```
class Solution {
public:
    int countCharacters(vector<string>& words, string chars) {
        unordered_map<char, int> chars_cnt;
        for(char c:chars){
            ++chars_cnt[c];
        }
        int ans = 0;
        for(string word: words){
            unordered_map<char, int> word_cnt;
            for(char c: word){
                ++word_cnt[c];
            }
            bool is_ans = true;
            for(char c: word){
                if(word_cnt[c] > chars_cnt[c]){
                    is_ans = false;
                    break;
                }
            }
            if(is_ans){
                ans = ans + word.size();
            }

        }
        return ans;

    }
};
```
思路是维护两个哈希表，chars对应的哈希表中，每个字符的values是出现的次数，对words中的每一个word，对应的哈希表中，每个字符的values也是出现的次数，这时候进行对比，后者小于前者，说明这个单词
满足条件，可以累加它的长度。
复杂度分析：
时间复杂度：O(n)，其中 nn 为所有字符串的长度和。我们需要遍历每个字符串，包括 chars 以及数组 words 中的每个单词。
空间复杂度：O(S)，其中 SS 为字符集大小，在本题中 SS 的值为 2626（所有字符串仅包含小写字母）。程序运行过程中，最多同时存在两个哈希表，使用的空间均不超过字符集大小 SS，因此空间复杂度为 O(S)O(S)。


### C++解法二 ###
```
class Solution {
public:
    int countCharacters(vector<string>& words, string chars) {
        vector<int> chars_cnt = count(chars);
        int ans = 0;
        for(string& str: words){
            vector<int> word_cnt = count(str);
            if(contains(chars_cnt, word_cnt)){
                ans = ans + str.length();
            }
        }
        return ans;
    }
    bool contains(vector<int>& chars, vector<int>& words){
        bool flag = true;
        for(int i=0; i<26; i++){
            if(chars[i]<words[i]){
                flag = false;
                break;
            }
        }
        return flag;
    }



    vector<int> count(string& chars){
        vector<int> temp(26, 0);
        for(char c: chars){
            temp[c-'a']++;
        }
        return temp;
    }
};
```
思路与解法一是相同的，但是这个代码的优势在于对于统计字符串中字符出现的个数，可以直接使用一个26大小的数组来做（只有小写字母）。这样可以节省时间和空间。

### python解法一 ###
```
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        ans = 0
        cnt = collections.Counter(chars)
        for w in words:
            c = collections.Counter(w)
            if all([c[i] <= cnt[i] for i in c]):
                ans += len(w)
        return ans
```
思路与上面相同，只是使用了collection函数。
