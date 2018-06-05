//
//  FormDataModel.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

struct FormDataModel : Decodable {
    
    let cells: [Cell]
    
}

struct Cell: Decodable {
    
    let id : Int
    let type : Int
    let message : String
    let typefield : String?
    let hidden : Bool
    let topSpacing : Double
    let show : Int?
    let required : Bool
    
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
    
    enum CellTypes: Int {
        case field = 1
        case text = 2
        case image = 3
        case checkbox = 4
        case send = 5
    }
    
    enum CellTypeField: String {
        case text = "1"
        case telNumberInt = "2"
        case telNumberStr = "telnumber"
        case email = "3"
    }
    
    
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
