//
//  Solution95.swift
//  leetcode
//
//  Created by peter on 2020/7/13.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

/*

 95. 不同的二叉搜索树 II
 难度 中等
 
 给定一个整数 n，生成所有由 1 ... n 为节点所组成的 二叉搜索树 。

 示例：
 输入：3
 输出：
 [
   [1,null,3,2],
   [3,2,null,1],
   [3,1,null,null,2],
   [2,1,3],
   [1,null,2,null,3]
 ]
 解释：
 以上的输出对应以下 5 种不同结构的二叉搜索树：

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-binary-search-trees-ii
*/

class Solution95 {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        return generate_tree(1, n)
    }
    
    func generate_tree(_ start: Int, _ end: Int) -> [TreeNode?] {
        var allTree = [TreeNode?]()
        if start > end {
            allTree.append(nil);
            return allTree
        }
        
        for i in start ... end {
            let leftTree = generate_tree(start, i - 1)
            let rightTree = generate_tree(i + 1, end)
            for l in leftTree {
                for r in rightTree {
                    let currentTree = TreeNode(i)
                    currentTree.left = l
                    currentTree.right = r
                    allTree.append(currentTree)
                }
            }
        }
        return allTree
    }
    
    func numTrees(_ n: Int) -> Int {
        var c = 1
        for i in 0 ..< n {
            c = c * 2 * (2 * i + 1)/(i + 2)
        }
        return c
    }
}
