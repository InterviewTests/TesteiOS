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
            return
        }
        
        var displayedCells: [Form.FetchCells.ViewModel.DisplayedCells] = []
        
        let viewModel = Form.FetchCells.ViewModel(displayedCells: displayedCells)
        viewController?.displayFetchedCells(viewModel: viewModel)
    }
}
