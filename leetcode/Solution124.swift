//
//  Solution124.swift
//  leetcode
//
//  Created by 景生善 on 2020/10/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution124 {
    
    var maxSum = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxGain(root)
        return maxSum
    }
    
    func maxGain(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftGain = max(maxGain(root?.left), 0)
        let rightGain = max(maxGain(root?.right), 0)
        
        let nodePrice = root!.val + leftGain + rightGain
        
        maxSum = max(maxSum, nodePrice)
        
        return root!.val + max(leftGain, rightGain)
        
    }
}
