//
//  Solution144.swift
//  leetcode
//
//  Created by videopls on 2020/8/10.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [TreeNode]()
        stack.append(root!)
        while !stack.isEmpty {
            let p = stack.removeLast()
            if p.right != nil {
                stack.append(p.right!)
            }
            if p.left != nil {
                stack.append(p.left!)
            }
            result.append(p.val)
        }
        return result;
    }
}
