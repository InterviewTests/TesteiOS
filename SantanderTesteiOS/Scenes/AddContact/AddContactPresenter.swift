//
//  AddContactPresenter.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

protocol CellPresentation {
    func cellsPresentation(response : AddContactModels.Cells.Response)
}

class AddContactPresenter : CellPresentation {
    
    weak var viewController : AddContactDisplayCells?
    
    func cellsPresentation(response: AddContactModels.Cells.Response) {
        var result : [CellViewModel] = []
        for cell in response.cells {
            result.append(CellViewModel(cell: cell))
        }
        let viewModel = AddContactModels.Cells.ViewModel(viewModel: result)
        viewController?.displayCell(viewModel: viewModel)
    }
    
}
