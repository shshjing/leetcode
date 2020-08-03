//
//  Solution119.swift
//  leetcode
//
//  Created by videopls on 2020/8/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution119 {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        if numRows == 0 {
            return result
        }
        for i in 1 ... numRows {
            if i == 1 {
                result.append([1])
            }
            else if i == 2 {
                result.append([1,1])
            }
            else {
                let list1 = result[i - 2]
                var list2 = [Int]()
                list2.append(1)
                for j in 0 ..< list1.count {
                    if j == 0 {
                        continue
                    }
                    else {
                        list2.append(list1[j - 1] + list1[j])
                    }
                }
                list2.append(1)
                result.append(list2)
            }
        }
        
        return result
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        let t = generate(rowIndex + 1)
        return t[rowIndex]
    }
}
