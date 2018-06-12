//
//  InvestmentViewModel.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import RxSwift

class InvestmentViewModel {
    
    var investData = Variable<InvestRoot?>(nil)
    
    func viewDidLoad() {
        APIService.fetchJsonData(with: Constants.InvestJsonURL) { (investData: InvestRoot?, result) in
            self.investData.value = investData
        }
    }
}
