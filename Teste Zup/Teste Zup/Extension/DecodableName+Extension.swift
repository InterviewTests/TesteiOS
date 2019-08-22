//
//  DecodableName+Extension.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

extension Decodable {
    static var className: String  {
        return String(describing: self)
    }
}
