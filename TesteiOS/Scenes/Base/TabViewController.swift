//
//  TabViewController.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 08/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        // Cor de fundo para tab selecionada
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor(red: 202.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0), size: tabBarItemSize)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
