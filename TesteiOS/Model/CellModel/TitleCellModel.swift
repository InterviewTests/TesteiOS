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
    let whatIs:String
    let riskTitle:String
    let infoTitle:String

    
    init(_ screen:Screen?) {
        guard let s = screen else {
            self.title = ""
            self.whatIs = ""
            self.riskTitle = ""
            self.infoTitle = ""
            return
        }
        self.title = s.title
        self.whatIs = s.whatIs
        self.riskTitle = s.riskTitle
        self.infoTitle = s.infoTitle
    
    }
   
}
