//
//  Solution41.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution60 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var f = factorial(n - 1)
        var result = ""
        var r = k
        var m = 0
        var visited = [Int]()
        for i in 1 ... n {
            visited.append(i)
        }
        while result.count != n {
            if f > 1 {
                if r % f == 0 {
                    m = r / f
                }
                else {
                    m = r / f + 1
                }
            }
            else {
                m = r
            }
            
            result += String(visited[m - 1])
            visited.remove(at: m - 1)
            if r % f == 0 {
                r = f
            }
            else {
                r = r % f
            }
            if n - result.count > 0 {
                f = f / (n - result.count)
            }
            else {
                f = 1
            }
        }
        return result
    }
    
    func factorial(_ n: Int) -> Int {
        var f = 1
        if n > 1 {
            for i in 1 ... n {
                f = f * i
            }
        }
        return f
    }
}

class SolutionD {
    func getK(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        if nums.count < 3 {
            return result
        }
        let n = nums.count
        
        var conform = [Bool](repeating: true, count: nums.count)
        conform[0] = false
        conform[n - 1] = false
        
        var maxL = Int(INT32_MAX)
        maxL = maxL * (-1)
        var minR = Int(INT32_MAX)
        
        for i in 1 ..< nums.count - 1 {
            maxL = max(maxL, nums[i - 1])
            if nums[i] <= maxL {
                conform[i] = false
            }
            minR = min(minR, nums[n - i])
            if nums[n - i - 1] >= minR  {
                conform[n - i - 1] = false
            }
        }
        
        for i in 1 ..< n - 1 {
            if conform[i] == true {
                result.append(nums[i])
            }
        }
        return result
    }
}
