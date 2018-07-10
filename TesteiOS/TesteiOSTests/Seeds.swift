//
//  Seeds.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

struct Seeds
{
    struct Cells
    {
        static let text = Cell(id: 1, type: 2, message: "Olá, primeiro se apresente com o seu nome:", typefield: nil, hidden: false, topSpacing: 60.0, show: nil, required: false)
        static let fieldText = Cell(id: 2, type: 1, message: "Nome Completo", typefield: 1, hidden: false, topSpacing: 35.0, show: nil, required: true)
        static let fieldPhone = Cell(id: 6, type: 1, message: "Telefone", typefield: 2, hidden: false, topSpacing: 10.0, show: nil, required: true)
        static let fieldEmail = Cell(id: 4, type: 1, message: "Email", typefield: 3, hidden: true, topSpacing: 35.0, show: nil, required: true)
        static let checkbox = Cell(id: 3, type: 4, message: "Gostaria de cadastrar meu email", typefield: nil, hidden: false, topSpacing: 35.0, show: 4, required: false)
        static let button = Cell(id: 7, type: 5, message: "Enviar", typefield: nil, hidden: false, topSpacing: 10.0, show: nil, required: true)
    }
}
