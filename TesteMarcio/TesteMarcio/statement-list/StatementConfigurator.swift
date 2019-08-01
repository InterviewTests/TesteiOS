//
//  StatementConfigurator.swift
//  TesteMarcio
//
//  Created by marcio-mac on 29/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit

class StatementConfigurator: ConfiguratorProtocol {
    func config(viewController: UIViewController) {
        guard let vc = viewController as? StatementListViewController else {
            return
        }
        
        let interactor = StatementInteractor()
        let presenter = StatementPresenter()
        let router = StatementRouter()
        let worker = StatementWorker()
        
        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = vc
        router.viewController = vc
    }
    
    
}
