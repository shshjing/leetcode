//
//  Solution103.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution103 {
    var result = [[Int]]()
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        helper(root, 0)
        if result.count > 2 {
            for i in 2 ..< result.count {
                if i % 2 == 0 {
                    result[i] = result[i].reversed()
                }
            }
        }
        return result
    }
    
    func helper(_ root: TreeNode?, _ level: Int) -> Void {
        if root != nil {
            var list:[Int]
            
            if result.count > level {
                list = result[level]
            }
            else {
                list = [Int]()
                result.append(list)
            }
            list.append(root!.val)
            result[level] = list
            helper(root?.left, level + 1)
            helper(root?.right, level + 1)
        }
    }
}
