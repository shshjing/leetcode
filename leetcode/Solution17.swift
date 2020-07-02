//
//  Solution17.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 17. 电话号码的字母组合
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 示例:
 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 */

class Solution17 {
    
    let letter = [
                "2": ["a", "b", "c"],
                "3": ["d", "e", "f"],
                "4": ["g", "h", "i"],
                "5": ["j", "k", "l"],
                "6": ["m", "n", "o"],
                "7": ["p", "q", "r", "s"],
                "8": ["t", "u", "v"],
                "9": ["w", "x", "y", "z"]
            ]
    
    var output = [String]()
    
    func letterCombinations(_ digits: String) -> [String] {
        
        for i in digits {
            output = append(output, letter[String(i)]!)
        }
        
        return output
    }
    
    func append(_ array : [String], _ letter : [String]) -> [String] {
        
        var arr: [String] = []
        for l in letter{
            if(array.count > 0){
                for s in array{
                    arr.append(s + l)
                }
            }else{
                arr.append(l)
            }
        }
        return arr

    }
}
