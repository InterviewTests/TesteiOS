//
//  PostDataPresenter.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

protocol PresentPostData {
    func presentingPostData(data: DetailDataToBePosted)
    func authenticateData(loginViewController: LoginViewController, credentialsDelegate: UserAndSafeDataDelegate)
    func login(loginViewController: LoginViewController, delegate: UserAndSafeDataDelegate, router: UserTransactionsRouter)
}

class LoginPresenter: PresentPostData {
    
    var viewController: LoginViewController?
    var interactor: LoginInteractor?
    func presentingPostData(data: DetailDataToBePosted) {
        
    }
    
    func authenticateData(loginViewController: LoginViewController, credentialsDelegate: UserAndSafeDataDelegate) {
        interactor = LoginInteractor()
        interactor?.authentication(loginViewController: loginViewController, credentialsDelegate: credentialsDelegate)
    }
    
    func login(loginViewController: LoginViewController, delegate: UserAndSafeDataDelegate, router: UserTransactionsRouter) {
        interactor = LoginInteractor()
        interactor?.login(loginViewController: loginViewController, delegate: delegate, router: router)
    }
    
}
