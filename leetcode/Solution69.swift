//
//  Solution69.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 69. x 的平方根
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:
 输入: 4
 输出: 2
 
 示例 2:
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
*/

class Solution69 {
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        var ans = -1
        while left <= right {
            let mid = left + (right - left)/2
            if mid * mid <= x {
                ans = mid
                left = mid + 1
            }
            else {
                right = mid - 1
            }
        }
        return ans
    }
}
