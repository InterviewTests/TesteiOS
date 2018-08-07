//
//  FundosDetailsRouter.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

@objc protocol FundosDetailsRoutingLogic {
    
}

protocol FundosDetailsDataPassing {
    var dataStore: FundosDetailsDataStore? { get }
}

class FundosDetailsRouter: NSObject, FundosDetailsRoutingLogic, FundosDetailsDataPassing {
    weak var viewController: FundosDetailsViewController?
    var dataStore: FundosDetailsDataStore?
}
