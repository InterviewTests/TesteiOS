//
//  FundsRouter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//

import UIKit

@objc protocol FundsRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol FundsDataPassing
{
  var dataStore: FundsDataStore? { get }
}

class FundsRouter: NSObject, FundsRoutingLogic, FundsDataPassing
{
  weak var viewController: FundsViewController?
  var dataStore: FundsDataStore?
}
