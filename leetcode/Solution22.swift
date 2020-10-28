//
//  Solution22.swift
//  leetcode
//
//  Created by videopls on 2020/9/21.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
22. 括号生成
难度 中等

数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
示例：

输入：n = 3
输出：[
       "((()))",
       "(()())",
       "(())()",
       "()(())",
       "()()()"
     ]

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/generate-parentheses
*/

class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        backtrack(&result, n, n, "")
        return result
    }
    
    func backtrack(_ result: inout [String], _ left: Int, _ right: Int, _ s: String) -> Void {
        if left == 0 && right == 0 {
            result.append(s)
            return
        }
        if right < left {
            return
        }
        
        if left > 0 {
            backtrack(&result, left - 1, right, s + "(")
        }
        
        if right > 0 {
            backtrack(&result, left, right - 1, s + ")")
        }
        
    }
}
