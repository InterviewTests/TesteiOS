//
//  CellEntity.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 24/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import ObjectMapper

class Cells : Mappable{
    
    var data : [CellEntity]?
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        self.data <- map["cells"]
    }
}
class CellEntity: Mappable {
    
    var id: Int?
    var type: Int?
    var message: String?
    var typefield: String?
    var typeFieldNumber: Int?
    var hidden: Bool?
    var topSpacing: Int?
    var required: Bool?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        self.id <- map["id"]
        self.type <- map["type"]
        self.message <- map["message"]
        self.typefield <- map["typefield"]
        self.hidden <- map["hidden"]
        self.required <- map["required"]
        
        if(self.typefield == nil){
            self.typeFieldNumber <- map["typefield"]
        }
    }
    
}
