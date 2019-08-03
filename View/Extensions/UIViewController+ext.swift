//
//  UIErrorView.swift
//  biblio-swift-1.1
//
//  Created by Erika Segatto on 09/02/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation
import UIKit


// MARK: Default textFieldDelegate
extension UIViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
}

extension UIViewController {
    
    // MARK: logout()
    fileprivate func doLogout() {
//        let initialNavigationController = (self.navigationController as? InitialNavigationController) ?? (self.parent?.navigationController as? InitialNavigationController)
//        initialNavigationController?.presenter.logOut()
    }
    
    func logOut() {
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.dismiss(animated: true, completion: {self.doLogout()})
        }
        else {
            self.doLogout()
        }
    }

    // MARK: showError
    func showError(error: Error) {
        self.showError(title: "Erro", error: error)
    }
    
    func showError(title: String, error: Error) {
        let errorMessage = error.localizedDescription
        
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.message = (currentAlert.message ?? "") + "\n\n\(errorMessage)"
            return
        }
        
        let alert = UIAlertController(title: title,
                                      message: errorMessage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
