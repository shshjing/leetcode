//
//  Solution111.swift
//  leetcode
//
//  Created by videopls on 2020/7/31.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution111 {
    func minDepth(_ root: TreeNode?) -> Int {
        var result = [Int]()
        helper(root, 0, &result)
        var min = Int.max
        if result.count == 0 {
            min = 0
        }
        else {
            for i in result {
                if min > i {
                    min = i
                }
            }
        }
        return min
    }
    
    func helper(_ root: TreeNode?, _ depth: Int, _ result: inout [Int]) -> Void {
        if root != nil {
            if root?.left == nil && root?.right == nil {
                result.append(depth + 1)
            }
            else {
                helper(root?.left, depth + 1, &result)
                helper(root?.right, depth + 1, &result)
            }
        }
    }
    
    func minDepthH(_ root: TreeNode?) -> Int {
        
        var stack = [(TreeNode, Int)]()
        if root == nil {
            return 0
        }
        else {
            stack.append((root!, 1))
        }
        var minDepth = Int.max
        while !stack.isEmpty {
            let current = stack.removeLast()
            let node = current.0
            let currentDepth = current.1
            if node.left == nil && node.right == nil {
                minDepth = min(minDepth, currentDepth)
            }
            if node.left != nil {
                stack.append((node.left!, currentDepth + 1))
            }
            if node.right != nil {
                stack.append((node.right!, currentDepth + 1))
            }
        }
        
        return minDepth
    }
}
