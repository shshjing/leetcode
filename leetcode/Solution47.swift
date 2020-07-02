//
//  Solution47.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution47 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        if nums.count == 0 {
            return res
        }
        let ns = nums.sorted()
        var used = [Bool](repeating: false, count: nums.count)
        var track = [Int]()
        backtrack(ns, &track, &used, &res)
        return res
    }
    
    func backtrack(_ nums: [Int], _ track: inout [Int], _ used: inout [Bool], _ res: inout [[Int]]) -> Void {
        if track.count == nums.count {
            let t = track
            res.append(t)
            return
        }
        for (i, num) in nums.enumerated() {
            if used[i] {
                continue
            }
            if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
                continue
            }
            used[i] = true
            track.append(num)
            backtrack(nums, &track, &used, &res)
            used[i] = false
            track.removeLast()
        }
    }
}
