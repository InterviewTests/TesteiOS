//
//  Extension+String.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

extension String{    
    var onlyDigits:String {
        
        let stringArray = self.components(
            separatedBy: NSCharacterSet.decimalDigits.inverted)
        let newString = stringArray.joined(separator: "")
        
        return newString
        
    }
}
