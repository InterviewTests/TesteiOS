//
//  FormViewModel.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct FormViewModel {
    
    var form: FormFormat?
    
    mutating func fetchForm(completion: @escaping (FormFormat) -> Void) {
        var this = self
        FormService.getForm(completion: ({ (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let fundSucess):
                this.form = fundSucess
                completion(fundSucess)
            }
        }))
    }
}
