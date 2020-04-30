//
//  ViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 27/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit
import Foundation

class DashboardViewController: BaseViewController, CustomTabBarDelegate, ContactFormTransitionProtocol, ContactFormResultProtocol {
    
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
    
    // MARK: - Private Methods
    fileprivate func configureUI() {
        customTabBar.delegate = self
        customTabBar.setup(tabBarItems: tabBarItems)
        
        let indexTab = DashboardRouter.showSelectedTab(parent: self, containerView: containerView, childrenVC: childrenVC, index: 0, addChilds: true)

        customTabBar.setSelectedTab(index: indexTab)
    }
    
    // MARK: - CustomTabBarDelegate
    func didSelectTab(index: Int) {
        _ = DashboardRouter.showSelectedTab(parent: self, containerView: containerView, childrenVC: childrenVC, index: index, addChilds: false)
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
