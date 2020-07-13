//
//  Solution94.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

 94. 二叉树的中序遍历
 难度 中等
 
 给定一个二叉树，返回它的中序 遍历。

 示例:
 
 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,3,2]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-inorder-traversal
*/

class Solution94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        helper(root, &result)
        return result
    }
    
    func helper(_ root: TreeNode?, _ res: inout [Int]) -> Void {
        if root != nil {
            if root?.left != nil {
                helper(root?.left, &res)
            }
            res.append(root!.val)
            if root?.right != nil {
                helper(root?.right, &res)
            }
        }
    }
    
    func inorderTraversalS(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var current = root
        while current != nil || !stack.isEmpty {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }
            current = stack.removeLast()
            result.append(current!.val)
            current = current?.right
        }
        return result
    }
}
