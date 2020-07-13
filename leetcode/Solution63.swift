//
//  Solution63.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 63. 不同路径 II
 难度 中等
 
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？

 网格中的障碍物和空位置分别用 1 和 0 来表示。

 说明：m 和 n 的值均不超过 100。
 
 示例 1:
 输入:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 输出: 2
 解释:
 3x3 网格的正中间有一个障碍物。
 从左上角到右下角一共有 2 条不同的路径：
 1. 向右 -> 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右 -> 向右

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-paths-ii
 
*/

class Solution63 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count == 0 || obstacleGrid[0].count == 0 || obstacleGrid[0][0] == 1 {
            return 0
        }
        let n = obstacleGrid.count
        let m = obstacleGrid[0].count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        dp[1][1] = 1
        for i in 1 ... n {
            for j in 1 ... m {
                if i == 1 && j == 1 {
                    continue
                }
                if obstacleGrid[i - 1][j - 1] == 1 {
                    dp[i][j] = 0
                }
                else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[n][m]
    }
}
