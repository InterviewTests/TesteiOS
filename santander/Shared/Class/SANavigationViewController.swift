//
//  SANavigationViewController.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SANavigationViewController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        prepare()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public extension SANavigationViewController {
    
    func prepare() {
        
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.navigationBar.barTintColor = .white
        self.navigationBar.tintColor = .red
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: Resource.Font.medium.of(size: 16),
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }
    
}
