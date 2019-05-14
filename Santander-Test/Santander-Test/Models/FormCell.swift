//
//  FormCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

struct FormCellsList: Decodable {
    let cells: [FormCell]
}

struct FormCell: Decodable {
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
