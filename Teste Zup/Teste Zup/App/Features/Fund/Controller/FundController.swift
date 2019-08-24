//
//  FundController.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FundController: UIViewController, ConfigurableController {
    var usedView: UIView = FundView()
    var fundViewModel = FundViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        fundViewModel.fetchFund(completion: { (fund) in
            self.fundViewModel.fund = fund
            if let fundView = self.usedView as? FundView {fundView.fundViewModel = self.fundViewModel}
        })
    }
}
