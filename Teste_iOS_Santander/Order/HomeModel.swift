//
//  HomeModel.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//
import UIKit

enum HomeListScene {
    
    enum getInvestData {
    
        struct Request {
            
        }
        struct Response {
            var newInvestimento: [String: InvestimentoObjectMapper]
        }
        struct ViewModel
        {
            var displayInvestEntries: [String: InvestimentoObjectMapper]
        }
    }
        
    enum getFormData {
            
        struct Request {
            
        }
        struct Response {
            var newFormulario: [String: [FormObjectMapper]]
        }
        struct ViewModel
        {
            var displayFormEntries: [String: [FormObjectMapper]]
        }
            
    }
}

