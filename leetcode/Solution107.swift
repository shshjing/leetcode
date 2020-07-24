//
//  Solution107.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution107 {
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var queue = [TreeNode]()
        if root != nil {
            queue.append(root!)
        }
        while !queue.isEmpty {
            var list = [Int]()
            let count = queue.count
            for _ in 0 ..< count {
                let p = queue.remove(at: 0)
                list.append(p.val)
                if p.left != nil {
                    queue.append(p.left!)
                }
                if p.right != nil {
                    queue.append(p.right!)
                }
            }
            result.insert(list, at: 0)
        }
        
        return result;
    }
}
