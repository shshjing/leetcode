//
//  Solution67.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 67. 二进制求和
 难度 简单
 给你两个二进制字符串，返回它们的和（用二进制表示）。

 输入为 非空 字符串且只包含数字 1 和 0。
 
 示例 1:
 输入: a = "11", b = "1"
 输出: "100"
 
 示例 2:
 输入: a = "1010", b = "1011"
 输出: "10101"
 
 提示：

 每个字符串仅由字符 '0' 或 '1' 组成。
 1 <= a.length, b.length <= 10^4
 字符串如果不是 "0" ，就都不含前导零。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-binary
*/

class Solution67 {
    func addBinary(_ a: String, _ b: String) -> String {
        var result = String("")
        var step = 0
        var sum = 0
        let charL = a.count > b.count ? ([Character] (a.reversed())) : ([Character] (b.reversed()))
        let charS = a.count > b.count ? ([Character] (b.reversed())) : ([Character] (a.reversed()))
        for i in 0 ..< charS.count {
            sum = Int(String(charS[i]))! + Int(String(charL[i]))! + step
            result.append("\(sum%2)")
            step = sum / 2
        }
        for i in charS.count ..< charL.count {
            sum = Int(String(charL[i]))! + step
            result.append("\(sum%2)")
            step = sum / 2
        }
        if step == 1 {
            result.append("1")
        }
        return String(result.reversed())
    }
}
