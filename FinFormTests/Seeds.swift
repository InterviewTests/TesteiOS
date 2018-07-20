//
//  Seeds.swift
//  FinFormTests
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

struct Seeds
{
    struct Cells
    {
        static let firstCell = Cell.init(id: 1, type: Type.field, message: "Message", typeField: TypeField.text, topSpacing: 30.0, show: 1, required: true)
        static let secondCell = Cell.init(id: 2, type: Type.field, message: "message@host.com.br", typeField: TypeField.email, topSpacing: 30.0, show: 1, required: true)
        static let thirdCell = Cell.init(id: 3, type: Type.field, message: "(11) 99999-9999", typeField: TypeField.telNumber, topSpacing: 30.0, show: 1, required: false)
    }
}
