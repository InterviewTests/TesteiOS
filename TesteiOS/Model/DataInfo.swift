//
//  Person.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

struct DataInfo: Codable {
    
    let name:String
    let data:String?
    
    init(name:String,data:String?) {
        self.name = name
        self.data = data
        
    }
    
}
