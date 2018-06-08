//
//  FormViewModel.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import RxSwift

protocol IFormContext {
    
    var disposeBag: DisposeBag? {get set}
    
    func sendNewMessage()
    
}

class FormViewModel {
    
    var formData = Variable<FormData?>(nil)
    
    var disposeBag: DisposeBag?
    
    init() {
    }
    func viewDidLoad() {
        APIService.fetchJsonData(with: Constants.formJsonURL) { (formData: FormData?, result) in
            self.formData.value = formData
        }
    }
}

extension FormViewModel: IFormContext {

    func sendNewMessage() {
        
    }

}
