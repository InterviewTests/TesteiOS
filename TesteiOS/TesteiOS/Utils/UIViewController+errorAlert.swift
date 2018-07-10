//
//  UIViewController+errorAlert.swift
//  TesteiOS
//
//  Created by Felipe Borges on 10/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayError() {
        let controller = UIAlertController(title: "Erro", message: "Temos um problema, Tente novamente mais tarde", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        
        self.present(controller, animated: true, completion: nil)
    }
}
