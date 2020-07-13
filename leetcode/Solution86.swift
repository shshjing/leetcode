//
//  Solution86.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 86. 分隔链表
 难度 中等
 
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

 示例:

 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-list
*/

class Solution86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var i : ListNode? = head
        
        var p : ListNode? = nil
        var q : ListNode? = nil
        var r : ListNode? = nil
        var s : ListNode? = nil
        while i != nil {
            if i!.val < x {
                if p == nil {
                    p = i
                    q = i
                }
                else {
                    q?.next = i
                    q = q?.next
                }
            }
            else {
                if r == nil {
                    r = i
                    s = i
                }
                else {
                    s?.next = i
                    s = s?.next
                }
            }
            i = i?.next
        }
        
        q?.next = r
        s?.next = nil
        
        if p != nil {
            return p
        }
    
        return r
    }
}
