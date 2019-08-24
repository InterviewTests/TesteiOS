//
//  FundViewModel.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 23/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct FundViewModel {
    var fund: Fund?
    
    init() {}
    
    func fetchFund(completion: @escaping (Fund) -> Void) {
        var this = self
        FundService.getFund(completion: ({ (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let fundSucess):
                this.fund = fundSucess
                completion(fundSucess)
            }
        }))
    }
}
