//
//  ToastView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

extension UIViewController {
    func showMessage(message: String) {
        let messageLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-100, width: 250, height: 35))
        messageLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        messageLabel.textColor = UIColor.white
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        messageLabel.text = message
        messageLabel.alpha = 1.0
        messageLabel.layer.cornerRadius = 10;
        messageLabel.clipsToBounds  =  true
        self.view.addSubview(messageLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            messageLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            messageLabel.removeFromSuperview()
        })
    }
}
