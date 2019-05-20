//
//  FormResponse.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation



public struct FormResponse: Codable {
    public var cells: [Form]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cells = try container.decode([Form].self, forKey: .cells)
    }
    
    enum CodingKeys: String, CodingKey {
        case cells
    }
}

public struct Form: Codable {
    
    public var field: FormField
    public var fieldType: FormFieldType?
    public var message: String
    public var hidden: Bool
    public var topSpacing: Int
    public var required: Bool
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        field = try container.decode(FormField.self, forKey: .field)
        message = try container.decode(String.self, forKey: .message)
        hidden = try container.decode(Bool.self, forKey: .hidden)
        topSpacing = try container.decode(Int.self, forKey: .topSpacing)
        required = try container.decode(Bool.self, forKey: .required)
        
        do {
            fieldType = try container.decode(FormFieldType.self, forKey: .fieldType)
        } catch {
            fieldType = nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case field = "type"
        case fieldType = "typeField"
        case message
        case hidden
        case topSpacing
        case required
    }
    
}

public enum FormField: Int, Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
    
    public init(from decoder: Decoder) throws {
        let singleValue = try decoder.singleValueContainer()
        if let formField = FormField(rawValue: try singleValue.decode(Int.self)) {
            self = formField
            return
        }
        self = .field
    }
}

public enum FormFieldType: Int, Codable {
    case text = 1
    case telNumber = 2
    case email = 3
    
    public init(from decoder: Decoder) throws {
        let singleValue = try decoder.singleValueContainer()
        if let formFieldType = FormFieldType(rawValue: try singleValue.decode(Int.self)) {
            self = formFieldType
            return
        }
        self = .text
    }
}
