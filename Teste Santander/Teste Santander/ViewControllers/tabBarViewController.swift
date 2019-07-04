//
//  tabBarViewController.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 03/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UITabBarItem.appearance()
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font:UIFont(name: "DINPro-Regular", size: 17)!]
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
