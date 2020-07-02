//
//  Solution54.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var order = [Int]()
        if matrix.count == 0 || matrix[0].count == 0 {
            return order
        }
        let rows = matrix.count
        let columns = matrix[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)
        let total = rows * columns
        var row = 0
        var column = 0
        let directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        var directionIndex = 0
        var nextRow = 0
        var nextColumn = 0
        for i in 0 ..< total {
            order.append(matrix[row][column])
            visited[row][column] = true
            nextRow = row + directions[directionIndex][0]
            nextColumn = column + directions[directionIndex][1]
            if nextRow < 0 || nextRow >= rows || nextColumn < 0 || nextColumn >= columns || visited[nextRow][nextColumn] {
                directionIndex = (directionIndex + 1) % 4
            }
            row = row + directions[directionIndex][0]
            column = column + directions[directionIndex][1]
        }
        return order
    }
}
