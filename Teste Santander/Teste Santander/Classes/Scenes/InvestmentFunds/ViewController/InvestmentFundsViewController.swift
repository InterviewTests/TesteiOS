//
//  InvestmentFundsViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol InvestmentFundsViewControllerProtocol {
    
}

class InvestmentFundsViewController: UIViewController, InvestmentFundsViewControllerProtocol {
    // MARK: - Interface Properties
    var interactor: InvestmentFundsInteractorProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
}
