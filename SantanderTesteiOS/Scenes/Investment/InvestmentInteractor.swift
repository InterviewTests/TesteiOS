//
//  InvestmentInteractor.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit


class InvestmentInteractor  {
    
    var presenter : InvestmentPresenter?
    private var worker : InvestmentWorker?
    
    init() {
        self.presenter  = InvestmentPresenter()
        self.worker     = InvestmentWorker()
    }
    
    func doLoadScreenInfo() {
        worker?.fetchScreenInfo(completion: { screen in
            let response = InvestmentModels.Screen.Response(screenModel: screen)
            self.presenter?.screenPresentation(response: response)
        }, failure: { error in
            
        })
    }
}
