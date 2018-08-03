//
//  CellResponse.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import Foundation

struct CellResponse: Codable {
    
    var cells:[Cell] = []
}

struct Cell: Codable {
    
    let id:Int
    let type: Type
    let message: String
    let typefield:TypeField?
    let hidden:Bool
    let topSpacing:Double
    let show:Int?
    let required:Bool
    
    enum TypeField: Codable {
        
        case int(Int), string(String)
        
        init(from decoder: Decoder) throws {
            
            if let int = try? decoder.singleValueContainer().decode(Int.self) {
                self = .int(int)
                return
            }
            
            if let string = try? decoder.singleValueContainer().decode(String.self) {
                self = .string(string)
                return
            }
            
            throw TypeFieldError.missingValue
        }
        
        func encode(to encoder: Encoder) throws {
            
        }
        
        func val() -> String {
            return "\(self)"
                .replacingOccurrences(of: "int", with: "")
                .replacingOccurrences(of: "string", with: "")
                .replacingOccurrences(of: "\"", with: "")
                .replacingOccurrences(of: "(", with: "")
                .replacingOccurrences(of: ")", with: "")
        }
        
        enum TypeFieldError:Error {
            case missingValue
        }
    }
}












