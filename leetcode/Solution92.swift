//
//  Solution92.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 92. 反转链表 II
 难度 中等
 
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
 */

class Solution92 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return head
        }
        var pLeft : ListNode?, pRight : ListNode?
        var p : ListNode? = head
        var count = 1
        while p != nil && count < m - 1 {
            p = p?.next
            count += 1
        }
        
        pLeft = p
        pRight = p?.next
        
        if m == 1 {
            pLeft = ListNode(0)
            pLeft?.next = head
            pRight = head
        }
        
        p = pRight?.next
        
        for _ in m ..< n {
            let temp = p?.next
            p?.next = pLeft?.next
            pLeft?.next = p
            p = temp
        }
        
        pRight?.next = p
        
        if m == 1 {
            return pLeft?.next
        }
        
        return head
    }
    
    func reverseBetweenC(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
            let dummy = ListNode(0)
            dummy.next = head
            
            //pre 就是要找的第 m - 1个节点
            var pre: ListNode? = dummy
            for _ in 0..<m - 1 {
                pre = pre?.next
            }
            //current 一直指向第 m 个节点
            let current = pre?.next

            //反转 n - m 次
            for _ in m..<n {
                let next = current?.next
                current?.next = next?.next //通过 current?.next 移动
                next?.next = pre?.next
                pre?.next = next
            }
            return dummy.next
        }
}
