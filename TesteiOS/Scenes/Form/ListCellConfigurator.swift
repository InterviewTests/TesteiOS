//
//  ListCellConfigurator.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit

extension ListCellViewController: ListCellPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue: segue)
    }
}

extension ListCellInteractor: ListCellViewControllerOutput
{
    func fetchItems(request: ListCell.Fetch.Request) {
        
    }
}

extension ListCellPresenter: ListCellInteractorOutput
{
    
}

class ListCellConfigurator {
    // MARK: - Object lifecycle
    
    static let sharedInstance = ListCellConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: ListCellViewController)
    {
        let router = ListCellRouter()
        router.viewController = viewController
        
        let presenter = ListCellPresenter()
        presenter.output = viewController
        
        let interactor = ListCellInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
}
