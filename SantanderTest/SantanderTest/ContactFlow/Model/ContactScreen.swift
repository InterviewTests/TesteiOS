//
//  ContactScreen.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import Foundation

enum CustomTypeField: UInt8, Decodable
{
    case text = 1, telNumber, email
}

struct ContactScreen: Decodable
{
    enum CustomType: UInt8, Decodable
    {
        case field = 1, text, image, checkbox, send
    }
    
    struct Cells: Decodable
    {
        let id: UInt8?
        let type: CustomType?
        let message: String?
        let typefield: CustomTypeField?
        var hidden: Bool?
        let topSpacing: Float?
        let show: UInt8?
        let required: Bool?
        
        enum CodingKeys: String, CodingKey
        {
            case id, type, message, typefield, hidden, topSpacing, show, required
        }
        
        init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try? container.decode(UInt8.self, forKey: .id)
            type = try? container.decode(CustomType.self, forKey: .type)
            message = try? container.decode(String.self, forKey: .message)
            
            // conversão para tipo comum
            if let value = try? container.decode(String.self, forKey: .typefield)
            {
                switch value.lowercased()
                {
                    case "text": typefield = .text
                    case "telnumber": typefield = .telNumber
                    case "email": typefield = .email
                    default: typefield = nil
                }
            }
            else
            {
                typefield = try? container.decode(CustomTypeField.self, forKey: .typefield)
            }
            
            hidden = try? container.decode(Bool.self, forKey: .hidden)
            topSpacing = try? container.decode(Float.self, forKey: .topSpacing)
            show = try? container.decode(UInt8.self, forKey: .show)
            required = try? container.decode(Bool.self, forKey: .required)
        }
    }
    
    var cells: [Cells]?
}
