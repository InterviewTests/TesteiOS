//
//  Cell.swift
//  TesteiOS
//
//  Created by Macbook on 07/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import Foundation

enum CodingKeys: String, CodingKey {
    case id
    case type
    case message
    case typefield
    case hidden
    case topSpacing
    case show
    case required
}

struct Cell : Decodable {
    var id : Int
    var type : Int
    var message : String
    var typefield : String?
    var hidden : Bool
    var topSpacing : Double
    var show : Int?
    var required : Bool
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container (keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self,forKey:CodingKeys.id)
        type = try container.decode(Int.self,forKey:CodingKeys.type)
        message = try container.decode(String.self,forKey:CodingKeys.message)
        
        if let value = try? container.decode(Int.self, forKey: .typefield) {
            typefield = String(value)
        } else {
            typefield = try container.decode(String?.self, forKey: .typefield)
        }
        
        hidden = try container.decode(Bool.self,forKey:CodingKeys.hidden)
        topSpacing = try container.decode(Double.self,forKey:CodingKeys.topSpacing)
        show = try container.decode(Int?.self,forKey:CodingKeys.show)
        required = try container.decode(Bool.self,forKey:CodingKeys.required)
    }
}
