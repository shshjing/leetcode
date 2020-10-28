//
//  Solution24.swift
//  leetcode
//
//  Created by videopls on 2020/10/23.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let temp = head?.next?.next
        let p = head?.next
        p?.next = head
        head?.next = swapPairs(temp)
        return p
    }
}
