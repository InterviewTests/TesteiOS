//
//  FormCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

struct FormCellsList: Decodable {
    let cells: [FormCell]
}

struct FormCell: Decodable {
    let id: Int?
    let type: Int?
    let message: String?
//    let typefield: Int? // TODO
    let hidden: Bool?
    let topSpacing: Int?
    let show: Int?
    let required: Bool?
}
