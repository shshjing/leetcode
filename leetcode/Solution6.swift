//
//  Solution6.swift
//  leetcode
//
//  Created by peter on 2020/5/25.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if numRows == 1 {
            return s
        }
        
        let chars = [Character](s)
        var table = [[String]](repeating: [String](repeating: "", count: chars.count), count: numRows)
        var i = 0
        var row = 0
        var column = 0
        var columnStep = false
        
        while i < chars.count {
            if row == 0 {
                columnStep = false
            }
            else if row == numRows - 1 {
                columnStep = true
            }
            
            table[row][column] = String(chars[i])
            
            if columnStep {
                column += 1
                row -= 1
            }
            else {
                row += 1
            }
            i += 1
        }
        var str = ""
        let rowNum = numRows > chars.count ? chars.count : numRows;
        
        for i in 0 ..< rowNum   {
            for j in 0 ..< column + 1 {
                str += table[i][j]
            }
        }
        return str
    }
}
