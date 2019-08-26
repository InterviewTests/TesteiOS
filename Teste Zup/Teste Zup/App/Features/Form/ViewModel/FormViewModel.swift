//
//  FormViewModel.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

enum StylePresentation {
    case field
    case text
    case image
    case checkbox
    case button
}

struct FormViewModel {
    
    var form: FormFormat?
    var row: Int?
    
    var styles = [StylePresentation?](repeating: nil, count: 6)
    
    
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
    
    mutating func definePresentation() {
        form?.cells?.forEach({ (cell) in
            switch cell.typeField {
            case 1:
                styles[row!] = .field
            default:
                print("")
            }
        })
    }
    
}
