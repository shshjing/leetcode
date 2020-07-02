//
//  Solution41.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution41 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        
        var contains = false
        
        for i in nums {
            if i == 1 {
                contains = true
                break
            }
        }
        
        if !contains {
            return 1
        }
        
        let n = nums.count
        
        if n == 1 {
            return 2
        }
        
        var ns = nums
        
        for i in 0 ..< n {
            if ns[i] <= 0 || ns[i] > n {
                ns[i] = 1
            }
        }
        
        for i in 0 ..< n {
            let a = Int(fabs(Double(ns[i])))
            if a == n {
                ns[0] = -Int(fabs(Double(ns[0])))
            }
            else {
                ns[a] = -Int(fabs(Double(ns[a])))
            }
        }
        
        for i in 1 ..< n {
            if ns[i] > 0 {
                return i
            }
        }
        
        if ns[0] > 0 {
            return n
        }
        return n + 1
    }
}
