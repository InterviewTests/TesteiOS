//
//  UIViewControllerExtension.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func showAlert(message: String){
        let alertController = UIAlertController(title: "Aplicativo", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
