//
//  TextCellModel.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class TextCellModel {
    
    let definition:String
    init(_ screen:Screen?) {
        guard let s = screen else {
            self.definition = ""
            return
        }
        self.definition = s.definition
    }
}
