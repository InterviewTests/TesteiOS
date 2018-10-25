//
//  RouterLoginViewController.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

protocol ShowTransacionsRouter {
    func routeToTransactions(destination: UserTransactionsViewController)
}

protocol ShowTransactionsDataPassing {
    var toBePosted: DetailDataToBePosted? { get }
}

class UserTransactionsRouter: ShowTransacionsRouter, ShowTransactionsDataPassing {
    
    var viewController: LoginViewController?
    var toBePosted: DetailDataToBePosted?
    var destinationInteractor: TransactionsInteractor?
    
    func routeToTransactions(destination: UserTransactionsViewController) {
        destination.userData = toBePosted
    }
    
}
