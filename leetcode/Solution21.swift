//
//  Solution21.swift
//  leetcode
//
//  Created by videopls on 2020/9/21.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
21. 合并两个有序链表
难度 简单
 
将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：

输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
*/

class Solution21 {
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
