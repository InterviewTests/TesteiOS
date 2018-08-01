//
//  SuccessRouter.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

@objc protocol SuccessRoutingLogic {
    func backToContacts()
}

class SuccessRouter: SuccessRoutingLogic {
    weak var viewController: SuccessViewController?
    
    func backToContacts() {
        viewController?.delegate?.backToContacts()
    }
}
