//
//  Enum.swift
//  SantanderTeste
//
//  Created by Nayara on 05/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import Foundation
enum MetadataType: Codable {
    case int(Int)
    case string(String)
    func encode(to encoder: Encoder) throws {
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = try .int(container.decode(Int.self))
        } catch DecodingError.typeMismatch {
            do {
                self = try .string(container.decode(String.self))
            } catch DecodingError.typeMismatch {
                throw DecodingError.typeMismatch(MetadataType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
            }
        }
}
   
}
