//
//  ContactRouter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//

import UIKit

@objc protocol ContactRoutingLogic {
    func routeToSuccessView()
}

class ContactRouter: NSObject, ContactRoutingLogic {
    weak var viewController: ContactViewController?
    
    func routeToSuccessView() {
        viewController?.performSegue(withIdentifier: "", sender: nil)
    }
}
