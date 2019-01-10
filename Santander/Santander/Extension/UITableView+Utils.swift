//
//  UITableView+Utils.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    
    /// Returns a UITableView for a given Class Type
    func getCell<T:UITableViewCell>(_ indexPath: IndexPath, _ type:T.Type) -> T?{
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
    }
    
    /// Register a Cell in the TableView, given an UITableViewCell Type
    func registerCell<T:UITableViewCell>(_ cell:T.Type){
        self.register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
}
