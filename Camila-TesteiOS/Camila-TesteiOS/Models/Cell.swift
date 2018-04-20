//
//  Cell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class Cell {
    var id: Int
    var type: Type
    var message: String
    var typeField: TypeField
    var topSpacing: Float
    var show: Int
    var required: Bool
    var hidden: Bool
    
    init(viewModel: FormModels.FetchCell.ViewModel.DisplayedCell) {
        self.id = viewModel.id
        self.message = viewModel.message
        self.hidden = viewModel.hidden
        self.topSpacing = viewModel.topSpacing
        self.show = viewModel.show
        self.required = viewModel.required
        self.typeField = TypeField(rawValue: viewModel.typefield) ?? TypeField.text
        self.type = Type(rawValue: viewModel.type) ?? Type.field
    }
    
}

