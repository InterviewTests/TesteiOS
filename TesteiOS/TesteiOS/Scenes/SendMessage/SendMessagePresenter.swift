//
//  SendMessagePresenter.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol SendMessagePresentationLogic {
    func present(response: SendMessage.Something.Response)
}

class SendMessagePresenter: SendMessagePresentationLogic    {
    weak var viewController: SendMessageDisplayLogic?
    
    func present(response: SendMessage.Something.Response) {
        switch response {
        case .error(let _):
            viewController?.displayError()
        case .success(let items):
            viewController?.display(viewModel: SendMessage.Something.ViewModel(items: items))
        }
    }
}
