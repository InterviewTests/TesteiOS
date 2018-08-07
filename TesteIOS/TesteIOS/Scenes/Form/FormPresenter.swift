//
//  FormPresenter.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FormPresentationLogic {
    func presentFetchedCells(response: Form.FetchCells.Response)
}

class FormPresenter: FormPresentationLogic {
    
    weak var viewController: FormDisplayLogic?
    
    //    MARK: - Fetch
    func presentFetchedCells(response: Form.FetchCells.Response) {
        if let error = response.error {
            viewController?.displayError(viewModel: Form.FetchCells.ViewModel(displayedCells: [], error: error))
            return
        }
        
        var displayedCells: [Form.FetchCells.ViewModel.DisplayedCell] = []
        
        for cell in response.cells {
            let displayedCell = Form.FetchCells.ViewModel.DisplayedCell(id: cell.id, type: cell.type, message: cell.message, typeField: cell.typeField, hidden: cell.hidden, topSpacing: cell.topSpacing, show: cell.show, isRequired: cell.isRequired)
            displayedCells.append(displayedCell)
        }
        
        let viewModel = Form.FetchCells.ViewModel(displayedCells: displayedCells, error: nil)
        viewController?.displayFetchedCells(viewModel: viewModel)
    }
}
