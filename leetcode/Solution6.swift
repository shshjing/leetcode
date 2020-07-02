//
//  Solution6.swift
//  leetcode
//
//  Created by peter on 2020/5/25.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 6. Z 字形变换
 难度 中等
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

 请你实现这个将字符串进行指定行数变换的函数：
 string convert(string s, int numRows);
 
 示例 1:
 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 
 示例 2:
 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:

 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zigzag-conversion
 */
class Solution6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if numRows == 1 {
            return s
        }
        
        let chars = [Character](s)
        var table = [[String]](repeating: [String](repeating: "", count: chars.count), count: numRows)
        var i = 0
        var row = 0
        var column = 0
        var columnStep = false
        
        while i < chars.count {
            if row == 0 {
                columnStep = false
            }
            else if row == numRows - 1 {
                columnStep = true
            }
            
            table[row][column] = String(chars[i])
            
            if columnStep {
                column += 1
                row -= 1
            }
            else {
                row += 1
            }
            i += 1
        }
        var str = ""
        let rowNum = numRows > chars.count ? chars.count : numRows;
        
        for i in 0 ..< rowNum   {
            for j in 0 ..< column + 1 {
                str += table[i][j]
            }
        }
        return str
    }
}
