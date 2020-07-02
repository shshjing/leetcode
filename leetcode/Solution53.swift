//
//  Solution53.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var pre = 0
        var maxSub = nums[0]
        for num in nums {
            pre = max(pre + num, num)
            maxSub = max(pre, maxSub)
        }
        return maxSub
    }
}
