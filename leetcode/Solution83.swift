//
//  Solution83.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

 83. 删除排序链表中的重复元素
 难度 简单
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

 示例 1:
 输入: 1->1->2
 输出: 1->2
 
 示例 2:
 输入: 1->1->2->3->3
 输出: 1->2->3
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list
*/

class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var p : ListNode? = head
        var q : ListNode? = head?.next
        while q != nil {
            if p?.val != q?.val {
                p?.next = q
                p = p?.next
            }
            q = q?.next
        }
        p?.next = nil
        return head
    }
}
