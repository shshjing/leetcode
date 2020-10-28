//
//  Solution199.swift
//  leetcode
//
//  Created by videopls on 2020/10/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution199 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        helper(root, &list, 1)
        return list
    }
    
    func helper(_ root: TreeNode?, _ list: inout [Int], _ level: Int) -> Void {
        if root != nil {
            if list.count < level {
                list.append(root!.val)
            }
            helper(root?.right, &list, level + 1)
            helper(root?.left, &list, level + 1)
        }
    }
}
