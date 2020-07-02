//
//  Solution179.swift
//  leetcode
//
//  Created by peter on 2020/5/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution179 {
    func largestNumber(_ nums: [Int]) -> String {
        let newNums = nums.sorted { (num1, num2) -> Bool in
            let str1 = String(num1) + String(num2)
            let str2 = String(num2) + String(num1)
            return str1 > str2
        }
        var result = ""
        for i in 0 ..< newNums.count {
            result += String(newNums[i])
        }
        if Int(result) == 0 {
            result = "0"
        }
        return result
    }
}
