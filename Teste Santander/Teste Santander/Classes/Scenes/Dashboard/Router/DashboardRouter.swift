//
//  DashboardRouter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

class DashboardRouter {
    
    static func showSuccessScreen(parent: DashboardViewController, containerView: UIView) {
        let contactFormResult = ContactFormResultViewController.loadFromNib()
        contactFormResult.delegate = parent
        
        parent.addChild(contactFormResult)
        
        contactFormResult.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contactFormResult.view.frame = containerView.bounds
        containerView.addSubview(contactFormResult.view)
        
        contactFormResult.didMove(toParent: parent)
    }
    
    static func sendNewMessage(parent: DashboardViewController, containerView: UIView) {
        for childVC in parent.children {
            if childVC.isKind(of: ContactFormResultViewController.self) {
                childVC.removeFromParent()
            }
            
            if childVC.isKind(of: ContactFormViewController.self) {
                childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                childVC.view.frame = containerView.bounds
                
                containerView.addSubview(childVC.view)
                childVC.didMove(toParent: parent)
            }
        }
    }
}
