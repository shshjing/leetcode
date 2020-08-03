//
//  Solution110.swift
//  leetcode
//
//  Created by videopls on 2020/8/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution110 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        if root == nil {
            return true
        }
        
        let (_, result) = helper(root, 0)
        
        return result
    }
    
    func helper(_ root: TreeNode?, _ level: Int) -> (Int, Bool) {
        if root != nil {
            if root?.left == nil && root?.right == nil {
                return ((level + 1), true)
            }
            else {
                let (leftLevel, leftResult) = helper(root?.left, level + 1)
                let (rightLevel, rightResult) = helper(root?.right, level + 1)
                return (max(leftLevel, rightLevel), abs(leftLevel - rightLevel) < 2  && leftResult && rightResult)
            }
        }
        else {
            return (level, true)
        }
    }
}
