//
//  ListFundRouter.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 10/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit

protocol ListFundRouterInput {
    func showFunds()
}

class ListFundRouter : ListFundRouterInput {
    weak var viewController: ListFundViewController!
    
    func showFunds() {
        viewController.performSegue(withIdentifier: "funds_vc", sender: nil)
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router which scenes it can communicate with
        
        if segue.identifier == "funds_vc" {
            
        }
    }
}
