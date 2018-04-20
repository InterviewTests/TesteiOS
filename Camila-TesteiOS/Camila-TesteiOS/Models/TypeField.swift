//
//  TypeField.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

enum TypeField: Int{
    case text = 1
    case telNumber = 2
    case email = 3
    
    //Isso existe pois a api retorna um caso de string, no entanto acredito ser um erro da api
    static func fromString(_ str: String) -> TypeField {
        switch str.lowercased() {
        case "text":
            return self.text
        case "telnumer":
            return self.telNumber
        case "email":
            return self.email
        default:
            return self.text
        }
    }
}

