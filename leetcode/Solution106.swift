//
//  Solution106.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var index = [Int:Int]()
        for (i,val) in inorder.enumerated() {
            index[val] = i
        }
        return buildTreeHelper(inorder, postorder, 0, inorder.count, 0, postorder.count, index)
    }
    
    func buildTreeHelper(_ inorder: [Int],
                         _ postorder: [Int],
                         _ iStart: Int,
                         _ iEnd: Int,
                         _ pStart: Int,
                         _ pEnd: Int,
                         _ index: [Int:Int]) -> TreeNode? {
        if pStart == pEnd {
            return nil
        }
        
        let rootVal = postorder[pEnd - 1]
        let root = TreeNode(rootVal)
        
        let iRootIndex = index[rootVal]
        
        let leftNum = iRootIndex! - iStart
        
        root.left = buildTreeHelper(inorder, postorder, iStart, iRootIndex!, pStart + 1, pStart + 1 + leftNum, index)
        root.right = buildTreeHelper(inorder, postorder, iRootIndex! + 1, iEnd, pStart + 1 + leftNum, pEnd, index)
        return root
    }
}
