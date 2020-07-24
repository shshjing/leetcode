//
//  Solution129.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution129 {
    
    var sum = 0
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        helper(root, 0)
        return sum
    }
    
    func helper(_ root: TreeNode?, _ num: Int) -> Void {
        if root != nil {
            if root?.left == nil && root?.right == nil {
                sum += num * 10 + root!.val
            }
            else {
                helper(root?.left, num * 10 + root!.val)
                helper(root?.right, num * 10 + root!.val)
            }
        }
    }
}
