//
//  FormViewModel.swift
//  TesteiOS
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
//

import Foundation
import RxSwift

protocol IFormContext {
    
    var disposeBag: DisposeBag? {get set}
    
    func sendNewMessage()

}

enum FormState {
    case none
    case validate
    case afterValidate
}

class FormViewModel {
    
    var formData = Variable<FormData?>(nil)
    
    var disposeBag: DisposeBag?

    var formCurrentState = Variable<(state:FormState, error: String?)>((.none, nil))
    
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
        self.formCurrentState.value = (.afterValidate, nil)
    }
}

