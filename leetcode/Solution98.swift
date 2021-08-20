//
//  Solution98.swift
//  leetcode
//
//  Created by 景生善 on 2020/7/16.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution98 {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, Int(Int32.min), Int(Int32.max))
    }
    
    func helper(_ root: TreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        if root == nil {
            return true
        }
        if root!.val  >= upper || root!.val <= lower {
            return false
        }
        return helper(root?.left, lower, root!.val) && helper(root?.right, root!.val, upper)
    }
    
    func isValidBSTZ(_ root: TreeNode?) -> Bool {
        var stack = [TreeNode]()
        var inorder = Int.min
        var p = root
        
        while !stack.isEmpty || p != nil {
            while p != nil {
                stack.append(p!)
                p = p?.left
            }
            p = stack.removeLast()
            if p!.val <= inorder {
                return false
            }
            inorder = p!.val
            p = p?.right
        }
        return true
    }
}

class Solution100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil  {
            return true
        }
        else if p != nil && q != nil && p!.val == q!.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false
    }
}
