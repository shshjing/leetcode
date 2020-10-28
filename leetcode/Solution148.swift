//
//  Solution148.swift
//  leetcode
//
//  Created by videopls on 2020/10/23.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let temp = slow?.next
        slow?.next = nil
        var left = sortList(head)
        var right = sortList(temp)
        let h = ListNode(0)
        var p = h
    
        while left != nil && right != nil {
            if left!.val < right!.val {
                p.next = left
                left = left?.next
            }
            else {
                p.next = right
                right = right?.next
            }
            p = p.next ?? ListNode(0)
        }
        
        p.next = left != nil ? left : right
        
        return h.next
    }
}
