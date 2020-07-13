//
//  Solution77.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

 77. 组合
 难度 中等
 
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:
 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combinations
*/

class Solution77 {
    var result = [[Int]]()
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var comb = [Int]()
        backtrack(&comb, n, k, 1)
        return result
    }
    
    func backtrack(_ comb: inout [Int], _ n: Int, _ k: Int, _ index: Int) -> Void {
        if comb.count == k {
            result.append(comb)
            return
        }
        if index > n {
            return
        }
        for i in index ... n {
            if comb.contains(i) {
                continue
            }
            comb.append(i)
            backtrack(&comb, n, k, i + 1)
            comb.removeLast()
        }
    }
}
