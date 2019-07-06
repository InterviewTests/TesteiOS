//
// FieldType.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import Foundation

enum FieldType: Int, Decodable {
    case unknown = 0
    case text = 1
    case phone = 2
    case email = 3
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let typeAsInt = try? container.decode(Int.self) {
            self = FieldType(rawValue: typeAsInt) ?? .unknown
            return
        }
        
        if let typeAsString = try? container.decode(String.self) {
            self = FieldType(string: typeAsString)
            return
        }
        
        self = .unknown
    }
    
    init(string: String) {
        switch string {
        case "telnumber":
            self = .phone
        default:
            self = .unknown
        }
    }
}
