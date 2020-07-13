//
//  Solution51.swift
//  leetcode
//
//  Created by peter on 2020/7/7.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 51. N皇后
 难度 困难
 
 n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
 
 给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。

 每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

 示例:
 输入: 4
 输出: [
  [".Q..",  // 解法 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // 解法 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 解释: 4 皇后问题存在两个不同的解法。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/n-queens
 */

class Solution51 {
    var result = [[String]]()
    func solveNQueens(_ n: Int) -> [[String]] {
        var board = [[Character]](repeating: [Character](repeating: ".", count: n), count: n)
        backtrack(&board, 0)
        return result
    }
    
    func backtrack(_ board: inout [[Character]], _ row: Int) -> Void {
        if row == board.count {
            var temp = [String]()
            for chars in board {
                temp.append(String(chars))
            }
            result.append(temp)
            return
        }
        
        let n = board[row].count
        for col in 0 ..< n {
            if !isValid(&board, row, col) {
                continue
            }
            board[row][col] = "Q"
            backtrack(&board, row + 1)
            board[row][col] = "."
        }
    }
    
    func isValid(_ board: inout [[Character]], _ row: Int, _ col: Int) -> Bool {
        let n = board.count
        for i in 0 ..< n {
            if board[row][i] == "Q" {
                return false
            }
        }
        for i in 0 ..< n {
            if board[i][col] == "Q" {
                return false
            }
        }
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0  {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        i = row - 1
        j = col + 1
        while i >= 0 && j < n  {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        return true
    }
}
