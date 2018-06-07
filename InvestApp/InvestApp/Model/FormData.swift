//
//  FormData.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//


import Foundation

struct FormCell: Decodable {

    let id: Int?
    let type: Int?
    let message: String?
    let typefield: String?
    let hidden: Bool?
    let topSpacing: Double?
    let required: Bool?

}

struct FormData: Decodable {

    let cells: [FormCell]?
}
