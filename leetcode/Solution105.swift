//
//  Solution105.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution105 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var index = [Int:Int]()
        for (i,val) in inorder.enumerated() {
            index[val] = i
        }
        return buildTreeHelper(preorder, inorder, 0, preorder.count, 0, inorder.count, index)
    }
    
    func buildTreeHelper(_ preorder: [Int],
                         _ inorder: [Int],
                         _ pStart: Int,
                         _ pEnd: Int,
                         _ iStart: Int,
                         _ iEnd: Int,
                         _ index: [Int:Int]) -> TreeNode? {
        if pStart == pEnd {
            return nil
        }
        
        let rootVal = preorder[pStart]
        let root = TreeNode(rootVal)
        
        let iRootIndex = index[rootVal]
        
        let leftNum = iRootIndex! - iStart
        
        root.left = buildTreeHelper(preorder, inorder, pStart + 1, pStart + 1 + leftNum, iStart, iRootIndex!, index)
        root.right = buildTreeHelper(preorder, inorder, pStart + 1 + leftNum, pEnd, iRootIndex! + 1, iEnd, index)
        return root
    }
}
