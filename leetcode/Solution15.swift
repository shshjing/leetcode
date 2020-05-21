//
//  Solution15.swift
//  leetcode
//
//  Created by peter on 2020/5/21.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 15. 三数之和
 难度 中等
 
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 示例：
 
 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 链接：https://leetcode-cn.com/problems/3sum
 
 */

class Solution15 {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {

        let newnums = nums.sorted()
        var result = [[Int]]()
        var repetition = [String : Int]()
        for i in 0 ..< newnums.count {
            
            var left = i + 1
            var right = newnums.count - 1

            while (left < right) {
                let sum = newnums[i] + newnums[left] + newnums[right]
                if (sum == 0) {
                    let key = newnums[i] > newnums[left] ? "\(newnums[left])\(newnums[i])\(newnums[right])" : "\(newnums[i])\(newnums[left])\(newnums[right])"
                    if (repetition[key] == nil) {
                        repetition[key] = 1
                        result.append([newnums[i], newnums[left], newnums[right]])
                    }
                    
                    
                    repeat {
                        right = right - 1
                    }while (left < right && newnums[right] == newnums[right + 1])

                    repeat {
                        left = left + 1
                    }
                    
                    while (left < right && newnums[left] == newnums[left - 1])
                }
                else if (sum > 0) {
                    right = right - 1;
                }
                else {
                    left = left + 1
                }
            }

            if (i > 0 && i < newnums.count - 2 && newnums[i] == newnums[i-1]){
                continue;
            }

        }

        return result;
    }
}
