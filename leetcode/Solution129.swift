//
//  Solution129.swift
//  leetcode
//
//  Created by videopls on 2020/7/24.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution129 {
    
    var sum = 0
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        helper(root, 0)
        return sum
    }
    
    func helper(_ root: TreeNode?, _ num: Int) -> Void {
        if root != nil {
            if root?.left == nil && root?.right == nil {
                sum += num * 10 + root!.val
            }
            else {
                helper(root?.left, num * 10 + root!.val)
                helper(root?.right, num * 10 + root!.val)
            }
        }
    }
}

//173
class BSTIterator {

    var list = [TreeNode]()
    var index = 0
    init(_ root: TreeNode?) {
        helper(root)
    }
    
    func helper(_ root: TreeNode?) -> Void {
        if root != nil {
            helper(root?.left)
            list.append(root!)
            helper(root?.right)
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        if index < list.count {
            let temp = index
            index += 1
            return list[temp].val
        }
        return -1
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        if index < list.count {
            return true
        }
        return false
    }
}

class SolutionSort {
    func sortString(_ charString: inout [Character]) -> [Character] {
        if charString.count == 0 {
            return charString
        }
        var left = 0
        var right = charString.count - 1
        while left < right {
            while charString[right] <= Character("Z") {
                right -= 1
            }
            
            while charString[left] >= Character("a") {
                left += 1
            }
            
            let temp = charString[right]
            charString[right] = charString[left]
            charString[left] = temp
            right -= 1
            left += 1
        }
        
        return charString
    }
    
    
}

extension Character
{
    func toInt() -> Int
    {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars
        {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
}
