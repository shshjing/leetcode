//
//  Solution718.swift
//  leetcode
//
//  Created by peter on 2020/7/1.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

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
