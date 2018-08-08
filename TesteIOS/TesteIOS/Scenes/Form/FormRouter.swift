//
//  FormRouter.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

@objc protocol FormRoutingLogic {
    func routeToShowFundos()
}

protocol FormDataPassing {
    var dataStore: FormDataStore? { get }
}

class FormRouter: NSObject, FormRoutingLogic, FormDataPassing {
    weak var viewController: FormViewController?
    var dataStore: FormDataStore?
    
    //    MARK: - Routing
    func routeToShowFundos() {
        if let viewController = viewController {
            let destinationVC = viewController.storyboard?.instantiateViewController(withIdentifier: "FundosTabBar") as! FundosTabBarViewController
            navigateToShowFundos(source: viewController, destination: destinationVC)
        }
    }
    
    //    MARK: - Navigation
    func navigateToShowFundos(source: FormViewController, destination: FundosTabBarViewController){
        source.show(destination, sender: nil)
    }
}
