//
//  CellPresenter.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

protocol CellsPresentationLogic {
    func presentFetchedCells(response: Cells.FetchCells.Response)
}

class CellsPresenter: CellsPresentationLogic {
    weak var viewController: CellsDisplayLogic?
    
    // MARK: - Fetch orders
    
    func presentFetchedCells(response: Cells.FetchCells.Response) {
        var displayedCells: [Cells.FetchCells.ViewModel.DisplayedCell] = []
        for cell in response.cells {
            let id = cell.id
            let type = cell.type
            let message = cell.message
            let typefield = cell.typefield
            let hidden = cell.hidden
            let topSpacing = cell.topSpacing
            let show = cell.show
            let required = cell.required
            
            let displayedCell = Cells.FetchCells.ViewModel.DisplayedCell(id: id, type: type, message: message, typefield: typefield, hidden: hidden, topSpacing: topSpacing, show: show, required: required, isSelected: false, isValidated: false)
            displayedCells.append(displayedCell)
        }
        let viewModel = Cells.FetchCells.ViewModel(displayedCells: displayedCells)
        viewController?.displayFetchedCells(viewModel: viewModel)
    }
}
