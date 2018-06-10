//
//  FormRouter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 09/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol FormImput {
    func showFundsViewController()
}

class FormRouter: FormImput {
    weak var viewController: UIViewController!
    
    func showFundsViewController() {
        viewController.performSegue(withIdentifier: "", sender: nil)
    }
}
