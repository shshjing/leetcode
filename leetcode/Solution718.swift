//
//  Solution718.swift
//  leetcode
//
//  Created by peter on 2020/7/1.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class NodeA {
    let children: [NodeA] = [];
}


class Solution718 {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        let n = A.count
        let m = B.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var ans = 0
        for i in (0 ..< n).reversed() {
            for j in (0 ..< m).reversed() {
                dp[i][j] = A[i] == B[j] ? dp[i + 1][j + 1] + 1 : 0
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }
    
    func findLengthL(_ A: [Int], _ B: [Int]) -> Int {
        var strA = ""
        for i in A {
            strA += String(format:"%02d", i)
        }
        var strB = ""
        for i in B {
            strB += String(format:"%02d", i)
        }
        let strC = A.count > B.count ? strB : strA
        let strD = A.count > B.count ? strA : strB
        let n = strC.count / 2
        var step = 1
        for i in 0 ..< n {
            if i + step <= n {
                var str = String(strC[strC.index(strC.startIndex, offsetBy: 2*i) ... strC.index(strC.startIndex, offsetBy: 2*(i + step) - 1)]);
                while strD.contains(str) {
                    step += 1
                    if i + step <= n {
                        str = String(strC[strC.index(strC.startIndex, offsetBy: 2*i) ... strC.index(strC.startIndex, offsetBy: 2*(i + step) - 1)]);
                    }
                    else {
                        break
                    }
                }
            }
        }
        
        return step - 1
    }
}

class Solution403 {
    func listOfDepth(_ tree: TreeNode?) -> [ListNode?] {
        var list = [ListNode?]()
        helper(tree, 0, &list)
        return list
    }
    
    func helper(_ tree: TreeNode?,_ depth: Int, _ list: inout [ListNode?]) -> Void {
        if tree != nil {
            if list.count == depth {
                list.append(ListNode(tree!.val))
            }
            else {
                var p = list[depth]
                while p?.next != nil {
                    p = p?.next
                }
                p?.next = ListNode(tree!.val)
            }
            helper(tree?.left, depth + 1, &list)
            helper(tree?.right, depth + 1, &list)
        }
    }
}

class Solution328 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let phead = head?.next
        var p = head
        var q = phead
        while q != nil && q?.next != nil {
            p?.next = q?.next
            p = p?.next
            q?.next = p?.next
            q = q?.next
        }
        p?.next = phead
        return head
    }
}

class Solution366 {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        while root != nil && (root?.left != nil || root?.right != nil) {
            var nodes = [Int]()
            helper(root, &nodes)
            result.append(nodes)
        }
        if root != nil {
            result.append([root!.val])
        }
        return result
    }
    
    func helper(_ root: TreeNode?, _ nodes: inout [Int]) -> Void {
        if root != nil {
            if root?.left != nil && root?.left?.left == nil && root?.left?.right == nil {
                nodes.append(root!.left!.val)
                root?.left = nil
            }
            if root?.right != nil && root?.right?.left == nil && root?.right?.right == nil {
                nodes.append(root!.right!.val)
                root?.right = nil
            }
            helper(root?.left, &nodes)
            helper(root?.right, &nodes)
        }
    }
}
