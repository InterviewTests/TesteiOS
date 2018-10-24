//
//  ContatoModel.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

struct FormModel: Codable {
    var cells: [Cell]
}

struct Cell: Codable {
    let id, type: Int
    let message: String
    let typefield: Typefield
    let hidden: Bool
    let topSpacing: Double
    let show: Int?
    let required: Bool
    var tag: Int?
    
    // variáveis que armazenarão o data entry nos campos
    var stringData: String?
    var intData: Int?
    var booleanData: Bool? = false
    var tapGestureRecognizer: UITapGestureRecognizer?
    var state: FieldValidationState?

    enum CodingKeys: String, CodingKey {
        case id, type, message, typefield, hidden, topSpacing, show, required, tag
    }
}

enum FieldValidationState{
    case empty
    case valid
    case invalid
}

enum Typefield: Codable, Equatable {
    case integer(Int)
    case string(String)
    case null
    
    init(value: Int){
        self = .integer(value)
    }

    init(string: String){
        self = .string(string)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(Typefield.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: Constants.Form.parseError))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

// MARK: Convenience initializers

extension FormModel {
    init?(data: Data) {
        guard var me = try? JSONDecoder().decode(FormModel.self, from: data) else { return nil }

        for(key, _) in me.cells.enumerated(){
            me.cells[key].tag = Int(arc4random_uniform(100000))
        }
        
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Cell {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Cell.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
