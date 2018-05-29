//
//  TitleCellModel.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class TitleCellModel {
    
    let title:String
    
    init(_ screen:Screen?) {
        guard let s = screen else {
            self.title = ""
            return
        }
        self.title = s.title
    }
}
