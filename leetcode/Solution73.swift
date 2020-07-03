//
//  Solution73.swift
//  leetcode
//
//  Created by peter on 2020/7/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows : Set<Int> = []
        var columns : Set<Int> = []
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] == 0 {
                    rows.insert(i)
                    columns.insert(j)
                }
            }
        }
        for i in rows {
            for j in 0 ..< matrix[i].count {
                matrix[i][j] = 0
            }
        }
        for j in columns {
            for i in 0 ..< matrix.count {
                matrix[i][j] = 0
            }
        }
    }
    
    func setZeroesH(_ matrix: inout [[Int]]) {
        
        var zeroRow = false
        var zeroColumn = false
        
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] == 0  {
                    if i == 0  {
                        zeroRow = true
                    }
                    if j == 0 {
                        zeroColumn = true
                    }
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
        for j in 0 ..< matrix[0].count {
            if matrix[0][j] == 0 && j != 0  {
                for i in 0 ..< matrix.count {
                    matrix[i][j] = 0
                }
            }
        }
        for i in 0 ..< matrix.count {
            if matrix[i][0] == 0 && i != 0  {
                for j in 0 ..< matrix[i].count {
                    matrix[i][j] = 0
                }
            }
        }
        if zeroRow {
            for j in 0 ..< matrix[0].count {
                matrix[0][j] = 0
            }
        }
        if zeroColumn {
            for i in 0 ..< matrix.count {
                matrix[i][0] = 0
            }
        }
    }
}
