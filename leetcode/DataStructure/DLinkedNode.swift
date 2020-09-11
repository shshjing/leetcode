//
//  DLinkedNode.swift
//  leetcode
//
//  Created by videopls on 2020/8/10.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

public class DLinkedNode {
    
    public var key: Int
    public var val: Int
    public var prev: DLinkedNode?
    public var next: DLinkedNode?
    
    public init(_ key: Int, value: Int) {
        self.key = key
        self.val = value
        self.prev = nil
        self.next = nil
    }
}

