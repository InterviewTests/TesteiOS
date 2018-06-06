//
//  ThreeLabelTitleModel.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class ThreeLabelCellModel {
    let downInfo:DataInfo = DataInfo(name: "", data: "")
    
    let value1:String?
    let value2:String?
    let value3:String?
    let btnURL: String?
    
    init(_ value1:String?,_ value2:String?,_ value3:String?,_ btnURL:String?) {
        
        self.value1 = value1
        self.value2 = value2
        self.value3 = value3
        self.btnURL = btnURL
        
    }
    
}
