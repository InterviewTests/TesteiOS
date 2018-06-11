//
//  ListFundConfigurator.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 10/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit

extension ListFundViewController: ListFundPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue: segue)
    }
}

extension ListFundInteractor: ListFundViewControllerOutput
{
    func fetchItems(request: ListFund.Fetch.Request) {
        
    }
}

extension ListFundPresenter: ListFundInteractorOutput
{
    
}

class ListFundConfigurator {
    // MARK: - Object lifecycle
    
    static let sharedInstance = ListFundConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: ListFundViewController)
    {
        let router = ListFundRouter()
        router.viewController = viewController
        
        let presenter = ListFundPresenter()
        presenter.output = viewController
        
        let interactor = ListFundInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
}
