//
//  Solution114.swift
//  leetcode
//
//  Created by videopls on 2020/8/4.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution114 {
    var result = [TreeNode]()
    
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        for i in 1 ..< result.count {
            var p = result[i - 1]
            var c = result[i]
            p.right = c
            p.left = nil
        }
    }
    
    func helper(_ root: TreeNode?) -> Void {
        if root != nil {
            result.append(root!)
            helper(root?.left)
            helper(root?.right)
        }
    }
}
