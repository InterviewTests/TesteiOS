//
//  RootCell.swift
//  SantanderTeste
//
//  Created by Danilo Henrique on 20/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct RootCell: Decodable {
    
    let cells: [Cell]!
}
struct Cell: Decodable {
    let id: Int?
    let type: Int?
    let message: String?
    let typefield: MetadataType?
    let hidden: Bool?
    let topSpacing: CGFloat?
    let show: Int?
    let required: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case message = "message"
        case typefield = "typefield"
        case hidden = "hidden"
        case topSpacing = "topSpacing"
        case show = "show"
        case required = "required"
        
    }
}



