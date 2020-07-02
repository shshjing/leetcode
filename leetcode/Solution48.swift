//
//  Solution48.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0 ..< n {
            for j in i ..< n {
                let temp = matrix[j][i]
                matrix[j][i] = matrix[i][j]
                matrix[i][j] = temp
            }
        }
        for i in 0 ..< n {
            for j in 0 ..< n/2 {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[i][n - j - 1]
                matrix[i][n - j - 1] = temp
            }
        }
    }
}
