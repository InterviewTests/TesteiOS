//
//  FormCell.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 03/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation


public class FormCell {
    public let id: Int
    public let cellType: CellType
    public let fieldType: FieldType
    public let message: String
    public let topSpacing: Double
    public let show: Int?
    public let hidden: Bool
    public let required: Bool
    
    public var input: Any? = nil

    public init(id: Int, cellType: Int, fieldType: String, message: String, topSpacing: Double, show: Int?, hidden: Bool, required: Bool) throws {

        guard let cellType = CellType(rawValue: cellType) else { throw DomainError.invalidCellType }
        guard let fieldType = FieldType.get(fieldType) else { throw DomainError.invalidFieldType }
        self.id = id
        self.cellType = cellType
        self.fieldType = fieldType
        self.message = message
        self.topSpacing = topSpacing
        self.show = show
        self.hidden = hidden
        self.required = required
    }
}
