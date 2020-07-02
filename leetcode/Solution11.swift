//
//  Solution11.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 11. 盛最多水的容器
 难度 中等
 
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。

 示例：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/container-with-most-water
 */

class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = (right - left) * min(height[left], height[right])
        var move = true
        while left < right {
            if (right - left) * min(height[left], height[right]) > maxArea {
                maxArea = (right - left) * min(height[left], height[right])
            }
            move = height[left] > height[right] ? true : false
            if move == true {
                right -= 1
            }
            else {
                left += 1
            }
        }
        return maxArea
    }
}
