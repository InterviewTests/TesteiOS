//
//  DashboardRouter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

class DashboardRouter {
    /// Displays the selected tab
    /// - Parameters:
    ///   - parent: Parent View
    ///   - containerView: Container parent view
    ///   - childrenVC: Children View Controllers
    ///   - index: index of selected Tab
    /// - Returns: Selected Tab
    static func showSelectedTab(parent: DashboardViewController, containerView: UIView, childrenVC: [UIViewController], index: Int, addChilds: Bool) -> Int {
        for indexTab in (0...childrenVC.count - 1) {
            let childVC = childrenVC[indexTab]
            
            if addChilds {
                parent.addChild(childVC)
            }
            
            if index == indexTab {
                childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                childVC.view.frame = containerView.bounds
                containerView.addSubview(childVC.view)
                childVC.didMove(toParent: parent)
            } else {
                if !addChilds {
                    childVC.view.removeFromSuperview()
                }
            }
        }
        
        return index
    }
    /// Displays success form Screen
    /// - Parameters:
    ///   - parent: Parent View
    ///   - containerView: Container parent view
    static func showSuccessScreen(parent: DashboardViewController, containerView: UIView) {
        let contactFormResult = ContactFormResultViewController.loadFromNib()
        contactFormResult.delegate = parent
        
        parent.addChild(contactFormResult)
        
        contactFormResult.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contactFormResult.view.frame = containerView.bounds
        containerView.addSubview(contactFormResult.view)
        
        contactFormResult.didMove(toParent: parent)
    }
    
    
    /// Displays contact form Screen
    /// - Parameters:
    ///   - parent: Parent View
    ///   - containerView: container parent view
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
