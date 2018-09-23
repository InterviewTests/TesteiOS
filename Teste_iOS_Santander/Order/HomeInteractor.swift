//
//  HomeInteractor.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit


protocol HomeLogic
{
    func getInvestData(request: HomeListScene.getInvestData.Request)
    func getFormData(request: HomeListScene.getFormData.Request)
}

protocol HomeDataStore
{
}


class HomeInteractor: NSObject, HomeLogic, HomeDataStore  {
    
    var presenter: HomePresentationLogic?

    
    func getInvestData(request: HomeListScene.getInvestData.Request) {
        
        InvestimentoRequest.getInvestimentData(page: 0) { (investment, error) in
            
            if let newDataInvestiment = investment {
                let response = HomeListScene.getInvestData.Response(newInvestimento: newDataInvestiment)
                self.presenter?.presentListInvest(response: response)
                
            } else if(investment == nil) {
                print(error as Any)
//                self.alertDados()
            }
        }
    }
    
    func getFormData(request: HomeListScene.getFormData.Request) {
        FormularioRequest.getFormData(page: 0) { (form, error) in
            
            if let newListForm = form {
                let response = HomeListScene.getFormData.Response(newFormulario: newListForm)
                self.presenter?.presentListForm(response: response)
            } else if(form == nil) {
                //                self.alertDados()
            }
        }
    }
    
    
    
}
