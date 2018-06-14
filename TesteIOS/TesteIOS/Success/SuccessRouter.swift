//
//  SuccessRouter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 14/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

@objc protocol SuccessRoutingLogic {
    func backToContacts()
}

class SuccessRouter: SuccessRoutingLogic {
    weak var viewController: SuccessViewController?
    
    func backToContacts() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
