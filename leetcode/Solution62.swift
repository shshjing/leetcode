//
//  Solution62.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 62. 不同路径
 难度 中等
 
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

 问总共有多少条不同的路径？

 示例 1:
 输入: m = 3, n = 2
 输出: 3
 解释:
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向右 -> 向下
 2. 向右 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向右

 示例 2:
 输入: m = 7, n = 3
 输出: 28
 
 提示：

 1 <= m, n <= 100
 题目数据保证答案小于等于 2 * 10 ^ 9
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-paths
 
*/

class Solution62 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        dp[1][1] = 1
        for i in 1 ... n {
            for j in 1 ... m {
                if i == 1 && j == 1 {
                    continue
                }
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[n][m]
    }
}
