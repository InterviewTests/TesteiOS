//
//  SendMessageInteractor.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit



protocol SendMessageBusinessLogic {
  func request(request: SendMessage.Something.Request)
}

class SendMessageInteractor: SendMessageBusinessLogic {
    var presenter: SendMessagePresentationLogic?
    var worker: SendMessageWorker?
  //var name: String = ""
  
  // MARK: Do something
  
    func request(request: SendMessage.Something.Request) {
        worker = SendMessageWorker()
        worker?.requestForm(url: request.url) { response in
            print(response)
        }
    }
}
