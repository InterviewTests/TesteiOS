//
//  UIViewController.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 03/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.closeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
}
