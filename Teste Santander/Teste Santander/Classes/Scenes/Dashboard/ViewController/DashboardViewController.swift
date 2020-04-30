//
//  ViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 27/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit
import Foundation

class DashboardViewController: UIViewController, CustomTabBarDelegate, ContactFormTransitionProtocol, ContactFormResultProtocol {
    
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var customTabBar: CustomTabBar!
    
    // MARK: - Tab Bar Items
    lazy var childrenVC = [InvestmentFundsRouter.rootViewController(), ContactFormRouter.rootViewController(delegate: self)]
    var tabBarItems = ["Investimento", "Contato"]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    fileprivate func configureUI() {
        customTabBar.delegate = self
        customTabBar.setup(tabBarItems: tabBarItems)
        
        for index in (0...childrenVC.count - 1) {
            let childVC = childrenVC[index]
            
            addChild(childVC)
            
            if index == 0 {
                childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                childVC.view.frame = containerView.bounds
                containerView.addSubview(childVC.view)
                
                childVC.didMove(toParent: self)
                customTabBar.setSelectedTab(index: index)
            }
        }
    }
    
    // MARK: - CustomTabBarDelegate
    func didSelectTab(index: Int) {
        for indexTab in (0...childrenVC.count - 1) {
            let childVC = childrenVC[indexTab]
            if index == indexTab {
                childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                childVC.view.frame = containerView.bounds
                
                containerView.addSubview(childVC.view)
                childVC.didMove(toParent: self)
            } else {
                childVC.view.removeFromSuperview()
            }
        }
    }
    
    // MARK: - ContactFormTransitionProtocol
    func showSuccessScreen() {
        DashboardRouter.showSuccessScreen(parent: self, containerView: containerView)
    }
    
    // MARK: - ContactFormResultProtocol
    func sendNewMessage() {
        DashboardRouter.sendNewMessage(parent: self, containerView: containerView)
    }
}
