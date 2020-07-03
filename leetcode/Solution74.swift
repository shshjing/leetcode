//
//  Solution74.swift
//  leetcode
//
//  Created by peter on 2020/7/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution74 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        
        let row = matrix.count
        let column = matrix[0].count
        
        if target < matrix[0][0] || target > matrix[row - 1][column - 1] {
            return false
        }
        
        var index = -1
        
        for i in 0 ..< matrix.count {
            if matrix[i][0] == target {
                return true
            }
            else if matrix[i][0] > target {
                index = i - 1
                break
            }
        }
        if index < 0 {
            index = row - 1
        }
        
        for i in matrix[index] {
            if i == target {
                return true
            }
        }
        return false
    }
    
    func searchMatrixH(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        
        let row = matrix.count
        let column = matrix[0].count
        
        if target < matrix[0][0] || target > matrix[row - 1][column - 1] {
            return false
        }
        
        var left = 0
        var right = row * column - 1
        var index = 0
        var value = 0
        while left <=  right {
            index = (left + right) / 2
            value = matrix[index / column][index % column]
            if value == target {
                return true
            }
            else if value > target {
                right = index - 1
            }
            else {
                left = index + 1
            }
        }
        return false
    }
}
