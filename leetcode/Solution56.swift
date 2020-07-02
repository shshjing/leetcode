//
//  Solution56.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let areas = intervals.sorted { (_ a : [Int], _ b : [Int]) -> Bool in
            return a[0] > b[0]
        }
        var mArray = [[Int]]()
        var merged = [Bool](repeating: false, count: intervals.count)
        
        for i in 0..<areas.count {
            if merged[i] == false {
                var areaI = areas[i]
                for j in i + 1..<areas.count {
                    let areaJ = areas[j]
                    if areaI[1] >= areaJ[0] && areaI[1] <= areaJ[1] ||  areaJ[1] >= areaI[0] && areaJ[1] <= areaI[1] {
                        areaI = [min(areaI[0], areaJ[0]), max(areaI[1], areaJ[1])]
                        merged[i] = true
                        merged[j] = true
                    }
                }
    
                var include = false
                for area in mArray {
                    if area[0] <= areaI[0] && areaI[1] <= area[1] {
                        include = true
                        break
                    }
                }
                if !include {
                    mArray.append(areaI)
                }
            }
        }
        return mArray
    }
}
