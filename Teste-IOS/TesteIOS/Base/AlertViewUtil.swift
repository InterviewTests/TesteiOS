//
//  AlertViewUtil.swift
//  TesteIOS
//
//  Created by Sidney Silva on 12/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

typealias handler = () -> ()

class AlertViewUtil: NSObject {
    static func createAlertView(viewController: UIViewController, message: String, completion:@escaping handler) {
        let alert = UIAlertController(title: AlertControllerConstant.alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: AlertControllerConstant.confirmButton, style: .default, handler: { (action) in
            completion()
        }))
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
