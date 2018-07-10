//
//  SendMessageInteractor.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol SendMessageBusinessLogic
{
  func doSomething(request: SendMessage.Something.Request)
}

protocol SendMessageDataStore
{
  //var name: String { get set }
}

class SendMessageInteractor: SendMessageBusinessLogic, SendMessageDataStore
{
  var presenter: SendMessagePresentationLogic?
  var worker: SendMessageWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: SendMessage.Something.Request)
  {
    worker = SendMessageWorker()
    worker?.doSomeWork()
    
//    let response = SendMessage.Something.Response()
//    presenter?.presentSomething(response: response)
  }
}
