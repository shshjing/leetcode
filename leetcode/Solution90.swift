//
//  Solution90.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 90. 子集 II
 难度 中等
 
 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:
 输入: [1,2,2]
 输出:
 [
   [2],
   [1],
   [1,2,2],
   [2,2],
   [1,2],
   []
 ]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subsets-ii
*/

class Solution90 {
    var result = [[Int]]()
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return result
        }
        let newnums = nums.sorted()
        var subset = [Int]()
        for i in 1 ..< newnums.count {
            backtrack(&subset, newnums, i, 0)
        }
        result.append(nums)
        result.append([Int]())
        return result
    }
    func backtrack(_ subset: inout [Int], _ nums:[Int], _ k:Int, _ index:Int) -> Void {
        if subset.count == k {
            for array in result {
                if array.count == k {
                    var i = 0
                    while i < k {
                        if array[i] != nums[subset[i]]  {
                            break
                        }
                        i += 1
                    }
                    if i == k {
                        return
                    }
                }
            }
            var sub = [Int]()
            for i in subset {
                sub.append(nums[i])
            }
            result.append(sub);
            return
        }
        if index >= nums.count {
            return
        }
        for i in index ..< nums.count {
            if subset.contains(i) {
                continue
            }
            subset.append(i)
            backtrack(&subset, nums, k, i + 1)
            subset.removeLast()
        }
    }
}
