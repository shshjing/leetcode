//
//  Solution79.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

*/

class Solution79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if word.count == 0 || board.count == 0 || board.count * board[0].count < word.count  {
            return false
        }
        var wordC = [Character](word)
        for i in 0 ..< board.count {
            if board[i].contains(wordC[0]) {
                for j in 0 ..< board[i].count {
                    if board[i][j] == wordC[0] {
                        var ii = i, jj = j, index = 1
                        if <#condition#> {
                            <#code#>
                        }
                    }
                }
            }
        }
        return false
    }
}
