//
//  Solution5.swift
//  leetcode
//
//  Created by peter on 2020/5/22.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution5 {
    func longestPalindrome(_ s: String) -> String {
        
        if s.count < 1 {
            return ""
        }
        
        var start = 0
        var end = 0
        
        for i in 0 ..< s.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i+1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        let chars = [Character](s)
        return String(chars[start ... end])
    }
    
    func expandAroundCenter(_ s : String, _ left : Int, _ right : Int) -> Int {
        var l = left
        var r = right
        let chars = [Character](s)
        while l > 0 && r < s.count && chars[left] == chars[right] {
            l -= 1
            r += 1
        }
        return r - l - 1;
    }
}
