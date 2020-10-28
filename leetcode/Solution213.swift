//
//  Solution213.swift
//  leetcode
//
//  Created by videopls on 2020/9/29.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution213 {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        var numsl = nums
        numsl.removeLast()

        var numsp = nums
        numsp.removeFirst()
        return max(lineRob(numsp), lineRob(numsl))
    }
    
    func lineRob(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp = 0
        for num in nums {
            temp = cur
            cur = max(pre + num, cur)
            pre = temp
        }
        return cur
    }
}
