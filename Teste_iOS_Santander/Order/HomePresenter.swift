//
//  HomePresenter.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentListInvest(response: HomeListScene.getInvestData.Response)
    func presentListForm(response: HomeListScene.getFormData.Response)
}

class HomePresenter: HomePresentationLogic {

    var viewController: HomeDisplayLogic?

    func presentListInvest(response: HomeListScene.getInvestData.Response) {
        let viewModel = HomeListScene.getInvestData.ViewModel(displayInvestEntries: response.newInvestimento)
        viewController?.displayInvestEntries(viewModel: viewModel)
    }
    
    func presentListForm(response: HomeListScene.getFormData.Response) {
        let viewModel = HomeListScene.getFormData.ViewModel(displayFormEntries: response.newFormulario)
        viewController?.displayFormEntries(viewModel: viewModel)
    }
    
}
