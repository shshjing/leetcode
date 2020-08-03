//
//  Solution113.swift
//  leetcode
//
//  Created by videopls on 2020/7/31.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution113 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var result = [[Int]]()
        
        var stack = [(TreeNode, Int, [Int])]()
        if root != nil {
            var path = [Int]()
            path.append(root!.val)
            stack.append((root!, root!.val, path))
        }
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            let node = current.0
            let sumPath = current.1
            let path = current.2
            
            if node.left == nil && node.right == nil {
                if sumPath == sum {
                    result.append(path)
                }
            }
            
            if node.left != nil {
                var temp = [Int]()
                temp.append(contentsOf: path)
                temp.append(node.left!.val)
                stack.append((node.left!, sumPath + node.left!.val, temp))
            }
            
            if node.right != nil {
                var temp = [Int]()
                temp.append(contentsOf: path)
                temp.append(node.right!.val)
                stack.append((node.right!, sumPath + node.right!.val, temp))
            }
        }
        
        return result
    }
}
