//
//  Solution165.swift
//  leetcode
//
//  Created by peter on 2020/5/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution165 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let array1 = version1.split(separator: ".")
        let array2 = version2.split(separator: ".")
        var i = 0
        var num1 = 0
        var num2 = 0
        while i < array1.count || i < array2.count  {
            num1 = 0
            num2 = 0
            if i < array1.count {
                num1 = Int(String(array1[i]))!
            }
            if i < array2.count {
                num2 = Int(String(array2[i]))!
            }
            if num1 > num2 {
                return 1
            }
            else if num1 < num2 {
                return -1
            }
            i += 1
        }
        
        return 0
    }
}
