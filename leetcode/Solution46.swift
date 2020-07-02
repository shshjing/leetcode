//
//  Solution46.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        result.append([])
        var prev = [[Int]]()
        var cur = [Int]()
        for num in nums {
            prev = result
            result = [[Int]]()
            for i in 0 ..< prev.count {
                for j in 0 ..< prev[i].count {
                    cur = prev[i]
                    cur.insert(num, at: j)
                    result.append(cur)
                }
                cur = prev[i]
                cur.append(num)
                result.append(cur)
            }
        }
        return result
    }
    
    func backtrack(_ nums : [Int],
                   _ track : inout [Int],
                   _ used : inout [Bool],
                   _ res : inout [[Int]]) -> Void {
        if track.count == nums.count {
            let r = track
            res.append(r)
            return
        }
        for (i,num) in nums.enumerated() {
            if used[i] {
                continue
            }
            used[i] = true
            track.append(num)
            backtrack(nums, &track, &used, &res)
            track.removeLast()
            used[i] = false
        }
    }
    
    func permuteH(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var used = [Bool](repeating: false, count: nums.count)
        var track = [Int]()
        backtrack(nums, &track, &used, &res)
        return res
    }
}
