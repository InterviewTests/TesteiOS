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
    let type: Int
    let message: String
    let typefield:String?
    let hidden:Bool
    let topSpacing:Double
    let show:Int
    let required:Bool
}
