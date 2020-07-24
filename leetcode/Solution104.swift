//
//  Solution104.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root != nil {
            return max(1 + maxDepth(root?.left), 1 + maxDepth(root?.right))
        }
        return 0
    }
}
