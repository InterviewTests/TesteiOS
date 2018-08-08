//
//  FundosContatoRouter.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

@objc protocol FundosContatoRoutingLogic {
    
}

protocol FundosContatoDataPassing {
    var dataStore: FundosContatoDataStore? { get }
}

class FundosContatoRouter: NSObject, FundosContatoRoutingLogic, FundosContatoDataPassing {
    weak var viewController: FundosContatoViewController?
    var dataStore: FundosContatoDataStore?
}
