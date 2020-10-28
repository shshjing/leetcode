//
//  Solution300.swift
//  leetcode
//
//  Created by videopls on 2020/10/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        
        var subList = [Int]()

        for (i, num) in nums.enumerated() {
            if i == 0 {
                subList.append(num)
            }
            else if num > subList[subList.count - 1] {
                subList.append(num)
            }
            else if num < subList[subList.count - 1] {
                for (j, n) in subList.enumerated() {
                    if n >= num {
                        subList[j] = num
                        break
                    }
                }
            }
        }
        return subList.count
    }
}
