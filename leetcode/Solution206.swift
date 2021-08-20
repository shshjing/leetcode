//
//  Solution206.swift
//  leetcode
//
//  Created by 景生善 on 2020/10/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var q = head
        var p = head?.next
        q?.next = nil
        var temp : ListNode?
        while p != nil {
            temp = p?.next
            p?.next = q
            q = p
            p = temp
        }
        return q
    }
}
