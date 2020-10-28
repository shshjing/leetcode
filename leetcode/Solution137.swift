//
//  Solution137.swift
//  leetcode
//
//  Created by videopls on 2020/10/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution137 {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        for i in nums {
            if dict[i] == nil {
                dict[i] = 1;
            }
            else {
                dict[i] = dict[i]! + 1
            }
        }
        var result = 0
        for i in dict.keys {
            if dict[i] == 1 {
                result = i
            }
        }
        return result
    }
    
    func singleNumberW(_ nums: [Int]) -> Int {
        var seen_once = 0
        var seen_twice = 0
        for i in nums {
            seen_once = ~seen_twice & (seen_once ^ i)
            seen_twice = ~seen_once & (seen_twice ^ i)

        }
        
        return seen_once
    }
}
