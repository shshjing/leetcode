//
//  Solution560.swift
//  leetcode
//
//  Created by videopls on 2020/10/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation


class Solution560 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        for (i, num) in nums.enumerated() {
            var sum = 0
            for j in i ..< nums.count {
                sum += nums[j]
                if sum == k {
                    count += 1
                    break;
                }
                else if sum > k {
                    break;
                }
            }
        }
        return count
    }
    
    func subarraySumN(_ nums: [Int], _ k: Int) -> Int {
        var count = 0, pre = 0
        var mp = [Int:Int]()
        mp[0] = 1
        for (i, num) in nums.enumerated() {
            pre += num
            if mp[pre - k] != nil {
                count += mp[pre - k]!
            }
            if mp[pre] == nil {
                mp[pre] = 1
            }
            else {
                mp[pre] = mp[pre]! + 1
            }
        }
        return count
    }
}
