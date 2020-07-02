//
//  Solution121.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = Int.max
        for price in prices {
            if price < minPrice {
                minPrice = price
            }
            else if price - minPrice > maxProfit {
                maxProfit = price - minPrice
            }
        }
        return maxProfit
    }
}
