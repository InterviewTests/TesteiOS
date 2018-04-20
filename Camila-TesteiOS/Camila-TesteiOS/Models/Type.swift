//
//  Type.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit


enum Type: Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
    
    //Isso existe pois a api retorna um caso de string, no entanto acredito ser um erro da api
    static func fromString(_ str: String) -> Type {
        switch str.lowercased() {
        case "field":
            return self.field
        case "text":
            return self.text
        case "image":
            return self.image
        case "checkbox":
            return self.checkbox
        case "send":
            return self.send
        default:
            return self.field
        }
    }
}

