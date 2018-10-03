//
//  Form.swift
//  DesafioSantander
//
//  Created by Fernanda de Lima on 04/09/2018.
//  Copyright © 2018 FeLima. All rights reserved.
//

import Foundation
import ObjectMapper

struct cellStruct {
    var id:Int?
    var type:Int?
    var message:String?
    var typefield:Any?
    var hidden:Bool?
    var topSpacing: Int?
    var show:Int?
    var required:Bool?
}

struct FormModal{
    var cells:[cellStruct]?

    init(cells: [cellStruct]) {
        self.cells = cells
    }
}


extension cellStruct: Mappable{
    init?(map: Map){
        mapping(map: map)
    }
    
    mutating func mapping(map:Map){
        id          <- map["id"]
        type        <- map["type"]
        message     <- map["message"]
        typefield   <- map["typefield"]
        hidden      <- map["hidden"]
        topSpacing  <- map["topSpacing"]
        show        <- map["show"]
        required    <- map["required"]
    }
}

extension FormModal:Mappable{
    init?(map: Map){
        mapping(map: map)
    }
    
    mutating func mapping(map:Map){
        cells     <- map["cells"]
    }
}

