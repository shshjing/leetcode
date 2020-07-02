//
//  Solution19.swift
//  leetcode
//
//  Created by peter on 2020/6/1.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 19. 删除链表的倒数第N个节点
 难度 中等
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 */

//public class ListNode {
//  public var val: Int
//  public var next: ListNode?
//  public init(_ val: Int) {
//      self.val = val
//      self.next = nil
//  }
//}
 
class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil || n == 0 {
            return head
        }
        var nodeArray = [ListNode]()
        var p = head
        nodeArray.append(p!)
        while p?.next != nil {
            p = p?.next
            nodeArray.append(p!)
        }
        p = head
        if n < nodeArray.count {
            let temp = nodeArray[nodeArray.count - n - 1]
            temp.next = temp.next?.next
        }
        else if n == nodeArray.count {
            p = p?.next
        }
        return p
    }
    
    func removeNthFromEndD(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil || n == 0 {
            return head
        }
        var pFirst = head
        var pSecond = head
        for i in 0 ..< n {
            pFirst = pFirst?.next
            if pFirst == nil {
                //因为n有效，所有只有可能倒数第n个是head
                return head?.next
            }
        }
        
        while pFirst != nil {
            pFirst = pFirst?.next
            if pFirst != nil {
                pSecond = pSecond?.next
            }
            else {
                pSecond?.next = pSecond?.next?.next
            }
        }
        
        return head
    }
}
