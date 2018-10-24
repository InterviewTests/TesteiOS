//
//  UIViewController+Extension.swift
//  TesteiOS
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

extension UIViewController
{
    // função para apresentar janela de aviso na tela
    func showAlert(title: String, body: String, buttonText: String)
    {
        let alertController = UIAlertController(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: buttonText, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
