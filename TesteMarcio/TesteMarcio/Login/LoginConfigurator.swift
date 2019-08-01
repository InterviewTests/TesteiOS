//
//  LoginConfigurator.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit

class LoginConfigurator: ConfiguratorProtocol {
    func config(viewController: UIViewController) {
        guard let vc = viewController as? LoginViewController else {
            return
        }
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let worker = LoginWorker()
        
        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = vc
        router.viewController = vc
    }
}
