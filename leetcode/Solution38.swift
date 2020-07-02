//
//  Solution38.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution38 {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        let chars = [Character](countAndSay(n - 1))
        var count = 1
        var lastChar = chars[0]
        var outStr = ""
        var i = 1
        
        while i < chars.count {
            if lastChar != chars[i] {
                outStr = outStr + "\(count)\(lastChar)"
                count = 1
                lastChar = chars[i]
            }
            else {
                count += 1
            }
            i += 1
        }
        outStr = outStr + "\(count)\(lastChar)"
        return outStr
    }
}
