//
//  Solution118.swift
//  leetcode
//
//  Created by videopls on 2020/8/3.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution118 {
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

/**
* Definition for a Node.
*/
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution116 {
    func connect(_ root: Node?) -> Node? {
        var list = [Node]()
        var count = 0
        if root != nil {
            root?.next = nil
            list.append(root!)
            while count < list.count {
                let listCount = list.count
                for i in count ..< listCount {
                    let tempNode = list[i]
                    if tempNode.left != nil {
                        list.append(tempNode.left!)
                    }
                    if tempNode.right != nil {
                        list.append(tempNode.right!)
                    }
                }
                
                if listCount < list.count - 1 {
                    for i in listCount ..< list.count - 1 {
                        let tempNode = list[i]
                        tempNode.next = list[i + 1]
                    }
                    list[list.count - 1].next = nil
                }
                
                count = listCount
            }
        }
        return root
    }
}
