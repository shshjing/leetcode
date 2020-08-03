//
//  Solution112.swift
//  leetcode
//
//  Created by videopls on 2020/7/31.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution112 {
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        var result = [Int]()
        helper(root, 0, &result)
        for i in result {
            if i == sum {
                return true
            }
        }
        return false
    }
    
    func helper(_ root: TreeNode?, _ sum: Int, _ result: inout [Int]) -> Void {
        if root != nil {
            if root?.left == nil && root?.right == nil {
                result.append(sum + root!.val)
            }
            else {
                helper(root?.left, sum + root!.val, &result)
                helper(root?.right, sum + root!.val, &result)
            }
        }
    }
}
