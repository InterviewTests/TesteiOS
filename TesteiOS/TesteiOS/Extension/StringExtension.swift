//
//  StringExtension.swift
//  TesteiOS
//
//  Created by Nicolau on 18/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import Foundation

extension String {
    func removing(elementsOf arr: [String]) -> String {
        var newString = ""
        let charArray = Array(self)
        
        for c in charArray {
            if !arr.contains(String(c)) {
                newString.append(c)
            }
        }
        
        return newString
    }
    
    func inserting(_ newElement: String, at i: Int) -> String {
        var newString = ""
        let charArray = Array(self)
        
        for j in 0 ..< charArray.count {
            if i == j {
                newString.append(newElement)
            }
            newString.append(charArray[j])
        }
        
        return newString
    }
    
    func substring(from index: Int) -> String {
        var newString = ""
        let charArray = Array(self)
        
        for i in 0 ..< charArray.count {
            if i >= index {
                newString.append(charArray[i])
            }
        }
        
        return newString
    }
}
