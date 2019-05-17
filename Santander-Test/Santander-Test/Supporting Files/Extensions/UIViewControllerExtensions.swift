//
//  UIViewControllerExtensions.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 17/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit
import StatusAlert

extension UIViewController {
    
    func showErrorFeedback(_ errorDescription: String) {
        let statusAlert = StatusAlert()
        statusAlert.image = UIImage(named: "alertIcon")
        statusAlert.title = "Erro!"
        statusAlert.message = errorDescription
        statusAlert.canBePickedOrDismissed = true
        statusAlert.alertShowingDuration = TimeInterval(exactly: 4)!
        
        statusAlert.showInKeyWindow()
    }
    
}
