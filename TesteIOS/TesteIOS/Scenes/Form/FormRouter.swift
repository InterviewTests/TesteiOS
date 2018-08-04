//
//  FormRouter.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

@objc protocol FormRoutingLogic {
    
}

protocol FormDataPassing {
    var dataStore: FormDataStore? { get }
}

class FormRouter: NSObject, FormRoutingLogic, FormDataPassing {
    weak var viewController: FormViewController?
    var dataStore: FormDataStore?
}
