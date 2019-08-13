//
//  ViewController.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
