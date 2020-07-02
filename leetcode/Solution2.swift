//
//  Solution2.swift
//  leetcode
//
//  Created by peter on 2020/5/21.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 2. 两数相加
 难度 中等
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

class Solution2 {
    
    /*
     算法

     就像你在纸上计算两个数字的和那样，我们首先从最低有效位也就是列表 l1 和 l2 的表头开始相加。由于每位数字都应当处于 0…9 的范围内，我们计算两个数字的和时可能会出现 “溢出”。例如，5+7=12。在这种情况下，我们会将当前位的数值设置为2，并将进位carry=1 带入下一次迭代。进位 carry 必定是 0 或 1，这是因为两个数字相加（考虑到进位）可能出现的最大和为 9+9+1=19。
     
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var result : ListNode? = nil
        var p : ListNode? = nil
        var p1 = l1, p2 = l2
        var step = 0
        while p1 != nil && p2 != nil {
            let num = p1!.val + p2!.val + step
            let node = ListNode(num % 10)
            if num > 9 {
                step = 1
            }
            else {
                step = 0
            }
            if p == nil {
                p = node
                result = node
            }
            else {
                p?.next = node
                p = node
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        
        while p1 != nil {
            let num = p1!.val + step
            let node = ListNode(num % 10)
            if num > 9 {
                step = 1
            }
            else {
                step = 0
            }
            if p == nil {
                p = node
                result = node
            }
            else {
                p?.next = node
                p = node
            }
            p1 = p1?.next
        }
        
        while p2 != nil {
            let num = p2!.val + step
            let node = ListNode(num % 10)
            if num > 9 {
                step = 1
            }
            else {
                step = 0
            }
            if p == nil {
                p = node
                result = node
            }
            else {
                p?.next = node
                p = node
            }
            p2 = p2?.next
        }
        
        if step > 0 {
            p?.next = ListNode(step)
        }
        
        return result
    }
    
    /*
     复杂度分析

     时间复杂度：O(max(m,n))，假设 m 和 n 分别表示 l1 和 l2 的长度，上面的算法最多重复 max(m,n) 次。

     空间复杂度：O(max(m,n))， 新列表的长度最多为 max(m,n)。

     链接：https://leetcode-cn.com/problems/add-two-numbers/solution/liang-shu-xiang-jia-by-leetcode/
    
     */
    
}
