//
// FormCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import Foundation

class FormCell: Decodable {
    let id: Int?
    let type: CellType?
    let message: String?
    let fieldType: FieldType?
    var hidden: Bool?
    let topSpacing: Double?
    let fieldToPresent: Int?
    let required: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case message
        case fieldType = "typefield"
        case hidden
        case topSpacing
        case fieldToPresent = "show"
        case required
    }
}
