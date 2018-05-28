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
    struct Cell: Decodable {
        
        let id : Int
        let type : Int
        let message : String
        let typefield : Int?
        let hidden : Bool
        let topSpacing : Double
        let show : Int?
        let required : Bool
    }
    
    
    
}
