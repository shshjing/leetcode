//
//  Solution93.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

 93. 复原IP地址
 难度 中等
 
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。

 有效的 IP 地址正好由四个整数（每个整数位于 0 到 255 之间组成），整数之间用 '.' 分隔。

 示例:
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/restore-ip-addresses 
*/

class Solution93 {
    var result = [String]()
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {
            return result
        }
        let sc = [Character](s)
        var ip = [String]()
        backtrack(sc, &ip, 0, 3)
        return result
    }
    
    func backtrack(_ sc : [Character], _ ip : inout [String], _ pos : Int, _ residue: Int) -> Void {
        if ip.count == 4 && Int(ip[3])! <= 255 && (ip[3].count == 1 || !ip[3].hasPrefix("0")) {
            result.append(ip.joined(separator: "."))
        }
        for i in pos+1 ..< sc.count {
            let s = String(sc[pos ..< i])
            if Int(s)! <= 255 && (s.count == 1 || !s.hasPrefix("0"))  {
                ip.append(s)
                if residue == 1 {
                    ip.append(String(sc[i ..< sc.count]))
                }
                backtrack(sc, &ip, i, residue - 1)
                ip.removeLast()
                if residue == 1 {
                    ip.removeLast()
                }
            }
        }
    }
}
