//
//  Solution9.swift
//  leetcode
//
//  Created by peter on 2020/5/21.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation


/*
 9. 回文数
 难度 简单
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 
 示例 1:
 输入: 121
 输出: true
 
 示例 2:
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。

 示例 3:
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x > -1 && x < 10 {
            return true
        }
        let str = "\(x)"
        var left = 0
        var right = str.count - 1
        while left < right {
            
            let strLeft = String(str[str.index(str.startIndex, offsetBy: left)])
            let strRight = String(str[str.index(str.startIndex, offsetBy: right)])
            if  strLeft != strRight {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    //有人说转字符串需要额外的空间，64位的Int转字符串空间很小的
}
