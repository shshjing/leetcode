//
//  Solution109.swift
//  leetcode
//
//  Created by videopls on 2020/8/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution109 {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var list = [Int]()
        var p = head
        while p != nil {
            list.append(p!.val)
            p = p?.next
        }
        return convertListToBST(list, 0, list.count - 1)
    }
    
    func convertListToBST(_ list:[Int], _ left:Int, _ right:Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = (left + right) / 2
        let tree = TreeNode(mid)
        tree.left = convertListToBST(list, left, mid - 1)
        tree.right = convertListToBST(list, mid + 1, right)
        return tree
    }
}
