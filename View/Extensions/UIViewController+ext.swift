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
    
    // MARK: showError
    func showError(_ error: Error) {
        self.showError(error, title: "Erro")
    }
    
    func showError(_ error: Error, title: String) {
        let errorMessage = error.localizedDescription
        
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.message = (currentAlert.message ?? "") + "\n\n\(errorMessage)"
            return
        }
        
        let alert = UIAlertController(title: title,
                                      message: errorMessage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: UIAlertAction.Style.cancel,
                                   handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
