//
//  ListCellRouter.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit

protocol ListCellRouterInput {
    func showFunds()
}

class ListCellRouter : ListCellRouterInput {
    weak var viewController: ListCellViewController!
    
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
