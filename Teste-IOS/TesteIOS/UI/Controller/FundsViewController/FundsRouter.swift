//
//  FundsRouter.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

@objc protocol FundsRoutingLogic {  
}

class FundsRouter: NSObject, FundsRoutingLogic {
  weak var viewController: FundsViewController?
}
