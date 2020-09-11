//
//  Solution122.swift
//  leetcode
//
//  Created by videopls on 2020/8/12.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution122 {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count < 2  {
            return 0
        }
        
        var lastPrice = prices[0];
        var maxProfit = 0
        
        for v in prices {
            if v - lastPrice > 0 {
                maxProfit += v - lastPrice
            }
            lastPrice = v
        }
        
        return maxProfit
    }
}
