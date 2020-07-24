//
//  Solution108.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count - 1)
    }
    
    func helper(_ nums: [Int], _ left:Int, _ right:Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = (left + right) / 2
        let root = TreeNode(nums[mid])
        root.left = helper(nums, left, mid - 1)
        root.right = helper(nums, mid + 1, right)
        return root
    }
}
