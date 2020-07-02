//
//  Solution64.swift
//  leetcode
//
//  Created by peter on 2020/7/2.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: grid[0].count), count: grid.count)
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count {
                if i == 0 && j == 0 {
                    dp[i][j] = grid[i][j]
                }
                else if i == 0  && j > 0 {
                    dp[i][j] = grid[i][j] + dp[i][j - 1]
                }
                else if j == 0 && i > 0 {
                    dp[i][j] = grid[i][j] + dp[i - 1][j]
                }
                else {
                    dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[grid.count - 1][grid[0].count - 1]
    }
}
