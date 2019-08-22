//
//  FormFormat.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

public struct FormFormat: Decodable {
    let cells: [Cell]?
}

public struct Cell: Decodable {
    let id: Int
    let type: Int
    let message: String
    let typeField: Int?
   
}
