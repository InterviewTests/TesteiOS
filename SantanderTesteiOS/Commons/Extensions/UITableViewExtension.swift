//
//  UIViewExtension.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var identifier : String {
        return String(describing: self)
    }
}

extension UITableView {
    
    
    func register<T : UITableViewCell>(class name : T.Type) {
        register(UINib(nibName: String(describing: name), bundle: Bundle(for: T.classForCoder())), forCellReuseIdentifier: String(describing: name))
    }
    
    func dequeue<T : UITableViewCell>(cell : T.Type, indexPath : IndexPath)-> T {
        return dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath) as! T
    }
}


