//
//  AppNavigationController.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController, UINavigationControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate                   = self
        self.navigationBar.tintColor    = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationBar.shadowImage  = UIImage()
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20),
                                                  NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is InvestmentViewController {
            viewController.navigationItem.title = "Investimento"
        }else if viewController is AddContactViewController {
            viewController.navigationItem.title = "Contato"
        }
    }
}
