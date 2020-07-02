//
//  Solution14.swift
//  leetcode
//
//  Created by peter on 2020/5/27.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 14. 最长公共前缀
 难度 简单
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 输入: ["flower","flow","flight"]
 输出: "fl"
 
 示例 2:
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-common-prefix
 */
class Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var longPrefix = strs[0]
        while longPrefix.count > 0 && strs.count > 1 {
            var state = true
            for i in 1 ..< strs.count {
                if strs[i].prefix(longPrefix.count) != longPrefix {
                    state = false
                    break
                }
            }
            if state == false {
                longPrefix.removeLast()
            }
            else {
                break
            }
        }
        return longPrefix
    }
}
