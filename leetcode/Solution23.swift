//
//  Solution23.swift
//  leetcode
//
//  Created by videopls on 2020/9/22.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var list = [ListNode?]()
        var i = 0
        while i < lists.count  {
            let p1 = lists[i]
            var p2 : ListNode? = nil
            if i + 1 < lists.count {
                p2 = lists[i + 1]
            }
            if p2 != nil {
                let m = mergeTwoLists(p1, p2)
                if m != nil {
                    list.append(m)
                }
            }
            else {
                list.append(p1)
            }
            i += 2
        }
        
        while list.count > 1 {
            let p1 = list.removeFirst()
            let p2 = list.removeFirst()
            let m = mergeTwoLists(p1, p2)
            list.append(m)
        }
        
        if list.count > 0 {
            return list[0]
        }
        return nil
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var p1 = l1;
        var p2 = l2;
        var head : ListNode? = nil
        var h : ListNode? = head
        while p1 != nil && p2 != nil {
            if p1!.val > p2!.val {
                if head == nil {
                    h = p2
                    head = h
                }
                else {
                    h!.next = p2
                    h = h?.next
                }
                p2 = p2?.next
            }
            else {
                if head == nil {
                    h = p1
                    head = h
                }
                else {
                    h!.next = p1
                    h = h?.next
                }
                p1 = p1?.next
            }
        }
        
        while p1 != nil {
            if head == nil {
                return p1
            }
            else {
                h!.next = p1
                h = h?.next
            }
            p1 = p1?.next
        }
        while p2 != nil {
            if head == nil {
                return p2
            }
            else {
                h!.next = p2
                h = h?.next
            }
            p2 = p2?.next
        }
        return head
    }
}
