//
//  Solution120.swift
//  leetcode
//
//  Created by videopls on 2020/8/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution120 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var minRoad = Int.max
        var minrs = [[Int]]()
        
        for (i, l) in triangle.enumerated() {
            var minrls = [Int]()
            for (j, val) in l.enumerated() {
                var temp = 0
                if i == 0 {
                    temp = val
                }
                else {
                    let el = minrs[i - 1]
                    if j == 0 {
                        temp = el[0] + val
                    }
                    else if j == l.count - 1 {
                        temp = el[j - 1] + val
                    }
                    else {
                        temp = min(el[j - 1] + val, el[j] + val)
                    }
                }
                minrls.append(temp)
                if temp < minRoad {
                    minRoad = temp
                }
            }
            minrs.append(minrls)
        }
        return minRoad
    }
}
