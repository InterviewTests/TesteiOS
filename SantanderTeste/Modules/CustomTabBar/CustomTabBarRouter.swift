//
//  CustomTabBarRouter.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class CustomTabBarRouter: BaseRouter {
    class func instantiate() -> CustomTabBarViewController {
        return CustomTabBarViewController(nibName: "CustomTabBarView", bundle: .main)
    }
}
