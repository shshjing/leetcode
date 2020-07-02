//
//  Solution34.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return [-1, -1]
        }
        return search(nums, 0, nums.count - 1, target)
    }
    
    func search(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> [Int] {
        if left < right {
            if nums[(left + right) / 2] > target {
                return search(nums, left, (left + right) / 2 - 1, target)
            }
            else if nums[(left + right) / 2] < target {
                return search(nums, (left + right) / 2 + 1, right, target)
            }
            else {
                let i = (left + right) / 2
                var j = 0
                var k = 0
                while i + k < nums.count && nums[i + k] == target {
                    k += 1
                }
                while i - j > -1 && nums[i - j] == target {
                    j += 1
                }
                return [i - j + 1, i + k - 1]
            }
        }
        else {
            if nums[left] == target {
                return [left, right]
            }
            else {
                return [-1, -1]
            }
        }
        return [-1, -1]
    }
}
