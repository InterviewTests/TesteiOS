//
//  FormCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

enum TypeField: Int {
    case text = 1
    case telNumber = 2
    case email = 3
}

enum Type: Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

struct FormCell {
    let id: Int?
    let type: Type?
    let message: String?
    let typefield: TypeField?
    let hidden: Bool?
    let topSpacing: Int?
    let show: Int?
    let required: Bool?
}

struct FormCellsList: Decodable {
    let cells: [FormCellModel]
}

struct FormCellModel: Decodable {
    let id: Int?
    let type: Int?
    let message: String?
    let typefield: AnyDecodable?
    let hidden: Bool?
    let topSpacing: Int?
    let show: Int?
    let required: Bool?
}

public struct AnyDecodable: Decodable {
    
    let value: Any
    
    public init<T>(_ value: T?) {
        self.value = value ?? ()
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self.init(string)
        } else if let int = try? container.decode(Int.self) {
            self.init(int)
        } else {
            self.init(())
        }
    }
}
