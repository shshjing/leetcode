//
//  Solution217.swift
//  leetcode
//
//  Created by 景生善 on 2021/8/20.
//  Copyright © 2021 peter. All rights reserved.
//

import Foundation

class Solution217 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int:Int]()
        for i in  0 ..< nums.count {
            if dict[nums[i]] != nil {
                return true
            }
            else {
                dict[nums[i]] = nums[i];
            }
        }
        return false
    }
    
    func isHappy(_ n: Int) -> Bool {
        var repeatList = [Int]()
        return check(n, &repeatList)
    }
    
    func check(_ n: Int, _ repeatList: inout [Int]) -> Bool {
        if n == 1 {
            return true
        }
        repeatList.append(n)
        let sepate = separt(n)
        var sum = 0
        for i in sepate {
            sum += i*i
        }
        
        if repeatList.contains(sum) {
            return false
        }
        return check(sum, &repeatList)
    }
    
    func separt(_ n: Int) -> [Int] {
        var result = [Int]()
        var m = n
        repeat {
            result.append(m % 10)
            m = m / 10
        }
        while (m > 0)
        return result
    }
}
