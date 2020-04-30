//
//  BaseViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol {
    /// Displays Loading Indicator
    func startLoading()
    
    /// Stop Loading Indicator
    func stopLoading()
}

class BaseViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    // MARK: - Public Methods
    func displayError(errorMessage: String) {
        let alert = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorMessage(errorMessage: String) {
        let alert = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
        self.present(alert, animated: true)

        let duration: Double = 5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    
    func startLoading() {
        self.showSpinner(onView: self.view)
    }
    
    func stopLoading() {
        self.removeSpinner()
    }
}


