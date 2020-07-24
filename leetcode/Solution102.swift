//
//  Solution102.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution102 {
    var result = [[Int]]()
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        helper(root, 0)
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
