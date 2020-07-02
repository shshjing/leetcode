//
//  Solution7.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 7. 整数反转
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:
 输入: 123
 输出: 321
 
 示例 2:
 输入: -123
 输出: -321
 
 示例 3:
 输入: 120
 输出: 21
 
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 */

class Solution7 {
    func reverse(_ x: Int) -> Int {
        //反转后的整数
        var rev = 0
        var X = x
        while X != 0 {
            let a = X % 10
            X = X / 10
            rev = rev * 10 + a
        }
        if rev > Int32.max || rev < Int32.min {
            return 0
        }
        
        return rev
    }
}
