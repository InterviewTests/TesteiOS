//
//  TypeField.swift
//  TesteIOS
//
//  Created by Sidney Silva on 09/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

//Api está retornando telnumber em vez de 2, por isso o tratamento foi necessário.

struct AnyType<T: Codable, U: Codable>: Codable {
    var intValue: T?
    var stringValue: U?
    
    var value: Any? {
        return intValue ?? stringValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let integer = try? container.decode(T.self) {
            self.intValue = integer
        }
        if let string = try? container.decode(U.self) {
            self.stringValue = string
        }
    }
}
