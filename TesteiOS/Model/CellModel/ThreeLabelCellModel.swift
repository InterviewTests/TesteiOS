//
//  ThreeLabelTitleModel.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class ThreeLabelCellModel {
    let value1:String?
    let value2:Double?
    let value3:Double?
    let btnURL: String?
    
    init(_ value1:String?,_ value2:Double?,_ value3:Double?,_ btnURL:String?) {
        
        guard let v1 = value1,
              let v2 = value2,
              let v3 = value3,
              let b = btnURL
              else {
                self.value1 = 0
                self.value2 = 0
                self.value3 = 0
                self.btnURL = nil
                return
            }
        self.value1 = v1
        self.value2 = v2
        self.value3 = v3
        self.btnURL = b
        
    }
    
}
