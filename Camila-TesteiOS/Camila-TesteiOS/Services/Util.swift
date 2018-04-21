//
//  Util.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class Util: NSObject {
    func setupNavBar<T:UIViewController>(viewController: T, title: String) where T:UINavigationBarDelegate{
        
        guard let view = viewController.view else {
            return
        }

        let navigationBar = CustomNavBar()
        navigationBar.isTranslucent = false
        navigationBar.delegate = viewController
        navigationBar.backgroundColor = .white
        navigationBar.items = [UINavigationItem.init(title: title)]

        viewController.view.addSubview(navigationBar)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        if #available(iOS 11, *) {
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }

        if viewController.navigationController != nil {
            navigationBar.isHidden = true
        } else {
            navigationBar.isHidden = false
        }
    }
}
