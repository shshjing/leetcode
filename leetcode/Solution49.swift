//
//  Solution49.swift
//  leetcode
//
//  Created by peter on 2020/6/28.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*
 49. 字母异位词分组
 难度 中等
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 示例:
 输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 
 说明：

 所有输入均为小写字母。
 不考虑答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/group-anagrams
 */

class Solution49 {
    //此方法超时
    func groupAnagramsC(_ strs: [String]) -> [[String]] {
        var result = [[String]]()
        var find = [Bool](repeating: false, count: strs.count)
        
        for i in 0 ..< strs.count {
            if find[i] == true {
                continue
            }
            var anagrams = [String]()
            anagrams.append(strs[i])
            find[i] = true
            var j = i + 1
            while j < strs.count {
                if find[j] == true {
                    j += 1
                    continue
                }
                if isAnagram(strs[i], strs[j]) {
                    find[j] = true
                    anagrams.append(strs[j])
                }
                j += 1
            }
            result.append(anagrams)
        }
        return result
    }
    
    func isAnagram(_ str1 : String, _ str2 : String ) -> Bool {
        if str1.count != str2.count {
            return false
        }
        
        if str1.count == 0 {
            return true
        }
        
        let chars1 = str1.sorted { (_ a : Character, _ b : Character) -> Bool in
            return a > b
        }
        let chars2 = str1.sorted { (_ a : Character, _ b : Character) -> Bool in
            return a > b
        }
        if chars1.elementsEqual(chars2) {
            return true
        }
        return false
        
        var dict1 = [Character : Int]()
        var dict2 = [Character : Int]()
        for char in str1 {
            if dict1[char] == nil {
                dict1[char] = 1
            }
            else {
                dict1[char] = dict1[char]! + 1
            }
        }
        for char in str2 {
            if dict2[char] == nil {
                dict2[char] = 1
            }
            else {
                dict2[char] = dict2[char]! + 1
            }
        }
        
        if dict1.keys.count != dict2.keys.count {
            return false
        }
        
        for char in dict1.keys {
            if dict1[char] != dict2[char] {
                return false
            }
        }
        
        return true
    }
    
    //以排序的字符集为key，在字典中保存字符串
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [[String]]()
        var dict = [[Character] : [String]]()
        for str in strs {
            let chars = str.sorted { (_ a : Character, _ b : Character) -> Bool in
                return a > b
            }
            if dict[chars] == nil {
                var strings = [String]()
                strings.append(str)
                dict[chars] = strings
            }
            else {
                var strings = dict[chars]
                strings!.append(str)
                dict[chars] = strings
            }
        }
        for strings in dict.values {
            result.append(strings)
        }
        return result
    }
}
