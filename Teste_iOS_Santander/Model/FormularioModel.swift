//
//  FormularioModel.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit
import ObjectMapper

struct FormularioModel: Mappable {
    
    var formtData: [FormObjectMapper]
    
    init?(map: Map) {
        do {
            formtData = try map.value("cells")
        } catch {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {
            formtData <- map["cells"]
    }

}

struct FormObjectMapper: Mappable {
    var id: Int?
    var type: Int?
    var message: String?
    var typefield: Int? 
    var hidden: Bool?
    var topSpacing: Float?
    var show: Int?
    var required: Bool?
    
    init?(map: Map) {
        //        id <- map["id"]
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        message <- map["message"]
        typefield <- map["typefield"]
        hidden <- map["hidden"]
        topSpacing <- map["topSpacing"]
        show <- map["show"]
        required <- map["required"]
    }
}
