//
//  Form.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct Form: Codable {
    
    let cells: [Cell]
    
    struct Cell: Codable {
        let id: Int
        let type: FieldType
        let message: String?
        let typefield: FieldType.TextFieldType?
        let hidden: Bool
        let topSpacing: Float
        let show: Int?
        let required: Bool
        
        enum FieldType: Int, Codable {
            case textField = 1
            case label
            case image
            case checkbox
            case send
            
            enum TextFieldType: Int, Codable {
                case text = 1
                case phoneNumber
                case email
            }
        }
    }
}

extension Form.Cell.FieldType.TextFieldType {
    
    init?(from string: String) {
        switch string {
        case "text":
            self.init(rawValue: 1)
            break
        case "telnumber":
            self.init(rawValue: 2)
            break
        case "email":
            self.init(rawValue: 3)
            break
        default:
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let stringValue = try? container.decode(String.self) {
            self.init(from: stringValue)!
            return
        }
        let intValue = try container.decode(Int.self)
        self.init(rawValue: intValue)!
    }
}
