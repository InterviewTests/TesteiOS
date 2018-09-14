//
//  FormCell.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct FormItem: Codable {
    let id: Int
    let type: FormFieldType
    let message: String?
    let typefield: FormFieldType.TextFieldType?
    let hidden: Bool
    let topSpacing: Float
    let show: Int?
    let required: Bool
}
