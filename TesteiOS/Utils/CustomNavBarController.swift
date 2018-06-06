//
//  CustomNavBarController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 31/05/18.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class CustomNavBarController: UINavigationController {
    
    override func viewWillLayoutSubviews() {
        configureLayout()
    }
    
    func configureLayout() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor.white
    }
}
