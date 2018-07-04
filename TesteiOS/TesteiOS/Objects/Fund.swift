//
//  Fund.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 7/4/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import Foundation

struct MoreInfo {
    var fund = Float()
    var CDI = Float()
}

struct Info {
    var name = String()
    var data = String()
}


class Fund {
    
    public static let shared = Fund()

    var title = String()
    var fundName = String()
    var whatIs = String()
    var definition = String()
    var riskTitle = String()
    var risk = Int()
    var infoTitle = String()
    
    var moreInfo = [MoreInfo]()
    
    var info = [Info]()
    
    var downInfo = [Info]()
    
}
