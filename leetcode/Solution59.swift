//
//  Solution59.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        let directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        var directionIndex = 0
        var row = 0
        var column = 0
        var nextRow = 0
        var nextColumn = 0
        
        for i in 1 ... n*n {
            matrix[row][column] = i
            visited[row][column] = true
            nextRow = row + directions[directionIndex][0]
            nextColumn = column + directions[directionIndex][1]
            if nextRow < 0 || nextRow > n - 1 || nextColumn < 0 || nextColumn > n - 1 || visited[nextRow][nextColumn] {
                directionIndex = (directionIndex + 1) % 4
            }
            row = row + directions[directionIndex][0]
            column = column + directions[directionIndex][1]
        }
        
        return matrix
    }
}
