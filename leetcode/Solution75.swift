//
//  Solution75.swift
//  leetcode
//
//  Created by peter on 2020/7/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution75 {
    func sortColors(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        var low = 0
        var high = nums.count - 1
        
        while low <= high && nums[low] == 0 {
            low += 1
        }
        while low <= high && nums[high] == 2 {
            high -= 1
        }
        var index = low
        while low <= high && index <= high {
            if nums[index] == 2 {
                nums[index] = nums[high]
                nums[high] = 2
                high -= 1
                while nums[high] == 2 {
                    high -= 1
                }
            }
            if nums[index] == 0 {
                nums[index] = nums[low]
                nums[low] = 0
                low += 1
                while nums[low] == 0 {
                    low += 1
                }
                index = low
            }
            if nums[index] == 1 {
                index += 1
            }
        }
    }
    
    func sortColorsH(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        var low = 0
        var current = 0
        var high = nums.count - 1
        var temp : Int
        while current <= high {
            if nums[current] == 0 {
                temp = nums[low]
                nums[low] = nums[current]
                nums[current] = temp
                low += 1
                current += 1
            }
            else if nums[current] == 2 {
                temp = nums[current]
                nums[current] = nums[high]
                nums[high] = temp
                high -= 1
            }
            else {
                current += 1
            }
        }
    }
}
