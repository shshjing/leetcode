//
//  Solution35.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        var left = 0
        var right = nums.count - 1

        while left < right {
            
            if nums[(left + right) / 2] > target {
                right = (left + right) / 2 - 1
            }
            else if nums[(left + right) / 2] < target {
                left = (left + right) / 2 + 1
            }
            else {
                return (left + right) / 2
            }
        }
        if nums[(left + right) / 2] > target {
            return (left + right) / 2
        }
        else if nums[(left + right) / 2] < target {
            return (left + right) / 2 + 1
        }
        else {
            return (left + right) / 2
        }
    }
}
