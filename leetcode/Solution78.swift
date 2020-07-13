//
//  Solution78.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 78. 子集
 难度 中等
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:
 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subsets
 
*/

class Solution78 {
    var result = [[Int]]()
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return result
        }
        var comb = [Int]()
        for k in 1 ..< nums.count  {
            backtrack(&comb, nums, k, 0)
        }
        result.append(nums)
        result.append([Int]())
        return result
    }
    
    func backtrack(_ comb: inout [Int], _ nums: [Int], _ k: Int, _ index: Int) -> Void {
        if comb.count == k {
            result.append(comb)
            return
        }
        if index >= nums.count {
            return
        }
        for i in index ..< nums.count {
            if comb.contains(nums[i]) {
                continue
            }
            comb.append(nums[i])
            backtrack(&comb, nums, k, i + 1)
            comb.removeLast()
        }
    }
}
