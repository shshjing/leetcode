//
//  Solution29.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 29. 两数相除
 难度 x中等
 
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

 返回被除数 dividend 除以除数 divisor 得到的商。

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2

 示例 1:
 输入: dividend = 10, divisor = 3
 输出: 3
 解释: 10/3 = truncate(3.33333..) = truncate(3) = 3

 示例 2:
 输入: dividend = 7, divisor = -3
 输出: -2
 解释: 7/-3 = truncate(-2.33333..) = -2
 
 提示：

 被除数和除数均为 32 位有符号整数。
 除数不为 0。
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/divide-two-integers
 
 */

class Solution29 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        
        if dividend == 0 {
            return 0
        }
        if divisor == 1 {
            return dividend
        }
        if divisor == -1 {
            if dividend > -INT32_MAX {
                return -dividend
            }
            else {
                return Int(INT32_MAX)
            }
        }
        
        var sign = 1
        if dividend > 0 && divisor < 0 || dividend < 0 && divisor > 0 {
            sign = -1
        }
        
        let a = dividend > 0 ? dividend : -dividend
        let b = divisor > 0 ? divisor : -divisor
        let res = div(a, b)
        if sign > 0 {
            return res > INT32_MAX ? Int(INT32_MAX) : res
        }
        return -res
    }
    
    func div(_ a: Int, _ b:Int ) -> Int {
        if a < b {
            return 0
        }
        var count = 1
        var tb = b
        while (tb + tb) < a {
            count = count + count
            tb = tb + tb
        }
        return count + div(a - tb, b)
    }
}
