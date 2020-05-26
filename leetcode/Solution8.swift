//
//  Solution8.swift
//  leetcode
//
//  Created by peter on 2020/5/26.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution8 {
    func myAtoi(_ str: String) -> Int {
        
        let charS : Character = " "
        let charP : Character = "+"
        let charM : Character = "-"
        let char0 : Character = "0"
        let char9 : Character = "9"
        
        var ans = 0
        var sign = 1
        var firstMark = false
        
        for char in str {
            if char == charS && firstMark == false {
                continue
            }
            else if char == charS && firstMark == true {
                break
            }
            else if char == charP {
                if firstMark {
                    break
                }
                firstMark = true
                sign = 1
            }
            else if char == charM {
                if firstMark {
                    break
                }
                firstMark = true
                sign = -1
            }
            else if (char >= char0 && char <= char9 ) {
                firstMark = true
                ans = ans * 10 + Int(String(char))!
                if sign == 1 && ans > Int32.max {
                    return Int(Int32.max)
                }
                else if sign == -1 && ans * (-1) < Int32.min {
                    return Int(Int32.min)
                }
            }
            else {
                break
            }
        }
        
        return ans * sign
    }
}
