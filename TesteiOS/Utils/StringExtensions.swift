//
//  StringExtensions.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 30/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

extension String {
    
    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
}
