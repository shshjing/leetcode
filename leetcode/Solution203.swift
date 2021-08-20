//
//  Solution203.swift
//  leetcode
//
//  Created by 景生善 on 2021/8/20.
//  Copyright © 2021 peter. All rights reserved.
//

import Foundation

class Solution203 {
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        var p: ListNode? = nil
        var q: ListNode? = nil
        var c = head;
        while c != nil {
            if c?.val == val {
                p?.next = c?.next
            }
            else {
                if q == nil {
                    q = c
                    p = c
                }
                else {
                    p = p?.next
                }
            }
            c = c?.next
        }
        return q
    }
    
}
