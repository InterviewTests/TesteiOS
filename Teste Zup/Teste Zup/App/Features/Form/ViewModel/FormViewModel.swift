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
    case check
    case button
}

struct FormViewModel {
    
    var form: FormFormat?
    var presentationOutput = [StylePresentation?](repeating: nil, count: 6)
    
    var row: Int?
    
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
    
    mutating func setPresentation() {
        guard let cells = form?.cells else {return print("Cells is empty")}
        
        for i in 0...5 {
            switch cells[i].type {
                case 1:
                    presentationOutput[i] = .field
                case 2:
                    presentationOutput[i] = .check
                case 3:
                    presentationOutput[i] = .button
                default:
                    print("Perfom")
            }
        }
    }
}
