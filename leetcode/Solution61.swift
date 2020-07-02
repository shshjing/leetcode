//
//  Solution61.swift
//  leetcode
//
//  Created by peter on 2020/7/2.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        var p = head
        var list = [ListNode]()
        var tail = p
        
        while p != nil  {
            tail = p
            list.append(p!)
            p = p?.next
        }
        let move = k % list.count
        
        if move == 0 {
            return head
        }
        
        list[list.count - move - 1].next = nil
        list[list.count - 1].next = head
        return list[list.count - move]
    }
    func rotateRightH(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        var p = head
        var tail = p
        var count = 0
        
        while p != nil  {
            count += 1
            tail = p
            p = p?.next
        }
        
        let move = k % count
        
        if move == 0 {
            return head
        }
        
        tail?.next = head
        p = head
        
        for _ in 0 ..< count - move {
            p = p?.next
            tail = tail?.next
        }
        tail?.next = nil
        
        return p
    }
}
