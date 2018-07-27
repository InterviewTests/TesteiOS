//
//  String+Extensions.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 23/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

extension String{
    
    func isNumeric() -> Bool{
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    
    func subString(loc:Int,length:Int) -> String{
        let start = self.index(self.startIndex, offsetBy: loc)
        let end = self.index(self.endIndex, offsetBy: -(self.count - (loc + length)))
        let range = start..<end
        
        let mySubstring = self[range]
        return String(mySubstring)
    }
    
    static func loc(_ loc:String) -> String{
        var result = Bundle.main.localizedString(forKey: loc, value: nil, table: nil)
        
        if result == loc {
            result = Bundle.main.localizedString(forKey: loc, value: nil, table: "Form")
        } else if result == loc {
            result = Bundle.main.localizedString(forKey: loc, value: nil, table: "Investment")
        }
        
        return result
    }
    
}
