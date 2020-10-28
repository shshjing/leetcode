//
//  Solution440.swift
//  leetcode
//
//  Created by videopls on 2020/10/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation


class Solution440 {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var p = 1
        var prefix = 1
        while p < k {
            let count = getCount(prefix, n)
            if p + count > k {
                prefix *= 10
                p += 1
            }
            else {
                prefix += 1
                p += count
            }
        }
        return prefix
    }
        
    func getCount(_ prefix: Int, _ n: Int) -> Int {
        var count = 0
        var cur = prefix
        var next = prefix + 1
        while cur <= n {
            count += min(next, n + 1) - cur;
            cur *= 10
            next *= 10
        }
        return count
    }
}
