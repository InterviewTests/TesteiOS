//
//  CellModel.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

enum CellType: Int, Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int, Codable {
    case text = 1
    case telNumber = 2
    case email = 3
}

struct CellModel: Codable {
    var id: Int
    var type: CellType
    var message: String
    var typefield: TypeField?
    var hidden: Bool
    var topSpacing: Float
    var show: Int?
    var required: Bool
    
    static func mockCells() -> [CellModel] {
        let textCell = CellModel(id: 1, type: .text, message: "Text Cell", typefield: .text, hidden: false, topSpacing: 18.0, show: nil, required: true)
        let fieldCell = CellModel(id: 1, type: .field, message: "Field Cell", typefield: .text, hidden: false, topSpacing: 18.0, show: nil, required: true)
        let emailCell = CellModel(id: 1, type: .field, message: "Email Cell", typefield: .email, hidden: false, topSpacing: 18.0, show: nil, required: true)
        let phoneCell = CellModel(id: 1, type: .field, message: "Phone Cell", typefield: .telNumber, hidden: false, topSpacing: 18.0, show: nil, required: true)
        let checkboxCell = CellModel(id: 1, type: .checkbox, message: "Checkbox", typefield: .text, hidden: false, topSpacing: 18.0, show: nil, required: true)
        let sendCell = CellModel(id: 1, type: .send, message: "Send", typefield: nil, hidden: false, topSpacing: 18.0, show: nil, required: true)
        
        return [textCell, fieldCell, emailCell, phoneCell, checkboxCell, sendCell]
    }
}
