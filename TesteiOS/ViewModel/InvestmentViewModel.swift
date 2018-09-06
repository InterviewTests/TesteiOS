//
//  InvestmentViewModel.swift
//  TesteiOS
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
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


