//
//  Cell.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation
import UIKit

struct FormCell: Decodable {
    let id: Int
    let type: FormCellType
    let message: String
    let fieldType: FieldType?
    var isHidden: Bool
    let topSpacing: CGFloat
    let fieldToPresent: Int?
    let isRequired: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case message
        case fieldType = "typefield"
        case isHidden = "hidden"
        case topSpacing
        case fieldToPresent = "show"
        case isRequired = "required"
    }
    
    var tag: String {
        switch type {
        case .field:
            return fieldType != nil ? "field-\(fieldType!.tag)" : "field"
        case .text:
            return "text"
        case .image:
            return "image"
        case .checkbox:
            return "checkbox"
        case .send:
            return "send"
        }
    }
}
