//
//  Solution55.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution55 {
    func canJump(_ nums: [Int]) -> Bool {
        var rightArrive = 0
        for (i, num) in nums.enumerated() {
            if i <= rightArrive {
                rightArrive = max(rightArrive, i + num)
                if rightArrive > nums.count - 1 {
                    return true
                }
            }
        }
        return false
    }
}
