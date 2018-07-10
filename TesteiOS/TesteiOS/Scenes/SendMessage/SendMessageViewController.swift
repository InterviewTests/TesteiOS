//
//  SendMessageViewController.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol SendMessageDisplayLogic: class {
    func display(viewModel: SendMessage.Something.ViewModel)
}

class SendMessageViewController: UIViewController, SendMessageDisplayLogic {
    var interactor: SendMessageBusinessLogic?
  
  // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
  // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = SendMessageInteractor()
        let presenter = SendMessagePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
  
    func doSomething() {
        let request = SendMessage.Something.Request()
        interactor?.request(request: request)
    }
  
    func display(viewModel: SendMessage.Something.ViewModel) {
        
    }
}
