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
    func presentSomething(response: SendMessage.Something.Response)
}

class SendMessagePresenter: SendMessagePresentationLogic    {
    weak var viewController: SendMessageDisplayLogic?
    
    func presentSomething(response: SendMessage.Something.Response) {
        let viewModel = SendMessage.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
