//
//  riskCellModel.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class RiskCellModel {
    let risk:Int
    init(_ screen:Screen?) {
        guard let s = screen else {
            self.risk = 0
            return
        }
        self.risk = s.risk
    }
    
}
