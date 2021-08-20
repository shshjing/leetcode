//
//  Solution80.swift
//  leetcode
//
//  Created by 景生善 on 2020/7/12.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution80 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 3 {
            return nums.count
        }
        var i = 0
        var j = 0
        var count = 0
        var lastvar = 0
        lastvar = nums[0]
        while j < nums.count {
            if nums[j] == lastvar  {
                count += 1
            }
            else {
                count = 1
                lastvar = nums[j]
            }
            if count < 3 {
                nums[i] = nums[j]
                i += 1
                j += 1
            }
            else {
                j += 1
            }
        }
        return i
    }
}

class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var p : ListNode? = head
        var q : ListNode? = head?.next
        while q != nil {
            if p?.val != q?.val {
                p?.next = q
                p = p?.next
            }
            q = q?.next
        }
        p?.next = nil
        return head
    }
}

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


class Solution90 {
    var result = [String]()
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {
            return result
        }
        let sc = [Character](s)
        var ip = [String]()
        backtrack(sc, &ip, 0, 3)
        return result
    }
    
    func backtrack(_ sc : [Character], _ ip : inout [String], _ pos : Int, _ residue: Int) -> Void {
        if ip.count == 4 && Int(ip[3])! <= 255 && (ip[3].count == 1 || !ip[3].hasPrefix("0")) {
            result.append(ip.joined(separator: "."))
        }
        for i in pos+1 ..< sc.count {
            let s = String(sc[pos ..< i])
            if Int(s)! <= 255 && (s.count == 1 || !s.hasPrefix("0"))  {
                ip.append(s)
                if residue == 1 {
                    ip.append(String(sc[i ..< sc.count]))
                }
                backtrack(sc, &ip, i, residue - 1)
                ip.removeLast()
                if residue == 1 {
                    ip.removeLast()
                }
            }
        }
    }
}
