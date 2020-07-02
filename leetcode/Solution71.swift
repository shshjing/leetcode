//
//  Solution71.swift
//  leetcode
//
//  Created by peter on 2020/7/2.
//  Copyright © 2020 peter. All rights reserved.
//

import Foundation

class Solution71 {
    func simplifyPath(_ path: String) -> String {
        let subStrings = path.split(separator: "/")
        let subs = subStrings.compactMap({"\($0)"})
        var pathItems = [String]()
        for item in subs {
            if item == "." {
                continue
            }
            else if item == ".." {
                if pathItems.count > 0 {
                    pathItems.removeLast()
                }
            }
            else {
                pathItems.append(item)
            }
        }
        var result = ""
        for item in pathItems {
            result += String("/\(item)")
        }
        if result.count == 0 {
            result = "/"
        }
        return result
    }
}
