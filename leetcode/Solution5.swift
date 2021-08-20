//
//  Solution5.swift
//  leetcode
//
//  Created by peter on 2020/5/22.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 5. 最长回文子串
 难度 中等
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 
 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 
 示例 2：
 输入: "cbbd"
 输出: "bb"
 
 */
class Solution5 {
    func longestPalindrome(_ s: String) -> String {
        
        if s.count < 1 {
            return ""
        }
        
        var start = 0
        var end = 0
        
        for i in 0 ..< s.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i+1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        let chars = [Character](s)
        return String(chars[start ... end])
    }
    
    func expandAroundCenter(_ s : String, _ left : Int, _ right : Int) -> Int {
        var l = left
        var r = right
        let chars = [Character](s)
        while l > -1 && r < s.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        return r - l - 1;
    }
    /*
    class Solution {
        public String longestPalindrome(String s) {
            int n = s.length();
            boolean[][] dp = new boolean[n][n];
            String ans = "";
            for (int l = 0; l < n; ++l) {
                for (int i = 0; i + l < n; ++i) {
                    int j = i + l;
                    if (l == 0) {
                        dp[i][j] = true;
                    } else if (l == 1) {
                        dp[i][j] = (s.charAt(i) == s.charAt(j));
                    } else {
                        dp[i][j] = (s.charAt(i) == s.charAt(j) && dp[i + 1][j - 1]);
                    }
                    if (dp[i][j] && l + 1 > ans.length()) {
                        ans = s.substring(i, i + l + 1);
                    }
                }
            }
            return ans;
        }
    }
 */
    
    func longestPalindromeDp(_ s: String) -> String {
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = ""
        let chars = [Character](s)
        for l in 0 ..< n {
            for i in 0 ..< n - l {
                let j = i + l
                if l == 0 {
                    dp[i][j] = true
                }
                else if l == 1 {
                    dp[i][j] = chars[i] == chars[j]
                }
                else {
                    dp[i][j] = chars[i] == chars[j] && dp[i + 1][j - 1]
                }
                if dp[i][j] && l + 1 > ans.count {
                    ans = String(chars[i ... i + l])
                }
            }
        }
        return ans
    }
}
