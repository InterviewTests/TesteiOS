//
//  ContactSuccessViewController.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright (c) 2018 Leonardo Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ContactSuccessDisplayLogic: class {
    func dismissView()
}

class ContactSuccessViewController: UIViewController, ContactSuccessDisplayLogic {
    var interactor: ContactSuccessBusinessLogic?
    var router: (NSObjectProtocol & ContactSuccessRoutingLogic & ContactSuccessDataPassing)?
    
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
        let interactor = ContactSuccessInteractor()
        let presenter = ContactSuccessPresenter()
        let router = ContactSuccessRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendAnotherMessage(_ sender: Any) {
        sendAnotherMessage()
    }
    
    func sendAnotherMessage() {
        interactor?.sendAnotherMessage()
    }
    
    func dismissView() {
        navigationController?.popViewController(animated: true)
    }
}
