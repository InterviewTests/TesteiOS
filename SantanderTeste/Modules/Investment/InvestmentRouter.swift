//
//  InvestmentRouter.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class InvestmentRouter: BaseRouter {
    
    class func instantiate() -> InvestmentViewController {
        let vc = InvestmentViewController(nibName: "InvestmentView", bundle: .main)
        vc.title = "Investimento"
        
        let presenter = InvestmentPresenter()
        let interactor = InvestmentInteractor()
        
        vc.presenter = presenter
        presenter.delegate = vc
        
        presenter.interactor = interactor
        interactor.delegate = presenter
        
        return vc
    }
}
