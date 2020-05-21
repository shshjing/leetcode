//
//  Solution3.swift
//  leetcode
//
//  Created by peter on 2020/5/21.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        var maxLength = 1
        
        for i in 0 ..< s.count {
            let startIndex = s.index(s.startIndex, offsetBy: i)
            let endIndex = s.index(startIndex, offsetBy: maxLength)
            let strtempi = s[startIndex ..< endIndex]
            var dic = [String : Int]()
            dic[String(strtempi)] = 1
            var length = 1
            for j in i+1 ..< s.count {
                let startIndex = s.index(s.startIndex, offsetBy: j)
                let endIndex = s.index(startIndex, offsetBy: 1)
                let strtempj = s[startIndex ..< endIndex]
                if dic[String(strtempj)] == nil {
                    dic[String(strtempj)] = 1
                    length += 1
                }
                else {
                    break
                }
                
            }
            
            if length > maxLength {
                maxLength = length
            }
        }
        
        return maxLength
    }
}
