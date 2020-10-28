//
//  Solution198.swift
//  leetcode
//
//  Created by videopls on 2020/9/29.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp = 0
        for num in nums {
            temp = cur
            cur = max(pre + num, cur)
            pre = temp
        }
        return cur
    }
}
