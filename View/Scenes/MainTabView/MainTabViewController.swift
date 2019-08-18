//
//  MainTabViewController.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 11/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
//import UIKit
import MaterialComponents.MaterialTabs


class MainTabViewController: MDCTabBarViewController {
    
    @IBOutlet var formViewContainer: UIView!
    @IBOutlet var fundViewContainer: UIView!
    
    @IBOutlet var formBottomConstraint: NSLayoutConstraint!
    @IBOutlet var fundBottomConstraint: NSLayoutConstraint!
    
    private let tabBarItens = ["Investimento", "Contato"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let bottomTabBar = tabBar {
            // set tabbar constraints
            self.view.layoutIfNeeded()
            formBottomConstraint.constant = bottomTabBar.frame.height
            fundBottomConstraint.constant = bottomTabBar.frame.height
            formViewContainer.updateConstraints()
            fundViewContainer.updateConstraints()
            
            
            // TabBar config
            bottomTabBar.itemAppearance = .titles
            bottomTabBar.items = tabBarItens.enumerated().map { index, title in
                return UITabBarItem(title: title, image: nil, tag: index)
            }
            // select first item
            bottomTabBar.selectedItem = bottomTabBar.items[0]
            tabBar(bottomTabBar, didSelect: bottomTabBar.items[0])
        }
    }
    
    // MARK: MDCTabBarDelegate
    override func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {

        guard let selectedItem = tabBar.selectedItem else {
            return
        }

        let selectedTab = tabBarItens[selectedItem.tag]

        if selectedTab == "Investimento" {
            self.view.bringSubviewToFront(fundViewContainer)
        } else {
            self.view.bringSubviewToFront(formViewContainer)
        }
    }
    
}

