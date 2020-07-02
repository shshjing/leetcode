//
//  Solution20.swift
//  leetcode
//
//  Created by peter on 2020/6/1.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 20. 有效的括号
 难度 简单
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:
 输入: "()"
 输出: true
 
 示例 2:
 输入: "()[]{}"
 输出: true
 
 示例 3:
 输入: "(]"
 输出: false
 
 示例 4:
 输入: "([)]"
 输出: false
 
 示例 5:
 输入: "{[]}"
 输出: true
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 */
class Solution20 {
    func isValid(_ s: String) -> Bool {
        let chars = [Character](s)
        if chars.count % 2 != 0 {
            return false
        }
        var newChars = [Character]()
        
        for c in s {
            switch c {
            case "(", "[", "{":
                newChars.append(c)
            case ")":
                if newChars.popLast() != "(" {
                    return false
                }
            case "]":
                if newChars.popLast() != "[" {
                    return false
                }
            case "}":
                if newChars.popLast() != "{" {
                    return false
                }
            default:
                break
            }
        }
        
        if newChars.count != 0 {
            return false
        }
        return true
    }
}
