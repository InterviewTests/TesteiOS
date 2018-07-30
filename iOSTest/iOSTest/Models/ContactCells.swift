//
//  ContactCell.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import Foundation

struct ContactCells: Codable {
    let cells: [Cell]
}

struct Cell: Codable {
    let id: Int
    let type: Int
    let message: String
    let typefield: Typefield?
    let hidden: Bool
    let topSpacing: Float
    let show: Int?
    let required: Bool
}

enum Typefield: Codable {

    func encode(to encoder: Encoder) throws {

    }

    case integer(Int), string(String)

    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .integer(int)
            return
        }

        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }

        throw QuantumError.missingValue
    }

    enum QuantumError:Error {
        case missingValue
    }
}

