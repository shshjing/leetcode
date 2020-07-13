//
//  Solution89.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

 89. 格雷编码
 难度 中等
 
 格雷编码是一个二进制数字系统，在该系统中，两个连续的数值仅有一个位数的差异。

 给定一个代表编码总位数的非负整数 n，打印其格雷编码序列。即使有多个不同答案，你也只需要返回其中一种。

 格雷编码序列必须以 0 开头。

 示例 1:
 输入: 2
 输出: [0,1,3,2]
 解释:
 00 - 0
 01 - 1
 11 - 3
 10 - 2

 对于给定的 n，其格雷编码序列并不唯一。
 例如，[0,2,3,1] 也是一个有效的格雷编码序列。

 00 - 0
 10 - 2
 11 - 3
 01 - 1

 示例 2:
 
 输入: 0
 输出: [0]
 解释: 我们定义格雷编码序列必须以 0 开头。
      给定编码总位数为 n 的格雷编码序列，其长度为 2n。当 n = 0 时，长度为 20 = 1。
      因此，当 n = 0 时，其格雷编码序列为 [0]。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/gray-code
*/

class Solution89 {
    func grayCode(_ n: Int) -> [Int] {
        var res = [0]
        var head = 1
        for _ in 0 ..< n {
            let count = res.count
            for j in (0 ..< count).reversed()  {
                res.append(head + res[j])
            }
            head <<= 1
        }
        return res
    }
    
    func longStr(_ str:String) -> Int {
        var left = 0
        var right = 0
        var windows = [Character:Int]()
        var res = 0
        let strC = [Character](str)
        while right < str.count {
            let char1 = strC[right]
            if windows[char1] == nil {
                windows[char1] = 1
            }
            else {
                windows[char1]! += 1
            }
            right += 1
            while windows[char1] == 2 {
                let char2 = strC[left]
                windows[char2]! -= 1
                left += 1
            }
            res = max(res, right - left)
        }
        return res
    }
    
    func longdif(_ str1:String, _ str2:String) -> [Int] {
        var left = 0
        var right = 0
        var windows = [Character:Int]()
        var need = [Character:Int]()
        var res = [Int]()
        let strC1 = [Character](str1)
        let strC2 = [Character](str2)
        var match = 0
        for c in strC2 {
            if need[c] == nil {
                need[c] = 1
            }
            else {
                need[c]! += 1
            }
        }
        
        while right < strC1.count {
            let char1 = strC1[right]
            if need[char1] != nil {
                if windows[char1] == nil {
                    windows[char1] = 1
                }
                else {
                    windows[char1]! += 1
                }
                if windows[char1] == need[char1] {
                    match += 1
                }
            }
            
            right += 1
            
            while match == need.count {
                if right - left == strC2.count {
                    res.append(left)
                }
                let char2 = strC2[left]
                if need[char2] != nil {
                    windows[char2]! -= 1
                    if windows[char2]! < need[char2]! {
                        match -= 1
                    }
                }
                left += 1
            }
        }
        return res
    }
}
