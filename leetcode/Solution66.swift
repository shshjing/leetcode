//
//  Solution66.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 66. 加一
 难度 简单
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

 你可以假设除了整数 0 之外，这个整数不会以零开头。

 示例 1:
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 
 示例 2:
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/plus-one
*/

class Solution66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var step = 1
        var index = digits.count - 1
        var sum = 0
        var list = digits
        while step > 0 && index >= 0 {
            sum = list[index] + step
            list[index] = sum % 10
            step = sum / 10
            index -= 1
        }
        if step == 1 {
            list.insert(step, at: 0)
        }
        return list
    }
}
